; Princess Engine
; Copyright (C) 2014-2019 NovaSquirrel
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

.proc ShowTimeTrialResult
OldTimeSeconds = TempVal
OldTimeMinutes = TempVal+1
    dec StartedLevelNumber ; Replay the same level
    ; Change the color to black for visibility
    lda #$3f
    sta PPUADDR
    lda #$01
    sta PPUADDR
    lda #$0f
    sta PPUDATA
    ; Reselect the first color
    lda #$3f
    sta PPUADDR
    lda #$00
    sta PPUADDR

    ; First we need a font
    lda #0
    sta PPUMASK ; Already in vblank from the delay earlier, so don't wait for it
    lda #' '
    jsr ClearNameCustom
    lda #GraphicsUpload::CHR_FONT
    jsr DoGraphicUpload

    ; Fetch minutes and seconds
    lda StartedLevelNumber
    asl
    tay
    lda SavedLevelTimes+0,y
    sta OldTimeMinutes
    lda SavedLevelTimes+1,y
    sta OldTimeSeconds

    ; Display everything
    PositionXY 0, 6, 6
    jsr PutStringImmediate
    .byt "TIME TRIAL RESULTS", 0

    PositionXY 0, 6, 10
    jsr PutStringImmediate
    .byt "Best time: ", 0
    lda OldTimeSeconds
    ora OldTimeMinutes
    bne ThereIsATime
      jsr PutStringImmediate
      .byt "N/A", 0
      jmp :+
    ThereIsATime:
      ldy OldTimeMinutes
      lda BCD99,y
      jsr PutHex
      lda #':'
      sta PPUDATA
      ldy OldTimeSeconds
      lda BCD99,y
      jsr PutHex
    :

    PositionXY 0, 6, 12
    jsr PutStringImmediate
    .byt "Your time: ", 0
    ldy LevelTimerMinutes
    lda BCD99,y
    jsr PutHex
    lda #':'
    sta PPUDATA
    ldy LevelTimerSeconds
    lda BCD99,y
    jsr PutHex

    ; Automatically lower time if no time saved
    lda OldTimeSeconds
    ora OldTimeMinutes
    beq LowerTime
    ; Otherwise calculate it
    lda LevelTimerMinutes
    cmp OldTimeMinutes ; saved minutes
    bcc LowerTime
    bne HigherTime
    lda LevelTimerSeconds
    cmp OldTimeSeconds ; saved seconds
    bcs HigherTime
  LowerTime:
    lda StartedLevelNumber
    asl
    tay
    lda LevelTimerMinutes
    sta SavedLevelTimes+0,y
    lda LevelTimerSeconds
    sta SavedLevelTimes+1,y

    PositionXY 0, 6, 22
    jsr PutStringImmediate
    .byt "NEW RECORD!", 0
  HigherTime:

    PositionXY 0, 6, 18
    jsr PutStringImmediate
    .byt "Press B to exit", 0
    PositionXY 0, 6, 16
    jsr PutStringImmediate
    .byt "Press A to try again", 0

    lda #0
    sta PPUSCROLL
    sta PPUSCROLL
    jsr WaitVblank
    lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
    sta PPUCTRL
    lda #BG_ON
    sta PPUMASK
  Loop:
    jsr WaitVblank
    jsr ReadJoy

    lda keynew
    and #KEY_A
    jne StartLevel ; This routine re-inits stack pointer so leaving it inside several routines here is fine

    lda keynew
    and #KEY_B
    beq Loop
    rts
.endproc
