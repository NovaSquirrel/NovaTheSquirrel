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

; Can probably be moved into another bank, and far called into

.proc OptionsScreenCommonLoop
Color1 = 10
Color2 = 11
Color3 = 12
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
  jmp ReadJoy
.endproc

.proc OptionsScreenSetup
Color1 = 10
Color2 = 11
Color3 = 12
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

  ; Write the background tiles for the sides
  lda #0
  sta PPUADDR
  sta PPUADDR
  ldx #0
: lda OptionsBackground,x
  sta PPUDATA
  inx
  bne :-

  ; Preset the colors for the cycling
  lda #$35
  sta Color1
  lda #$3a
  sta Color2
  lda #$32
  sta Color3
  rts

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
OptionsPalette:
  .byt $30, $0f, $00, $10
.endproc

.proc ShowOptions
Cursor = 13
LastOptionNum = 14
LastOptionConst = 5
  lda #LastOptionConst
  sub OptionsViaInventory
  sta LastOptionNum

  jsr OptionsScreenSetup

  lda #0
  sta Cursor
  sta DeleteSavePlaceholder
  sta IsCustomLevel

; Write the options
  PositionXY 0, 11, 4
  jsr PutStringImmediate
  .byt "-Options:-",0

  lda OptionsViaInventory
  bne :+
  PositionXY 0, 3, 10
  jsr PutStringImmediate
  .byt "Start game",0
:
  lda OptionsViaInventory
  beq :+
  PositionXY 0, 3, 10
  jsr PutStringImmediate
  .byt "Resume game",0
:
  PositionXY 0, 3, 12
  jsr PutStringImmediate
  .byt "Acceleration",0
  PositionXY 0, 3, 14
  jsr PutStringImmediate
  .byt "Run speed",0
  PositionXY 0, 3, 16
  jsr PutStringImmediate
  .byt "Double-tap run",0
  PositionXY 0, 3, 18
  jsr PutStringImmediate
  .byt "B always shoots",0
  PositionXY 0, 3, 20
  jsr PutStringImmediate
  .byt "Delete save",0
  PositionXY 0, 3, 24
  jsr PutStringImmediate
  .scope
  .byt .sprintf("Project day %d", (.TIME / 86400) - 16611),0
  .endscope
  PositionXY 0, 3, 26
  jsr PutStringImmediate
  .byt "http://novasquirrel.com",0

  ; Print current values for the options
  ldy LastOptionNum
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

  jsr OptionsScreenCommonLoop

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
  beq :+
    lda OptionsViaInventory
    jeq JumpToLevelSelect
    rts
  :

  lda keynew
  and #KEY_B
  beq :+
    lda OptionsViaInventory
    jeq ShowMainMenu
  :

  lda keynew
  and #KEY_A
  beq NoA
  ; If Cursor is at the top or at the bottom, A does stuff
  ; otherwise it doesn't
  lda Cursor ; 0 = Start game
  bne :+
  lda OptionsViaInventory
  beq ReturnFromTitle
  rts
ReturnFromTitle:
  jmp JumpToLevelSelect
:
  cmp #LastOptionConst ; 4 = Delete save
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
    cmp LastOptionNum
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

  jsr StopSoundFar
  inc pently_music_playing

  jmp Loop

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
  .hibytes $2159+64*1, $2159+64*2, $2159+64*3, $2159+64*4, $2159+64*5
LoName:
  .lobytes $2159+64*1, $2159+64*2, $2159+64*3, $2159+64*4, $2159+64*5

; Text for the different choices
ChoiceValues:
  .byt "SlowFast"
  .byt "FastSlow"
  .byt "No  Yes "
  .byt "No  Yes "
  .byt "No  Yes "
.endproc

.proc ShowDeleteSavedShared
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
  rts
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
  jsr ShowDeleteSavedShared

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

.proc ShowDeleteLevelScreen
  jsr WaitVblank
  lda #0
  sta PPUMASK
  lda #' '
  jsr ClearNameCustom

  PositionXY 0, 10, 4
  jsr PutStringImmediate
  .byt "Delete level?",0
  jsr ShowDeleteSavedShared

: jsr ReadJoy
  lda keynew
  beq :-
  and #KEY_SELECT
  beq DontResetSave
    lda CustomLevelSlot
    beq :+
      sub #1
      jsr SaveLevel
    :
DontResetSave:
  jmp LaunchLevelEditor
.endproc

OptionsBackground:
  .incbin "../chr/options.chr"

.proc ShowMainMenu
Cursor = 13

  jsr SoundTestStopMusic
  jsr OptionsScreenSetup

  lda #0
  sta Cursor
  sta IsCustomLevel

; Write the options
  PositionXY 0, 11, 4
  jsr PutStringImmediate
  .byt "-Main menu-",0

  PositionXY 0, 3, 10
  lda LevelCleared
  bne :+
    jsr PutStringImmediate
    .byt "Start the game!",0
    jmp NoLevelsCleared
  :
  lda LevelCleared
  beq :+
    jsr PutStringImmediate
    .byt "Level Select (",0
  :

  ; Calculate completion percentage
  ldy #0 ; percentage
; --------------------------
  ldx #4 ; index
CountClearedLoop:
  lda LevelCleared,x
  ; Increment Y for every bit
: lsr
  bcc :+
    iny
  :
  cmp #0
  bne :--
  dex
  bpl CountClearedLoop
; --------------------------
  ldx #4 ; index
CountCollectLoop:
  lda CollectibleBits,x
  ; Increment Y for every bit
: lsr
  bcc :+
    iny
  :
  cmp #0
  bne :--
  dex
  bpl CountCollectLoop
; --------------------------
  ; Make bosses count for more
  ldx #4
CountBossesLoop:
  lda LevelCleared,x
  bpl :+
    tya
    add #4
    tay
  :
  dex
  bpl CountBossesLoop

  ; Draw percentage
  cpy #100
  bcc :+
    ; Write the hundreds digit
    lda #'1'
    sta PPUDATA
    ; Subtract 100 from the percentage
    tya
    sub #100
    tay
  :

  lda BCD99,y
  pha
  lsr
  lsr
  lsr
  lsr
  ora #'0'
  sta PPUDATA
  pla
  and #15
  ora #'0'
  sta PPUDATA

  lda #'%'
  sta PPUDATA
  lda #')'
  sta PPUDATA

NoLevelsCleared:

  PositionXY 0, 3, 12
  jsr PutStringImmediate
  .byt "View controls",0
  PositionXY 0, 3, 14
  jsr PutStringImmediate
  .byt "Game options",0
  PositionXY 0, 3, 16
  jsr PutStringImmediate
  .byt "Extra features",0

  ; This will make the colors change on the first loop iteration
  lda #255
  sta retraces

Loop:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK

  jsr OptionsScreenCommonLoop

  lda keynew
  and #KEY_START
  beq :+
    jmp JumpToLevelSelect
  :

  lda keynew
  and #KEY_A
  beq NoA
  ldy Cursor
  jeq JumpToLevelSelect
  dey
  jeq ShowControlsTrampoline
  dey
  jeq ShowOptions
  dey
  jeq ShowExtraFeatures
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
.endproc

.proc ShowExtraFeatures
Cursor = 13
FeatureCount = TempVal

  jsr SoundTestStopMusic
  jsr OptionsScreenSetup

  lda #0
  sta Cursor

  lda #3
  sta FeatureCount

  lda LevelCleared+4 ; Beating the game unlocks credits
  bpl :+
    inc FeatureCount
  :
  lda LevelCleared+0
  and LevelCleared+1
  and LevelCleared+2
  and LevelCleared+3
  and LevelCleared+4
  and CollectibleBits+0
  and CollectibleBits+1
  and CollectibleBits+2
  and CollectibleBits+3
  and CollectibleBits+4
  cmp #255
  bne :+
    inc FeatureCount
    inc FeatureCount
  :

; Write the options
  PositionXY 0, 11, 4
  jsr PutStringImmediate
  .byt "-Extras!-",0

  lda FeatureCount
  cmp #1
  bne :+
    PositionXY 0, 3, 20
    jsr PutStringImmediate
    .byt "Check back here if you",0
    PositionXY 0, 3, 22
    jsr PutStringImmediate
    .byt "beat or 100% the game!",0
  :

  PositionXY 0, 3, 10
  jsr PutStringImmediate
  .byt "Back",0
  PositionXY 0, 3, 12
  jsr PutStringImmediate
  .byt "Double Action Blaster Guys",0
  PositionXY 0, 3, 14
  jsr PutStringImmediate
  .byt "Capsules",0
  PositionXY 0, 3, 16
  jsr PutStringImmediate
  .byt "Level Studio",0

  lda FeatureCount
  cmp #3
  beq :+
  PositionXY 0, 3, 18
  jsr PutStringImmediate
  .byt "Credits",0
  lda FeatureCount
  cmp #4
  beq :+
  PositionXY 0, 3, 20
  jsr PutStringImmediate
  .byt "Sound test",0
  PositionXY 0, 3, 22
  jsr PutStringImmediate
  .byt "Early graphics",0
:

  ; This will make the colors change on the first loop iteration
  lda #255
  sta retraces

Loop:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK

  jsr OptionsScreenCommonLoop

  lda keynew
  and #KEY_B
  beq :+
    jmp ShowMainMenu
  :

  lda keynew
  and #KEY_A
  beq NoA
  ldy Cursor
  jeq ShowMainMenu
  dey
  jeq LaunchDABG
  dey
  jeq LaunchPuzzle
  dey
  jeq LaunchLevelEditor
  dey
  jeq LaunchCredits
  dey
  jeq ShowSoundTest
  dey
  jeq ShowEarlyTiles
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
    cmp FeatureCount
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
.endproc

.proc LaunchLevelEditor
ModeNum = CustomLevelMode
  ; Test for SXROM
  ldx #0
  stx IsSXROM
  stx ModeNum
  stx SandboxMode
  stx SandboxFlyMode
  stx IsCustomLevel

  ; Require SXROM for the level editor
  jsr TestForSXROM
  beq :+
    lda #SANDBOX_LEVEL
    sta StartedLevelNumber
    jmp StartLevel
  :
  ; X is still zero
  inx
  stx IsCustomLevel
  stx IsSXROM

  jsr OptionsScreenSetup
  lda #GraphicsUpload::CHR_LEVELEDIT_ICONS
  jsr DoGraphicUpload

  PositionXY 0, 10, 4
  jsr PutStringImmediate
  .byt "Level Studio",0
  PositionXY 0, 5, 10
  jsr PutStringImmediate
  .byt "Mode:",0

  ; Draw mode icons
  PositionXY 0, 11, 10
  ldy #$80
  jsr WriteIncreasing16
  PositionXY 0, 11, 11
  ldy #$90
  jsr WriteIncreasing16
  PositionXY 0, 11, 12
  ldy #$a0
  jsr WriteIncreasing16

  PositionXY 0, 5, 15
  jsr PutStringImmediate
  .byt "Slot: Empty A B C D E",0
  PositionXY 0, 5, 20
  jsr PutStringImmediate
  .byt "Up+Select will toggle",0
  PositionXY 0, 5, 21
  jsr PutStringImmediate
  .byt "physics when editing.",0

  ; Force palette change
  lda #255
  sta retraces
Loop1:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK

  ; Write mode string
  PositionXY 0, 5, 12
  lda ModeNum
  asl
  asl
  adc ModeNum ; carry always clear
  tax
  ldy #5
: lda ModeNames,x
  sta PPUDATA
  inx
  dey
  bne :-

  ; Do common menu stuff
  jsr OptionsScreenCommonLoop

  lda keynew
  and #KEY_LEFT
  beq :+
    dec ModeNum
  :

  lda keynew
  and #KEY_RIGHT
  beq :+
    inc ModeNum
  :

  lda keynew
  and #KEY_B
  jne ShowExtraFeatures

  lda ModeNum
  and #3
  sta ModeNum

  ; Draw cursor
  lda #OAM_COLOR_0
  sta OAM_ATTR
  lda #$51
  sta OAM_TILE
  sta OAM_TILE+4
  lda ModeNum
  asl
  asl
  asl
  asl
  asl
  add #12*8
  sta OAM_XPOS
  lda #13*8-1
  sta OAM_YPOS
  lda #255
  sta OAM_YPOS+4

  lda keynew
  and #KEY_A
  beq Loop1

; -------------------------------------
  lda #0
  sta CustomLevelSlot

Loop2:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK

  ; Do common menu stuff
  jsr OptionsScreenCommonLoop

  lda keynew
  and #KEY_B
  jne Loop1

  lda keynew
  and #KEY_LEFT
  beq :+
    dec CustomLevelSlot
    bpl :+
      lda #5
      sta CustomLevelSlot
  :

  lda keynew
  and #KEY_RIGHT
  beq :+
    inc CustomLevelSlot
    lda CustomLevelSlot
    cmp #6
    bne :+
      lda #0
      sta CustomLevelSlot
  :

  lda keynew
  and #KEY_A
  beq :+
    ldx ModeNum
    lda ModeH,x
    pha
    lda ModeL,x
    pha
    rts
  :

  ; Draw cursor
  lda #OAM_COLOR_1
  sta OAM_ATTR
  lda #OAM_COLOR_0
  sta OAM_ATTR+4
  lda #$51
  ldx CustomLevelSlot
  lda CursorSlotXPos,x
  sta OAM_XPOS+4
  lda #16*8-1
  sta OAM_YPOS+4

  jmp Loop2

; -------------------------------------

CursorSlotXPos:
  .byt 13*8, 17*8, 19*8, 21*8, 23*8, 25*8

ModeNames:
  .byt "Play!"
  .byt "Block"
  .byt "Enemy"
  .byt "Erase"

ModeL:
  .byt <(ModePlay-1), <(ModeBlock-1), <(ModeEnemy-1), <(ModeErase-1)
ModeH:
  .byt >(ModePlay-1), >(ModeBlock-1), >(ModeEnemy-1), >(ModeErase-1)

; -------------------------------------

ModePlay:
  lda #SANDBOX_LEVEL ; should be the last level slot, modify if not
  sta StartedLevelNumber
  jmp StartLevel

ModeBlock:
  lda #SANDBOX_LEVEL ; should be the last level slot, modify if not
  sta StartedLevelNumber
  lda #1
  sta SandboxFlyMode
  jmp StartLevel

ModeEnemy:
  ; Only allow editing enemies for non-empty level slots
  lda CustomLevelSlot
  jeq LaunchLevelEditor
  sub #1
  jsr LoadLevel

  jmp SpriteEditTrampoline

ModeErase:
  jsr ClearLevelMap
  jmp ShowDeleteLevelScreen

ClearLevelMap:
  ; Init pointer for $6000
  ldx #$60
  stx 1
  lda #0
  sta 0
  tay
  ; Clear loop
: sta (0),y
  iny
  bne :-
  inx
  stx 1
  cpx #$70
  bne :-

  ; A and Y are still zero
  ; Clear the tilesets
  ldx #SandboxTilesets_Length-1
: sta SandboxTerrain,x
  dex
  bpl :-

  ; Also delete enemy list
  lda #255
: sta SpriteListRAM,y
  iny
  bne :-
  rts
.endproc

.proc LaunchCredits
  lda #OPTIONS_BANK
  jsr StartCredits
  jmp ShowExtraFeatures
.endproc

.proc ShowEarlyTiles
  jsr WaitVblank
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #0
  sta PPUMASK

  lda #' '
  jsr ClearNameCustom

  PositionXY 0, 8, 8
  ldy #$80
Draw:
  sty PPUDATA
  iny
  tya
  and #15
  bne :+
    lda #' '
    jsr WritePPURepeated16
  :
  cpy #$00
  bne Draw

  ; Set attributes
  lda #$23
  sta PPUADDR
  lda #$d2
  sta PPUADDR
  ldx #11
: lda Attribute,x
  sta PPUDATA
  dex
  bpl :-
  ; ends at 23dd

  PositionXY 0, 3, 18
  jsr PutStringImmediate
  .byt "These are the first tiles",0
  PositionXY 0, 3, 20
  jsr PutStringImmediate
  .byt "that I ever drew for this",0
  PositionXY 0, 3, 22
  jsr PutStringImmediate
  .byt "game. Press A to exit.",0

; Upload graphics and palette
  lda #$31
  sta LevelBackgroundColor
  lda #GraphicsUpload::CHR_EARLYTILES
  jsr DoGraphicUpload
  jsr WaitVblank
  lda #GraphicsUpload::PAL_EARLYTILES
  jsr DoGraphicUpload

  jsr WaitVblank
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #BG_ON
  sta PPUMASK

Loop:
  jsr WaitForKey
  lda keydown
  and #KEY_A|KEY_B|KEY_START
  beq Loop

  jmp ShowExtraFeatures

Attribute:
  .byt %11011010, %01011000, %01010101, 0
  .byt 0,0,0,0
  .byt 255, %11001100, %01010000, %10100000
.endproc
