; NES variable width font drawing library
; Copyright 2006 Damian Yerrick and Shay Green
;
; Copying and distribution of this file, with or without
; modification, are permitted in any medium without royalty provided
; the copyright notice and this notice are preserved in all source
; code copies.  This file is offered as-is, without any warranty.

; Change history:
; 2006-03: vwfPutTile rewritten by "Blargg" (SG)
; and then adapted by Damian Yerrick to match old semantics
; 2010-06: DY decided to skip completely transparent pattern bytes
; 2011-11: DY added string length measuring
; 2012-01: DY added support for inverse video
; 2014-04: DY fixed some slight glitches in shift111 OR logic

;.include "nes.h"
;.export vwfPutTile, vwfPuts, vwfPuts0
;.export vwfStrWidth, vwfStrWidth0
;.export clearLineImg, copyLineImg, lineImgBuf, invertTiles
;.exportzp lineImgBufLen
;.import chrData, chrWidths

INCLUDE_GLYPH_WIDTH = 0

VWF_TEST = 1

lineImgBuf = $100  ; overlap unused parts of the stack
lineImgBufLen = 128

tileAddr = $06

;;
; Clears the line image buffer.
; Does not modify Y or zero page.
.proc clearLineImg
  ldx #lineImgBufLen/4-1
  lda #0
:
  .repeat 4, I
    sta lineImgBuf+lineImgBufLen/4*I,x
  .endrepeat
  dex
  bpl :-
  rts
.endproc

;;
; Copies a rendered line of text to the screen
; in:  AAYY = destination address in VRAM
; trash: $00
.proc copyLineImg
ppuaddr_lo = 0
  tax
  sty ppuaddr_lo
  lda #VBLANK_NMI|VRAM_DOWN|BG_0000|OBJ_1000
  sta PPUCTRL
  ldy #15
loop:
  lda chrstarts,y
  clc
  adc ppuaddr_lo
  bcs xfix
  stx PPUADDR
xfix_end:
  sta PPUADDR
  .repeat ::lineImgBufLen/16,step
    lda lineImgBuf + step*16, y
    sta PPUDATA
  .endrep
  dey
  bpl loop
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  rts
xfix:
  inx
  stx PPUADDR
  dex
  bcs xfix_end

chrstarts:
  .byt  0, 1, 2, 3, 4, 5, 6, 7, 16,17,18,19,20,21,22,23
.endproc


.macro getTileAddr
  sec
  sbc #' '
  ; Find source address
  asl a     ; 7 6543 210-
  adc #$80  ; 6 -543 2107
  rol a     ; - 5432 1076
  asl a     ; 5 4321 076-
  tay
  and #%00000111
  adc #>chrData
  sta tileAddr+1
  tya
  and #%11111000
  sta tileAddr
.endmacro

;;
; Puts a 1-bit tile to position X in the line image buffer.
; In:   A = tile number
;       X = destination X position
; Trash: $05-$07
.proc vwfPutTile
@temp = $05
  getTileAddr
  ldy #7
  
  ; Handle each shift count separately.  Uses ad-hoc dispatch
  ; rather than binary to allow favoring the slower shifts more.
  ; Counts for each shift are clocks beyond the basic loop elements.
  ; Adjustment for low three bits of x is made by offsetting
  ; lineImgBuf.
  stx @temp
  txa
  ora #%0111
  tax
  lda @temp
  and #%111
  cmp #%100
  bcs @shift1xx
  cmp #%011
  bcc @shift0xx
@shift011: ; 18
  lda (tileAddr),y
  beq @clear011
  lsr a    ; 0 -765 4321
  ror a    ; 1 0-76 5432
  ror a    ; 2 10-7 6543
  sta @temp
  and #%00011111
  ora lineImgBuf,x
  sta lineImgBuf,x
  lda @temp
  ror a
  and #%11100000
  ora lineImgBuf+8,x
  sta lineImgBuf+8,x
@clear011:
  dex
  dey
  bpl @shift011
  rts
  
@shift1xx:
  bne @not_shift100
@shift100: ; 18
  lda (tileAddr),y
  beq @clear100
  asl a    ; 7 6543 210-
  rol a    ; 6 5432 10-7
  rol a    ; 5 4321 0-76
  rol a    ; 4 3210 -765
  sta @temp
  and #%11110000
  ora lineImgBuf+8,x
  sta lineImgBuf+8,x
  lda @temp
  rol a
  and #%00001111
  ora lineImgBuf,x
  sta lineImgBuf,x
@clear100:
  dex
  dey
  bpl @shift100
  rts

@shift0xx:
  lsr a
  beq @shift00x
@shift010: ; 16
  lda (tileAddr),y
  beq @clear010
  lsr a    ; 0 -765 4321
  ror a    ; 1 0-76 5432
  sta @temp
  and #%00111111
  ora lineImgBuf,x
  sta lineImgBuf,x
  lda @temp
  ror a
  and #%11000000
  ora lineImgBuf+8,x
  sta lineImgBuf+8,x
@clear010:
  dex
  dey
  bpl @shift010
  rts

@not_shift100:
  cmp #%110
  bcs @shift11x
@shift101: ; 16
  lda (tileAddr),y
  beq @clear101
  asl a    ; 7 6543 210-
  rol a    ; 6 5432 10-7
  rol a    ; 5 4321 0-76
  sta @temp
  and #%11111000
  ora lineImgBuf+8,x
  sta lineImgBuf+8,x
  lda @temp
  rol a
  and #%00000111
  ora lineImgBuf,x
  sta lineImgBuf,x
@clear101:
  dex
  dey
  bpl @shift101
  rts

@shift00x:
  bcc @shift000
@shift001: ; 6
  lda (tileAddr),y
  beq @clear001
  lsr a
  ora lineImgBuf,x
  sta lineImgBuf,x
  ror a
  and #%10000000
  ora lineImgBuf+8,x
  sta lineImgBuf+8,x
@clear001:
  dex
  dey
  bpl @shift001
  rts

@shift11x:
  lsr a
  bcs @shift111
@shift110: ; 14
  lda (tileAddr),y
  beq @clear110
  asl a    ; 7 6543 210-
  rol a    ; 6 5432 10-7
  sta @temp
  and #%11111100
  ora lineImgBuf+8,x
  sta lineImgBuf+8,x
  lda @temp
  rol a
  and #%00000011
  ora lineImgBuf,x
  sta lineImgBuf,x
@clear110:
  dex
  dey
  bpl @shift110
  rts

@shift000: ; -8
  lda (tileAddr),y
  ora lineImgBuf,x
  sta lineImgBuf,x
  dex
  dey
  bpl @shift000
  rts

@shift111: ; 4
  lda (tileAddr),y
  beq @clear111
  asl a
  ora lineImgBuf+8,x
  sta lineImgBuf+8,x
  lda #0
  rol a
  ora lineImgBuf,x
  sta lineImgBuf,x
@clear111:
  dex
  dey
  bpl @shift111
  rts
.endproc

;;
; Calculates the width in pixels of a string.
; @param AAYY: string address, stored to $00-$01
; @return total pen-advance in A and $02
; @return strlen in Y; carry set if overflowed
.proc vwfStrWidth
str = $00
  sty str
  sta str+1
.endproc
;;
; Same as vwfStrWidth.
; @param $00-$01: string address
; @return A, $02: width; Y: strlen
.proc vwfStrWidth0
str = vwfStrWidth::str
width = $02
  ldy #0
  sty width
loop:
  lda (str),y
  cmp #32
  bcc bail
  tax
  lda chrWidths-32,x
  clc
  adc width
  sta width
  bcs bail
  iny
  bne loop
bail:
  lda width
  rts
.endproc

.if INCLUDE_GLYPH_WIDTH
.export vwfGlyphWidth
;;
; finds the portion of a glyph actually occupied by pixels
; in: A = character number (32-127)
; out: A = columns containing a bit; X: pen-advance in pixels
.proc vwfGlyphWidth
  tay
  ldx chrWidths-32,y
  getTileAddr
  ldy #7
  lda #0
:
  ora (tileAddr),y
  dey
  bpl :-
  rts
.endproc
.endif

vwfPutsBuffer:
  ldy #<StringBuffer
  lda #>StringBuffer
;;
; Puts a string to position X, terminated by ctrl character or null.
; In:   AAYY = string base address, stored to $00-$01
;       X = destination X position
; Out:  X = ending X position
;       $00-$01 = END of string (points at null or newline)
;       AAYY = If stopped at $00: End of string
;              If stopped at $01-$1F: Next character
; Trash: $04-$07
.proc vwfPuts
str = $00
  sty str
  sta str+1
.endproc
.proc vwfPuts0
str = vwfPuts::str
horz = 4
  stx horz
loop:
  ldy #0
  lda (str),y
  beq done0
  cmp #32
  bcc doneNewline
  beq isSpace
  ldx horz
  jsr vwfPutTile
  ldy #0
isSpace:
  lda (str),y
  inc str
  bne :+
  inc str+1
:
  tax
  lda chrWidths-32,x
  clc
  adc horz
  sta horz
  cmp #lineImgBufLen
  bcc loop

doneNewline:
  lda #1
done0:
  clc
  adc str
  tay
  lda #0
  adc str+1
  ldx horz 
  rts
.endproc

;;
; Inverts the first A 8x8 pixel tiles in lineImgBuf.
.proc invertTiles
  asl a
  asl a
  asl a
  tax
  dex
invertloop:
  lda #$FF
  eor lineImgBuf,x
  sta lineImgBuf,x
  dex
  bpl invertloop
  rts
.endproc

.pushseg
.segment "PRGeFont"
.align 256
chrData:
  .byt   0,  0,  0,  0,  0,  0,  0,  0,  0,128,128,128,128,  0,128,  0
  .byt   0,160,160,  0,  0,  0,  0,  0,  0, 80,248, 80,248, 80,  0,  0
  .byt   0, 32,112,160, 96, 80,224, 64,  0,208,208, 32, 96, 64,176,176
  .byt   0, 64,160, 64,168,144,104,  0,  0,128,128,  0,  0,  0,  0,  0
  .byt   0, 32, 64,128,128,128, 64, 32,  0,128, 64, 32, 32, 32, 64,128
  .byt   0, 32,168,112,168, 32,  0,  0,  0, 32, 32,248, 32, 32,  0,  0
  .byt   0,  0,  0,  0,  0,  0,128,128,  0,  0,  0,240,  0,  0,  0,  0
  .byt   0,  0,  0,  0,  0,  0,128,  0,  0, 16, 16, 32, 96, 64,128,128
  .byt   0, 96,144,144,144,144, 96,  0,  0, 32, 96, 32, 32, 32, 32,  0
  .byt   0, 96,144, 16, 96,128,240,  0,  0, 96, 16, 96, 16,144, 96,  0
  .byt   0, 48, 80,144,240, 16, 16,  0,  0,112,128,224, 16,144, 96,  0
  .byt   0, 96,128,224,144,144, 96,  0,  0,240, 16, 32, 32, 64, 64,  0
  .byt   0, 96,144, 96,144,144, 96,  0,  0, 96,144,144,112, 16, 96,  0
  .byt   0,  0,128,  0,  0,  0,128,  0,  0,  0,128,  0,  0,  0,128,128
  .byt   0,  0, 16, 96,128, 96, 16,  0,  0,  0,240,  0,  0,240,  0,  0
  .byt   0,  0,128, 96, 16, 96,128,  0,  0, 96,144, 16, 32,  0, 32,  0
  .byt   0, 56, 68,154,170,170,158, 64,  0, 32, 80, 80,248,136,136,  0
  .byt   0,240,136,240,136,136,240,  0,  0,112,136,128,128,136,112,  0
  .byt   0,240,136,136,136,136,240,  0,  0,248,128,240,128,128,248,  0
  .byt   0,248,128,240,128,128,128,  0,  0,112,136,128,152,136,120,  0
  .byt   0,136,136,248,136,136,136,  0,  0,128,128,128,128,128,128,  0
  .byt   0, 64, 64, 64, 64, 64, 64,128,  0,136,144,160,224,144,136,  0
  .byt   0,128,128,128,128,128,248,  0,  0,132,204,204,180,180,132,  0
  .byt   0,136,200,168,168,152,136,  0,  0,112,136,136,136,136,112,  0
  .byt   0,240,136,136,240,128,128,  0,  0,112,136,136,136,136,112,  8
  .byt   0,240,136,136,240,144,136,  0,  0,112,136, 96, 16,136,112,  0
  .byt   0,248, 32, 32, 32, 32, 32,  0,  0,136,136,136,136,136,112,  0
  .byt   0,136,136,136, 80, 80, 32,  0,  0,132,180,180,180, 72, 72,  0
  .byt   0,136, 80, 32, 32, 80,136,  0,  0,136, 80, 32, 32, 32, 32,  0
  .byt   0,248,  8, 16, 96,128,248,  0,  0,224,128,128,128,128,128,224
  .byt   0,128,128, 64, 96, 32, 16, 16,  0,224, 32, 32, 32, 32, 32,224
  .byt   0, 32, 80,136,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,248
  .byt   0,128, 64,  0,  0,  0,  0,  0,  0,  0, 96, 16,112,144,112,  0
  .byt   0,128,224,144,144,144,224,  0,  0,  0, 96,144,128,144, 96,  0
  .byt   0, 16,112,144,144,144,112,  0,  0,  0, 96,144,240,128,112,  0
  .byt   0, 48, 64,224, 64, 64, 64,  0,  0,  0,112,144,144,112, 16, 96
  .byt   0,128,224,144,144,144,144,  0,  0,128,  0,128,128,128,128,  0
  .byt   0, 64,  0, 64, 64, 64, 64,128,  0,128,144,160,192,160,144,  0
  .byt   0,128,128,128,128,128, 64,  0,  0,  0,208,168,168,168,168,  0
  .byt   0,  0,224,144,144,144,144,  0,  0,  0, 96,144,144,144, 96,  0
  .byt   0,  0,224,144,144,224,128,128,  0,  0,112,144,144,112, 16, 16
  .byt   0,  0,224,128,128,128,128,  0,  0,  0,112,128, 96, 16,224,  0
  .byt   0, 64,224, 64, 64, 64, 32,  0,  0,  0,144,144,144,144,112,  0
  .byt   0,  0,144,144,144, 96, 96,  0,  0,  0,136,168,168, 80, 80,  0
  .byt   0,  0,144,144, 96,144,144,  0,  0,  0,144,144, 96, 32, 64,128
  .byt   0,  0,240, 16, 96,128,240,  0,  0, 48, 64, 64,128, 64, 64, 48
  .byt   0,128,128,128,128,128,128,128,  0,192, 32, 32, 16, 32, 32,192
  .byt   0, 80,160,  0,  0,  0,  0,  0,  0,  0, 32, 80,136,136,248,  0
  .byt   0, 56, 68,146,162,138, 68, 56,  0, 56, 68,154,162,154, 68, 56
  .byt   0,108,146,130,130, 68, 40, 16,  0,240,144,144,144,144,240,  0
  .byt   0, 32,112,168, 32, 32, 32,  0,  0, 32, 32, 32,168,112, 32,  0
  .byt   0,  0, 32, 64,248, 64, 32,  0,  0,  0, 32, 16,248, 16, 32,  0
chrWidths:
  .byt   3,  2,  4,  6,  5,  5,  6,  2,  4,  4,  6,  5,  2,  5,  2,  5
  .byt   5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  2,  2,  5,  5,  5,  5
  .byt   8,  6,  6,  6,  6,  6,  6,  6,  6,  2,  3,  6,  6,  7,  6,  6
  .byt   6,  6,  6,  6,  6,  6,  6,  7,  6,  6,  6,  4,  5,  4,  6,  5
  .byt   3,  5,  5,  5,  5,  5,  4,  5,  5,  2,  3,  5,  3,  6,  5,  5
  .byt   5,  5,  4,  5,  4,  5,  5,  6,  5,  5,  5,  5,  2,  5,  5,  6
  .byt   8,  8,  8,  5,  6,  6,  6,  6
.popseg

.proc vwfPutsAtRow
  sta TempVal+0
  sty TempVal+1
  stx TempVal+2
  jsr clearLineImg
  ldx #0
  lda TempVal+0
  ldy TempVal+1
  jsr vwfPuts
  ldy #0
  lda TempVal+2
  jmp copyLineImg
.endproc
