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

.proc ShowMouseEasterEgg
  jsr WaitVblank
  lda #0
  sta PPUMASK
  lda #' '
  jsr ClearNameCustom
  lda #GraphicsUpload::CHR_FONT
  jsr DoGraphicUpload

    PositionXY 0, 5, 8
  jsr PutStringImmediate
  .byt "It's 'Nova the Squirrel'",0
  PositionXY 0, 5, 10
  jsr PutStringImmediate
  .byt "not 'Nova the Mouse.'",0
  PositionXY 0, 5, 12
  jsr PutStringImmediate
  .byt "Wrong rodent, doofus.",0

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
  lda #BG_ON
  sta PPUMASK

: jsr WaitVblank
  jsr ReadJoy
  lda keynew
  and #KEY_START
  beq :-
  jmp Reset
.endproc
