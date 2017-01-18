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

; Start the main loop off and initialize things
.proc MainLoopInit
  lda #0
  sta PPUMASK
  sta UploadTileAddress+1 ; Make sure tile uploading is off
  sta IsNormalDoor        ; Make sure the door entering flag is off

  ; This value is kept at $f0 for most routines, so make sure it's right
  lda #$f0
  sta EnemyRightEdge

  ; Start the music.
  ; Right now music is disabled until I get something non-annoying in there.
  lda #SOUND_BANK
  jsr _SetPRG
  jsr pently_init
;  lda LevelMusic
;  jsr pently_start_music
  jsr pently_stop_music

  ; Render the part of the level the player starts in, if there isn't a dialog
  ; that needs to be shown at the start of the level.
  ; (this way the level isn't shown for a frame before the dialog starts)
  lda #MAINLOOP_BANK
  jsr SetPRG
  lda NeedDialog
  bne :+
  inc JustTeleported
  jsr RenderLevelScreens ; Render the screen the player's on
  jsr WaitVblank
  lda #BG_ON             ; Turn PPU display on
  sta PPUMASK
: 

  ; Make sure NMI is on
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  jsr ClearOAM
  jmp VBlankUpdates
.endproc

.proc VBlankUpdates
  ; The VRAM is unusable outside of vertical blank because the PPU is constantly using it.
  ; Nova the Squirrel writes to queues during gameplay when it wants VRAM changes, and waits for vertical blank
  ; to actually perform the changes.
  jsr WaitVblank
  lda #2
  sta OAM_DMA
  bit PPUSTATUS

  ; if IsScrollUpdate is set, update the side of the screen with the ThirtyUpdate buffer
  lda IsScrollUpdate
  jeq NotScrollUpdate
    lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN ; write vertically
    sta PPUCTRL
    lda ThirtyUpdateAddr+0
    sta PPUADDR
    lda ThirtyUpdateAddr+1
    sta PPUADDR
    .repeat 30, I
      lda ThirtyUpdateTile+I
      sta PPUDATA
    .endrep
    ; Update attributes so the newly scrolled-in tiles have the right colors
    ; Note: Vertical writes are still on! This cuts the number of times we need to write
    ; to PPUADDR in half.
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

  ; Horizontal writes again
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL

  ; Upload four tiles worth of data (64 bytes) to a PPU address if needed
  lda UploadTileAddress+1
  beq NoUploadTile
    sta PPUADDR
    lda UploadTileAddress+0
    sta PPUADDR
    jsr UploadFourTiles
  NoUploadTile:

  ; Queue for up to four single-byte changes
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

  ; Queue for up to three changes the size of a block
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

  ; The PPU address register is the same as the scroll register, so
  ; change the scroll value to be correct again
  jsr UpdateScrollRegister
.endproc
; don't put anything else here
.proc MainLoop
  ; Turn PPU display on (only if the level doesn't need to be rerendered)
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
  ; A flag gets set at the start of the main loop, and if it's still
  ; set when NMI happens, a lag frame occured
  .ifdef NMI_MUSIC
    lda #1
    sta LagFrame
  .endif
  countdown IsScrollUpdate ; decrease scroll update stage
  jsr ReadJoy
  jsr ClearOAM

  ; There's a timer that only goes up every 4 frames rather than 1
  ; and delayed metatile edits use it so that they can fit a longer
  ; delay into a byte.
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

  ; Run the player, objects, and most other stuff
  lda #MAINLOOP_BANK
  jsr SetPRG

  lda FallingBlockPointer+1
  beq NoFallingBlock
    ; Load the position
    ldy FallingBlockY
    lda FallingBlockPointer+0
    sta LevelBlockPtr+0
    lda FallingBlockPointer+1
    sta LevelBlockPtr+1
    lda (LevelBlockPtr),y
    bne NoMoreFallingBlock

    ; Erase this block and add another one below
    dey
    lda (LevelBlockPtr),y
    pha
    lda #0
    jsr ChangeBlock
    iny
    pla
    jsr ChangeBlock
    inc FallingBlockY
    lda FallingBlockY
    cmp #15
    bne NoFallingBlock
  NoMoreFallingBlock:
  lda #0
  sta FallingBlockPointer+1
NoFallingBlock:

  jsr RunPlayer
  jsr AdjustCamera
  jsr DisplayPlayer
  lda #OBJECT_BANK
  jsr SetPRG
  jsr RunObjects
  jsr FlickerEnemies

  lda #SOUND_BANK
  jsr SetPRG

  lda PlayerHealth
  bne NotDie
  jsr pently_init ; Stop music and sound effects
  jsr ShowDie
NotDie:

  ; Update music+sfx, play sounds if needed
  jsr pently_update
  lda NeedSFX
  bpl :++
    cmp #SFX::BOOM1 ; boom sound has a second sound effect that plays with it
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

  ; Render the level if needed (like when you go in a door)
  lda #MAINLOOP_BANK
  jsr SetPRG

  lda NeedLevelRerender
  beq :+
    lda #MAINLOOP_BANK
    jsr SetPRG
    jsr WaitVblank
    jsr RenderLevelScreens
    lda #0
    sta NeedLevelRerender
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

  ; Reset the whole level if that's needed too
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

  ; Display the level number using a sprite if it's a new level
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

    ; Copy the current game state into the checkpoint state
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
