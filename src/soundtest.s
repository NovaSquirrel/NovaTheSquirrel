; Princess Engine
; Copyright (C) 2018 NovaSquirrel
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

.proc ShowSoundTest
Cursor = 13
NewSong = TempVal+0
OldSong = TempVal+1
IsPlaying = TempVal+2 ; 0:none, 1:pently, 2:famitone
  jsr OptionsScreenSetup
  jsr SoundTestStopMusic

  lda #0
  sta Cursor
  sta NewSong
  sta OldSong
  sta IsPlaying
  sta MusicMute

; Write the options
  PositionXY 0, 8, 4
  jsr PutStringImmediate
  .byt "-Sound test!-",0

  PositionXY 0, 3, 10
  jsr PutStringImmediate
  .byt "Back",0

  PositionXY 0, 3, 12
  jsr PutStringImmediate
  .byt "New music: 0",0

  PositionXY 0, 3, 14
  jsr PutStringImmediate
  .byt "Old music: 0",0

  PositionXY 0, 3, 16
  jsr PutStringImmediate
  .byt "Stop music",0

  PositionXY 0, 3, 19
  jsr PutStringImmediate
  .byt "'Old music' is a bunch of",0
  PositionXY 0, 3, 21
  jsr PutStringImmediate
  .byt "music that was originally",0
  PositionXY 0, 3, 23
  jsr PutStringImmediate
  .byt "written for this game,",0
  PositionXY 0, 3, 25
  jsr PutStringImmediate
  .byt "back in like 2009-2010!",0

  ; This will make the colors change on the first loop iteration
  lda #255
  sta retraces

Loop:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK

  jsr OptionsScreenCommonLoop

  jsr UpdateSong

  lda keynew
  and #KEY_B
  beq :+
    jmp ShowExtraFeatures
  :

  lda keynew
  and #KEY_A
  beq NoA
  ldy Cursor
  jeq ShowExtraFeatures
  dey
  jeq PlayMusicNew
  dey
  jeq PlayMusicOld
  dey
  jeq StopMusic
NoA:

  ; Move the cursor
  lda keynew
  and #KEY_UP
  beq :+
    lda Cursor
    beq :+
    dec Cursor
  :

  lda keynew
  and #KEY_DOWN
  beq :+
    lda Cursor
    cmp #3
    beq :+
    inc Cursor
  :

  lda keynew
  and #KEY_LEFT
  beq :+
    ldx Cursor
    beq :+
    cpx #3
    bcs :+
    dex
    dec NewSong,x
    bpl @NoStopLeft
      lda #0
      sta NewSong,x
    @NoStopLeft:
    jsr UpdateNumber
  :

  lda keynew
  and #KEY_RIGHT
  beq :+
    ldx Cursor
    beq :+
    cpx #3
    bcs :+
    dex
    lda NewSong,x
    cmp SongLimit,x
    beq :+
    inc NewSong,x
    jsr UpdateNumber
  :

  lda #OAM_COLOR_0
  sta OAM_ATTR
  lda #$51
  sta OAM_TILE
  lda #2*8
  sta OAM_XPOS
  lda Cursor
  asl
  asl
  asl
  asl
  add #10*8-1
  sta OAM_YPOS

  jmp Loop

SongLimit:
  .byt 12, 15

UpdateNumber: ; Update the displayed song number
  jsr WaitVblank
  lda #$21
  sta PPUADDR
  lda UpdatePPULow,x
  sta PPUADDR

  lda NewSong,x
  cmp #10
  bcc :+
    ldy #'1'
    sty PPUDATA
    sub #10
  :
  ora #'0'
  sta PPUDATA
  lda #' '
  sta PPUDATA
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  ; inline tail-call
UpdateSong:
  lda IsPlaying
  cmp #1
  bne :+
    jsr SoundTestUpdatePently
  :

  lda IsPlaying
  cmp #2
  bne :+
    jsr SoundTestUpdateFamitone
  :
  rts

UpdatePPULow: ; Low bytes of the song number update addresses
  .byt $8e, $ce

StopMusic:
  jsr SoundTestStopMusic
  jmp Loop
PlayMusicOld:
  lda OldSong
  jsr SoundTestStartFamitone
  lda #2
  sta IsPlaying
  jmp Loop
PlayMusicNew:
  lda NewSong
  jsr SoundTestStartPently
  lda #1
  sta IsPlaying
  jmp Loop
.endproc

