; Princess Engine
; Copyright (C) 2014-2016 NovaSquirrel
;
; This program is free software: you can redistribute it and/or
; modify it under the terms of the GNU General Public License as
; published by the Free Software Foundation; either version 3 of the
; License, or (at your option) any later version.
;
; This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;
.proc StartCutscene
  lda PRGBank ; we'll return to the original bank when we're done
  pha
  jsr WaitVblank
  ldx #0
  stx PPUMASK
  jsr ClearOAM
  lda #2
  sta OAM_DMA
; clear background half of VRAM
  lda #0
  sta PPUADDR
  sta PPUADDR
  tax
  ldy #16
: sta PPUDATA
  inx
  bne :-
  dey
  bne :-

  lda #GraphicsUpload::BG_CUTSCENE
  jsr DoGraphicUpload

  lda #CUTSCENE_BANK
  jsr SetPRG
  jsr CutsceneInit

  ldy #<HelloString
  lda #>HelloString
  jsr CopyToStringBuffer

  jsr ClearDynamicVRAM
  jsr clearLineImg
  ldx #0
  ldy #<StringBuffer
  lda #>StringBuffer
  jsr vwfPuts
  ldy #<$0200
  lda #>$0200
  jsr copyLineImg
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
: jmp :-

  jsr WaitVblank
  lda #0
  sta PPUMASK
  jsr DoLevelUploadList
  jsr WaitVblank

  pla ; restore old bank
  lda PRGBank
  jsr _SetPRG
  rts
.endproc

HelloString:
  .byt "Sample text to test this with!",0

.pushseg
.segment "PRGe"
.proc CutsceneInit
; initialize palette
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  lda #$30
  ldx #$0f
  ; palette 1
  sta PPUDATA
  stx PPUDATA
  sta PPUDATA
  stx PPUDATA
  ; palette 2
  sta PPUDATA
  sta PPUDATA
  stx PPUDATA
  stx PPUDATA
  ; palette 3
  sta PPUDATA
  ldx #$1a
  stx PPUDATA
  ldx #$2a
  stx PPUDATA
  ldx #$26
  stx PPUDATA

; clear nametable
  lda #$20
  sta PPUADDR
  lda #$00
  sta PPUADDR
  tax
  ldy #4
  lda #0
: sta PPUDATA
  inx
  bne :-
  dey
  bne :-

; top of ground
  lda #>($2000+32*24+6)
  sta PPUADDR
  lda #<($2000+32*24+6)
  sta PPUADDR
  lda #$18
  sta PPUDATA
  lda #$16
  ldx #18
  jsr WritePPURepeated
  lda #$1a
  sta PPUDATA

; bottom of ground
  lda #>($2000+32*25+6)
  sta PPUADDR
  lda #<($2000+32*25+6)
  sta PPUADDR
  lda #$19
  sta PPUDATA
  lda #$17
  ldx #18
  jsr WritePPURepeated
  lda #$1b
  sta PPUDATA

; ground attribute
  lda #>($2400-16)
  sta PPUADDR
  lda #<($2400-16)
  sta PPUADDR
  lda #%10101010
  ldx #16
: sta PPUDATA
  dex
  bne :-

; set up nametable
  lda #>($2000+32*11+8)
  sta PPUADDR
  lda #<($2000+32*11+8)
  sta PPUADDR
  lda #6
  sta 0
  ldy #$20
NametableLoop:
  ldy #$20
  ldx #16
: sty PPUDATA
  iny
  dex
  bne :-
; --------
  ldx #16
  lda #0
: sta PPUDATA
  dex
  bne :-
; --------
  dec 0
  bne NametableLoop

  lda #>($2000+32*10+7)
  sta PPUADDR
  lda #<($2000+32*10+7)
  sta PPUADDR
  lda #$01
  sta PPUDATA
  lda #$02
  ldx #16
  jsr WritePPURepeated
  lda #$03
  sta PPUDATA

  lda #>($2000+32*17+7)
  sta PPUADDR
  lda #<($2000+32*17+7)
  sta PPUADDR
  lda #$04
  sta PPUDATA
  lda #$02
  ldx #16
  jsr WritePPURepeated
  lda #$05
  sta PPUDATA

  lda #VRAM_DOWN
  sta PPUCTRL
  lda #>($2000+32*11+7)
  sta PPUADDR
  lda #<($2000+32*11+7)
  sta PPUADDR
  lda #$15
  ldx #6
  jsr WritePPURepeated
  ; ---
  lda #>($2000+32*11+7+17)
  sta PPUADDR
  lda #<($2000+32*11+7+17)
  sta PPUADDR
  lda #$15
  ldx #6
  jsr WritePPURepeated

  ; write the balloon's tail
  lda #>($2000+32*17+9)
  sta PPUADDR
  lda #<($2000+32*17+9)
  sta PPUADDR
  ldy #$06
  sty PPUDATA
  iny
  sty PPUDATA
  iny
  sty PPUDATA
  lda #>($2000+32*17+10)
  sta PPUADDR
  lda #<($2000+32*17+10)
  sta PPUADDR
  ldy #$09
  sty PPUDATA
  iny
  sty PPUDATA

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  rts
.endproc

SpeechBubblePPUAddrLo:
.repeat 8, I
  .byt <($2000+32*11+7+32*I)
.endrep

.proc WriteSpeechBubbleHorizLine
  lda #$02
StartSixteen:
  .repeat 16
    sta PPUDATA
  .endrep
  rts
.endproc

WriteSpeechBubbleSixteen = WriteSpeechBubbleHorizLine::StartSixteen

.proc WriteSpeechBubbleRow
  lda #$15
  sta PPUDATA
  .repeat 16
    sty PPUDATA
    iny
  .endrep
  sta PPUDATA
  rts
.endproc
.popseg
