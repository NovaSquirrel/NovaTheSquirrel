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

  jsr pently_init
  lda #0
  jsr pently_start_music

  lda #4
  sta PlayerHealth

  lda #0
  sta UploadTileAddress+1

;  ldy #<HelloString
;  lda #>HelloString
;  jsr CopyToStringBuffer

;  lda #VWF_BANK
;  jsr SetPRG
;  jsr ClearDynamicVRAM
;  jsr clearLineImg
;  ldx #0
;  ldy #<StringBuffer
;  lda #>StringBuffer
;  jsr vwfPuts
;  ldy #<$0c00
;  lda #>$0c00
;  jsr copyLineImg

  lda #MAINLOOP_BANK
  jsr SetPRG
  jsr RenderLevelScreens
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  jsr WaitVblank
  jmp MainLoop
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
;  lda #OBJ_ON | BG_ON | %11100000
;  sta PPUMASK
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

.if 0
  lda keydown
  and #KEY_B
  beq :+
  lda keylast
  and #KEY_B
  bne :+
    ldy #0
    jsr TryMakeSprite
  :
.endif

  lda #SOUND_BANK
  jsr SetPRG
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
  lda #OBJ_ON | BG_ON ;OBJ_CLIP | BG_CLIP
  sta PPUMASK

.if 0
  lda #<($17c0)
  sta UploadTileAddress+0
  lda #>($17c0)
  sta UploadTileAddress+1
  ldx #63
  lda retraces
: sta UploadTileSpace,x
  dex
  bpl :-
.endif

.if 0
  lda keydown
  and #KEY_SELECT
  beq :+
  lda keylast
  and #KEY_SELECT
  bne :+
    jsr StartCutscene
  :
.endif

.if 1
  lda keydown
  and #KEY_SELECT
  beq :++
  lda keylast
  and #KEY_SELECT
  bne :++
    lda PlayerAbility
    add #1
    cmp #12
    bne :+
      lda #0
    :
    jsr ChangePlayerAbility
  :
.endif

  jmp VBlankUpdates
.endproc
