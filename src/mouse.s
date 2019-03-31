; Princess Engine
; Copyright (C) 2019 NovaSquirrel
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

.proc MouseEasterEggClearScreen
  lda #' '
  jsr ClearNameCustom
  PositionXY 0, 2, 3
  jsr PutStringImmediate
  .byt $11, $12, $13, 0

  PositionXY 0, 32-4-1, 3
  jsr PutStringImmediate
  .byt $14, $15, $16, 0
  rts
.endproc

.proc ShowMouseEasterEgg
  jsr WaitVblank
  lda #0
  sta PPUMASK
  jsr MouseEasterEggClearScreen
  ; Add the sprite palette
  lda #$3f
  sta PPUADDR
  lda #$11
  sta PPUADDR
  lda #$0f
  sta PPUDATA
  lda #$2a
  sta PPUDATA
  ; Add graphics
  lda #GraphicsUpload::CHR_FONT
  jsr DoGraphicUpload
  lda #GraphicsUpload::CHR_PAINT
  jsr DoGraphicUpload

  PositionXY 0, 5, 8
  jsr PutStringImmediate
  .byt "This is Nova's game",0
  PositionXY 0, 5, 10
  jsr PutStringImmediate
  .byt "not Maffi's. This game",0
  PositionXY 0, 5, 12
  jsr PutStringImmediate
  .byt "does not support mice!",0

  PositionXY 0, 5, 16
  jsr PutStringImmediate
  .byt "However the game DOES",0
  PositionXY 0, 5, 18
  jsr PutStringImmediate
  .byt "support a regular SNES",0
  PositionXY 0, 5, 20
  jsr PutStringImmediate
  .byt "controller so plug one",0
  PositionXY 0, 5, 22
  jsr PutStringImmediate
  .byt "of those in!",0

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  jsr WaitVblank
  lda #BG_ON|OBJ_ON
  sta PPUMASK
  jsr ClearOAM

  lda #110
  sta PlayerDrawX
  sta PlayerDrawY

Forever:
  jsr WaitVblank

  ; ---------------------------------------------
  ; Allow the player to "draw" on the screen
  ; ---------------------------------------------

  lda PlayerDrawY
  cmp #239
  jcs SkipReactingToButtons

  ; Calculate PPU position under the cursor
  lda #$20 >> 2
  sta 1

  lda PlayerDrawY ; ........ yyyyy...
  and #%11111000
  asl
  rol 1           ; .......y yyyy....
  asl
  rol 1           ; ......yy yyy.....
  sta 0

  lda PlayerDrawX
  lsr
  lsr
  lsr
  ora 0           ; 001000yy yyyxxxxx
  sta 0

  ; Get the tile at that location
  lda 1
  sta PPUADDR
  lda 0
  sta PPUADDR
  lda PPUDATA
  lda PPUDATA
  ; Fix tiles that aren't virtual pixels, unless they're actually buttons
  cmp #$10
  bcc IsPixels
    ; One of the two special buttons
    cmp #$14
    jcc ClearScreen
    cmp #$17
    jcc ChangeSpeed
    ; Otherwise it's just text
    lda #0
  IsPixels:
  sta 2 ; Save it

  ; Calculate which sub-tile within the tile
  lda PlayerDrawY ; 
  and #%100
  lsr
  sta 3
  lda PlayerDrawX
  and #%100
  lsr
  lsr
  ora 3
  tay

  ; ---------------------------------------------

  ; Left and right set or reset pixels
  lda keydown
  and #128
  beq NotRight
    lda 1
    sta PPUADDR
    lda 0
    sta PPUADDR
;    lda 2
;    and BitCancel,y

    ; When erasing, erase the whole tile because it makes a lot more sense
    lda #0
    sta PPUDATA
  NotRight:

  lda keydown
  and #64
  beq NotLeft
    lda 1
    sta PPUADDR
    lda 0
    sta PPUADDR
    lda 2
    ora BitSelect,y
    sta PPUDATA
  NotLeft:

SkipReactingToButtons:
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  ; ---------------------------------------------

  ; Put the cursor
  lda PlayerDrawX
  sta OAM_XPOS
  lda PlayerDrawY
  sta OAM_YPOS
  dec OAM_YPOS ; Adjust for the 1 pixel offset
  lda #$10
  sta OAM_TILE
  lda #0
  sta OAM_ATTR
  lda #2
  sta OAM_DMA
SkipDMA:

  ; Read the mouse
  lda #1
  sta JOY1
  lda #0
  sta JOY1
  jsr ReadJoy8bits ; Byte 1:always zero, unless it's a regular controller
  and #KEY_START
  jne Reset

  ; Read the mouse buttons
  lda keydown
  sta keylast
  jsr ReadJoy8bits ; Byte 2: left and right buttons
  and #%11000000
  sta keydown

  lda keylast
  eor #255
  and keydown
  sta keynew

  jsr ReadJoy8bits ; Byte 3: vertical movement 
  bpl :+
    eor #$7F
    clc
    adc #1
  :
  add PlayerDrawY
  sta PlayerDrawY

  jsr ReadJoy8bits ; Byte 4: horizontal movement
    bpl :+
    eor #$7F
    clc
    adc #1
  :
  add PlayerDrawX
  sta PlayerDrawX


  jmp Forever

ClearScreen:
  lda keynew
  and #%01000000
  jeq SkipReactingToButtons

  ; Clear the screen
  lda #0
  sta PPUMASK
  jsr MouseEasterEggClearScreen
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK

  ; Prevent an infinite loop
  lda #0
  sta keynew
  sta PPUSCROLL
  sta PPUSCROLL
  jmp Forever

ChangeSpeed:
  lda keynew
  and #%01000000
  jeq SkipReactingToButtons

  ; Cycle sensitivity
  lda #1
  sta $4016
  lda $4016
  lda #0
  sta $4016
  sta PPUSCROLL
  sta PPUSCROLL

  jmp SkipDMA
.endproc
