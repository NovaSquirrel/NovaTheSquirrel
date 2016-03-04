#!/usr/bin/env python
from __future__ import division
"""

The compression format deals with 16-byte chunks considered as 8x8
pixel tiles with two bit planes.  Possible formats are as follows:

* Ordinary tile: two blocks of 8 bytes
* 2-bit tile (colors 0 and 1 or 2 and 3):
  a block of 8 bytes, then 8 bytes of $00 or $FF
* 2-bit tile (colors 0 and 2 or 1 and 3):
  8 bytes of $00 or $FF, then a block of 8 bytes
* 2-bit tile (colors 0 and 3 or 1 and 2):
  a block of 8 bytes, then the same block copied or complemented
* Solid color tile: 8 bytes of $00 or $FF then 8 bytes of $00 or $FF
* Repeat tile: Repeat previous 16 bytes
* Repeat tile from previous pattern table: Repeat 16 bytes starting
  4096 bytes back

"""

def pb8_oneplane(planedata, topValue=None):
    ctile = [0]
    lastc = topValue
    flag = 0
    for c in planedata:
        flag = flag << 1
        c = ord(c)
        if c == lastc:
            flag = flag | 1
        else:
            ctile.append(c)
            lastc = c
    ctile[0] = flag
    return ctile

def pb53(chrdata):
    """Compress tile data with PB53.

Return (pb53data, seekpoints)
pb53 is the compressed data
seekpoints is an array of indices of the start of the compressed data
for each 4096-byte unit after the first

"""
    from array import array
    from binascii import b2a_hex

    out = array('B')
    seekpoints = []

    for i in range(0, len(chrdata), 16):
        if i > 0 and i % 4096 == 0:
            seekpoints.append(len(out))
        tile = chrdata[i:i + 16]
        asInts = array('B', tile)

        solid0 = (asInts[0] in (0x00, 0xFF)
                  and all(x == tile[0] for x in tile[1:8]))
        solid1 = (asInts[8] in (0x00, 0xFF)
                  and all(x == tile[8] for x in tile[9:16]))

        # Solid color tiles: $84-$87
        if solid0 and solid1:
            ctrlbyte = 0x84 | (0x02 & asInts[8]) | (0x01 & asInts[0])
            out.append(ctrlbyte)
            continue

        # Duplicate previous tile: $82
        if i >= 16 and chrdata[i - 16:i] == tile:
            ctrlbyte = 0x82
            out.append(ctrlbyte)
            continue

        # Duplicate tile from previous pattern table: $83
        if i >= 4096 and chrdata[i - 4096:i - 4080] == tile:
            ctrlbyte = 0x83
            out.append(ctrlbyte)
            continue

        # Encode first plane
        if solid0:
            ctrlbyte = 0x80 | (0x01 & asInts[0])
            out.append(ctrlbyte)
        else:
            pb = pb8_oneplane(tile[0:8])
            out.extend(pb)

        # Encode second plane
        if solid1:
            ctrlbyte = 0x80 | (0x01 & asInts[8])
            out.append(ctrlbyte)
        elif tile[0:8] == tile[8:16]:
            # Colors 0 and 3
            ctrlbyte = 0x82
            out.append(ctrlbyte)
        elif all(a ^ b == 0xFF for (a, b) in zip(asInts[0:8], asInts[8:16])):
            # Colors 1 and 2
            ctrlbyte = 0x83
            out.append(ctrlbyte)
        else:
            pb = pb8_oneplane(tile[8:16])
            out.extend(pb)
    return (out.tostring(), seekpoints)

def unpb53plane(ctrlbyte, it):
    if ctrlbyte >= 0x80:
        # Solid plane
        p0data = 0xFF if (ctrlbyte & 0x01) else 0x00
        return ([p0data] * 8)
    p0data = [it.next()]
    while len(p0data) < 8:
        ctrlbyte = ctrlbyte << 1
        p0data.append(p0data[-1] if ctrlbyte & 0x80 else it.next())
    return p0data
    
def unpb53(data, numTiles=None):
    from array import array
    out = array('B')
    it = (ord(c) for c in data)
    for ctrlbyte in it:
        if numTiles is not None and len(out) >= numTiles * 16:
            break

        if ctrlbyte >= 0x84 and ctrlbyte <= 0x87:
            # Solid color tiles
            p0data = 0xFF if (ctrlbyte & 0x01) else 0x00
            out.extend([p0data] * 8)
            p1data = 0xFF if (ctrlbyte & 0x02) else 0x00
            out.extend([p1data] * 8)
            continue

        if ctrlbyte == 0x82:
            # Repeat previous tile
            out.extend(out[-16:])
            continue

        if ctrlbyte == 0x83:
            # Repeat corresponding tile from other bank
            out.extend(out[-4096:-4080])
            continue

        # Decode each plane
        out.extend(unpb53plane(ctrlbyte, it))
        ctrlbyte = it.next()
        if ctrlbyte in (0x82, 0x83):
            # 2-color plane, colors 0/3 or 1/2
            xorbyte = 0xFF if (ctrlbyte & 0x01) else 0x00
            out.extend(c ^ xorbyte for c in out[-8:])
        else:
            out.extend(unpb53plane(ctrlbyte, it))


    return out.tostring()

roms = [
    '../../my_games/Concentration Room 0.02.nes',
    '../../my_games/lj65 0.41.nes',
    '../roms/Zooming_Secretary.nes',
    '../../compomenu/roms/fhbg.nes',
    '../../compomenu/roms/lan.nes',
    '../../compomenu/roms/mower.nes',
    '../../compomenu/roms/slappin.nes',
    '../../compomenu/roms/thwaite.nes',
    '../../ruder/ruder.nes',
]

def test():
    import ines
    for filename in roms:
        rom = ines.load_ines(filename)
        (data, seekpoints) = pb53(rom['chr'])
        print "%s: compressed %s to %s" % (filename, len(rom['chr']), len(data))
        print "seekpoints:", seekpoints
        unpacked = unpb53(data)
        if unpacked != rom['chr']:
            diffs = [i if a != b else None
                     for (i, (a, b)) in enumerate(zip(rom['chr'], unpacked))]
            print "unpacked different starting at", diffs[0]
        else:
            print "unpack ok"
  
def parse_argv(argv):
    from optparse import OptionParser
    parser = OptionParser(usage="usage: %prog [options] [[-i] INFILE [[-o] OUTFILE]]")
    parser.add_option("-d", "--unpack", dest="unpacking",
                      help="unpack instead of packing",
                      action="store_true", default=False)
    parser.add_option("--raw", dest="withHeader",
                      help="don't write 2-byte length header",
                      action="store_false", default=True)
    parser.add_option("-i", "--input", dest="infilename",
                      help="read input from INFILE", metavar="INFILE")
    parser.add_option("-o", "--output", dest="outfilename",
                      help="write output to OUTFILE", metavar="OUTFILE")
    (options, args) = parser.parse_args(argv[1:])

    # Fill unfilled roles with positional arguments
    argsreader = iter(args)
    infilename = options.infilename
    if infilename is None:
        try:
            infilename = argsreader.next()
        except StopIteration:
            infilename = '-'
    if infilename == '-' and options.unpacking:
        import sys
        if sys.stdin.isatty():
            raise ValueError('cannot decompress from terminal')

    outfilename = options.outfilename
    if outfilename is None:
        try:
            outfilename = argsreader.next()
        except StopIteration:
            outfilename = '-'
    if outfilename == '-' and not options.unpacking:
        import sys
        if sys.stdout.isatty():
            raise ValueError('cannot compress to terminal')

    return (infilename, outfilename, options.unpacking, options.withHeader)

argvTestingMode = True

def main(argv=None):
    import sys
    if argv is None:
        argv = sys.argv
        if (argvTestingMode and len(argv) < 2
            and sys.stdin.isatty() and sys.stdout.isatty()):
            argv.extend(raw_input('args:').split())
    try:
        (infilename, outfilename, unpacking, withHeader) = parse_argv(argv)
    except StandardError, e:
        import sys
        sys.stderr.write("%s: %s\n" % (argv[0], str(e)))
        sys.exit(1)

    # Read input file
    infp = None
    try:
        if infilename != '-':
            infp = open(infilename, 'rb')
        else:
            infp = sys.stdin
        data = infp.read()
    finally:
        if infp and infilename != '-':
            infp.close()
        del infilename, infp

    if unpacking:

        # Decompress input file
        if withHeader:
            numTiles = ord(data[0]) * 256 + ord(data[1])
            startOffset = -((-numTiles) // 256) * 2
        else:
            numTiles = None
            startOffset = 0
        outdata = unpb53(data[startOffset:])
        if maxlength is not None:
            if len(outdata) < maxlength:
                raise IndexError('incomplete chunk')
            if len(outdata) > maxlength:
                outdata = outdata[:maxlength]
    else:

        # Compress input file
        (outdata, seekpoints) = pb53(data)
        if withHeader:

            # The .pb53 header is the unpacked length in 16-byte units,
            # 16-bit big endian, followed by 16-bit seek points
            sz = (len(data) // 16) % 0x10000
            headerwords = [sz]
            headerwords.extend(seekpoints)
            header = "".join("".join((chr((sz >> 8) & 0xFF), chr(sz & 0xFF)))
                             for sz in headerwords)
            outdata = header + outdata
    
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
##    test()
