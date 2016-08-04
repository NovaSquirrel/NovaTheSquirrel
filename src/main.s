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
.proc MainLoopInit
  lda #0
  sta PPUMASK

  lda #$f0
  sta EnemyRightEdge

  lda #SOUND_BANK
  jsr _SetPRG
  jsr pently_init
  lda LevelMusic
  jsr pently_start_music

  lda #0
  sta UploadTileAddress+1

  lda #MAINLOOP_BANK
  jsr SetPRG
  lda NeedDialog
  bne :+
  inc JustTeleported
  jsr RenderLevelScreens
  jsr WaitVblank
  lda #BG_ON
  sta PPUMASK
: 
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  jsr ClearOAM
  jmp VBlankUpdates
.endproc

.proc VBlankUpdates
  jsr WaitVblank
  lda #2
  sta OAM_DMA
  bit PPUSTATUS

  lda IsScrollUpdate ; update the side if needed, also use vertical writes for it since it's vertical
  jeq NotScrollUpdate
    lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
    sta PPUCTRL
    lda ThirtyUpdateAddr+0
    sta PPUADDR
    lda ThirtyUpdateAddr+1
    sta PPUADDR
    .repeat 30, I
      lda ThirtyUpdateTile+I
      sta PPUDATA
    .endrep
  ; do attribute updates if needed
  ; note: vertical writes are still on!
  lda IsScrollUpdate
  cmp #4
  bne Not4
    .repeat 4, I
      lda AttributeWriteA1
      sta PPUADDR
      lda AttributeWriteA2+I
      sta PPUADDR
      lda AttributeWriteD+I
      sta PPUDATA
      lda AttributeWriteD+I+4
      sta PPUDATA
    .endrep
  Not4:
  NotScrollUpdate:

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL

  lda UploadTileAddress+1
  jeq NoUploadTile
    sta PPUADDR
    lda UploadTileAddress+0
    sta PPUADDR
    .repeat 64, I
      lda UploadTileSpace+I
      sta PPUDATA
    .endrep
    lda #0
    sta UploadTileAddress+1
  NoUploadTile:

  .repeat 4, I ; change if the max number of tile changes per frame is changed
    lda TileUpdateA1+I
    beq :+
      sta PPUADDR
      lda TileUpdateA2+I
      sta PPUADDR
      lda TileUpdateT+I
      sta PPUDATA
      lda #0
      sta TileUpdateA1+I
    :
  .endrep
  .repeat 3, I
    lda BlockUpdateA1+I
    beq :+
      sta PPUADDR
      lda BlockUpdateA2+I
      sta PPUADDR
      lda BlockUpdateT1+I
      sta PPUDATA
      lda BlockUpdateT2+I
      sta PPUDATA

      lda BlockUpdateB1+I
      sta PPUADDR
      lda BlockUpdateB2+I
      sta PPUADDR
      lda BlockUpdateT3+I
      sta PPUDATA
      lda BlockUpdateT4+I
      sta PPUDATA
      lda #0
      sta BlockUpdateA1+I
    :
  .endrep

  ; set the scroll
  jsr UpdateScrollRegister
.endproc
; don't put anything else here
.proc MainLoop
  lda NeedLevelRerender
  bne :+
.ifdef CPU_METER
  lda #OBJ_ON | BG_ON | %11100000
  sta PPUMASK
.else
  lda #OBJ_ON | BG_ON
  sta PPUMASK
.endif
:
  .ifdef NMI_MUSIC
    lda #1
    sta LagFrame
  .endif
  countdown IsScrollUpdate ; decrease scroll update stage
  jsr ReadJoy
  jsr ClearOAM

  lda retraces
  and #3
  bne NotSlowTimer
    inc slowtimer

    ; check the delayed metatile updates
    ldx #MaxDelayedMetaEdits-1
DelayCheck:
    lda DelayedMetaEditIndexHi,x
    beq @NotPresent
      lda DelayedMetaEditTime,x
      beq @DoDelayedEdit
      dec DelayedMetaEditTime,x ; count down the timer for the edit if it's nonzero
      jmp @NotPresent
  @DoDelayedEdit:
    ; set up the edit
    lda DelayedMetaEditIndexHi,x
    sta LevelBlockPtr+1
    lda DelayedMetaEditIndexLo,x ; ChangeBlock needs to have the Y position and column starting address
    tay                          ; separate, but the DelayedMetaEdit array combines them.
    and #$f0                     ; Separate them out.
    sta LevelBlockPtr+0
    tya                          ; Y gets the Y position.
    and #$0f
    tay
    lda DelayedMetaEditType,x
    jsr ChangeBlock              ; saves X so we don't have to do that here
    lda #0
    sta DelayedMetaEditIndexHi,x ; Don't need to clear the rest
  @NotPresent:
    dex
    bpl DelayCheck
NotSlowTimer:

  lda #MAINLOOP_BANK
  jsr SetPRG
  jsr RunPlayer
  jsr AdjustCamera
  jsr DisplayPlayer
  jsr RunObjects
  jsr FlickerEnemies

  lda #SOUND_BANK
  jsr SetPRG

  lda PlayerHealth
  bne NotDie
  jsr pently_init
  jsr ShowDie
NotDie:

  jsr pently_update
  lda NeedSFX
  bpl :++
    cmp #SFX::BOOM1
    php
    and #63
    jsr pently_start_sound
    plp
    bne :+
      lda #SFX::BOOM2
      jsr pently_start_sound
    :
    lda #0
    sta NeedSFX
  :
  countdown SoundDebounce

  ; Still need sound bank since the pause screen mutes the sound
  lda keydown
  and #KEY_START
  beq NoPause
.ifdef NMI_MUSIC
    lsr LagFrame
.endif
    jsr PauseScreen
  NoPause:

  lda #MAINLOOP_BANK
  jsr SetPRG

  lda NeedLevelRerender
  beq :+
    lda #MAINLOOP_BANK
    jsr SetPRG
    lsr NeedLevelRerender
    jsr WaitVblank
    jsr RenderLevelScreens
    jsr WaitVblank
  :

  ; Change ability if needed
  lda NeedAbilityChange
  bpl :+
    and #127
    jsr ChangePlayerAbility
    lda #0
    sta NeedAbilityChange
  :

  ; Let player reset their ability
  lda keydown
  and #KEY_SELECT
  bne :+
    lda #0
    sta PlayerSelectTimer
  :
  lda keydown
  and #KEY_SELECT
  beq :+
    lda PlayerAbility
    beq :+
      lda keydown
      and #KEY_DOWN
      bne @ForceResetAbility
      inc PlayerSelectTimer
      lda PlayerSelectTimer
      cmp #30
      bne :+
@ForceResetAbility:
        lda #128
        sta NeedAbilityChange
  :

  lda NeedLevelReload
  beq :+
    jsr WaitVblank
    lda #0
    sta NeedLevelReload
    sta PPUMASK
    lda LevelNumber
    jsr DecompressLevel
    ldx #$ff
    txs
    jmp MainLoopInit
  :

  lda NeedDialog
  beq :+
.ifdef NMI_MUSIC
    lsr LagFrame
.endif
    jsr StartCutscene ; this routine clears NeedDialog
  :

.if 0
  ; Debugging feature
  lda keydown
  and #KEY_SELECT
  beq :+
  lda keylast
  and #KEY_SELECT
  bne :+
    lda #<Intro
    sta ScriptPtr+0
    lda #>Intro
    sta ScriptPtr+1
    inc NeedDialog
  :
.endif

  ; Display the level number if it's a new level
  lda DisplayLevelNumber
  beq NoDisplayLevelNumber
  and #31
  tay
  ldx OamPtr
  lda StartedLevelNumber
  and #7
  add #$41
  sta OAM_TILE,x
  lda #OAM_COLOR_1
  sta OAM_ATTR,x
  lda #256/2-4
  sta OAM_XPOS,x
  lda #240/2-4
  sta OAM_YPOS,x
  txa
  add #4
  stx OamPtr

  inc DisplayLevelNumber
  lda DisplayLevelNumber
  cmp #64
  bcc NoDisplayLevelNumber
  lda #0
  sta DisplayLevelNumber
NoDisplayLevelNumber:

  lda MakeCheckpoint
  beq :++
    lda #0
    sta MakeCheckpoint
    lda PlayerPXH
    sta CheckpointX
    lda PlayerPYH
    sta CheckpointY
    lda LevelNumber
    sta CheckpointLevelNumber

    ldy #GameStateLen-1
  : lda CurrentGameState,y
    sta CheckpointGameState,y
    dey
    bpl :-
  :

.ifdef CPU_METER
  lda #OBJ_ON | BG_ON
  sta PPUMASK
.endif
  .ifdef NMI_MUSIC
    lda #0
    sta LagFrame
  .endif
  jmp VBlankUpdates
.endproc
