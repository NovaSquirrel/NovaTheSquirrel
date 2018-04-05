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

.macro MiniFontText String
  .repeat .strlen(String), I
    .scope
      Char = .strat(String, I)
      .if Char = ' '
        .byt $e0
      .endif
      .if Char = '-'
        .byt $fb
      .endif
      .if Char = ':'
        .byt $fc
      .endif
      .if Char >= 'A' && Char <= 'Z'
        .byt $e1 + Char-'A'
      .endif
    .endscope
  .endrep
  .byt 0
.endmacro

.proc ScreenOff
  jsr WaitVblank
  lda #0
  sta PPUMASK
  rts
.endproc

.proc ScreenOn
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  jsr WaitVblank
  lda #BG_ON | OBJ_ON
  sta PPUMASK
  rts
.endproc

.proc OpenSandboxMenu
; star is $51 or $52
CursorX = SandboxCursorX
CursorY = 5
  ; Set OBJ back to $1000 because the tile placing mode changes it to $0000
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  jsr ClearName
  jsr ClearOAM
  lda #2
  sta OAM_DMA

  PositionXY 0, 8, 4
  jsr PutStringImmediate
  MiniFontText "- SANDBOX MODE -"

; Draw the 7 blocks currently selected
  ldy #0
  bit PPUSTATUS
DrawBlockLoop:
  ldx SandboxBrushes,y
  jsr GetBlockInfoFar
  ; Top row
  lda #$21
  sta PPUADDR
  lda BlockLowA,y
  sta PPUADDR
  lda 0
  sta PPUDATA
  lda 2
  sta PPUDATA
  ; Bottom row
  lda #$21
  sta PPUADDR
  lda BlockLowB,y
  sta PPUADDR
  lda 1
  sta PPUDATA
  lda 3
  sta PPUDATA
  ; Palette
  lda #$23
  sta PPUADDR
  tya
  add #$d0
  sta PPUADDR
  lda 4
  sta PPUDATA

  iny
  cpy #7
  bne DrawBlockLoop 

  PositionXY 0, 3, 12
  jsr PutStringImmediate
  MiniFontText "DRAW WITH BLOCK"
  PositionXY 0, 3, 13
  jsr PutStringImmediate
  MiniFontText "SELECT NEW BLOCK"
  PositionXY 0, 3, 14
  jsr PutStringImmediate
  MiniFontText "COPY LEVEL BLOCK"

  ; Horizontal line
  PositionXY 0, 3, 16
  ldx #20
  lda #$fb
  jsr WritePPURepeated

  PositionXY 0, 3, 18
  jsr PutStringImmediate
  MiniFontText "SELECT LEVEL TILESET"
  PositionXY 0, 3, 19
  jsr PutStringImmediate
  MiniFontText "SELECT ABILITY"

  PositionXY 0, 3, 24
  jsr PutStringImmediate
  MiniFontText "EXIT TO LEVEL SELECT"

  jsr ScreenOn

  lda #0
  sta CursorY
Loop:
  jsr WaitVblank
  lda #2
  sta OAM_DMA

  jsr ReadJoy

  lda keynew
  and #KEY_DOWN
  beq :+
    inc CursorY
    lda CursorY
    cmp #6
    bne :+
      lda #0
      sta CursorY
  :
  lda keynew
  and #KEY_UP
  beq :+
    dec CursorY
    bpl :+
      lda #5
      sta CursorY
  :
  lda keynew
  and #KEY_LEFT
  beq :+
    dec CursorX
    bpl :+
      lda #6
      sta CursorX
  :
  lda keynew
  and #KEY_RIGHT
  beq :+
    inc CursorX
    lda CursorX
    cmp #7
    bne :+
    lda #0
    sta CursorX
  :
  lda keynew
  and #KEY_A
  beq @NotA
    ldy CursorY
    bne :+ ; Draw with block
      ldx SandboxCursorX
      lda SandboxBrushes,x
      sta SandboxCurrentBlock
      jsr DoPlaceBlock
      jmp ExitLoop
    :
    dey
    bne :+ ; Select a new block type

    :
    dey 
    bne :+ ; Copy block from level
      ldx SandboxCursorX
      lda #255
      sta SandboxCurrentBlock
      jsr DoPlaceBlock
      jmp ExitLoop
    :
    dey
    bne :+ ; Select new graphics

    :
    dey
    bne :+ ; Select ability
      jmp OpenSandboxAbilityPicker
    :
    dey
    bne :+ ; Exit to level select
      jmp ExitToLevelSelectFar
    :
  @NotA:

  lda #0
  sta OAM_ATTR+(4*0)
  sta OAM_ATTR+(4*1)
  lda #$52
  sta OAM_TILE+(4*0)
  sta OAM_TILE+(4*1)
  lda #7*8-1
  sta OAM_YPOS+(4*0)
  ldx CursorY
  lda MenuYPositions,x
  sta OAM_YPOS+(4*1)

  lda CursorX
  asl
  asl
  asl
  asl
  asl
  add #2*8+4
  sta OAM_XPOS+(4*0)

  lda #2*8
  sta OAM_XPOS+(4*1)

  lda keynew
  and #KEY_B
  jeq Loop
ExitLoop:

  jsr WaitVblank
  inc NeedLevelRerender
  rts

DoPlaceBlock:
  jsr UndoPostProcessLevel
  lda #15 ; Change if more placeable blocks are added
  sta PlaceBlockInLevel
  sta PlaceBlockItemIndex ; not 255, so you can cancel it
  lda PlayerPXL
  add #$80
  lda PlayerPXH
  adc #0
  sub ScrollX+1
  sta PlaceBlockX
  lda PlayerPYH
  sta PlaceBlockY
  rts

MenuYPositions:
  .byt 12*8-1, 13*8-1, 14*8-1, 18*8-1, 19*8-1, 24*8-1

BlockLowA:
  .lobytes $2102+(4*0), $2102+(4*1), $2102+(4*2), $2102+(4*3), $2102+(4*4), $2102+(4*5), $2102+(4*6), $2102+(4*7)
BlockLowB:
  .lobytes $2122+(4*0), $2122+(4*1), $2122+(4*2), $2122+(4*3), $2122+(4*4), $2122+(4*5), $2122+(4*6), $2102+(4*7)
; High is always $21

.endproc

.proc OpenSandboxAbilityPicker
CursorY = 5
  jsr ScreenOff
  jsr ClearName
  jsr ClearOAM

  PositionXY 0, 8, 4
  jsr PutStringImmediate
  MiniFontText "- SANDBOX MODE -"
  PositionXY 0, 9, 5
  jsr PutStringImmediate
  MiniFontText "SELECT ABILITY"

  PositionXY 0, 3, 8
  jsr PutStringImmediate
  MiniFontText "BLASTER"
  PositionXY 0, 3, 10
  jsr PutStringImmediate
  MiniFontText "GLIDER"
  PositionXY 0, 3, 12
  jsr PutStringImmediate
  MiniFontText "BOMB"
  PositionXY 0, 3, 14
  jsr PutStringImmediate
  MiniFontText "FIRE"
  PositionXY 0, 3, 16
  jsr PutStringImmediate
  MiniFontText "FIREWORK"
  PositionXY 0, 3, 18
  jsr PutStringImmediate
  MiniFontText "NICE CUBES"
  PositionXY 0, 3, 20
  jsr PutStringImmediate
  MiniFontText "BOOMERANG"
  PositionXY 0, 3, 22
  jsr PutStringImmediate
  MiniFontText "WATER BOTTLES"
  PositionXY 0, 3, 24
  jsr PutStringImmediate
  MiniFontText "WIND"
  PositionXY 0, 3, 26
  jsr PutStringImmediate
  MiniFontText "BURGER"

  lda #0
  sta CursorY
  jsr ScreenOn

Loop:
  jsr WaitVblank
  lda #2
  sta OAM_DMA

  jsr ReadJoy

  lda keynew
  and #KEY_DOWN
  beq :+
    inc CursorY
    lda CursorY
    cmp #10
    bne :+
      lda #0
      sta CursorY
  :
  lda keynew
  and #KEY_UP
  beq :+
    dec CursorY
    bpl :+
      lda #9
      sta CursorY
  :
  lda keynew
  and #KEY_A
  beq :+
    ldx CursorY
    lda AbilityTypes,x
    ora #128
    sta NeedAbilityChange
    inc NeedLevelRerender
    rts
  :

  lda #0
  sta OAM_ATTR+(4*0)
  lda #$52
  sta OAM_TILE+(4*0)
  lda CursorY
  asl
  asl
  asl
  asl
  add #8*8-1
  sta OAM_YPOS+(4*0)

  lda #2*8
  sta OAM_XPOS+(4*0)

  lda keynew
  and #KEY_B
  jeq Loop
Exit:
  inc NeedLevelRerender
  rts

AbilityTypes:
  .byt AbilityType::BLASTER
  .byt AbilityType::GLIDER
  .byt AbilityType::BOMB
  .byt AbilityType::FIRE
  .byt AbilityType::FIREWORK
  .byt AbilityType::NICE
  .byt AbilityType::BOOMERANG
  .byt AbilityType::WATER
  .byt AbilityType::FAN
  .byt AbilityType::BURGER
.endproc

.proc OpenSandboxGFXPicker
  jsr ScreenOff
  jsr ClearName

  PositionXY 0, 8, 4
  jsr PutStringImmediate
  MiniFontText "- SANDBOX MODE -"
  PositionXY 0,11, 5
  jsr PutStringImmediate
  MiniFontText "SELECT GFX"

  PositionXY 0, 3, 8
  jsr PutStringImmediate
  MiniFontText "BACK"
  PositionXY 0, 3, 10
  jsr PutStringImmediate
  MiniFontText "TERRAIN:"
  PositionXY 0, 18, 10
  jsr PutStringImmediate
  MiniFontText "GRASSLAND"
  PositionXY 0, 3, 12
  jsr PutStringImmediate
  MiniFontText "EXTRA:"
  PositionXY 0, 18, 12
  jsr PutStringImmediate
  MiniFontText "TROPICAL"
  PositionXY 0, 3, 14
  jsr PutStringImmediate
  MiniFontText "DECOR:"
  PositionXY 0, 18, 14
  jsr PutStringImmediate
  MiniFontText "ARROWS"

  PositionXY 0, 3, 16
  jsr PutStringImmediate
  MiniFontText "SPRITE COLORS: A"
  PositionXY 0, 3, 18
  jsr PutStringImmediate
  MiniFontText "SPRITE SLOT A: WALKER"
  PositionXY 0, 3, 20
  jsr PutStringImmediate
  MiniFontText "SPRITE SLOT B: WALKER"
  PositionXY 0, 3, 22
  jsr PutStringImmediate
  MiniFontText "SPRITE SLOT C: WALKER"
  PositionXY 0, 3, 24
  jsr PutStringImmediate
  MiniFontText "SPRITE SLOT D: WALKER"



; Write level graphic slot information
  lda #GraphicsUpload::BG_COMMON
  sta LevelUploadList+0

  ldx SandboxTerrain
  lda Terrains,x
  sta LevelUploadList+1
  lda BGPalettes,x
  sta LevelUploadList+2
  lda BGColors,x
  sta LevelBackgroundColor

  ldx SandboxExtra
  lda Extras,x
  sta LevelUploadList+3

  ldx SandboxDecoration
  lda Extras,x
  sta LevelUploadList+4

  ldx SandboxSpPalette
  lda SpPalettes,x
  sta LevelUploadList+5

  lda #255
  sta LevelUploadList+6

  ldx #3
: lda SandboxSpSlot1,x
  tay
  lda Sprites,y
  sta SpriteTileSlots,x
  dex
  bpl :-

  ; If using DABG terrain, adjust the common and maybe the puzzle tilesets
  lda SandboxTerrain
  cmp #4
  bcc :+
    lda #GraphicsUpload::BG_DABGCOMMON
    sta LevelUploadList+0

    ; Replace puzzle graphics too
    lda LevelUploadList+3
    cmp #GraphicsUpload::BG_CHIP
    bne :+
      lda #GraphicsUpload::BG_CHIP_DABG
      sta LevelUploadList+3
  :

  jmp ScreenOff

Terrains:
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_CLOUDS
  .byt GraphicsUpload::BG_DABG ; automatically sets BG_CHIP_DABG and BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_DABG
TerrainssNames:
  MiniFontText "GRASSLAND"
  MiniFontText "PUZZLE"
  MiniFontText "FROZEN"
  MiniFontText "CLOUDS"
  MiniFontText "DABG RED"
  MiniFontText "DABG GRAY"
  MiniFontText "DABG BLUE"
BGPalettes:
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_DABG
  .byt GraphicsUpload::PAL_DABG_GRAY
  .byt GraphicsUpload::PAL_DABG_BLUE
BGColors:
  .byt 49
  .byt 15
  .byt 15
  .byt 49
  .byt 49
  .byt 49
  .byt 49

Extras:
  .byt GraphicsUpload::BG_TROPICAL
  .byt GraphicsUpload::BG_SUBURBS
  .byt GraphicsUpload::BG_JUNGLE
  .byt GraphicsUpload::BG_CHIP
ExtrasNames:
  MiniFontText "TROPICAL"
  MiniFontText "SUBURBS"
  MiniFontText "JUNGLE"
  MiniFontText "PUZZLE"

Decorations:
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_FROZEN_BG
DecorationsNames:
  MiniFontText "GRASSY"
  MiniFontText "ARROW BOX"
  MiniFontText "FROZEN"

Sprites:
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_SUN
  .byt GraphicsUpload::SP_RONALD
  .byt GraphicsUpload::SP_MINES
  .byt GraphicsUpload::SP_HANNAH
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_WIND
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_FACEBALL
SpritesNames:
  MiniFontText "WALKER"
  MiniFontText "CANNON"
  MiniFontText "FIRE"
  MiniFontText "KING"
  MiniFontText "EXPLODE"
  MiniFontText "SUN"
  MiniFontText "RONALD"
  MiniFontText "MINES"
  MiniFontText "ARROW BOX"
  MiniFontText "LIFE"
  MiniFontText "WIND"
  MiniFontText "BOOMERANG"
  MiniFontText "SMILOIDS"

SpPalettes:
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::PAL_ENEMY3
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::PAL_ENEMY5
.endproc

; Reverses most of the LevelPostProcess effects
.proc UndoPostProcessLevel
  ; Level starts at $6000
  ldy #$00
  sty LevelBlockPtr+0
  lda #$60
  sta LevelBlockPtr+1
Loop:
  lda (LevelBlockPtr),y
  cmp BackgroundMetatile
  beq IsBackground
    sta 0 ; Save block ID to compare against
    ldx #0
  : lda FindList,x
    beq IsBackground ; Exit if at the end of the list and no matches
    cmp 0            ; Is it the block in the level?
    beq DoReplace
    inx
    bne :-           ; Unconditional

; Replace the block in the level
DoReplace:
  lda ReplaceList,x
  sta (LevelBlockPtr),y
IsBackground:
  ; Increment low byte
  iny
  bne Loop
  ; Increment high byte
  inc LevelBlockPtr+1
  lda LevelBlockPtr+1
  cmp #$70
  bne Loop
  rts

FindList:
  .byt Metatiles::LADDER_TOP
  .byt Metatiles::SOLID_LEDGE_L
  .byt Metatiles::SOLID_LEDGE_R
  .byt Metatiles::SOLID_LEDGE_S
  .byt Metatiles::FALLTHROUGH_LEDGE_L
  .byt Metatiles::FALLTHROUGH_LEDGE_R
  .byt Metatiles::FALLTHROUGH_LEDGE_S
  .byt Metatiles::WATER_FROZEN
  .byt Metatiles::WATER_TOP
  .byt Metatiles::WATER_BELOW_SOMETHING
  .byt Metatiles::LAVA_FROZEN
  .byt Metatiles::LAVA_TOP
  .byt Metatiles::LAVA_BELOW_SOMETHING
  .byt Metatiles::GROUND_TOP_L
  .byt Metatiles::GROUND_TOP_M
  .byt Metatiles::GROUND_TOP_R
  .byt Metatiles::GROUND_MIDDLE_L
  .byt Metatiles::GROUND_MIDDLE_R
  .byt Metatiles::GROUND_INNER_LEFT
  .byt Metatiles::GROUND_INNER_RIGHT
  .byt Metatiles::GROUND_INNER_BOTH
  .byt Metatiles::GROUND_NARROW_TOP
  .byt Metatiles::GROUND_NARROW_SIDES
  .byt Metatiles::ROCK_TOP_L
  .byt Metatiles::ROCK_TOP_M
  .byt Metatiles::ROCK_TOP_R
  .byt Metatiles::ROCK_MID_L
  .byt Metatiles::ROCK_MID_R
  .byt Metatiles::ROCK_BOT_L
  .byt Metatiles::ROCK_BOT_M
  .byt Metatiles::ROCK_BOT_R
  .byt Metatiles::CLOUD_L
  .byt Metatiles::CLOUD_M
  .byt Metatiles::CLOUD_R
  .byt Metatiles::STONE_BRIDGE_TOP
  .byt Metatiles::STONE_BRIDGE_LEFT
  .byt Metatiles::STONE_BRIDGE_RIGHT
  .byt Metatiles::SAND_UL
  .byt Metatiles::SAND_U
  .byt Metatiles::SAND_UR
  .byt Metatiles::SAND_L
  .byt Metatiles::SAND_R
  .byt Metatiles::STRIPED_LOG_HORIZ_L
  .byt Metatiles::STRIPED_LOG_HORIZ_R
  .byt Metatiles::BRICKWALL_TOP
  .byt Metatiles::WHITEFENCE_LEFT
  .byt Metatiles::WHITEFENCE_RIGHT
  .byt Metatiles::BG_LINE_TOP
  .byt 0

ReplaceList:
  .byt Metatiles::LADDER
  .byt Metatiles::SOLID_LEDGE_M
  .byt Metatiles::SOLID_LEDGE_M
  .byt Metatiles::SOLID_LEDGE_M
  .byt Metatiles::FALLTHROUGH_LEDGE_M
  .byt Metatiles::FALLTHROUGH_LEDGE_M
  .byt Metatiles::FALLTHROUGH_LEDGE_M
  .byt Metatiles::WATER_MAIN
  .byt Metatiles::WATER_MAIN
  .byt Metatiles::WATER_MAIN
  .byt Metatiles::LAVA_MAIN
  .byt Metatiles::LAVA_MAIN
  .byt Metatiles::LAVA_MAIN
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
  .byt Metatiles::STONE_BRIDGE
  .byt Metatiles::STONE_BRIDGE
  .byt Metatiles::SAND
  .byt Metatiles::SAND
  .byt Metatiles::SAND
  .byt Metatiles::SAND
  .byt Metatiles::SAND
  .byt Metatiles::STRIPED_LOG_HORIZ
  .byt Metatiles::STRIPED_LOG_HORIZ
  .byt Metatiles::BRICKWALL_MIDDLE
  .byt Metatiles::WHITEFENCE_MIDDLE
  .byt Metatiles::WHITEFENCE_MIDDLE
  .byt Metatiles::EMPTY
.endproc



