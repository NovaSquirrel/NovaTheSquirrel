#!/usr/bin/env python3
from __future__ import with_statement, division, print_function
from contextlib import closing
import array
import sys
if str is bytes:
    print("This program requires Python 3.", file=sys.stdout)
    sys.exit(1)

use_sox = False

usageText = """Usage: quadenc.py INFILE.wav OUTFILE.qdp
Compresses an audio file to QuaDPCM (quadratic difference pulse code
modulation), a format suitable for playback on an NES using quadpcm.s.
The sample rate of the input file should be 16000 Hz."""
usageTextSox = "File format support through SoX enabled; requires SoX and soxwave.py."
usageTextNoSox = "File format support through SoX disabled; only uncompressed .wav works."

framelen = (256 - 1) * 4
usageNotes = [usageText]
usageNotes.append(usageTextSox if use_sox else usageTextNoSox)
usageText = '\n'.join(usageNotes)

def is_little():
    """Return True if the system is little-endian or False otherwise"""
    return bool(bytearray(array.array("i", [1]).tobytes())[0])

def load_file(filename):
    """Load a mono audio file as an array of 2-byte halfwords."""
    if use_sox:
        import soxwave as wave
    else:
        import wave
    with closing(wave.open(filename, 'rb')) as inwv:
        c = inwv.getnchannels()
        if c != 1:
            raise ValueError("only mono is supported")
        length = inwv.getnframes()
        data = array.array('h', inwv.readframes(length))
    assert data.itemsize() == 2
    if not is_little():
        data.byteswap()
    return data

def play_data(data, rate):
    import soxwave
    if not is_little():
        data = data[:]
        data.byteswap()
    args = ['play', '-t', 's16', '-r', str(rate), '-c', '1', '-L', '-']
    soxwave.sox_spawn(args, data.tobytes())

deltas = [0, 1, 4, 9, 16, 25, 36, 49,
          64, -49, -36, -25, -16, -9, -4, -1]
def quadpcm_enc(data, startval=64):
    out = array.array('B')
    scmin = 64
    scmax = 64
    byt = None
    for s in data:
        scaled = min((s + 32768 + 64) // 512, 127)
        cands = [(abs(((startval + d) & 0x7F) - scaled), i)
                  for (i, d) in enumerate(deltas)]
        enc = min(cands)[1]
        if byt is None:
            byt = enc
        else:
            out.append(byt | (enc << 4))
            byt = None
        startval = (startval + deltas[enc]) & 0x7F
    return (out.tostring(), startval)

def quadpcm_dec(data, startval=64):
    out = array.array('h')
    for c in data:
        for enc in (c & 0x0F, c >> 4):
            startval = (startval + deltas[enc]) & 0x7F
            out.append((startval - 64) * 512)
    return (out, startval)

def halve_rate(iterable):
    flp = array.array('h', [0] * 3)
    flp.extend(iterable)
    flp.extend([0]*3)
    fil = (int(round((16 * flp[i + 3]
                      - (flp[i] + flp[i + 6])
                      + 9 * (flp[i + 2] + flp[i + 4]))
                     / 32))
           for i in range(0, len(flp) - 6, 2))
    return array.array('h', fil)

def lerp_double_rate(iterable):
    from itertools import chain

    fil = array.array('h', iterable)
    fil.append(0)
    lerp1 = ((a, (a + b) // 2)
             for (a, b) in zip(fil[:-1], fil[1:]))
    return array.array('h', (s for r in lerp1 for s in r))

def quads_enc(data):
    data_frames = [data[i:i + framelen]
                   for i in range(0, len(data), framelen)]
    del data

    # For each frame, I choose only low frequencies (0-4000 Hz)
    # or high frequencies (4000-8000 Hz), not both.
    # Use autocorrelation at lag 1 to see which to use.
    correls = [(sum(a * b for (a, b) in zip(f[1:], f[:-1]))
                / sum(a * a for a in f))
               for f in data_frames]
    # flip_frames: these frames shall be decoded with the
    # interpolated samples flipped
    flip_frames = [r < 0 for r in correls]
    flp1 = (-s if (flip and (i & 1)) else s
            for (f, flip) in zip(data_frames, flip_frames)
            for (i, s) in enumerate(f))
    fil = halve_rate(flp1)
    correls = flp1 = None

    fil_frames = [fil[i:i + framelen // 2]
                  for i in range(0, len(fil), framelen // 2)]

    # At this point, the signal is (fil, flip_frames)
    # Encode bitstream
    bitstream = array.array('B')
    last = 64
    for i in range(len(flip_frames)):
        base = framelen // 2 * i
        f = fil[base:base + framelen // 2]
        flipval = 0x7F if flip_frames[i] else 0
##        print i, flipval
        bitstream.append(flipval)
        (enc, last) = quadpcm_enc(f, last)
        bitstream.fromstring(enc)
    return bitstream

def quads_dec(bitstream):

    # The rest is validation to see if we can decode this bitstream.
    print("length of bitstream is", len(bitstream))
    enc_frames = [bitstream[i:i + framelen // 4 + 1]
                  for i in range(0, len(bitstream), framelen // 4 + 1)]
    del bitstream
    flip_frames = [f[0] for f in enc_frames]
    fil = array.array('h')
    last = 64
    for f in enc_frames:
        (dec, last) = quadpcm_dec(f[1:], last)
        fil.extend(dec)

    # Reconstruct at full rate
    lerp = lerp_double_rate(fil)
    lerp_frames = [lerp[i:i + framelen]
                   for i in range(0, len(lerp), framelen)]
    unflp = (min(32767, -s if (flip and (i & 1)) else s)
             for (f, flip) in zip(lerp_frames, flip_frames)
             for (i, s) in enumerate(f))
    return array.array('h', unflp)

def main(argv=None):
    argv = argv or sys.argv
    if len(argv) > 1 and argv[1] in ('-h', '-?', '--help'):
        print(usageText)
        return
    if len(argv) != 3:
        print("not enough filenames; try --help", file=sys.stderr)
        sys.exit(1)
    infilename, outfilename = argv[1:3]

    bitstream = quads_enc(load_file(infilename))
    if len(bitstream) % 256 > 0:
        bitstream.extend([0] * (256 - (len(bitstream) % 256)))
    with open(outfilename, "wb") as outfp:
        outfp.write(bitstream.tobytes())

if __name__=='__main__':
##    main(['quadenc.py', "../audio/selnow.wav", "../obj/nes/selnow.qdp"])
    main()
