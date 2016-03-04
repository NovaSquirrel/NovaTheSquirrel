#!/usr/bin/env python
"""

savtool
an image conversion tool for use with an NES graphics editor
by Damian Yerrick

See versionText for version and copyright information.

"""
from __future__ import with_statement, division, print_function
import sys
import os
try:
    from PIL import Image, ImageChops
except ImportError:
    print >>sys.stderr, "%s: warning: Python Imaging Library not installed" % os.path.basename(sys.argv[0])
    Image = None
from array import array
from binascii import a2b_hex, b2a_hex
import re  # for isxdigit

default_palette = '\x0F\x00\x10\x30\x0F\x06\x16\x26\x0F\x1A\x2A\x3A\x0F\x02\x12\x22'

# Command line parsing and help #####################################
#
# Easy is hard.  It takes a lot of code and a lot of text to make a
# program self-documenting and resilient to bad input.

usageText = "usage: %prog [options] [-i] INFILE [-o] OUTFILE"
versionText = """%prog 0.04

Copyright 2012 Damian Yerrick
Copying and distribution of this file, with or without
modification, are permitted in any medium without royalty provided
the copyright notice and this notice are preserved in all source
code copies. This file is offered as-is, without any warranty.
"""
descriptionText = """
Image converter for NES graphics editor.
"""
moreDetailsText = """File formats:
.bmp: Uncompressed bitmap
.chr: Tile sheet in the NES's format (4096 bytes)
.gif: Lossless compressed bitmap (LZW)
.nam: Map data alone (1024 bytes)
.png: Lossless compressed bitmap (DEFLATE)
.ppu: PPU dump (16384 bytes)
.sav: Saved picture from editor (8192 bytes), containing a
      tile sheet, a map, and a palette
.srm: Synonym for .sav used by some emulators

Supported INFILE/OUTFILE pairs:
ppu->sav, ppu->bitmap, bitmap<->sav, bitmap<->chr, chr<->sav, sav->sav

OUTFILE is required except in two cases.  If --print-palette or
--show is given without OUTFILE, no file will be written.  If INFILE
is a .sav file and --show is not specified, changes to the tile sheet
or palette will be written back to INFILE.

The behavior of --chr depends on the format of INFILE.
.ppu: ADDR is the hexadecimal address ($0000 or $1000) of the
      tile sheet.
.sav: SHEET is the filename of a tile sheet that replaces the tiles
      without remapping the nametable.
.nam: SHEET is the filename of a tile sheet combined with --chr and
      --palette, both of which are required.
Bitmap: SHEET is the filename of a tile sheet that savtool will try
        to use.  Any tiles in the bitmap but not in the tile sheet
        will replace tiles in the tile sheet: first duplicate tiles,
        then unused blank then other unused tiles.  To force this
        behavior with a .sav INFILE, specifying --remap.

When converting an indexed bitmap image to .sav without --palette,
the lower 2 bits are used, and the whole picture uses color set 0
with a grayscale palette.  With --palette, the indexed or truecolor
image is converted with all four color sets, and the color set that
best matches each 16x16 pixel area is used.  Using --palette with a
.ppu or .sav INFILE just replaces it.

Glossary
Attribute: The color set chosen for each color area
Bitmap: A picture stored as rows of pixels, which may represent a
        128 by 128 pixel tile sheet or a larger picture
CHR: Programming term for a tile sheet, especially one in the NES's
     native tile data format
Color area: A 16 by 16 pixel area on the map to which a color set can
            be assigned
Color set: A set of three colors that can be used with the background
           color in each color area
Hex palette: A string of 32 letters and numbers representing the 13
             colors in a palette
Map: A grid of 32 by 30 tile numbers and 16 by 15 attributes
Nametable: Programming term for a map
Palette: A background color and four color sets
PPU dump: A copy of all data visible to the NES's video chip, as
          written by FCEUX's hex editor
Tile: An 8 by 8 pixel piece of graphics
Tile sheet: A collection of 256 tiles
"""

testpatterns = [
    "savtool.py",
    "savtool.py --help",
    "savtool.py --more-help",
    "savtool.py --version",
    "savtool.py x.sav --chr y.png",
    "savtool.py x.sav --chr y.chr",
    "savtool.py x.sav --chr y.sav",
    "savtool.py x.sav --print-palette",
    "savtool.py x.png --chr y.png --palette 0F0010300F0616260F1A2A3A0F021222 -o x.sav",
    "savtool.py x.png --chr y.png --palette z.sav -o x.sav",
    'savtool.py "World 1-3.ppu" --chr $1000 -x 16 -y 0 -o treetops.sav',
    "savtool.py x.nam --chr x.chr --palette 0F0010300F0616260F1A2A3A0F021222 -o x.sav",
]

xdigitRE = re.compile('^\$?([0-9a-fA-F]+)$')
infile_exts = {
    'bmp': 'bmp', 'png': 'bmp', 'gif': 'bmp',
    'sav': 'sav', 'srm': 'sav',
    'ppu': 'ppu', 'chr': 'chr', 'nam': 'nam'
}

def mkparser():
    from optparse import OptionParser

    parser = OptionParser(usage=usageText, version=versionText,
                          description=descriptionText)
    parser.add_option("--more-help", dest="morehelp",
                      default=False, action="store_true",
                      help="show more detailed help and exit",)
    parser.add_option("-i", dest="infilename",
                      help="read from INFILE (.bmp, .chr, .nam, .png, .ppu, .sav)",
                      metavar="INFILE")
    parser.add_option("-o", dest="outfilename",
                      help="write output to OUTFILE (.bmp, .chr, .nam, .png, .sav); "
                           "optional if INFILE is a .sav",
                      metavar="OUTFILE")
    parser.add_option("--chr", dest="chrfilename", metavar="SHEET-OR-ADDR",
                      help="set the hex starting address to ADDR ($0000 or $1000) "
                           "if INFILE is a PPU dump, or use SHEET as a tile sheet")
    parser.add_option("--remap", dest="remap",
                      default=False, action="store_true",
                      help="instead of replacing a picture's tile sheet with SHEET, remap it to use tiles already in SHEET")
    parser.add_option("-x", "--scroll-x", dest="xscroll",
                      help="trim 16*DISTANCE pixels from left side of .ppu (0-31, default 0)",
                      metavar="DISTANCE", type="int", default=0)
    parser.add_option("-y", "--scroll-y", dest="yscroll",
                      help="trim 16*DISTANCE pixels from top of .ppu (0-29, default 0)",
                      metavar="DISTANCE", type="int", default=0)
    parser.add_option("--palette", dest="palette",
                      help="use a 32-character hex palette or the palette from SAVFILE",
                      metavar="SAVFILE-OR-HEX")
    parser.add_option("--print-palette", dest="printpalette",
                      default=False, action="store_true",
                      help="write image's 32-character hex palette to standard output",)
    parser.add_option("--show", dest="show",
                      default=False, action="store_true",
                      help="display picture")
    parser.add_option("-P", "--write-chr", metavar="COLORSET", dest="writechr",
                      help="write tile sheet instead of screen, with colorset COLORSET (0-3)",
                      default=None, type="int")
    parser.add_option("--write-swatches", metavar="OUTFILE", dest="swatchfilename",
                      help="write the entire NES palette to OUTFILE  (.bmp, .chr, .nam, .png, .sav); "
                      "useful for determining hex values",
                      default=None)
    return parser

parser = None
def parse_argv(argv):
    global parser
    parser = parser or mkparser()

    (options, pos) = parser.parse_args(argv[1:])

    if options.morehelp:
        print(moreDetailsText)
        sys.exit()

    if options.writechr not in (0, 1, 2, 3, None):
        parser.error("color set for tile sheet must be 0 to 3")
    if options.xscroll < 0 or options.xscroll > 31:
        parser.error("X scroll must be 0 to 31")
    if options.yscroll < 0 or options.yscroll > 29:
        parser.error("Y scroll must be 0 to 29")

    # Fill unfilled roles with positional arguments
    pos = iter(pos)
    try:
        infilename = options.infilename or pos.next()
    except StopIteration:
        if options.swatchfilename:
            infilename = None
        else:
            parser.error("no input file; try %s --help"
                         % os.path.basename(sys.argv[0]))

    if infilename is not None:
        inext = os.path.splitext(infilename)[1].lstrip('.').lower()
        try:
            intype = infile_exts[inext]
        except KeyError:
            parser.error("unrecognized extension '%s' for input file" % inext)
    else:
        intype = None

    try:
        outfilename = options.outfilename or pos.next()
    except StopIteration:
        if options.show:
            outtype = 'bmp'
            outfilename = None
        elif infilename and infilename[-4:].lower() in ('.sav', '.srm'):
            outfilename = infilename  # overwrite same file
        elif options.swatchfilename and not infilename:
            outfilename = None
        else:
            parser.error("no output file")
    if outfilename is not None:
        outext = os.path.splitext(outfilename)[1].lstrip('.').lower()
        try:
            outtype = infile_exts[outext]
        except KeyError:
            parser.error("unrecognized extension '%s' for output file" % outext)

    # make sure no trailing arguments
    try:
        pos.next()
        parser.error("too many filenames")
    except StopIteration:
        pass

    # look for mutually conflicting options
    if options.chrfilename:
        chrext = os.path.splitext(options.chrfilename)[1].lstrip('.').lower()
        try:
            chrtype = infile_exts[chrext]
        except KeyError:
            if intype == 'ppu' and xdigitRE.match(options.chrfilename):
                chrtype = 'literal'
            else:
                parser.error("unrecognized extension '%s' for tile sheet" % chrext)
        if chrtype == 'nam':
            parser.error("nametable has no tile sheet")
    elif infilename:
        chrtype = intype
    else:
        chrtype = None

    if options.palette:
        palext = os.path.splitext(options.palette)[1].lstrip('.').lower()
        try:
            paltype = infile_exts[palext]
        except KeyError:
            if xdigitRE.match(options.palette):
                paltype = 'literal'
            else:
                parser.error("unrecognized extension '%s' for palette" % chrext)
        if paltype not in ('literal', 'ppu', 'sav'):
            parser.error("only PPU dumps and save files have an NES palette")
    elif infilename:
        paltype = intype
    else:
        paltype = None

    if chrtype == 'nam' and not options.chrfilename:
        parser.error("converting a nametable requires a tile sheet (--chr)")
    remap = (intype == 'bmp' and options.chrfilename) or options.remap
    if remap and (not options.chrfilename or chrtype == 'literal'):
        parser.error("remapping CHR requires a tile sheet (--chr)")
    if chrtype == 'nam' and (options.writechr or options.remap):
        parser.error("nametable has no tile sheet")
    if intype != 'ppu' and (options.xscroll or options.yscroll):
        parser.error("only PPU dumps can be scrolled")
    if options.printpalette and paltype not in ('ppu', 'sav'):
        parser.error("only PPU dumps and save files have an NES palette")

    return (infilename, outfilename, options.chrfilename,
            options.xscroll, options.yscroll,
            options.palette, options.printpalette, options.writechr,
            options.show, remap, options.swatchfilename)

def test_argv():
    from shlex import split as strtoargs
    argtitles = ("input filename", "output filename", "tile sheet",
                 "X offset", "Y offset",
                 "palette", "print palette", "write CHR with color set",
                 "show picture", "remap CHR")
    for line in testpatterns:
        print(line)
        args = strtoargs(line)
        try:
            row = parse_argv(args)
        except SystemExit:
            print("Would exit")
        except Exception as e:
            print(e)
        else:
            print("\n".join("  %s: %s" % (a, repr(b))
                            for (a, b) in zip(argtitles, row)))

# PPU dump loading ##################################################

def get_scrolled_nametable(four_screens, xscroll, yscroll):
    """Take a 1-screen slice from a 4-screen nametable, scrolled by 16*yscroll pixels."""

    from binascii import b2a_hex
    ntrows = [[screen[i:i + 32] for i in range(0, 960, 32)]
              for screen in four_screens]
    # reattach 4-screen
    ntrows = [l + r
              for (l, r) in zip(ntrows[0] + ntrows[2], ntrows[1] + ntrows[3])]
    # apply vertical scrolling
    toffset = yscroll * 2
    boffset = max(0, toffset - 30)
    ntrows = ntrows[toffset:toffset + 30] + ntrows[:boffset]
    # apply horizontal scrolling
    loffset = xscroll * 2
    roffset = max(0, loffset - 32)
    ntrows = [row[loffset:loffset + 32] + row[:roffset]
              for row in ntrows]
    
    # linearize attributes
    attrs = [[screen[i:i + 8] for i in range(960, 1024, 8)]
             for screen in four_screens]
    attrs = [l + r
             for (l, r) in zip(attrs[0] + attrs[2], attrs[1] + attrs[3])]
    attrs = [([((ord(c) >> 0) & 0x03, (ord(c) >> 2) & 0x03)
               for c in row],
              [((ord(c) >> 4) & 0x03, (ord(c) >> 6) & 0x03)
               for c in row])
             for row in attrs]
    attrs = [[subcol for byte in subrow for subcol in byte]
             for row in attrs for subrow in row]
    attrs = attrs[0:15] + attrs[16:31]

    # apply vertical scrolling
    boffset = max(0, yscroll - 15)
    attrs = attrs[yscroll:yscroll + 15] + attrs[:boffset]
    # apply horizontal scrolling
    roffset = max(0, xscroll - 16)
    attrs = [row[xscroll:xscroll + 16] + row[:roffset]
             for row in attrs]
    attrs.append([0]*16)

    # reassemble attributes
    attrs = [[row[i] | (row[i + 1] << 2) for i in range(0, 16, 2)]
             for row in attrs]
    attrs = [[tc | (bc << 4) for (tc, bc) in zip(t, b)]
             for (t, b) in zip(attrs[0::2], attrs[1::2])]
    attrs = "".join(chr(c) for row in attrs for c in row)

    ntrows.append(attrs)
    return "".join(ntrows)

def load_ppu(filename, pattable_base=0, xscroll=0, yscroll=0):
    """Load a PPU dump and convert it to SAV format."""
    with open(filename, 'rb') as infp:
        data = infp.read(16384)
    bgchr = data[pattable_base:pattable_base + 0x1000]
    spritechr = data[0x0000:0x0800]
    nametables = [data[i + 0x2000:i + 0x2400] for i in range(0, 0x1000, 0x400)]
    nametable = get_scrolled_nametable(nametables, xscroll, yscroll)
    palette = data[0x3F00:0x3F20]
    return ''.join([bgchr, spritechr, nametable,
                    '\xFF'*0x300, palette, '\000'*0xE0])

def load_sav(filename):
    with open(filename, 'rb') as infp:
        return infp.read(8192)

def load_nam(filename):
    with open(filename, 'rb') as infp:
        namdata = infp.read(1024)
    sav = ''.join(('\xFF' * 0x1800,
                   namdata,
                   '\xFF' * 768,
                   default_palette, default_palette,
                   '\xFF' * 224))
    return sav

def load_chr(filename):
    with open(filename, 'rb') as infp:
        data = infp.read(4096)
    return data + '\xFF' * (4096 - len(data))

# Bitmap image loading ##############################################

def bitmap_to_sav(im):
    """Convert a PIL bitmap without remapping the colors."""
    from pilbmp2nes import pilbmp2chr
    from chnutils import dedupe_chr
    (w, h) = im.size
    im = pilbmp2chr(im, 8, 8)

    if len(im) <= 256:
        # smaller than 16384 pixels: output as a tile sheet
        # with a blank nametable
        chrdata = ''.join(im)
        namdata = '\xFF' * 960 + '\x00' * 64
    else:
        from array import array
        im, linear_namdata = dedupe_chr(im)
        if len(im) > 256:
            raise IndexError("image has %d distinct tiles, which exceeds 256"
                              % len(im))
        width_in_tiles = w // 8
        height_in_tiles = len(linear_namdata) // width_in_tiles
        topborder = (31 - height_in_tiles) // 2
        leftborder = (32 - width_in_tiles) // 2
        rightborder = 32 - width_in_tiles - leftborder
        namdata = array('B', '\xFF' * (32 * topborder))
        for i in range(0, len(linear_namdata), width_in_tiles):
            namdata.fromstring('\xFF' * leftborder)
            namdata.extend(linear_namdata[i:i + width_in_tiles])
            namdata.fromstring('\xFF' * rightborder)
        namdata.fromstring('\xFF' * (960 - len(namdata)))
        namdata.fromstring('\x00' * 64)
        namdata = namdata.tostring()
        assert len(namdata) == 1024

    chrdata = ''.join(im)
    chrdata = chrdata + '\xFF' * (4096 - len(chrdata))

    sav = ''.join((chrdata,
                   '\xFF' * 2048,
                   namdata,
                   '\xFF' * 768,
                   default_palette, default_palette,
                   '\xFF' * 224))
    return sav

def ensure_pil():
    if not Image:
        print >>sys.stderr, "%s: error: PIL not installed" % os.path.basename(sys.argv[0])
        sys.exit(1)

def load_bitmap(filename):
    """Load a BMP, GIF, or PNG image without remapping the colors."""
    ensure_pil()
    return bitmap_to_sav(Image.open(filename))

# Rendering .sav file to bitmap #####################################

# Bisqwit's palette
bisqpal = a2b_hex(
    '656565002d69131f7f3c137c600b62730a37710f075a1a00'
    '3428000b3400003c00003d10003840000000000000000000'
    'aeaeae0f63b34051d07841cca736a9c03470bd3c309f4a00'
    '6d5c00366d0007770400793d00727d000000000000000000'
    'fefeff5db3ff8fa1ffc890fff785faff83c0ff8b7fef9a49'
    'bdac2c85bc2f55c7533cc98c3ec2cd4e4e4e000000000000'
    'fefeffbcdfffd1d8ffe8d1fffbcdfdffcce5ffcfcaf8d5b4'
    'e4dca8cce3a9b9e8b8aee8d0afe5eab6b6b6000000000000'
)
bisqpal = [bisqpal[i:i + 3]
          for i in range(0, len(bisqpal), 3)]

def sliver_to_texels(lo, hi):
    return [((lo >> i) & 1) | (((hi >> i) & 1) << 1)
            for i in range(7, -1, -1)]

def tile_to_texels(chrdata):
    _stt = sliver_to_texels
    _o = ord
    return [_stt(_o(a), _o(b)) for (a, b) in zip(chrdata[0:8], chrdata[8:16])]

def add_attr_to_texels(texels, attr):
    attr = attr * 4
    return [[c and c + attr for c in row] for row in texels]

def chrbank_to_texels(chrdata):
    _ttt = tile_to_texels
    return [_ttt(chrdata[i:i + 16]) for i in range(0, len(chrdata), 16)]

def texels_to_pil(texels, tile_width=16):
    ensure_pil()
    r8 = range(8)
    texels = [texels[i:i + tile_width]
              for i in range(0, len(texels), tile_width)]
    texels = ["".join(chr(c)
                      for tile in row for c in tile[y])
              for row in texels for y in range(8)]
    im = Image.fromstring('P', (8 * tile_width, len(texels)), ''.join(texels))
    im.putpalette('\x00\x00\x00\x66\x66\x66\xb2\xb2\xb2\xff\xff\xff'*64)
    return im

def decode_attribute_table(attrs):
    """Decode a 64-byte NES attribute table to a 16x15 grid."""

    from binascii import b2a_hex
    
    # linearize attributes
    attrs = [attrs[i:i + 8] for i in range(0, 64, 8)]
    attrs = [([((ord(c) >> 0) & 0x03, (ord(c) >> 2) & 0x03)
               for c in row],
              [((ord(c) >> 4) & 0x03, (ord(c) >> 6) & 0x03)
               for c in row])
             for row in attrs]
    attrs = [[subcol for byte in subrow for subcol in byte]
             for row in attrs for subrow in row]
    return attrs[:15]

def render_bitmap(sav):
    chrdata = sav[0x0000:0x1000]
    palette = sav[0x1F00:0x1F20]
    rgbpalette = [bisqpal[ord(c) & 0x3F] for c in palette]
    tiles = chrbank_to_texels(chrdata)
    nam = sav[0x1800:0x1C00]
    attrs = decode_attribute_table(nam[0x3C0:])
    r2 = (0,1)
    attrs = [[c for c in row for i in r2] for row in attrs for i in r2]
    nam = [[ord(c) for c in nam[i:i + 32]] for i in range(0, 960, 32)]
    tile = add_attr_to_texels(tiles[nam[2][3]], attrs[2][3])
    colortiles = [add_attr_to_texels(tiles[tn], cs)
                  for (nr, ar) in zip(nam, attrs) for (tn, cs) in zip(nr, ar)]
    im = texels_to_pil(colortiles, 32)
    im.putpalette(''.join(rgbpalette) * 8)
    return im

def render_tilesheet(sav, colorset):
    chrdata = sav[0x0000:0x1000]
    palette = sav[0x1F00:0x1F20]
    rgbpalette = [bisqpal[ord(c) & 0x3F] for c in palette]
    tiles = texels_to_pil(chrbank_to_texels(chrdata))
    subpal = rgbpalette[0:1] + rgbpalette[colorset*4+1:colorset*4+4]
    tiles.putpalette(''.join(subpal) * 64)
    return tiles

# Remapping a picture to use another .chr file ######################

def tile_is_blank(tile):
    blankplanes = ('\xFF'*8, '\x00'*8)
    return (tile[0:8] in blankplanes and tile[8:16] in blankplanes)

def remap_sav_to_chr(srcsav, dstsheet):
    # Find sets of all tiles, as mappings to their first occurrence
    # in the tile set
    srctiles = [srcsav[i:i + 16] for i in range(0, 4096, 16)]
    dsttiles = [dstsheet[i:i + 16] for i in range(0, 4096, 16)]
    srcseen = {}
    for i, t in enumerate(srctiles):
        srcseen.setdefault(t, i)
    dstseen = {}
    dstdupes = []
    for i, t in enumerate(dsttiles):
        dstdupes.append(t in dstseen)
        dstseen.setdefault(t, i)

    # find all tiles in srctileset that are not in dsttileset
    spaces_needed = sorted((i, t) for (t, i) in srcseen.iteritems()
                           if t not in dstseen)

    # Find candidates for replacement within the new tile sheet by
    # priority:
    # 1. Duplicate tiles
    # 2. Blank tiles
    # 3. Other tiles not shared
    dstshared = [(i, t, t in srcseen, tile_is_blank(t), dupe)
                 for i, (t, dupe) in enumerate(zip(dsttiles, dstdupes))]
    candidates = [(not dupe, not blank, i)
                  for (i, t, shared, blank, dupe) in dstshared
                  if dupe or not shared]
    candidates.sort()
    assert len(candidates) >= len(spaces_needed)
    replacements = zip(spaces_needed,
                       sorted(row[2] for row in candidates[:len(spaces_needed)]))
    # rows of replacements are of the form
    # (src tile number, tile data, dst tile number)

    for ((srctilenum, tiledata), dsttilenum) in replacements:
        dsttiles[dsttilenum] = tiledata
        dstseen[tiledata] = dsttilenum

    nam = array('B', srcsav[0x1800:0x1BC0])
    newnam = array('B', (dstseen[srctiles[i]] for i in nam))
    return "".join(("".join(dsttiles),
                    srcsav[0x1000:0x1800], newnam.tostring(), srcsav[0x1BC0:]))

# Rounding a bitmap toward a given palette ##########################

# There are holes in PIL's indexed image conversion API, which appear
# to prompt abstraction inversion.  convert() supports color rounding
# or Floyd-Steinberg dithering, but it supports only web or adaptive
# palette, not a specific palette.  quantize() supports a specific
# palette, but Floyd-Steinberg dithering can't be turned off.
# So I have to do all the conversion pixel by pixel, and it's slow
# as [expletive] in pure Python.  Caching individual converted colors
# speeds up the process for pictures that are already indexed or
# nearly so, so cache the 1024 most common colors.

def closestcolor(rgb, palette):
    r, g, b = rgb
    palette = [(r2 - r, g2 - g, b2 - b) for (r2, g2, b2) in palette]
    palette = [3*r2*r2 + 6*g2*g2 + b2*b2 for (r2, g2, b2) in palette]
    best = sorted(enumerate(palette), key=lambda i: i[1])[0][0]
    return best

def colorround(im, palettes):
    from collections import Counter
    from itertools import chain
    ensure_pil()
    im = im.convert('RGB')
    (w, h) = im.size
    imd = list(im.getdata())  # a list of (R, G, B) tuples in imd
    imdset = frozenset(x[0] for x in Counter(imd).most_common(1024))
    trials = []
    outpal = list(chain.from_iterable(chain.from_iterable(palettes)))
    pbase = 0
    for p in palettes:
        # Convert the image to this 4-color palette
        colordic = dict((rgb, closestcolor(rgb, p) + pbase) for rgb in imdset)
        imm = array('B', (colordic[rgb]
                          if rgb in colordic
                          else closestcolor(rgb, p) + pbase
                          for rgb in imd))
        imp = Image.new('P', im.size)
        imp.putpalette(outpal)
        imp.putdata(imm)
        pbase += len(p)

        # For each 16x16 pixel area, calculate the difference
        # between it and the original
        impr = imp.convert('RGB')
        diff = ImageChops.difference(im, impr)
        difftiles = [diff.crop((l, t, l + 16, t + 16))
                     for t in range(0, w, 16) for l in range(0, w, 16)]
        difftiles = [list(tile.getdata()) for tile in difftiles]
        difftiles = [sum(3*r*r+6*g*g+b*b for (r, g, b) in tile)
                     for tile in difftiles]
        trials.append((imp, difftiles))

    # Find the best attribute for each 16x16 pixel area
    attrs = [sorted(enumerate(i), key=lambda i: i[1])[0][0]
             for i in zip(*(difftiles for (imp, difftiles) in trials))]

    # Calculate the resulting image
    tls = zip(((l, t) for t in range(0, h, 16) for l in range(0, w, 16)),
              attrs)
    imf = Image.new('P', im.size)
    imf.putpalette(outpal)
    for ((l, t), attr) in tls:
        imf.paste(trials[attr][0].crop((l, t, l+16, t+16)), (l, t))
    attrw = -(-w // 16)
    attrs = [attrs[i:i + attrw] for i in range(0, len(attrs), attrw)]
    return (imf, attrs)

def load_bitmap_with_palette(filename, palette):
    ensure_pil()
    from pilbmp2nes import pilbmp2chr
    from chnutils import dedupe_chr
    im = Image.open(filename)
    (w, h) = im.size
    palettes = [bisqpal[ord(i)]
                for i in palette]
    palettes  = [tuple(ord(i) for i in r) for r in palettes]
    palettes = [[palettes[0]] + palettes[i + 1:i + 4]
                for i in range(0, 16, 4)]

    if w != 256 or h != 240:
        i2 = Image.new("RGB", (256, 240), palettes[0][0])
        i2.paste(im, ((256 - w) // 2, (240 - h) // 2))
        im = i2
    (imf, attrs) = colorround(im, palettes)
    sav = bitmap_to_sav(imf)
    attrs = [[row[i] | (row[i + 1] << 2) for i in range(0, 16, 2)]
             for row in attrs]
    attrs = [[tc | (bc << 4) for (tc, bc) in zip(t, b)]
             for (t, b) in zip(attrs[0::2], attrs[1::2])]
    attrs = "".join(chr(c) for row in attrs for c in row)
    return ''.join((sav[0:0x1BC0], attrs, sav[0x1C00:0x1F00],
                    palette, palette, sav[0x1F20:]))

# Saving the NES palette that this converter uses ###################

def save_swatches(filename=None):
    from PIL import ImageFont, ImageDraw

    cellw, cellh = 24, 24
    im = Image.new('P', (16*cellw, 5*cellh), 0x0F)
    im.putpalette(''.join(bisqpal) + '\xff\x00\xff'*192)
    fnt = ImageFont.load_default()
    dc = ImageDraw.Draw(im)
    captiontxt = "savtool's NES palette"
    tw, th = dc.textsize(captiontxt, font=fnt)
    captionpos = ((cellw * 16 - tw) // 2, (cellh - th) // 2)
    dc.text(captionpos, captiontxt, font=fnt, fill=0x20)
    for row in xrange(4):
        y = (row + 1) * cellh
        for col in xrange(16):
            x = col * cellw
            colornumber = row * 16 + col
            dc.rectangle((x, y, x + cellw, y + cellh), fill=colornumber)

            # draw caption
            graylevel = (row + 1 if col < 1
                         else row if col < 13
                         else row - 1 if col < 14
                         else 0)
            captioncolor = 0x20 if graylevel < 2 else 0x0F
            captiontxt = '%02x' % colornumber
            tw, th = dc.textsize(captiontxt, font=fnt)
            captionpos = (x + cellw - tw, y + cellh - th)
            dc.text(captionpos, captiontxt, font=fnt, fill=captioncolor)
    if filename:
        im.save(filename)
    else:
        im.show()

# Let's see if we can do main() now. ################################

def main(argv=None):
    args = parse_argv(argv or sys.argv)
    (infilename, outfilename, chrfilename,
     xscroll, yscroll, palette, printpalette, writechr,
     show, remap, swatchfilename) = args
    progname = os.path.basename(sys.argv[0])

    if swatchfilename:
        save_swatches(swatchfilename if swatchfilename != '-' else None)
        if not infilename:
            return

    intype = infile_exts[os.path.splitext(infilename)[1].lstrip('.').lower()]
    outtype = outfilename and infile_exts[os.path.splitext(outfilename)[1].lstrip('.').lower()]
    m = chrfilename and xdigitRE.match(chrfilename)
    if intype == 'ppu' and m:
        chrtype = None
        chrbase = int(m.group(1), 16)
    else:
        chrtype = chrfilename and infile_exts[os.path.splitext(chrfilename)[1].lstrip('.').lower()]
        chrbase = 0
    m = palette and xdigitRE.match(palette)
    if m and len(m.group(1)) == 32:
        paltype = 'literal'
        palette = a2b_hex(m.group(1))
    else:
        paltype = palette and infile_exts[os.path.splitext(palette)[1].lstrip('.').lower()]

    if paltype == 'ppu':
        palette = load_ppu(palette)[0x1F00:0x1F10]
        paltype = 'literal'
    elif paltype == 'sav':
        palette = load_sav(palette)[0x1F00:0x1F10]
        paltype = 'literal'
    if paltype and paltype != 'literal':
        print >>sys.stderr, "%s: %s palette type not yet implemented" % (progname, paltype)
        sys.exit(1)

    if intype == 'ppu':
        sav = load_ppu(infilename, chrbase, xscroll, yscroll)
    elif intype == 'sav':
        sav = load_sav(infilename)
    elif intype == 'bmp':
        if palette:
            sav = load_bitmap_with_palette(infilename, palette)
        else:
            sav = load_bitmap(infilename)
    elif intype == 'nam':
        sav = load_nam(infilename)
    else:
        print >>sys.stderr, "%s: %s input type not yet implemented" % (progname, intype)
        sys.exit(1)

    changed = False
    if paltype == 'literal':
        sav = ''.join((sav[:0x1F00], palette, sav[0x1F10:]))
        changed = True

    chrdata = None
    if chrtype in ('ppu', 'sav', 'chr'):
        chrdata = load_chr(chrfilename)
    elif chrtype == 'bmp':
        chrdata = load_bitmap(chrfilename)
    elif chrtype:
        print >>sys.stderr, "%s: %s tile sheet type not yet implemented" % (progname, chrtype)
        sys.exit(1)
    if chrdata:
        assert len(chrdata) >= 4096
        if remap:
            sav = remap_sav_to_chr(sav, chrdata)
        else:
            sav = chrdata[:4096] + sav[4096:]
        changed = True

    im = None
    if show or outtype == 'bmp':
        im = render_tilesheet(sav, writechr) if writechr is not None else render_bitmap(sav)
    if outtype == 'bmp':
        im.save(outfilename)
    elif outtype == 'chr':
        with open(outfilename, 'wb') as outfp:
            outfp.write(sav[:0x1000])
    elif outtype == 'nam':
        with open(outfilename, 'wb') as outfp:
            outfp.write(sav[0x1800:0x1C00])
    elif outtype == 'sav':
        with open(outfilename, 'wb') as outfp:
            outfp.write(sav)
    elif outtype and (changed or outfilename != infilename):
        print >>sys.stderr, "%s: %s output type not yet implemented" % (os.path.basename(sys.argv[0]), outtype)
        sys.exit(1)
    if show:
        im.show()
    if printpalette:
        print(b2a_hex(sav[0x1F00:0x1F10]))

    # TO DO:
    # Convert color PNG and guess palette

def test_suite():
    test_argv()
    main(["savtool.py", "../docs/smb1.ppu", "--chr", "1000", "--show"])
    raw_input("Viewing SMB1 PPU dump")
    main(["savtool.py", "../docs/smb1.ppu", "--chr", "1000", "smb1.ppu.png"])
    main(["savtool.py", "../docs/smb1.ppu", "--chr", "1000", "--write-chr", "1", "--show"])
    raw_input("Viewing SMB1 CHR ROM")
    main(["savtool.py", "../sample_savs/pm.sav", "test_chr.bmp", "--write-chr", "1"])
    main(["savtool.py", "../sample_savs/pm.sav", "test_out.png"])
    main(["savtool.py", "../sample_savs/pm.sav", "--print-palette", 'pm.sav.png'])
    print("above is palette for PM")
    main(["savtool.py", "../docs/smb1.ppu", "--chr", "1000", "smb1.ppu.sav"])
    main(["savtool.py", "../docs/kiddie scratch1.png", "stick_figure.png.sav"])
    main(["savtool.py", "../docs/smb1.ppu", "smb1_chr.png", "--chr", "1000", "--write-chr", "1"])
    main(["savtool.py", "smb1_chr.png", "blank_with_smb1_chr.sav"])
    main(["savtool.py", "../sample_savs/pm.sav", "pm.sav.nam"])
    main(["savtool.py", "../sample_savs/pm.sav", "pm.sav.chr"])
    main(["savtool.py", "pm.sav.nam", "--chr", "pm.sav.chr", "--palette", "0f0026300f1726300f2726300f152630", "--show"])
    raw_input("Viewing PM reassembled from CHR and NAM with literal palette")
    main(["savtool.py", "pm.sav.nam", "--chr", "pm.sav.chr", "--palette", "../sample_savs/pm.sav", "--show"])
    raw_input("Viewing PM reassembled from CHR and NAM with palette from SAV")
    main(["savtool.py", "../sample_savs/pm.sav", '--write-chr', '0', "pm.chr.png"])
    main(["savtool.py", "pm.sav.nam", "--chr", "pm.chr.png", "--palette", "0f0026300f1726300f2726300f152630", "pm_reassembled.sav"])
    main(["savtool.py", "pm_reassembled.sav", "--show"])
    raw_input("Viewing the same, except as a SAV")
    main(["savtool.py", "../sample_savs/RPG_village.sav", "--remap", "--chr", "../sample_savs/prez.sav", "RPG_village_with_prez_chr.sav"])
    main(["savtool.py", "RPG_village_with_prez_chr.sav", "--show"])
    raw_input("Viewing RPG village remapped into prez tile sheet")
    main(["savtool.py", "RPG_village_with_prez_chr.sav", "--write-chr", "0", "--show"])
    raw_input("Viewing prez tile sheet that has had RPG village tiles inserted")
    main(["savtool.py", "../sample_savs/RPG_village.sav", "RPG_village.png"])
    main(["savtool.py", "RPG_village.png", "--palette", "0f1219270f1019170f1623270f021222", "--show"])
    raw_input("Viewing RPG_village converted to PNG and back with a palette")
    print*("""Copy the sav files from this folder to a PowerPak and make sure they
look correct.""")

if __name__=='__main__':
##    test_suite()
    main()
