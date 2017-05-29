; Princess Engine
; Copyright (C) 2016-2017 NovaSquirrel
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
HaveExtraRAM:
  ldx #15
  lda #>SelectForOptions
  ldy #<SelectForOptions
DontHaveExtraRAM:
  jsr vwfPutsAtRow

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
  sta 2 ; first 8 bits
  jsr ReadJoy8bits
  sta 1 ; middle 8 bits
  jsr ReadJoy8bits
  cmp #$FF ; should be all 1s if official NES or SNES controller
  bne ThirdPartyController
  lda 1    ; should be all 1s if NES, but all 0s if SNES with no keys pressed
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
  and #KEY_SELECT
  beq :+
  pla
  pla
  lda #OPTIONS_BANK
  jsr SetPRG
  jmp ShowOptions
:
  lda keydown
  and #KEY_START
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
SelectForOptions: .byt "          Select: options",0

.proc ShowDie
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

  ; Restore checkpoint
  ldy #GameStateLen-1
: lda CheckpointGameState,y
  sta CurrentGameState,y
  dey
  bpl :-

  lda CheckpointX
  sta PlayerPXH
  lda #0
  sta PlayerPXL
  sta PlayerAbility
  lda CheckpointY
  sta PlayerPYH

  inc IsNormalDoor ; skip setting X and Y

  lda #$40
  sta PlayerPXL
  lda CheckpointLevelNumber
  jmp StartLevel_FromCheckpoint
.endproc

.proc ShowCredits
  rts
.endproc

.proc JumpToLevelSelect
  lda LevelAvailable
  cmp #1
  beq SkipLevelSelect
  lda #VWF_BANK
  jsr SetPRG

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

  jmp ShowLevelSelect
SkipLevelSelect:
  lda #0
  jmp StartLevel
.endproc

