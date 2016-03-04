#!/usr/bin/env python
#
# Bitmap to NES CHR converter using Python Imaging Library
# Copyright 2010 Damian Yerrick
#
# Copying and distribution of this file, with or without
# modification, are permitted in any medium without royalty
# provided the copyright notice and this notice are preserved.
# This file is offered as-is, without any warranty.
#
from __future__ import with_statement
from PIL import Image
from time import sleep

def formatTilePlanar(tile, nPlanes):
    import array
    if (tile.size != (8, 8)):
        return None
    pixels = iter(tile.getdata())
    outplanes = [array.array('B')
                 for i in range(nPlanes)]
    for y in range(8):
        slivers = [0 for i in range(nPlanes)]
        for x in range(8):
            px = pixels.next()
            for i in range(nPlanes):
                slivers[i] = slivers[i] << 1
                if px & 0x01:
                    slivers[i] = slivers[i] | 1
                px >>= 1
        for i in range(nPlanes):
            outplanes[i].append(slivers[i])
    out = "".join(plane.tostring() for plane in outplanes)
    return out

def pilbmp2chr(im, tileWidth=8, tileHeight=8,
               formatTile=lambda im: formatTilePlanar(im, 2)):
    """Convert a bitmap image into a list of byte strings representing tiles."""
    im.load()
    (w, h) = im.size
    outdata = []
    for mt_y in range(0, h, tileHeight):
        for mt_x in range(0, w, tileWidth):
            metatile = im.crop((mt_x, mt_y,
                                mt_x + tileWidth, mt_y + tileHeight))
            for tile_y in range(0, tileHeight, 8):
                for tile_x in range(0, tileWidth, 8):
                    tile = metatile.crop((tile_x, tile_y,
                                          tile_x + 8, tile_y + 8))
                    data = formatTile(tile)
                    outdata.append(data)
    return outdata

def parse_argv(argv):
    from optparse import OptionParser
    parser = OptionParser(usage="usage: %prog [options] [-i] INFILE [-o] OUTFILE")
    parser.add_option("-i", "--image", dest="infilename",
                      help="read image from INFILE", metavar="INFILE")
    parser.add_option("-o", "--output", dest="outfilename",
                      help="write CHR data to OUTFILE", metavar="OUTFILE")
    parser.add_option("-W", "--tile-width", dest="tileWidth",
                      help="set width of metatiles", metavar="HEIGHT",
                      type="int", default=8)
    parser.add_option("--packbits", dest="packbits",
                      help="use PackBits RLE compression",
                      action="store_true", default=False)
    parser.add_option("-H", "--tile-height", dest="tileHeight",
                      help="set height of metatiles", metavar="HEIGHT",
                      type="int", default=8)
    parser.add_option("-1", dest="planes",
                      help="set 1bpp mode (default: 2bpp NES)",
                      action="store_const", const=1, default=2)
    (options, args) = parser.parse_args(argv[1:])

    tileWidth = int(options.tileWidth)
    if tileWidth <= 0:
        raise ValueError("tile width '%d' must be positive" % tileWidth)

    tileHeight = int(options.tileHeight)
    if tileHeight <= 0:
        raise ValueError("tile height '%d' must be positive" % tileHeight)

    # Fill unfilled roles with positional arguments
    argsreader = iter(args)
    try:
        infilename = options.infilename
        if infilename is None:
            infilename = argsreader.next()
    except StopIteration:
        raise ValueError("not enough filenames")

    outfilename = options.outfilename
    if outfilename is None:
        try:
            outfilename = argsreader.next()
        except StopIteration:
            outfilename = '-'
    if outfilename == '-':
        import sys
        if sys.stdout.isatty():
            raise ValueError("cannot write CHR to terminal")

    return (infilename, outfilename, tileWidth, tileHeight,
            options.packbits, options.planes)

argvTestingMode = True

def main(argv=None):
    import sys
    if argv is None:
        argv = sys.argv
        if (argvTestingMode and len(argv) < 2
            and sys.stdin.isatty() and sys.stdout.isatty()):
            argv.extend(raw_input('args:').split())
    try:
        (infilename, outfilename, tileWidth, tileHeight,
         usePackBits, planes) = parse_argv(argv)
    except StandardError, e:
        sys.stderr.write("%s: %s\n" % (argv[0], str(e)))
        sys.exit(1)

    im = Image.open(infilename)

    outdata = pilbmp2chr(im, tileWidth, tileHeight,
                         lambda im: formatTilePlanar(im, planes))
    outdata = ''.join(outdata)
    if usePackBits:
        from packbits import PackBits
        sz = len(outdata) % 0x10000
        outdata = PackBits(outdata).flush().tostring()
        outdata = ''.join([chr(sz >> 8), chr(sz & 0xFF), outdata])

    # Read input file
    outfp = None
    try:
        if outfilename != '-':
            outfp = open(outfilename, 'wb')
        else:
            outfp = sys.stdout
        outfp.write(outdata)
    finally:
        if outfp and outfilename != '-':
            outfp.close()

if __name__=='__main__':
    main()
##    main(['pilbmp2nes.py', '../tilesets/char_pinocchio.png', 'char_pinocchio.chr'])
##    main(['pilbmp2nes.py', '--packbits', '../tilesets/char_pinocchio.png', 'char_pinocchio.pkb'])
