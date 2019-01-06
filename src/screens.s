; Princess Engine
; Copyright (C) 2016-2018 NovaSquirrel
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
.proc ShowTitle
; Turn on NMIs
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_0000
  sta PPUCTRL

; Upload the palette, nametable and graphics
  lda #0
  sta PPUMASK
  lda #$30
  sta LevelBackgroundColor
  lda #GraphicsUpload::TITLE_CHR
  jsr DoGraphicUpload
  lda #GraphicsUpload::TITLE_NAM
  jsr DoGraphicUpload
  lda #GraphicsUpload::TITLE_PAL
  jsr DoGraphicUpload
  ; Clear sprites too
  jsr ClearOAM
  lda #2
  sta OAM_DMA

  ; Get ready for the message that can either
  ; be for the options or for no WRAM error
  lda #$0f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  tax
  jsr WritePPURepeated

  lda #VWF_BANK
  jsr SetPRG
  lda #$23
  sta PPUADDR
  lda #$48
  sta PPUADDR
  ldy #$f0
  ldx #16
  jsr WriteIncreasing

  ; See if we have extra RAM
  ; and display an error if it's missing
  ldx #7
  lda SaveTag
  cmp SaveTagString
  beq HaveExtraRAM
  lda #>NoRAMError
  ldy #<NoRAMError
  jsr vwfPutsAtRow
HaveExtraRAM:
  ldx #15
  lda #>BottomMessage
  ldy #<BottomMessage
  jsr vwfPutsAtRow
DontHaveExtraRAM:

; Turn on the display and get it ready
  jsr WaitVblank
  lda #BG_ON
  sta PPUMASK
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_0000
  sta PPUCTRL
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

; Check the console the controller belongs to
  lda #1
  sta JOY1
  lda #0
  sta JOY1
  sta SNESController
  jsr ReadJoy8bits
; sta 2 ; first 8 bits can be discarded
  jsr ReadJoy8bits
  sta 1 ; middle 8 bits

  ; Second byte also indicates if it's a SNES mouse, so look
  and #%00001111 ; SNES mouse has a signature of 1
  cmp #1
  bne :+
    lda #MOUSE_BANK
    jsr SetPRG
    jmp ShowMouseEasterEgg
  :

  jsr ReadJoy8bits
  cmp #$FF ; last byte should be all 1s if official NES or SNES controller
  bne ThirdPartyController
  lda 1    ; should be all 1s if NES, but all 0s if SNES
  and #%00001111 ; Test that the SNES controller signature is zero
  bne NESController
  inc SNESController
NESController:
ThirdPartyController:

; Onto the actual display loop
DisplayLoop:
  jsr WaitVblank
  jsr ReadJoy
  jsr ReseedRandomizer
  lda keynew
  and #KEY_START
  beq :+
  pla
  pla
  lda #OPTIONS_BANK
  jsr SetPRG
  jmp ShowMainMenu ;ShowOptions
:
  lda keydown
  and #KEY_SELECT
  bne Exit
  jmp DisplayLoop

; wait for Start to get unpressed
Exit:
  jsr WaitVblank
  jsr ReadJoy
  lda keydown
  and #KEY_START
  bne Exit

  ; Disable rendering again
  jsr WaitVblank
  lda #0
  sta PPUMASK
  rts
.endproc

NoRAMError: .byt "No WRAM, so game won't work!",0
;SelectForOptions: .byt "          Select: options",0
;BottomMessage: .byt "       Prerelease version?",0
BottomMessage: .byt "     (c) 2018 NovaSquirrel",0

.proc ShowDie
  ; If the level is to be preserved, don't reload it
  lda PreserveLevel
  beq NoPreserveLevel
    lda CheckpointX
    sta PlayerPXH
    lda #0
    sta PlayerPXL
    lda CheckpointY
    sta PlayerPYH
    inc NeedLevelRerender

    lda #4
    sta PlayerHealth

    jsr DieSound

    lda #SOUND_BANK
    jsr SetPRG

    lda #0
    sta NeedSFX

    lda LevelMusic
    jmp pently_start_music
  NoPreserveLevel:

  jsr WaitVblank
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  ; Set the palette to black and red
  ldx #4
: lda #$0f
  sta PPUDATA
  lda #$06
  sta PPUDATA
  lda #$16
  sta PPUDATA
  lda #$26
  sta PPUDATA
  dex
  bne :-
  jsr UpdateScrollRegister

  jsr DieSound

  ; Restore checkpoint
  ldy #GameStateLen-1
: lda CheckpointGameState,y
  sta CurrentGameState,y
  dey
  bpl :-

  ; Reset ability and reset player to checkpoint position
  lda CheckpointX
  sta PlayerPXH
  lda #0
  sta PlayerPXL
  sta PlayerAbility
  lda CheckpointY
  sta PlayerPYH

  inc IsNormalDoor ; skip setting X and Y (overridden with checkpoint)

  lda #$40
  sta PlayerPXL
  lda CheckpointLevelNumber

  jmp StartLevel_FromCheckpoint

DieSound:
  ; Ramp up to $4011 = 64
  ldx #0
@Loop:
  stx $4011
  ; Delay
  ldy #192
: iny
  bne :-
  ; Loop back
  inx
  cpx #64
  bne @Loop

  ; Play the sample
  lda #VOICE_BANK
  jsr SetPRG

  lda StartedLevelNumber
  and #%111000
  cmp #%001000
  beq BummerInstead
  jsr quadpcm_play_die
  jmp :+
BummerInstead:
  jsr quadpcm_play_bummer
:

  lastSample = 4
  ldx 4
@Loop2:
  stx $4011
  ; Delay
  ldy #192
: iny
  bne :-
  ; Loop back
  dex
  bpl @Loop2

  rts
.endproc

.proc JumpToLevelSelect
;  lda LevelAvailable
;  cmp #1
;  beq SkipLevelSelect
  lda #VWF_BANK
  jsr SetPRG

.ifndef PLAYTESTING_BUILD
  ; Calculate the starting world
  ldy #0
: lda LevelAvailable,y
  beq :+
  iny
  cpy #8
  bne :-
: dey
  tya
  asl
  asl
  asl
  sta StartedLevelNumber

  ; Calculate the level to have pre-selected
  lda LevelAvailable,y
: lsr
  beq :+
  inc StartedLevelNumber
  bne :-
:
.else
  lda #0
  sta StartedLevelNumber
.endif

  jmp ShowLevelSelect
;SkipLevelSelect:
;  lda #0
;  jmp StartLevel
.endproc

.proc ShowLevelEnd
Ptr = 2
; Prepare the upload data
  ldx #31
  lda #$3e
: sta UploadTileSpace+32,x
  dex
  bpl :-

  jsr WaitVblank
  lda #<$2000
  sta Ptr+0
  lda #>$2000
  sta Ptr+1

.ifdef FADE_TO_ONLY_WHITE
  ; Change all of the lightest colors to white
  ldx #3
: lda #$3f
  sta PPUADDR
  lda PaletteIndexes,x
  sta PPUADDR
  lda #$30
  sta PPUDATA
  dex
  bpl :-
  jsr UpdateScrollRegister
.endif

Loop:
  jsr WaitVblank
  ; Left nametable
  lda Ptr+1
  sta PPUADDR
  lda Ptr+0
  sta PPUADDR
  jsr UploadTwoTiles
  ; Right nametable
  lda Ptr+1
  ora #$04
  sta PPUADDR
  lda Ptr+0
  sta PPUADDR
  jsr UploadTwoTiles

  jsr UpdateScrollRegister

  ; Next row
  lda Ptr+0
  add #32
  sta Ptr+0
  addcarry Ptr+1

  ; Stop at attribute table
  lda Ptr+1
  cmp #$23
  bne Loop
  lda Ptr+0
  cmp #$c0
  bne Loop

  ; Set background to white
  jsr WaitVblank
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  lda #$30
  sta PPUDATA
  jsr UpdateScrollRegister

  ; Delay
  ldx #15
: jsr WaitVblank
  dex
  bne :-

  lda #OPTIONS_BANK
  jsr SetPRG
  jmp ShowPreLevel

.ifdef FADE_TO_ONLY_WHITE
PaletteIndexes:
  .byt $03, $07, $0b, $0f
.endif
.endproc
