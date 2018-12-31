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

; Enemy list is structured as:
; XX EY TT
; || || ++ Type (bottom bit is direction)
; || |+--- Y position
; || +---- Four flags
; ++------ X position

EnemyEditScreen = ScrollX
EnemyEditMove = 10 ; if nonzero, you're currently moving an enemy
EnemyNamePointer = LevelSpritePointer

.enum SmallLevelIcon
  SPACE = $20
  SOLID = $80
  PLATFORM = $81
  FALL_PLATFORM = $82
  MONEY = $83
  LADDER = $84
  SPRING = $85
  WATER = $86
  SPIKE = $87
  PATH = $88
  HEART = $89
  UNKNOWN = $8a
  KEY = $8b
  LOCK = $8c
  TOGGLE_ON = $8d
  TOGGLE_OFF = $8e
  SWITCH = $8f
  BRICKS = $90
  LEFT = $91
  DOWN = $92
  UP = $93
  RIGHT = $94

  CRATE = $95
  C_LEFT = $96
  C_DOWN = $97
  C_UP = $98
  C_RIGHT = $99
.endenum


.proc ShowSpriteEditor
  ldx #0
  stx PlaceBlockX
  stx PlaceBlockY
  stx EnemyEditScreen
  jsr SortEnemyList
.endproc
; Inline tail call
.proc ReshowSpriteEditor
  jsr WaitVblank
  lda #0
  sta PPUMASK
  jsr ClearOAM
  lda #GraphicsUpload::CHR_ENEMYEDIT
  jsr DoGraphicUpload

  lda #' '
  jsr ClearNameCustom

  PositionXY 0, 7, 3
  jsr PutStringImmediate
  .byt "-Enemy placement:-",0

  ; UI stuff
  PositionXY 0, 7, 5
  jsr PutStringImmediate
  .byt "Screen:",0

  ; Upload a smiley in the sprite CHR
  lda #$16
  sta PPUADDR
  lda #$30
  sta PPUADDR
  ldx #0
: lda Smiley,x
  sta PPUDATA
  inx
  cpx #16
  bne :-

  ; Top edge
  PositionXY 0, 7, 6
  lda #4
  sta PPUDATA
  lda #5
  jsr WritePPURepeated16
  lda #6
  sta PPUDATA

  ; Bottom edge
  PositionXY 0, 7, 22
  lda #9
  sta PPUDATA
  lda #10
  jsr WritePPURepeated16
  lda #11
  sta PPUDATA

  ; Make the vertical bars on the sides sides
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL
  PositionXY 0, 7, 7
  lda #7
  ldx #15
  jsr WritePPURepeated
  PositionXY 0, 24, 7
  lda #8
  ldx #15
  jsr WritePPURepeated
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_RIGHT
  sta PPUCTRL

  ldx #0
  stx EnemyEditMove
  dex
  stx PlaceBlockItemIndex ; start out 255

  jsr EnemyEditLevelDraw

Loop:
  jsr WaitVblank
  lda #BG_ON|OBJ_ON
  sta PPUMASK

  lda #2
  sta OAM_DMA

  ; -----------------------------------
  ; Display the name and info of the enemy being hovered over
  PositionXY 0, 8, 24
  ldx PlaceBlockItemIndex
  inx
  beq DisplayNoSprite
DisplaySprite:

  ; Display the string
  ldy #0
: lda (EnemyNamePointer),y
  beq :+
  sta PPUDATA
  iny
  bne :-
:
  
  ; Try to clear up stuff on the end from a longer enemy being displayed earlier
  lda #' '
  .repeat 6
    sta PPUDATA
  .endrep

  ; Display the four flags
  PositionXY 0, 8, 26
  lda SpriteListRAM,x ; X is now pointing to the second byte with that INX earlier
  lsr
  lsr
  lsr
  lsr
  sta 0
  .repeat 4
    lda #'0'
    lsr 0
    adc #0
    sta PPUDATA
  .endrep
  lda SpriteListRAM+1,x ; type
  and #1
  tay
  lda DirectionTiles,y
  sta PPUDATA

  jmp DisplayedSprite
DisplayNoSprite:
  lda #' '
  jsr WritePPURepeated16
  PositionXY 0, 8, 26
  lda #' '
  jsr WritePPURepeated16
DisplayedSprite:
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  ; -----------------------------------


  jsr ReadJoy
  jsr KeyRepeat


  lda PlaceBlockX
  and #$f0
  sta 0

  lda keynew
  and #KEY_LEFT
  beq :+
    dec PlaceBlockX
  :

  lda keynew
  and #KEY_RIGHT
  beq :+
    inc PlaceBlockX
  :

  lda keynew
  and #KEY_UP
  beq :+
    dec PlaceBlockY
    bpl :+
      lda #14
      sta PlaceBlockY
  :

  lda keynew
  and #KEY_DOWN
  beq :+
    inc PlaceBlockY
    lda PlaceBlockY
    cmp #15
    bne :+
      lda #0
      sta PlaceBlockY
  :

  ; Update the scroll if necessary
  lda PlaceBlockX
  and #$f0
  cmp 0
  beq :+
    lsr
    lsr
    lsr
    lsr
    sta EnemyEditScreen
    jsr EnemyEditLevelDraw
  :

  lda #OAM_COLOR_0
  sta OAM_ATTR
  lda #$51
  sta OAM_TILE
  lda PlaceBlockX
  and #15
  asl
  asl
  asl
  add #8*8
  sta OAM_XPOS
  lda PlaceBlockY
  asl
  asl
  asl
  add #8*7-1
  sta OAM_YPOS

  lda keynew
  and #KEY_LEFT|KEY_RIGHT|KEY_UP|KEY_DOWN
  beq NoDPad
    ; Decide to look for an enemy under the cursor, or move an enemy if in moving mode
    lda EnemyEditMove
    bne :+
      jsr LocateEnemyByXY
      jmp NoDPad
    :
    ldx PlaceBlockItemIndex
    lda PlaceBlockX
    sta SpriteListRAM+0,x
    lda SpriteListRAM+1,x
    and #$f0
    ora PlaceBlockY
    sta SpriteListRAM+1,x
    jsr EnemyEditScan
  NoDPad:

  ; B = horizontally flip I guess?
  lda keynew
  and #KEY_B
  beq :+
    ldx PlaceBlockItemIndex
    cpx #255
    beq :+
      lda SpriteListRAM+2,x
      eor #1
      sta SpriteListRAM+2,x
      jsr EnemyEditScan    
  :

  lda keynew
  and #KEY_START
  jne SpriteEditorMenu

  ; A = select enemies, or place down new ones
  lda keynew
  and #KEY_A
  beq NoA
    ; If moving an enemy, cancel the movement
    lda EnemyEditMove
    beq :+
      lsr EnemyEditMove ; clear the flag
      beq NoA           ; unconditional
    :

    lda PlaceBlockItemIndex
    cmp #255
    jeq PlaceNewEnemy
      jmp SelectedAnEnemy
  NoA:

  jmp Loop

Smiley:
  .byt $3c, $42, $8b, $8b, $81, $8d, $42, $3c
  .byt $00, $3c, $7e, $7e, $7e, $72, $3c, $00 
; Old front-facing smiley:
;  .byt $3c, $7e, $ff, $ff
;  .byt $ff, $ff, $7e, $3c
;  .byt $00, $3c, $5a, $7e
;  .byt $5a, $66, $3c, $00

DirectionTiles:
  .byt $94, $91
.endproc

.proc PlaceNewEnemy
CursorY = 0
EnemyMenuLength = 1
EnemyMenuPointer = 2
EnemyNamePointer = 4
  ; Print the four sprite slot names and the always-loaded slot
  jsr WaitVblank
  PositionXY 0, 8, 23
  lda SandboxSpSlot1
  jsr PrintCategoryName

  PositionXY 0, 8, 24
  lda SandboxSpSlot2
  jsr PrintCategoryName

  PositionXY 0, 8, 25
  lda SandboxSpSlot3
  jsr PrintCategoryName

  PositionXY 0, 8, 26
  lda SandboxSpSlot4
  jsr PrintCategoryName

  PositionXY 0, 8, 27
  lda #14 ; generic
  jsr PrintCategoryName

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  ; -----------------------------------

  lda #0
  sta CursorY
ChooseCategoryLoop:
  jsr WaitVblank

  lda #2
  sta OAM_DMA

  jsr ReadJoy

  lda keynew
  and #KEY_DOWN
  beq :+
    inc CursorY
    lda CursorY
    cmp #5
    bne :+
      lda #0
      sta CursorY
  :
  lda keynew
  and #KEY_UP
  beq :+
    dec CursorY
    bpl :+
      lda #4
      sta CursorY
  :
 
  lda keynew
  and #KEY_B
  beq :+
    jsr EraseCategoryNames
    jmp ReshowSpriteEditor::Loop
  :

  jsr DrawCursor

  lda keynew
  and #KEY_A
  beq ChooseCategoryLoop

  ; -----------------------------------
  ; Now find the menu data for the picked category

  jsr EraseCategoryNames

  ; The last category is the generic slot so use a hardcoded value
  ; but for the first four use an array
  ldx CursorY
  cpx #4 ; the generic slot
  bne :+
    lda #14 ; last entry
    bne :++
  :
    lda SandboxSpSlot1,x
  :

  ; Calculate the index. *12
  asl
  asl
  sta 0
  asl
  add 0
  tax
  ; Get the data
  lda EnemyMenuSets+9,x
  sta EnemyMenuLength


  lda EnemyMenuSets+10,x
  sta EnemyMenuPointer+0
  lda EnemyMenuSets+11,x
  sta EnemyMenuPointer+1

  ; Now draw the second menu
  ldy #0
  ldx EnemyMenuLength
  jsr WaitVblank
  PositionXY 0, 8, 23
  jsr PrintEnemyName
  dex
  beq :+
  PositionXY 0, 8, 24
  jsr PrintEnemyName
  dex
  beq :+
  PositionXY 0, 8, 25
  jsr PrintEnemyName
  dex
  beq :+
  PositionXY 0, 8, 26
  jsr PrintEnemyName
  dex
  beq :+
  PositionXY 0, 8, 27
  jsr PrintEnemyName
:
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  ; -----------------------------------
  lda #0
  sta CursorY
ChooseEnemyLoop:
  jsr WaitVblank

  lda #2
  sta OAM_DMA

  jsr ReadJoy

  lda keynew
  and #KEY_DOWN
  beq :+
    inc CursorY
    lda CursorY
    cmp EnemyMenuLength
    bne :+
      lda #0
      sta CursorY
  :
  lda keynew
  and #KEY_UP
  beq :+
    dec CursorY
    bpl :+
      ldx EnemyMenuLength
      dex
      stx CursorY
  :
 
  lda keynew
  and #KEY_B
  beq :+
    jsr EraseCategoryNames
    jmp PlaceNewEnemy
  :

  jsr DrawCursor

  lda keynew
  and #KEY_A
  beq ChooseEnemyLoop

  ; -----------------------------------
  jsr EraseCategoryNames

  jsr FindFreeEnemyList
  bcc Fail
  lda PlaceBlockX
  sta SpriteListRAM+0,x
  lda PlaceBlockY
  and #15
  sta SpriteListRAM+1,x

  ; Set the type according to the choice earlier
  ; *3
  lda CursorY
  asl
  add CursorY
  tay
  lda (EnemyMenuPointer),y
  ; Face left
  sec
  rol
  sta SpriteListRAM+2,x
  jsr EnemyEditScan
  jsr LocateEnemyByXY
Fail:
  jmp ReshowSpriteEditor::Loop

DrawCursor:
  ; Draw cursor
  lda #OAM_COLOR_1
  sta OAM_ATTR+0
  lda #OAM_COLOR_0
  sta OAM_ATTR+4
  lda #$51
  sta OAM_TILE+4
  lda #7*8
  sta OAM_XPOS+4
  lda CursorY
  asl
  asl
  asl
  add #8*23-1
  sta OAM_YPOS+4
  rts

PrintCategoryName:
  ; *12 to get an index to the name
  asl
  asl
  sta 0
  asl
  add 0
  tax
  ; Print the actual name
  .repeat 9, I
    lda EnemyMenuSets+I,x
    sta PPUDATA
  .endrep
  rts

PrintEnemyName:
  iny ; Skip enemy type

  ; Get name
  lda (EnemyMenuPointer),y
  sta EnemyNamePointer+0
  iny
  lda (EnemyMenuPointer),y
  sta EnemyNamePointer+1
  iny

  ; Write name
  sty TempY
  ldy #0
: lda (EnemyNamePointer),y
  beq @Exit
  sta PPUDATA
  iny
  bne :-
@Exit:
  ldy TempY
  rts

EraseCategoryNames:
  ; Hide the cursor sprite
  lda #255
  sta OAM_YPOS+4

  jsr WaitVblank

  PositionXY 0, 8, 23
  lda #' '
  jsr WritePPURepeated16
  PositionXY 0, 8, 24
  lda #' '
  jsr WritePPURepeated16
  PositionXY 0, 8, 25
  lda #' '
  jsr WritePPURepeated16
  PositionXY 0, 8, 26
  lda #' '
  jsr WritePPURepeated16
  PositionXY 0, 8, 27
  lda #' '
  jsr WritePPURepeated16

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  rts
.endproc

.proc SelectedAnEnemy
Cursor = 0
  jsr WaitVblank
  PositionXY 0, 25, 7
  jsr PutStringImmediate
  .byt "Move",0
  PositionXY 0, 25, 8
  jsr PutStringImmediate
  .byt "Flags",0
  PositionXY 0, 25, 9
  jsr PutStringImmediate
  .byt "Copy",0
  PositionXY 0, 25, 10
  jsr PutStringImmediate
  .byt "Erase",0

  lda #1
  sta OAM_ATTR+(4*0)

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  sta Cursor

Loop:
  jsr WaitVblank
  lda #2
  sta OAM_DMA

  jsr ReadJoy

  lda keynew
  and #KEY_UP
  beq :+
    dec Cursor
  :
  lda keynew
  and #KEY_DOWN
  beq :+
    inc Cursor
  :
  lda Cursor
  and #3
  sta Cursor
  asl
  asl
  asl
  add #8*7-1
  sta OAM_YPOS+4
  lda #24*8
  sta OAM_XPOS+4
  lda #0
  sta OAM_ATTR+4
  lda #$51
  sta OAM_TILE+4

  lda keynew
  and #KEY_A
  beq NotA
  ldx Cursor
  bne NotMove
    ; Start moving the current enemy
    inc EnemyEditMove
    jmp EraseMenu
  NotMove:

  dex
  bne NotFlags
    ; Allow editing enemy flags
    jmp EraseMenu
  NotFlags:

  dex
  bne NotCopy
    ; Clone an enemy
    ldy PlaceBlockItemIndex
    jsr FindFreeEnemyList
    bcc Loop ; Can't clone, no free slot
    lda SpriteListRAM,y
    sta SpriteListRAM,x
    lda SpriteListRAM+1,y
    sta SpriteListRAM+1,x
    lda SpriteListRAM+2,y
    sta SpriteListRAM+2,x
    stx PlaceBlockItemIndex
    inc EnemyEditMove ; start moving it
    jmp EraseMenu
  NotCopy:
  Erase:
    ; Erase an enemy from the list
    ldx PlaceBlockItemIndex
    lda #255
    sta SpriteListRAM+0,x
    sta PlaceBlockItemIndex
    lda #0
    sta SpriteListRAM+1,x
    sta SpriteListRAM+2,x
    jmp EraseMenu
NotA:

  lda keynew
  and #KEY_B
  jeq Loop

EraseMenu:
  jsr EnemyEditScan

  lda #255
  sta OAM_YPOS+4

  jsr WaitVblank
  ; Erase the menu
  PositionXY 0, 25, 7
  jsr EraseLine
  PositionXY 0, 25, 8
  jsr EraseLine
  PositionXY 0, 25, 9
  jsr EraseLine
  PositionXY 0, 25, 10
  jsr EraseLine
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  jmp ReshowSpriteEditor::Loop

EraseLine:
  lda #' '
  ldx #5
  jmp WritePPURepeated
.endproc

.proc EnemyEditLevelDraw
  ; Form the pointer
  ldy #0
  sty LevelBlockPtr+0
  lda #$60
  ora EnemyEditScreen
  sta LevelBlockPtr+1

  ; Y starts out zero
Loop:
  lda (LevelBlockPtr),y
  bne :+
    lda #SmallLevelIcon::SPACE
Next:
    sta ScratchPage,y
    iny
    bne Loop
    jmp Render
  :
  ; Look for a match
  sta 0
  ldx #0
: lda MatchRecognize,x
  beq NoMatch
  cmp 0
  beq Match
  inx 
  bne :-
Match:
  ; Put a tile in corresponding to the level block
  lda MatchIcon,x
  bne Next
NoMatch:

  ; Use something else to determine the icon to use
  ldx 0
  lda MetatileFlagsROM,x
  sta 1

  and #M_BEHAVIOR
  cmp #M_WATER
  bne :+
    lda #SmallLevelIcon::WATER
    bne Next
  :

  lda 1
  and #M_BEHAVIOR
  cmp #M_FALLABLE_LEDGE
  bne :+
    lda #SmallLevelIcon::FALL_PLATFORM
    bne Next
  :

  bit 1
  bvc :+
  bmi :+
    lda #SmallLevelIcon::PLATFORM
    bne Next
  :
  bpl :+
    lda #SmallLevelIcon::SOLID
    bne Next
  :

  lda #SmallLevelIcon::UNKNOWN
  bne Next


Render:
  jsr WaitVblank
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL

  ; Unrolled loop to upload the whole preview in one vblank
  .repeat 16, I
    lda #>($2000+I+(32*7+8))
    sta PPUADDR
    lda #<($2000+I+(32*7+8))
    sta PPUADDR

    .repeat 15, J
      lda ScratchPage+((I*16)+J)
      sta PPUDATA
    .endrep
  .endrep

  ; I also tried to do it with less loop unrolling but it ran out of vblank budget
  .if 0
    .repeat 16, I
      lda #>($2000+I+(32*7+8))
      sta PPUADDR
      lda #<($2000+I+(32*7+8))
      sta PPUADDR

      ldx #I<<4
      jsr RenderColumn
    .endrep
  .endif


  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_RIGHT
  sta PPUCTRL
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  ; Update UI
  jsr WaitVblank
  PositionXY 0, 14, 5
  ldx EnemyEditScreen
  lda Hex,x
  sta PPUDATA
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  jmp EnemyEditScan
Hex:
  .byt "0123456789ABCDEF"

.if 0
  RenderColumn:
    .repeat 15, J
      lda ScratchPage+J,x
      sta PPUDATA
    .endrep
    rts
.endif

; With the size of this, maybe it'd be better to just use a 256 byte table...
MatchRecognize:
  .byt Metatiles::COIN
  .byt Metatiles::BRICKS
  .byt Metatiles::GRAY_BRICKS
  .byt Metatiles::LADDER
  .byt Metatiles::LADDER_TOP
  .byt Metatiles::ROPE
  .byt Metatiles::SPRING
  .byt Metatiles::SPIKES
  .byt Metatiles::HEART
  .byt Metatiles::BIG_HEART
  .byt Metatiles::PATH_LINE
  .byt Metatiles::KEY_RED
  .byt Metatiles::KEY_GREEN
  .byt Metatiles::KEY_BLUE
  .byt Metatiles::LOCK_RED
  .byt Metatiles::LOCK_GREEN
  .byt Metatiles::LOCK_BLUE
  .byt Metatiles::TOGGLE_BLOCK_ON
  .byt Metatiles::TOGGLE_BLOCK_OFF
  .byt Metatiles::TOGGLE_SWITCH
  .byt Metatiles::FORCE_LEFT
  .byt Metatiles::FORCE_DOWN
  .byt Metatiles::FORCE_UP
  .byt Metatiles::FORCE_RIGHT
  .byt Metatiles::METAL_ARROW_LEFT
  .byt Metatiles::METAL_ARROW_DOWN
  .byt Metatiles::METAL_ARROW_UP
  .byt Metatiles::METAL_ARROW_RIGHT
  .byt Metatiles::WOOD_ARROW_LEFT
  .byt Metatiles::WOOD_ARROW_DOWN
  .byt Metatiles::WOOD_ARROW_UP
  .byt Metatiles::WOOD_ARROW_RIGHT
  .byt Metatiles::WOOD_BOMB
  .byt Metatiles::METAL_BOMB
  .byt Metatiles::WOOD_CRATE
  .byt Metatiles::METAL_CRATE
  .byt Metatiles::FORK_ARROW_UP
  .byt Metatiles::FORK_ARROW_DOWN
  .byt Metatiles::CEILING_BARRIER
  .byt Metatiles::BG_LINE_TOP
  .byt 0

MatchIcon:
  .byt SmallLevelIcon::MONEY
  .byt SmallLevelIcon::BRICKS
  .byt SmallLevelIcon::BRICKS
  .byt SmallLevelIcon::LADDER
  .byt SmallLevelIcon::LADDER
  .byt SmallLevelIcon::LADDER
  .byt SmallLevelIcon::SPRING
  .byt SmallLevelIcon::SPIKE
  .byt SmallLevelIcon::HEART
  .byt SmallLevelIcon::HEART
  .byt SmallLevelIcon::PATH
  .byt SmallLevelIcon::KEY
  .byt SmallLevelIcon::KEY
  .byt SmallLevelIcon::KEY
  .byt SmallLevelIcon::LOCK
  .byt SmallLevelIcon::LOCK
  .byt SmallLevelIcon::LOCK
  .byt SmallLevelIcon::TOGGLE_ON
  .byt SmallLevelIcon::TOGGLE_OFF
  .byt SmallLevelIcon::SWITCH
  .byt SmallLevelIcon::LEFT
  .byt SmallLevelIcon::DOWN
  .byt SmallLevelIcon::UP
  .byt SmallLevelIcon::RIGHT
  .byt SmallLevelIcon::C_LEFT
  .byt SmallLevelIcon::C_DOWN
  .byt SmallLevelIcon::C_UP
  .byt SmallLevelIcon::C_RIGHT
  .byt SmallLevelIcon::C_LEFT
  .byt SmallLevelIcon::C_DOWN
  .byt SmallLevelIcon::C_UP
  .byt SmallLevelIcon::C_RIGHT
  .byt SmallLevelIcon::CRATE
  .byt SmallLevelIcon::CRATE
  .byt SmallLevelIcon::CRATE
  .byt SmallLevelIcon::CRATE
  .byt SmallLevelIcon::C_UP
  .byt SmallLevelIcon::C_DOWN
  .byt SmallLevelIcon::DOWN
  .byt SmallLevelIcon::SPACE
.endproc

; Scan for enemy sprites and display them
.proc EnemyEditScan
  jsr ClearOAM

  lda EnemyEditScreen
  asl
  asl
  asl
  asl
  sta 0

  ldx #0
  ldy #8 ; start two slots in

Loop:
  ; No empty sprites
  lda SpriteListRAM+2,x
  beq Next
  ; Compare X position
  lda SpriteListRAM+0,x
  sub 0
  cmp #16
  bcs Next

  asl
  asl
  asl
  add #8*8
  sta OAM_XPOS,y
  lda SpriteListRAM+1,x
  and #15
  asl
  asl
  asl
  add #8*7-1
  sta OAM_YPOS,y
  lda #OAM_COLOR_1
  sta OAM_ATTR,y
  lda #$63
  sta OAM_TILE,y

  ; Horizontally flip if the enemy is flipped
  lda SpriteListRAM+2,x
  lsr
  bcc :+
    lda #OAM_COLOR_1|OAM_XFLIP
    sta OAM_ATTR,y
  :

  ; Next sprite slot
  iny
  iny
  iny
  iny
Next:
  inx
  inx
  inx
  cpx #255
  bne Loop
  rts
.endproc

; Locates a sprite list entry
; inputs: PlaceBlockX, PlaceBlockY
; outputs: X (enemy index), also PlaceBlockItemIndex
; 255 if no enemy found
.proc LocateEnemyByXY
  ldx #0
Loop:
  ; No empty sprites
  lda SpriteListRAM+2,x ; Type
  beq Next
  lda SpriteListRAM+0,x ; X
  cmp PlaceBlockX
  bne Next
  lda SpriteListRAM+1,x ; Y
  and #15
  cmp PlaceBlockY
  bne Next
  stx PlaceBlockItemIndex

  ; Find the name pointer next
  lda SpriteListRAM+2,x
  lsr
  sta 0 ; type, with direction stripped out
  ldy #0
FindNameLoop:
  lda EnemyMenuData,y
  beq FoundName ; if it reaches the end of the list, display the end marker's string
  cmp 0
  beq FoundName
  iny
  iny
  iny
  bne FindNameLoop

FoundName:
  lda EnemyMenuData+1,y
  sta EnemyNamePointer+0
  lda EnemyMenuData+2,y
  sta EnemyNamePointer+1
  rts
Next:
  inx
  inx
  inx
  cpx #255
  bne Loop
  ; Fail
  stx PlaceBlockItemIndex
  rts
.endproc

; Insertion sort on the enemy list
.proc SortEnemyList
  ldx #3
Loop1:
  txa
  tay
  Loop2:
    ; Previous element bigger than the current one?
    lda SpriteListRAM,y
    cmp SpriteListRAM-3,y
    bcs Loop2End
    ; Swap and go back an element
    ; ---------------------------------
    lda SpriteListRAM,y
    pha
    lda SpriteListRAM-3,y
    sta SpriteListRAM,y
    pla
    sta SpriteListRAM-3,y
    ; ---------------------------------
    lda SpriteListRAM+1,y
    pha
    lda SpriteListRAM-2,y
    sta SpriteListRAM+1,y
    pla
    sta SpriteListRAM-2,y
    ; ---------------------------------
    lda SpriteListRAM+2,y
    pha
    lda SpriteListRAM-1,y
    sta SpriteListRAM+2,y
    pla
    sta SpriteListRAM-1,y
    ; ---------------------------------

    ; Stop at element 0
    dey
    dey
    dey
    bne Loop2
  Loop2End:
  inx
  inx
  inx
  cpx #255
  bne Loop1

  ; Also set all empty sprites to column 255
  ; so they'll be interpreted as end of list
  ldx #0
FixLoop:
  lda SpriteListRAM+2,x
  bne :+
    lda #255
    sta SpriteListRAM+0,x
  :

  ; Fix unreachable Y positions
  lda SpriteListRAM+1,x
  and #15
  cmp #15
  bne :+
    dec SpriteListRAM+1,x
  :

  inx
  inx
  inx
  cpx #255
  bne FixLoop

  rts
.endproc

; Find a free slot in the enemy list
; outputs: carry (set if found), X (enemy index)
.proc FindFreeEnemyList
  ldx #0
Loop:
  lda SpriteListRAM+2,x
  beq Found
  inx
  inx
  inx
  cpx #255
  bne Loop
  clc
  rts
Found:
  sec
  rts
.endproc

.proc EnemyNameData
Checkpoint:
  .byt "Checkpoint",0
SidePlatform:
  .byt "Side platform",0
LinePlatform:
  .byt "Line platform",0
LaserBeams:
  .byt "Laser beams",0
PushPlatform:
  .byt "Push platform",0
Plodder:
  .byt "Plodder",0
Sneaker:
  .byt "Sneaker",0
Spinner:
  .byt "Spinner",0
Owl:
  .byt "Owl",0
Ball:
  .byt "Ball",0
BallGuy:
  .byt "Ball guy",0
Thwomp:
  .byt "SMASH guy",0
Cannon:
  .byt "DinnerBlaster",0
Mine:
  .byt "Mine",0
FireWalk:
  .byt "Fire walker",0
FireJump:
  .byt "Fire jumper",0
FireBar:
  .byt "Firebar",0
King:
  .byt "King",0
Volcano:
  .byt "Volcano",0
RocketLauncher:
  .byt "Rockets",0
Fireworks:
  .byt "Fireworks",0
BombGuy:
  .byt "Bomb guy",0
Sun:
  .byt "Sun mask",0
SunKey:
  .byt "Sun key",0
BurgerRonald:
  .byt "Burger "
Ronald:
  .byt "Ronald",0
Icecube:
  .byt "Icecube",0
Snowman:
  .byt "Snowman",0
Minecart:
  .byt "Minecart",0
FallingSpike:
  .byt "Spike",0
Boulder:
  .byt "Boulder",0
Glider:
  .byt "Glider",0
LWSS:
  .byt "LWSS",0
Fan:
  .byt "Fan",0
Cloud:
  .byt "Strife Cloud",0
Boomerang:
  .byt "Boomerang man",0
GrabbyHand:
  .byt "Grabby hand",0
Bouncer:
  .byt "Bouncer",0
Gremlin:
  .byt "Gremlin",0
Rover:
  .byt "Rover",0
Turkey:
  .byt "Turkey",0
BombPopGen:
  .byt "Bomb pops",0
MamaLuigi:
  .byt "Mama Luigi",0
Toast:
  .byt "Toast",0
Grillbert:
  .byt "Grillbert",0
.endproc

.proc EnemyMenuData
Generic:
  .byt Enemy::CHECKPOINT
  .addr EnemyNameData::Checkpoint

  .byt Enemy::MOVING_PLATFORM_HORIZ
  .addr EnemyNameData::SidePlatform

  .byt Enemy::MOVING_PLATFORM_LINE
  .addr EnemyNameData::LinePlatform

  .byt Enemy::BEAM_EMITTER
  .addr EnemyNameData::LaserBeams

  .byt Enemy::MOVING_PLATFORM_PUSH
  .addr EnemyNameData::PushPlatform

Walker:
  .byt Enemy::GOOMBA
  .addr EnemyNameData::Plodder

  .byt Enemy::SNEAKER
  .addr EnemyNameData::Sneaker

  .byt Enemy::SPINNER
  .addr EnemyNameData::Spinner

  .byt Enemy::OWL
  .addr EnemyNameData::Owl

Cannon:
  .byt Enemy::BALL
  .addr EnemyNameData::Ball

  .byt Enemy::BALL_GUY
  .addr EnemyNameData::BallGuy

  .byt Enemy::THWOMP
  .addr EnemyNameData::Thwomp

  .byt Enemy::CANNON_1
  .addr EnemyNameData::Cannon

  .byt Enemy::MINE
  .addr EnemyNameData::Mine

Fire:
  .byt Enemy::FIRE_WALK
  .addr EnemyNameData::FireWalk

  .byt Enemy::FIRE_JUMP
  .addr EnemyNameData::FireJump

  .byt Enemy::FIREBAR
  .addr EnemyNameData::FireBar

King:
  .byt Enemy::KING
  .addr EnemyNameData::King

  .byt Enemy::GEORGE
  .addr EnemyNameData::Volcano

Explode:
  .byt Enemy::ROCKET_LAUNCHER
  .addr EnemyNameData::RocketLauncher

  .byt Enemy::FIREWORK_SHOOTER
  .addr EnemyNameData::Fireworks

  .byt Enemy::BOMB_GUY
  .addr EnemyNameData::BombGuy

Sun:
  .byt Enemy::SUN
  .addr EnemyNameData::Sun

  .byt Enemy::SUN_KEY
  .addr EnemyNameData::SunKey

Ronald:
  .byt Enemy::RONALD
  .addr EnemyNameData::Ronald

  .byt Enemy::RONALD_BURGER
  .addr EnemyNameData::BurgerRonald

Mines:
  .byt Enemy::ICE_1
  .addr EnemyNameData::Icecube

  .byt Enemy::ICE_2
  .addr EnemyNameData::Snowman

  .byt Enemy::MINECART
  .addr EnemyNameData::Minecart

  .byt Enemy::FALLING_SPIKE
  .addr EnemyNameData::FallingSpike

Hannah:
  .byt Enemy::BOULDER
  .addr EnemyNameData::Boulder

Life:
  .byt Enemy::BIG_GLIDER
  .addr EnemyNameData::Glider

  .byt Enemy::BIG_LWSS
  .addr EnemyNameData::LWSS

Wind:
  .byt Enemy::ELECTRIC_FAN
  .addr EnemyNameData::Fan

  .byt Enemy::CLOUD
  .addr EnemyNameData::Cloud

Boomerang:
  .byt Enemy::BOOMERANG_GUY
  .addr EnemyNameData::Boomerang

  .byt Enemy::GRABBY_HAND
  .addr EnemyNameData::GrabbyHand

Faceball:
  .byt Enemy::BOUNCER
  .addr EnemyNameData::Bouncer

  .byt Enemy::GREMLIN
  .addr EnemyNameData::Gremlin

  .byt Enemy::ROVER
  .addr EnemyNameData::Rover

  .byt Enemy::TURKEY
  .addr EnemyNameData::Turkey

Castle:
  .byt Enemy::TOAST
  .addr EnemyNameData::Toast

  .byt Enemy::GRILLBERT
  .addr EnemyNameData::Grillbert

  .byt Enemy::MAMA_LUIGI
  .addr EnemyNameData::MamaLuigi

  .byt Enemy::BOMB_POP_GENERATOR
  .addr EnemyNameData::BombPopGen

End:
  .byt 0 ; end marker
  .addr End ; also an empty string
.endproc

.proc EnemyMenuSets
; Sets of names, multiply by 12 to get the right one
  .byt "Walker   ", 4
  .addr EnemyMenuData::Walker

  .byt "Cannon   ", 5
  .addr EnemyMenuData::Cannon

  .byt "Fire     ", 3
  .addr EnemyMenuData::Fire

  .byt "King     ", 2
  .addr EnemyMenuData::King

  .byt "Explode  ", 3
  .addr EnemyMenuData::Explode

  .byt "Sun      ", 2
  .addr EnemyMenuData::Sun

  .byt "Ronald   ", 2
  .addr EnemyMenuData::Ronald

  .byt "Mines    ", 4
  .addr EnemyMenuData::Mines

  .byt "Arrow box", 1
  .addr EnemyMenuData::Hannah

  .byt "Life     ", 2
  .addr EnemyMenuData::Life

  .byt "Wind     ", 2
  .addr EnemyMenuData::Wind

  .byt "Boomerang", 2
  .addr EnemyMenuData::Boomerang

  .byt "Smiloids ", 4
  .addr EnemyMenuData::Faceball

  .byt "Castle   ", 4
  .addr EnemyMenuData::Castle
; -------------------------------------
  .byt "Platform ", 5
  .addr EnemyMenuData::Generic

.endproc

.proc SpriteEditorMenu
CursorY = 5
  jsr SortEnemyList
  jsr ScreenOff
  lda #' '
  jsr ClearNameCustom
  jsr ClearOAM

  PositionXY 0, 8, 4
  jsr PutStringImmediate
  .byt "-Enemy placement:-",0

  PositionXY 0, 3, 8
  jsr PutStringImmediate
  .byt "Save level",0

  PositionXY 0, 3, 10
  jsr PutStringImmediate
  .byt "Save & test level",0

  PositionXY 0, 3, 12
  jsr PutStringImmediate
  .byt "Save & edit level",0

  PositionXY 0, 3, 14
  jsr PutStringImmediate
  .byt "Exit to menu",0

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
    cmp #4
    bne :+
      lda #0
      sta CursorY
  :
  lda keynew
  and #KEY_UP
  beq :+
    dec CursorY
    bpl :+
      lda #3
      sta CursorY
  :
  lda keynew
  and #KEY_A
  beq :+
    ldx CursorY
    bne NotSave
      jsr DoSave
      jmp ReshowSpriteEditor
    NotSave:

    dex
    bne NotSaveTest
      lda #0
      sta CustomLevelMode
      jsr DoSave
      lda #SANDBOX_LEVEL ; should be the last level slot, modify if not
      sta StartedLevelNumber
      jmp StartLevel
    NotSaveTest:

    dex
    bne NotSaveEdit
      lda #1
      sta CustomLevelMode
      jsr DoSave
      lda #SANDBOX_LEVEL ; should be the last level slot, modify if not
      sta StartedLevelNumber
      lda #1
      sta SandboxFlyMode
      jmp StartLevel

    NotSaveEdit:
    ; Exit to menu
      jmp LevelEditorMenuTrampoline
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
  jmp ReshowSpriteEditor

DoSave:
  lda CustomLevelSlot
  sub #1
  jmp SaveLevel
.endproc
