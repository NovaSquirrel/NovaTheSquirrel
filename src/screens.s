; Princess Engine
; Copyright (C) 2016 NovaSquirrel
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

DisplayLoop:
  jsr WaitVblank
  jsr ReadJoy
  lda keynew
  and #KEY_SELECT
  beq :+
  pla
  pla
  jmp ShowOptions
:
  lda keydown
  and #KEY_START
  bne Exit
  jmp DisplayLoop
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
  lda #SOUND_BANK
  jsr SetPRG
  jsr quadpcm_play_die

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

  lda CheckpointLevelNumber
  jmp StartLevel_FromCheckpoint
.endproc

.proc ShowCredits
  rts
.endproc

.proc ShowOptions
Color1 = 10
Color2 = 11
Color3 = 12
Cursor = 13
; Initialize PPU stuff
  jsr WaitVblank
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #0
  sta PPUMASK

  lda #' '
  jsr ClearNameCustom

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL
  lda #0
  sta PPUMASK
  jsr ClearOAM
  lda #2
  sta OAM_DMA

; Write nametable
  lda #0
  jsr BackgroundColumn
  lda #$1e
  jsr BackgroundColumn

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL

  ; write attributes
  lda #$23
  sta PPUADDR
  lda #$c0
  sta PPUADDR
  lda #8
  sta 0 ; counter
: lda #%00010001
  sta PPUDATA
  lda #0
  ldx #6
  jsr WritePPURepeated
  lda #%01000100
  sta PPUDATA
  dec 0
  bne :-

; Upload graphics and palette
  jsr ClearBG4kb
  lda #GraphicsUpload::CHR_FONT
  jsr DoGraphicUpload
  jsr UploadNovaAndCommon
  jsr WaitVblank
  ; Write palette
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  ldx #0
: lda OptionsPalette,x
  sta PPUDATA
  inx
  cpx #4
  bne :-

  lda #0
  sta Cursor
  sta DeleteSavePlaceholder
  sta PPUADDR
  sta PPUADDR
  ldx #64-1
: lda OptionsBackground,x
  sta PPUDATA
  dex
  bpl :-

; Write the options
  PositionXY 0, 11, 4
  jsr PutStringImmediate
  .byt "-Options:-",0

  PositionXY 0, 3, 10
  jsr PutStringImmediate
  .byt "Start game",0
  PositionXY 0, 3, 12
  jsr PutStringImmediate
  .byt "Acceleration",0
  PositionXY 0, 3, 14
  jsr PutStringImmediate
  .byt "Run speed",0
  PositionXY 0, 3, 16
  jsr PutStringImmediate
  .byt "Run method",0
  PositionXY 0, 3, 18
  jsr PutStringImmediate
  .byt "Delete save",0

  ; Preset the colors for the cycling
  lda #$35
  sta Color1
  lda #$3a
  sta Color2
  lda #$32
  sta Color3

  ; Print current values for the options
  ldy #4
: tya
  tax
  jsr PrintChoiceValue
  dey
  bpl :-

  ; This will make the colors change on the first loop iteration
  lda #255
  sta retraces

Loop:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK

  ; Every 32 frames, cycle some colors
  lda retraces
  and #31
  bne NoColorChange
  ; Write the colors and cycle them at the same time
  lda #$3f
  sta PPUADDR
  lda #$05
  sta PPUADDR
  lda Color1
  pha
  sta PPUDATA
  lda Color2
  sta PPUDATA
  sta Color1
  lda Color3
  sta PPUDATA
  sta Color2
  pla
  sta Color3
NoColorChange:
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #2
  sta OAM_DMA
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  jsr ReadJoy

  ; Let the player change the options
  ldx Cursor
  dex
  bmi NoOptionChange
  lda keynew
  and #KEY_LEFT|KEY_RIGHT
  beq :+
    lda SavedOptions,x
    eor #1
    sta SavedOptions,x
    jsr WaitVblank
    jsr PrintChoiceValue
    lda #0
    sta PPUSCROLL
    sta PPUSCROLL
  :
NoOptionChange:

  lda keynew
  and #KEY_START
  jne JumpToLevelSelect

  lda keynew
  and #KEY_A
  beq NoA
  ; If Cursor is at the top or at the bottom, A does stuff
  ; otherwise it doesn't
  lda Cursor ; 0 = Start game
  jeq JumpToLevelSelect
  cmp #4 ; 4 = Delete save
  bne NoA
  lda DeleteSavePlaceholder
  jne ShowDeleteSaveScreen
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
    cmp #4
    beq :+
    inc Cursor
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

; Make two columns of the animated background tiles
BackgroundColumn:
  sta 0
  lda #$20
  sta PPUADDR
  lda 0
  sta PPUADDR
  ldx #15
  ldy #0
  jsr PPURepeatedAlt
  inc 0
  lda #$20
  sta PPUADDR
  lda 0
  sta PPUADDR
  ldx #15
  ldy #2
  jmp PPURepeatedAlt
PPURepeatedAlt:
  sty PPUDATA
  iny
  sty PPUDATA
  dey
  dex 
  bne PPURepeatedAlt
  rts

; Print the value for choice number X
PrintChoiceValue:
  ; Write PPU address from table
  lda HiName,x
  sta PPUADDR
  lda LoName,x
  sta PPUADDR

  ; Get offset for the option text
  lda SavedOptions,x
  asl
  asl
  sta 0

  txa
  asl
  asl
  asl
  ora 0
  tax
  ; Write text
  lda ChoiceValues+0,x
  sta PPUDATA
  lda ChoiceValues+1,x
  sta PPUDATA
  lda ChoiceValues+2,x
  sta PPUDATA
  lda ChoiceValues+3,x
  sta PPUDATA
  rts

; Nametable addresses to put the choice values at
HiName:
  .hibytes $2159+64*1, $2159+64*2, $2159+64*3, $2159+64*4
LoName:
  .lobytes $2159+64*1, $2159+64*2, $2159+64*3, $2159+64*4

; Text for the different choices
ChoiceValues:
  .byt "SlowFast"
  .byt "FastSlow"
  .byt "B   Tap "
  .byt "No  Yes "
OptionsPalette:
  .byt $30, $0f, $00, $10
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
  lda #0
  sta StartedLevelNumber
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

.proc ShowDeleteSaveScreen
  jsr WaitVblank
  lda #0
  sta PPUMASK
  lda #' '
  jsr ClearNameCustom

  PositionXY 0, 10, 4
  jsr PutStringImmediate
  .byt "Delete save?",0
  PositionXY 0, 3, 14
  jsr PutStringImmediate
  .byt "Push Select if you're sure",0
  PositionXY 0, 2, 16
  jsr PutStringImmediate
  .byt "Push anything else to cancel",0

  jsr WaitVblank
  lda #BG_ON
  sta PPUMASK
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

: jsr ReadJoy
  lda keynew
  beq :-
  and #KEY_SELECT
  beq DontResetSave
  lda #0 ; Corrupt the save tag so the check fails
  sta SaveTag
DontResetSave:
  jmp Reset
.endproc

OptionsBackground:
  .incbin "../chr/options.chr"
