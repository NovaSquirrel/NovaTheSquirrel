; Princess Engine
; Copyright (C) 2017 NovaSquirrel
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

.proc ShowPreLevel
; 10, 11, 12 used by palette cycle
LevelTextAddress = 8
Cursor = 14
OptionCount = 13
  ldx #255 ; reinitialize stack pointer just in case
  txs

  jsr OptionsScreenSetup
  jsr ClearOAM

  lda #0
  sta Cursor
  lda #3
  sta OptionCount

  PositionXY 0, 11, 4
  jsr PutStringImmediate
  .byt "- Level -",0

  ; Print World-Level
  PositionXY 0, 14, 5
  lda StartedLevelNumber
  lsr
  lsr
  lsr
  add #'1'
  sta PPUDATA
  lda #'-'
  sta PPUDATA
  lda StartedLevelNumber
  and #7
  add #'1'
  sta PPUDATA

  ; - Draw the box of options -
  ; Top
  PositionXY 0, 8, 19
  lda #4
  sta PPUDATA
  lda #5
  ldx #14
  jsr WritePPURepeated
  lda #6
  sta PPUDATA
  ; Bottom
  PositionXY 0, 8, 25
  lda #9
  sta PPUDATA
  lda #10
  ldx #14
  jsr WritePPURepeated
  lda #11
  sta PPUDATA

  ; Make sides
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL
  PositionXY 0, 8, 20
  lda #7
  ldx #5
  jsr WritePPURepeated
  PositionXY 0, 23, 20
  lda #8
  ldx #5
  jsr WritePPURepeated
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_RIGHT
  sta PPUCTRL

  ; Is there a cutscene?
  ldx #0
PreLevelCutsceneCheck:
  lda PreLevelHasCutscene,x
  bmi PreLevelCutsceneNotFound
  cmp StartedLevelNumber
  beq PreLevelCutsceneFound
  inx
  bne PreLevelCutsceneCheck ; unconditional
PreLevelCutsceneFound:
  inc OptionCount
PreLevelCutsceneNotFound:

  ; Only display "Play cutscene" if it's actually an option
  lda OptionCount
  cmp #4
  bne :+
    PositionXY 0, 7, 17
    jsr PutStringImmediate
    .byt "* Play  Cutscene *",0
  :

  ; Is there pre-level text?
  ldx #0
PreLevelTextCheck:
  lda PreLevelText,x
  bmi PreLevelTextNotFound
  cmp StartedLevelNumber
  beq PreLevelTextFound
  inx
  inx
  inx
  bne PreLevelTextCheck ; unconditional
PreLevelTextFound:
  lda PreLevelText+1,x
  sta CompressedTextPointer+0
  lda PreLevelText+2,x
  sta CompressedTextPointer+1
  lda #$e2
  sta LevelTextAddress+0
  lda #$20
  sta LevelTextAddress+1

: ; Draw each line of the pre-level text
  ldx #0
  jsr DecompressTextFar
  pha ; save the terminator byte
  lda LevelTextAddress+1
  sta PPUADDR
  lda LevelTextAddress+0
  sta PPUADDR

  ; Go down two rows
  add #64
  sta LevelTextAddress+0
  addcarry LevelTextAddress+1

  jsr PrintDecompressedText
  pla ; get the terminator byte
  cmp #SCR::END_SCRIPT
  bne :-

PreLevelTextNotFound:

  ; Options
  PositionXY 0, 10, 24
  jsr PutStringImmediate
  .byt "Level Select",0
  PositionXY 0, 11, 22
  lda LevelCleared ; Shop unlocked
  bpl :+
    jsr PutStringImmediate
    .byt "Shop/Items",0
  :
  lda LevelCleared ; Shop is locked
  bmi :+
    jsr PutStringImmediate
    .byt "??????????",0
  :
  PositionXY 0, 13, 20
  jsr PutStringImmediate
  .byt "Start!",0

  ; ----- Screen is created -----

  ; Force color change the first frame
  lda #255
  sta retraces
Loop:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK

  jsr OptionsScreenCommonLoop ; Update palette and read controller

  ; Move the cursor
  lda keynew
  and #KEY_UP
  beq :+
    dec Cursor
    bpl :+
      ldx OptionCount
      dex
      stx Cursor
  :

  lda keynew
  and #KEY_DOWN
  beq :+
    inc Cursor
    lda Cursor
    cmp OptionCount
    bcc :+
      lda #0
      sta Cursor
  :

  lda keynew
  and #KEY_B
  jne ShowLevelSelect

  lda keynew
  and #KEY_A
  beq :+
    ldy Cursor
    jeq OptionLevel
    dey
    jeq OptionShop
    dey
    jeq OptionSelect
    dey
    jeq OptionCutscene
  :

  ; Draw cursor
  ldx Cursor
  lda #OAM_COLOR_0
  sta OAM_ATTR+0
  sta OAM_ATTR+4
  lda #$51
  sta OAM_TILE+0
  sta OAM_TILE+4
  lda StarXPos1,x
  sta OAM_XPOS+0
  lda StarXPos2,x
  sta OAM_XPOS+4
  lda StarYPos,x
  sta OAM_YPOS+0
  sta OAM_YPOS+4

  jmp Loop

StarXPos1: .byt 12*8,   10*8,   9*8,     8*8
StarXPos2: .byt 19*8,   21*8,   22*8,    23*8
StarYPos:  .byt 20*8-1, 22*8-1, 24*8-1,  17*8-1

OptionLevel:
  lda #0
  sta CutscenesEnabled
  jmp StartLevel

OptionShop:
  lda LevelCleared ; Shop unlocked
  jpl Loop
  jmp ShowShop

OptionSelect:
  jmp ShowLevelSelect

OptionCutscene:
  lda #1
  sta CutscenesEnabled
  jmp StartLevel
.endproc
