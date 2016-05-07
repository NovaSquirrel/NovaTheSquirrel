;
; math.s
; Arithmetic and trigonometry routines for Thwaite
;
; Copyright (c) 2011 Damian Yerrick
;
; Copying and distribution of this file, with or without
; modification, are permitted in any medium without royalty provided
; the copyright notice and this notice are preserved in all source
; code copies.  This file is offered as-is, without any warranty.
;

;
; The NES CPU has no FPU, nor does it have a multiplier or divider
; for integer math.  So we have to implement these in software.
; Here are subroutines to compute 8x8=16-bit product, a fractional
; quotient in 0.8 fixed point, 2-argument arctangent, and rectangular
; to polar coordinate conversion.  Also included are lookup tables of
; sine and cosine for angles expressed in units of 1/32 of a turn
; from due right, where cos(0) = cos(32) = sin(8) = 1.0.
; 
; Further information:
; http://en.wikipedia.org/wiki/Fixed-point_arithmetic
; http://en.wikipedia.org/wiki/Binary_multiplier
; http://en.wikipedia.org/wiki/Boxing_the_compass
; http://en.wikipedia.org/wiki/Binary_scaling#Binary_angles
;

.segment "CODE"

;;
; Multiplies two 8-bit factors to produce a 16-bit product
; in about 153 cycles.
; @param A one factor
; @param Y another factor
; @return high 8 bits in A; low 8 bits in Y
; Modified a bit
.proc mul8
factor2 = TempVal+1
prodlo = TempVal

  ; Factor 1 is stored in the lower bits of prodlo; the low byte of
  ; the product is stored in the upper bits.
  lsr a  ; prime the carry bit for the loop
  sta prodlo
  sty factor2
  lda #0
  ldy #8
loop:
  ; At the start of the loop, one bit of prodlo has already been
  ; shifted out into the carry.
  bcc noadd
  clc
  adc factor2
noadd:
  ror a
  ror prodlo  ; pull another bit out for the next iteration
  dey         ; inc/dec don't modify carry; only shifts and adds do
  bne loop
  ldy prodlo
  rts
.endproc

;;
; Computes 256*a/y.  Useful for finding slopes.
; 0 and 1 are trashed.
.proc getSlope1
quotient = 0
divisor = 1

  sty divisor
  ldy #1  ; when this gets ROL'd eight times, the loop ends
  sty quotient
loop:
  asl a
  bcs alreadyGreater
  cmp divisor
  bcc nosub
alreadyGreater:
  sbc divisor
  sec  ; without this, results using alreadyGreater are wrong
       ; thx to http://6502org.wikidot.com/software-math-intdiv
       ; for helping solve this
nosub:
  rol quotient
  bcc loop
  lda quotient
  rts
.endproc

;;
; Find the angle of a vector pointing from (x1, y1) to (x2, y2),
; all coordinates unsigned.
; This is also called arctan2 or (on TI calculators) "R>Ptheta".
; @param 0 x1
; @param 1 y1
; @param 2 x2
; @param 3 y2
; @return A: angle (0-31);
;         0: slope reflected into first octant;
;         1: angle reflected into first octant;
;         2, 3: point reflected into first octant
;         Trashes Y and nothing else.
.proc getAngle
x1 = 0
y1 = 1
x2 = 2
y2 = 3
flags = 4

  lda y2
  cmp y1
  bne notHorizontal
  lda x2
  cmp x1
  lda #0
  sta 1
  bcs :+
  lda #16
: rts

notHorizontal:
  ; make sure x2 > x1
  lda x2
  cmp x1
  bne notVertical
  lda y2
  cmp y1
  lda #$FF
  sta 3
  lda #0  ; store first-octant angle
  sta 1
  lda #24
  bcc :+
  lda #8
: rts
notVertical:

  ; At this point, we have already eliminated the special cases of a
  ; perfectly horizontal or vertical ray.
  ; So now compute the sign and abs of (y2 - y1)
  sec
  lda y2
  sbc y1
  bcs noVerticalFlip
  eor #$FF
  adc #1
noVerticalFlip:
  sta y1

  lda #0
  rol a
  sta flags  ; flag 2: SKIP y flip (angle = 16 - angle)

  ; Compute the sign and abs of (x2 - x1)
  sec
  lda x2
  sbc x1
  bcs noHorizontalFlip
  eor #$FF
  adc #1
noHorizontalFlip:
  sta x1
  rol flags  ; flag 1: SKIP x flip (angle = 8 - angle)

  ; if x1 > y1 then swap x1 and y1
  lda y1
  cmp x1
  bcc noDiagonalFlip
  ldy x1
  sty y1
  sta x1
noDiagonalFlip:
  rol flags  ; flag 0: PERFORM diagonal flip (angle = 4 - angle)

  lda y1
  sta y2
  ldy x1
  sty x2
  jsr getSlope1
  sta x1

  ldy #4
tansearch:
  cmp tantable-1,y
  bcs foundTan
  dey
  bne tansearch
foundTan:
  tya
  sta y1

  lsr flags
  bcc noUndoDiagonal
  eor #$FF  ; reverse-subtract 8
  adc #8
noUndoDiagonal:

  lsr flags
  bcs noUndoHorizontal
  eor #$FF  ; reverse-subtract 16
  adc #17   ; plus one because we came in with clc
noUndoHorizontal:

  lsr flags
  bcs noUndoVertical
  eor #$FF  ; reverse-subtract 32
  adc #33   ; plus one because we came in with clc
noUndoVertical:

  and #31   ; this routine tends to give 32 instead of 0 when aiming directly to the right
  rts
.endproc

; Tangents of angles between the ordinary angles, used by getAngle.
; you can make trig tables even in windows calculator
; (90/16*1)t*256= 25
tantable:
  .byt 25, 78, 137, 210

; Accurate sin/cos table used by measureFromSilo.
; These are indexed by angle in quadrant 1, and scaled by 256.
; (90*7/8)s*256=
sine256Q1:
  .byt 0, 50, 98, 142, 181, 213, 237, 251
cosine256Q1:
  .byt  0, 251, 237, 213, 181, 142, 98, 50

; Less precise sin/cos table used by e.g. missile smoke generation.
; These are indexed by angle through the whole circle
; and scaled by 64.
; (90*7/8)s*64=
SineTable:
  .byt   0, 12, 24, 36, 45, 53, 59, 63
CosineTable:
  .byt  64, 63, 59, 53, 45, 36, 24, 12
  .byt   0,<-12,<-24,<-36,<-45,<-53,<-59,<-63
  .byt <-64,<-63,<-59,<-53,<-45,<-36,<-24,<-12
  .byt   0, 12, 24, 36, 45, 53, 59, 63
