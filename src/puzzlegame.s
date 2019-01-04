; Implementation of expired U.S. Patent 5265888
; Copyright (C) 2019 NovaSquirrel
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

PuzzleMap = LevelMap ; 128 bytes, 8*16
PUZZLE_WIDTH = 8
PUZZLE_HEIGHT = 16

.enum PuzzleStates
  INIT_GAME
  INIT_PILL
  FALL_PILL
  CHECK_MATCH
  GRAVITY
.endenum

.enum PuzzleTiles
  VIRUS
  SINGLE
  LEFT
  RIGHT
  BOTTOM
  TOP
  CLEARING
.endenum

.pushseg
.segment "PUZRAM"
  PuzzleX: .res 2
  PuzzleY: .res 2
  PuzzleFallTimer: .res 2 ; Time until the piece falls down one row
  PuzzleDir: .res 2       ; Direction
  PuzzleColor1: .res 2
  PuzzleColor2: .res 2
  PuzzleSpeed:  .res 2    ; ranges 0-2
  PuzzleNextColor1: .res 2
  PuzzleNextColor2: .res 2

  PuzzleState: .res 2
  VirusLevel: .res 2
  PuzzleRedraw: .res 2    ; Redraw entire grid

  PuzzleVersus: .res 1    ; If nonzero, versus mode
.popseg

.proc PuzzleGameMenu
  CursorY = TempVal ; array of 2

  jsr ReseedRandomizer

  ; Clear RAM
  ldx #0
  tax
: sta $700,x
  sta PuzzleMap,x
  inx
  bne :-

  lda #4
  sta VirusLevel+0
  sta VirusLevel+1
  lda #1
  sta PuzzleSpeed+0
  sta PuzzleSpeed+1

  ; Turn off screen and draw the menu
  jsr WaitVblank
  lda #0
  sta PPUMASK

  lda #' '
  jsr ClearNameCustom
  jsr ClearOAM


  ; Menu border
  ; Top
  PositionXY 0, 4, 7
  lda #4
  sta PPUDATA
  lda #5
  ldx #21
  jsr WritePPURepeated
  lda #6
  sta PPUDATA
  ; Bottom
  PositionXY 0, 4, 17
  lda #9
  sta PPUDATA
  lda #10
  ldx #21
  jsr WritePPURepeated
  lda #11
  sta PPUDATA

  ; Make sides
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL
  PositionXY 0, 4, 8
  lda #7
  ldx #9
  jsr WritePPURepeated
  PositionXY 0, 26, 8
  lda #8
  ldx #9
  jsr WritePPURepeated
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_RIGHT
  sta PPUCTRL


  ; Draw the menu options
  PositionXY 0, 9, 4
  jsr PutStringImmediate
  .byt "- Vitamins -",0

  ; -----------------------------------

  PositionXY 0, 6, 9
  jsr PutStringImmediate
  .byt " Mode: Solo  Versus",0

  PositionXY 0, 6, 11
  jsr PutStringImmediate
  .byt "Style: Classic",0

  PositionXY 0, 6, 13
  jsr PutStringImmediate
  .byt "Count: 1P:04  2P:04",0

  PositionXY 0, 6, 15
  jsr PutStringImmediate
  .byt "Speed: 1P:Md  2P:Md ",0

  ; -----------------------------------

  PositionXY 0, 3, 22
  jsr PutStringImmediate
  .byt "Guide ",$82,$93," to make lines of",0

  PositionXY 0, 3, 23
  jsr PutStringImmediate
  .byt "4 or more. Clear out all ",$88,0

  PositionXY 0, 3, 24
  jsr PutStringImmediate
  .byt "to win!",0

  PositionXY 0, 5, 26
  jsr PutStringImmediate
  .byt "+: Move    A/B: Rotate",0

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  sta CursorY
  sta CursorY+1

Loop:
  jsr WaitVblank
  lda #BG_ON|OBJ_ON
  sta PPUMASK
  lda #2
  sta OAM_DMA

  ; Print the counts and speeds chosen
  PositionXY 0, 16, 13
  ldy VirusLevel+0
  jsr PutDecimal
  PositionXY 0, 23, 13
  ldy VirusLevel+1
  jsr PutDecimal

  PositionXY 0, 16, 15
  lda PuzzleSpeed+0
  jsr PutSpeedName
  PositionXY 0, 23, 15
  lda PuzzleSpeed+1
  jsr PutSpeedName

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  jsr PuzzleReadJoy

  jsr ClearOAM
  ldx #0
  jsr RunMenu
  inx
  jsr RunMenu

  ; Allow starting the game or returning to the menu
  lda keynew
  and #KEY_START
  jne InitPuzzleGame

  lda keynew
  and #KEY_B
  jne Reset

  ; Draw the next piece
  ldy OamPtr

  lda #5*8
  sta OAM_XPOS+0,y
  lda #25*8
  sta OAM_XPOS+4,y

  lda CursorY+0
  jsr ShiftCursorY
  sta OAM_YPOS+0,y
  lda CursorY+1
  jsr ShiftCursorY
  sta OAM_YPOS+4,y

  ; Draw the two cursors
  lda #$41
  sta OAM_TILE+0,y
  lda #$42
  sta OAM_TILE+4,y

  lda #OAM_COLOR_0
  sta OAM_ATTR+0,y
  sta OAM_ATTR+4,y
  tya
  add #8
  sta OamPtr

  jmp Loop

ShiftCursorY:
  asl
  asl
  asl
  asl
  add #9*8-1
  rts

RunMenu:
  lda keynew,x
  and #KEY_UP
  beq :+
    dec CursorY,x
  :

  lda keynew,x
  and #KEY_DOWN
  beq :+
    inc CursorY,x
  :

  lda keynew
  and #KEY_LEFT
  beq @NotLeft
    ldy CursorY,x
    bne :+
      ; Solo/Versus
      lda PuzzleVersus
      eor #1
      sta PuzzleVersus
      jmp @NotLeft
    :
    dey
    bne :+
      ; Style
      jmp @NotLeft
    :
    dey
    bne @NotLevelL
      dec VirusLevel,x
      bne :+
        lda #70
        sta VirusLevel,x
      :
      ; Level
      jmp @NotLeft
    @NotLevelL:
    ; Speed
    dec PuzzleSpeed,x
    bpl :+
      lda #2
      sta PuzzleSpeed,x
    :
  @NotLeft:

  lda keynew
  and #KEY_RIGHT
  beq @NotRight
    ldy CursorY,x
    bne :+
      ; Solo/Versus
      lda PuzzleVersus
      eor #1
      sta PuzzleVersus
      jmp @NotRight
    :
    dey
    bne :+
      ; Style
      jmp @NotRight
    :
    dey
    bne @NotLevelR
      inc VirusLevel,x
      lda VirusLevel,x
      cmp #71
      bne :+
        lda #1
        sta VirusLevel,x
      :
      ; Level
      jmp @NotRight
    @NotLevelR:
    ; Speed
    inc PuzzleSpeed,x
    lda PuzzleSpeed,x
    cmp #3
    bne :+
      lda #0
      sta PuzzleSpeed,x
    :
  @NotRight:

  lda CursorY,x
  and #3
  sta CursorY,x
  rts

PutDecimal:
  lda BCD99,y
  pha
  lsr
  lsr
  lsr
  lsr
  ora #$30
  sta PPUDATA
  pla
  and #15
  ora #$30
  sta PPUDATA
  rts

PutSpeedName:
  asl
  tay
  lda PuzzleSpeedNames+0,y
  sta PPUDATA
  lda PuzzleSpeedNames+1,y
  sta PPUDATA
  rts
PuzzleSpeedNames:
  .byt "LoMdHi"
.endproc

.proc InitPuzzleGame
  jsr WaitVblank
  lda #0
  sta PPUMASK

  ; Set palettes
  ldx #$3f
  stx PPUADDR
  lda #$0d
  sta PPUADDR
  jsr WriteColors
  stx PPUADDR
  lda #$1d
  sta PPUADDR
  jsr WriteColors

  ; Erase first tile
  lda #$00
  sta PPUADDR
  sta PPUADDR
  jsr WritePPURepeated16

  lda #' '
  jsr ClearNameCustom

  ; Set attributes
  lda #$23
  sta PPUADDR
  lda #$cb
  sta PPUADDR
  lda #%11110000
  sta PPUDATA
  sta PPUDATA
  ldy #3
: jsr WriteZeroRepeated6
  lda #%11111111
  sta PPUDATA
  sta PPUDATA
  dey
  bne :-
  jsr WriteZeroRepeated6
  lda #%00001111
  sta PPUDATA
  sta PPUDATA

  ; Make the playfield border
  ; Top
  PositionXY 0, 11, 5
  lda #4
  sta PPUDATA
  lda #5
  ldx #8
  jsr WritePPURepeated
  lda #6
  sta PPUDATA
  ; Bottom
  PositionXY 0, 11, 22
  lda #9
  sta PPUDATA
  lda #10
  ldx #8
  jsr WritePPURepeated
  lda #11
  sta PPUDATA

  ; Make sides
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL
  PositionXY 0, 11, 6
  lda #7
  jsr WritePPURepeated16
  PositionXY 0, 20, 6
  lda #8
  jsr WritePPURepeated16
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_RIGHT
  sta PPUCTRL

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  jsr ClearOAM

Loop:
  jsr WaitVblank
  lda #BG_ON|OBJ_ON
  sta PPUMASK
  lda #2
  sta OAM_DMA

  ; probably should clear this out before it's used?
  .repeat 4, I ; reuse this stuff from Nova the Squirrel
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

  ; Redraw the whole playfield if necessary
  lda PuzzleRedraw
  beq :+
    jsr PuzzleDrawAll
    lda #0
    sta PuzzleRedraw
  :

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_RIGHT
  sta PPUCTRL
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  jsr PuzzleReadJoy
  jsr KeyRepeat
  jsr ClearOAM

  ldx #0
  jsr PuzzleDoPlayer

  ; Pausing
  lda keynew
  and #KEY_START
  beq NoPause
    lda #BG_ON|OBJ_ON|LIGHTGRAY
    sta PPUMASK

    ; Debounce
    ldy #15
  : jsr WaitVblank
    dey
    bne :-

    ; Wait
  : jsr WaitVblank
    jsr PuzzleReadJoy
    lda keynew
    and #KEY_START
    beq :-

    ; Debounce
    ldy #15
  : jsr WaitVblank
    dey
    bne :-

    lda #BG_ON|OBJ_ON
    sta PPUMASK
  NoPause:


  jmp Loop


WriteZeroRepeated6:
  lda #0
  ldx #6
  jmp WritePPURepeated

WriteColors:
  lda #$26
  sta PPUDATA
  lda #$2a
  sta PPUDATA
  lda #$22
  sta PPUDATA
  rts
.endproc

.proc PuzzleDoPlayer
  ; -----------------------------------

  ; Draw the next piece
  ldy OamPtr

  lda #(12+3)*8
  sta OAM_XPOS+0,y
  lda #(12+4)*8
  sta OAM_XPOS+4,y

  lda #4*8-1
  sta OAM_YPOS+0,y
  sta OAM_YPOS+4,y

  ; Calculate the tiles for first and second pieces of the pill
  lda PuzzleNextColor1,x
  asl
  asl
  asl
  ora #$80 | PuzzleTiles::LEFT
  sta OAM_TILE+0,y

  lda PuzzleNextColor2,x
  asl
  asl
  asl
  ora #$80 | PuzzleTiles::RIGHT
  sta OAM_TILE+4,y

  lda #OAM_COLOR_3
  sta OAM_ATTR+0,y
  sta OAM_ATTR+4,y
  tya
  add #8
  sta OamPtr

  ; -----------------------------------

  ldy PuzzleState,x
  lda StateHi,y
  pha
  lda StateLo,y
  pha
  rts

StateHi:
  .hibytes PuzzleInit-1, InitPill-1, FallPill-1, PuzzleMatch-1, PuzzleGravity-1
StateLo:
  .lobytes PuzzleInit-1, InitPill-1, FallPill-1, PuzzleMatch-1, PuzzleGravity-1
.endproc

.proc InitPill
  ; Color = next color
  lda PuzzleNextColor1,x
  sta PuzzleColor1,x
  lda PuzzleNextColor2,x
  sta PuzzleColor2,x

  ; Choose a new next color
  jsr PuzzleRandomColor
  sta PuzzleNextColor1,x
  jsr PuzzleRandomColor
  sta PuzzleNextColor2,x
  lda #3
  sta PuzzleX,x
  lda #0
  sta PuzzleY,x
  sta PuzzleDir,x

  inc PuzzleState,x

  ldy PuzzleSpeed,x
  lda PuzzleFallSpeeds,y
  sta PuzzleFallTimer,x
  rts
.endproc

PuzzleFallSpeeds:
  .byt 60, 30, 15

.proc FallPill
Tile1 = TempVal + 0
Tile2 = TempVal + 1
SecondX = TempVal + 2 ; second tile X
SecondY = TempVal + 3 ; second tile Y
  ; Get the X and Y for the second piece
  ; so it's already fetched
  ldy PuzzleDir,x
  lda SecondPieceTX,y
  add PuzzleX,x
  sta SecondX
  lda SecondPieceTY,y
  add PuzzleY,x
  sta SecondY

  ; Rotate
  lda keynew,x
  and #KEY_B
  beq NotA
    inc PuzzleDir,x
    lda PuzzleDir,x
    cmp #2
    bne NotA
      lda #0
      sta PuzzleDir,x
      jsr SwapColors
  NotA:

  ; Rotate
  lda keynew,x
  and #KEY_A
  beq NotB
    dec PuzzleDir,x
    bpl NotB
      lda #1
      sta PuzzleDir,x
      jsr SwapColors
  NotB:

  lda keynew,x
  and #KEY_LEFT
  beq NotLeft
    lda PuzzleX,x
    beq NotLeft
      dec PuzzleX,x
      dec SecondX
  NotLeft:

  jsr PuzzleGridReadSecond
  bne :+
  jsr PuzzleGridReadFirst
  beq :++
  :
    inc PuzzleX,x
    inc SecondX
  :

  lda keynew,x
  and #KEY_RIGHT
  beq NotRight
    inc PuzzleX,x
    inc SecondX
  NotRight:

  ; Correct if you go past the right edge
  ; either by rotating or by moving right
  lda SecondX
  cmp #PUZZLE_WIDTH
  bne :+
    dec PuzzleX,x
    dec SecondX
  :

  jsr PuzzleGridReadSecond
  bne :+
  jsr PuzzleGridReadFirst
  beq :++
  :
    dec PuzzleX,x
    dec SecondX
  :

  lda keydown,x
  and #KEY_DOWN
  beq :+
    ; Fall every other frame if holding down
    lda retraces
    lsr
    bcs ForceFall
  :

  dec PuzzleFallTimer,x
  bne NoFall
ForceFall:
    inc PuzzleY,x
    inc SecondY
    ldy PuzzleSpeed,x
    lda PuzzleFallSpeeds,y
    sta PuzzleFallTimer,x

    lda PuzzleY,x
    cmp #PUZZLE_HEIGHT
    bne NoFall
  FallLandOnSomething:
     dec PuzzleY,x
     dec SecondY
     jmp LandOnSomething
  NoFall:

  ; Check if the pill has landed on another pill
  jsr PuzzleGridReadFirst
  sta 2
  jsr PuzzleGridReadSecond
  ora 2
  bne FallLandOnSomething


  ; Draw the pill
  ; (First get info before Y is taken up by OAM index)
  ldy PuzzleDir,x
  lda SecondPiecePX,y
  sta 0
  lda SecondPiecePY,y
  sta 1

  ; Now draw it
  ldy OamPtr

  lda PuzzleX,x
  add #12
  asl
  asl
  asl
  sta OAM_XPOS+0,y
  add 0
  sta OAM_XPOS+4,y

  lda PuzzleY,x
  add #6
  asl
  asl
  asl
  sta OAM_YPOS+0,y
  add 1
  sta OAM_YPOS+4,y

  ; Calculate the tiles for first and second pieces of the pill
  jsr GetPillTiles
  lda Tile1
  sta OAM_TILE+0,y

  lda Tile2
  sta OAM_TILE+4,y

  lda #OAM_COLOR_3
  sta OAM_ATTR+0,y
  sta OAM_ATTR+4,y

  tya
  add #8
  sta OamPtr
  rts

SecondPiecePX: ; pixels
  .byt 8, 0
SecondPiecePY:
  .byt 0, <-8
SecondPieceTX: ; tiles
  .byt 1, 0
SecondPieceTY:
  .byt 0, <-1

FirstPieceTile:
  .byt $82, $84 
SecondPieceTile:
  .byt $83, $85

SwapColors:
  lda PuzzleColor1,x
  pha
  lda PuzzleColor2,x
  sta PuzzleColor1,x
  pla
  sta PuzzleColor2,x
  rts

GetPillTiles:
  lda PuzzleDir,x
  asl
  add #$82
  sta 0

  lda PuzzleColor1,x
  asl
  asl
  asl
  ora 0
  sta Tile1

  lda PuzzleColor2,x
  asl
  asl
  asl
  ora 0
  adc #1 ; carry is clear
  sta Tile2
  rts

LandOnSomething:
  lda #PuzzleStates::INIT_PILL
  sta PuzzleState,x

  jsr GetPillTiles
  lda PuzzleX,x
  sta 0
  lda PuzzleY,x
  sta 1
  lda Tile1
  jsr LandPillWrite
  lda SecondX
  sta 0
  lda SecondY
  sta 1
  lda Tile2

LandPillWrite:
  ; Push the color
  sta 2
  pha
  lda 0
  asl
  asl
  asl
  asl
  ora 1
  tay
  pla
  ; Write to the internal grid
  sta PuzzleMap,y

  ; Update the nametable now

  ; Find a tile update slot
  ldy #0
: lda TileUpdateA1,y
  beq :+   ; found a free slot
  iny
  cpy #MaxNumTileUpdates 
  bne :-   ; keep going
  beq @Exit ; no slots? shouldn't happen but handle it anyway
:

  ; Form PPU address
  ; 4 is low half
  ; 5 is high half
  lda #0
  sta 5
  lda 1 ; Piece Y position
  .repeat 5 ; * 32
    asl
    rol 5
  .endrep
  add 0
  sta 4

  ; Write PPU address
  lda #<($2000 + 32*6 + 12)
  add 4
  sta TileUpdateA2,y
  lda #>($2000 + 32*6 + 12)
  adc 5
  sta TileUpdateA1,y

  ; Get tile
  lda 2
  sta TileUpdateT,y

@Exit:
  lda #PuzzleStates::CHECK_MATCH
  sta PuzzleState
  rts

PuzzleGridReadSecond:
  lda SecondX
  sta 0
  lda SecondY
  sta 1
  jmp PuzzleGridRead
.endproc

.proc PuzzleRandomColor
: jsr huge_rand
  and #3
  cmp #3
  beq :-
  rts
.endproc

PuzzleGridReadFirst:
  lda PuzzleX,x
  sta 0
  lda PuzzleY,x
  sta 1
.proc PuzzleGridRead
  lda 0
  asl
  asl
  asl
  asl
  ora 1
  tay
  lda PuzzleMap,y
  rts
.endproc

.proc PuzzleReadJoy
  lda keydown+0
  sta keylast+0
  lda keydown+1
  sta keylast+1

  lda #$01
  sta $4016
  sta keydown+0
  sta keydown+1  ; player 2's buttons double as a ring counter
  lsr a          ; now A is 0
  sta $4016
: lda $4016
  and #%00000011  ; ignore bits other than controller
  cmp #$01        ; Set carry if and only if nonzero
  rol keydown+0   ; Carry -> bit 0; bit 7 -> Carry
  lda $4017       ; Repeat
  and #%00000011
  cmp #$01
  rol keydown+1  ; Carry -> bit 0; bit 7 -> Carry
  bcc :-

  ; Update keylast
  lda keylast+0
  eor #$FF
  and keydown+0
  sta keynew+0

  lda keylast+1
  eor #$FF
  and keydown+1
  sta keynew+1
  rts
.endproc

.proc PuzzleMatch
COLOR_MASK = %11000
Row = 1
Column = 0
Color = 2
  lda #0
  sta Row
  sta Column
Horizontal:
  jsr PuzzleGridRead
  sta Color
  and PuzzleMap+PUZZLE_HEIGHT*1,y
  and PuzzleMap+PUZZLE_HEIGHT*2,y
  and PuzzleMap+PUZZLE_HEIGHT*3,y
  beq NextHorizontal

  ; Check for four in a row
  lda Color
  and #COLOR_MASK
  sta Color

  lda PuzzleMap+PUZZLE_HEIGHT*1,y
  and #COLOR_MASK
  cmp Color
  bne NextHorizontal

  lda PuzzleMap+PUZZLE_HEIGHT*2,y
  and #COLOR_MASK
  cmp Color
  bne NextHorizontal

  lda PuzzleMap+PUZZLE_HEIGHT*3,y
  and #COLOR_MASK
  cmp Color
  bne NextHorizontal

  ; Clear the tiles
  lda Color
  ora #$86
  sta PuzzleMap+PUZZLE_HEIGHT*0,y
  sta PuzzleMap+PUZZLE_HEIGHT*1,y
  sta PuzzleMap+PUZZLE_HEIGHT*2,y
  sta PuzzleMap+PUZZLE_HEIGHT*3,y
  sta PuzzleRedraw,x

NextHorizontal:
  ; Next column
  inc Column
  lda Column
  cmp #PUZZLE_WIDTH-3
  bne Horizontal
  ; Next row
  lda #0
  sta Column
  inc Row
  lda Row
  cmp #PUZZLE_HEIGHT
  bne Horizontal

  ; -----------------------------------

  lda #0
  sta Row
  sta Column
Vertical:
  jsr PuzzleGridRead
  sta Color
  and PuzzleMap+1,y
  and PuzzleMap+2,y
  and PuzzleMap+3,y
  beq NextVertical

  ; Check for four in a row
  lda Color
  and #COLOR_MASK
  sta Color

  lda PuzzleMap+1,y
  and #COLOR_MASK
  cmp Color
  bne NextVertical

  lda PuzzleMap+2,y
  and #COLOR_MASK
  cmp Color
  bne NextVertical

  lda PuzzleMap+3,y
  and #COLOR_MASK
  cmp Color
  bne NextVertical

  ; Clear the tiles
  lda Color
  ora #$86
  sta PuzzleMap+0,y
  sta PuzzleMap+1,y
  sta PuzzleMap+2,y
  sta PuzzleMap+3,y
  sta PuzzleRedraw,x

NextVertical:
  ; Next row
  inc Row
  lda Row
  cmp #PUZZLE_HEIGHT-3
  bne Vertical
  ; Next column
  lda #0
  sta Row
  inc Column
  lda Column
  cmp #PUZZLE_WIDTH
  bne Vertical

  ; Go to init pill if nothing cleared
  ; but attempt gravity if it did
  lda #PuzzleStates::INIT_PILL
  sta PuzzleState,x

  lda PuzzleRedraw,x
  bne :+
   rts
  :
  ; Now attempt to make things fall
  lda #PuzzleStates::GRAVITY
  sta PuzzleState,x
  lda #8
  sta PuzzleFallTimer,x
  rts
.endproc

.proc PuzzleGravity
  Column = 0
  Row = 1
  DidFix = 2 ; flag to say a tile was fixed

  lda PuzzleFallTimer,x
  beq :+
    dec PuzzleFallTimer,x
    rts
  :

  ldy #0
  sty DidFix
FixLoop:
  lda PuzzleMap,y
  bpl :+ ; all playfield tiles are >128, or negative
  jsr CallFix
: iny
  cpy #128
  bne FixLoop

  lda DidFix
  beq :+
    inc PuzzleRedraw,x
    rts
  :

  ; .----------------------------------
  ; | Try gravity now
  ; '----------------------------------
  lda #0
  sta DidFix
  lda #PUZZLE_WIDTH-1
  sta Column
  lda #PUZZLE_HEIGHT-1
  sta Row
GravityLoop:
  jsr PuzzleGridRead
  bne :+ ; only run for blank space
  lda PuzzleMap-1,y
  beq :+ ; that have a non-blank space above
  jsr CallGravity
:
  ; Next column
  dec Column
  bpl GravityLoop
  ; Next row
  lda #PUZZLE_WIDTH-1
  sta Column
  dec Row
  ; Skip row 0
  bne GravityLoop

  lda DidFix
  beq :+
    lda #8
    sta PuzzleFallTimer,x

    inc PuzzleRedraw,x
    rts
  :

  ; Check matches again if no gravity happened
  lda #PuzzleStates::CHECK_MATCH
  sta PuzzleState,x
  rts

; .------------------------------------
; | Tile fixing
; '------------------------------------
; Call one of the fix routines
CallFix:
  sty TempY
  and #7
  tay
  lda FixTableH,y
  pha
  lda FixTableL,y
  pha
  ldy TempY
  rts

; virus, single, left, right, bottom, top, clearing, nothing
FixTableL:
  .lobytes NoFix-1, NoFix-1, FixLeft-1, FixRight-1, FixBottom-1, FixTop-1, FixClearing-1, NoFix-1
FixTableH:
  .hibytes NoFix-1, NoFix-1, FixLeft-1, FixRight-1, FixBottom-1, FixTop-1, FixClearing-1, NoFix-1

FixClearing:
  inc DidFix
  lda #0
  sta PuzzleMap,y
NoFix:
  rts

FixLeft:
  lda PuzzleMap+PUZZLE_HEIGHT,y
  and #7
  cmp #PuzzleTiles::RIGHT
  beq :+
    lda PuzzleMap,y
    and #<~7
    ora #PuzzleTiles::SINGLE
    sta PuzzleMap,y
    inc DidFix
  :
  rts

FixRight:
  lda PuzzleMap-PUZZLE_HEIGHT,y
  and #7
  cmp #PuzzleTiles::LEFT
  beq :+
    lda PuzzleMap,y
    and #<~7
    ora #PuzzleTiles::SINGLE
    sta PuzzleMap,y
    inc DidFix
  :
  rts

FixBottom:
  lda PuzzleMap-1,y
  and #7
  cmp #PuzzleTiles::TOP
  beq :+
    lda PuzzleMap,y
    and #<~7
    ora #PuzzleTiles::SINGLE
    sta PuzzleMap,y
    inc DidFix
  :
  rts

FixTop:
  lda PuzzleMap+1,y
  and #7
  cmp #PuzzleTiles::BOTTOM
  beq :+
    lda PuzzleMap,y
    and #<~7
    ora #PuzzleTiles::SINGLE
    sta PuzzleMap,y
    inc DidFix
  :
  rts

; .------------------------------------
; | Gravity routines
; '------------------------------------
CallGravity:
  sty TempY
  ; Pick based on the tile above (still in accumulator)
  and #7
  tay
  lda GravityTableH,y
  pha
  lda GravityTableL,y
  pha
  ldy TempY
  rts

; virus, single, left, right, bottom, top, clearing, nothing
GravityTableL:
  .lobytes NoFix-1, GravitySingle-1, GravityLeft-1, GravityRight-1, GravitySingle-1, GravitySingle-1, NoFix-1, NoFix-1
GravityTableH:
  .hibytes NoFix-1, GravitySingle-1, GravityLeft-1, GravityRight-1, GravitySingle-1, GravitySingle-1, NoFix-1, NoFix-1

GravitySingle:
  lda PuzzleMap-1,y
  sta PuzzleMap,y
  lda #0
  sta PuzzleMap-1,y
  inc DidFix
  rts
GravityLeft:
  lda PuzzleMap+PUZZLE_HEIGHT,y
  bne :+
    lda PuzzleMap-1,y
    sta PuzzleMap,y
    lda PuzzleMap-1+PUZZLE_HEIGHT,y
    sta PuzzleMap+PUZZLE_HEIGHT,y
    lda #0
    sta PuzzleMap-1,y
    sta PuzzleMap-1+PUZZLE_HEIGHT,y
    inc DidFix
  :
  rts
GravityRight:
  lda PuzzleMap-PUZZLE_HEIGHT,y
  bne :+
    lda PuzzleMap-1,y
    sta PuzzleMap,y
    lda PuzzleMap-1-PUZZLE_HEIGHT,y
    sta PuzzleMap-PUZZLE_HEIGHT,y
    lda #0
    sta PuzzleMap-1,y
    sta PuzzleMap-1-PUZZLE_HEIGHT,y
    inc DidFix
  :
  rts

.endproc

.proc PuzzleDrawAll
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL
  .repeat 8, I
    lda #>($2000 + (6*32)+(12+I))
    sta PPUADDR
    lda #<($2000 + (6*32)+(12+I))
    sta PPUADDR
    .repeat 16, J
      lda PuzzleMap+(I*16)+J
      sta PPUDATA
    .endrep
  .endrep
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_RIGHT
  sta PPUCTRL
  rts
.endproc

.proc div8 ; see also mul8
num = 10   ; <-- also result
denom = 11
  stx TempX
  sta num
  sty denom
  lda #$00
  ldx #$07
  clc
: rol num
  rol
  cmp denom
  bcc :+
  sbc denom
: dex
  bpl :--
  rol num
  tay
  ldx TempX
  lda num
  rts
.endproc

.proc PuzzleInit
; Playfield generation logic adapted from Vitamins for GBA
Column = 0
Row = 1
VirusesLeft = 2
MaxY = 3
Color = 4
Failures = 5
TileNum = 6
; Init the next color
  jsr PuzzleRandomColor
  sta PuzzleNextColor1,x
  jsr PuzzleRandomColor
  sta PuzzleNextColor2,x

.if 0
; Virus count is (Level*4)+4, or 84 if Level>20
  lda VirusLevel,x
  cmp #20
  bcc :+
    lda #20
  :
  asl ; * 4
  asl
  add #4

  sta VirusesLeft
  ; Seems to crash if given >= 80? To do: look into that
  ; 70 is okay
.endif

  ; Right now just directly use the 
  lda VirusLevel,x
  sta VirusesLeft

  lda #200
  sta Failures

  jsr PuzzleRandomColor
  sta Color
  jsr CalculateTileNum

; Calculate maximum allowed height
  lda #176
  add VirusesLeft
  ldy #20
  jsr div8
  sta MaxY

; Clear playfield
  lda #0
  tay
: sta PuzzleMap,y
  iny
  cpy #128
  bne :-

  ; -----------------------------------

AddVirusLoop:
  ; Bail if too many failures
  lda Failures
  jeq AbortAddVirus

  jsr huge_rand
  and #7
  sta Column

: jsr huge_rand
  and #15
  cmp MaxY
  bcs :-
  ; Reverse subtraction, start from the bottom
  eor #255
  sec
  adc #PUZZLE_HEIGHT-1
  sta Row

  ; Make sure this space isn't already taken, and move to a different column if it is
  jsr PuzzleGridRead
  beq XOkay

  lda Column
  eor #4
  sta Column
  jsr PuzzleGridRead
  beq XOkay

  lda Column
  eor #2
  sta Column
  jsr PuzzleGridRead
  beq XOkay

  lda Column
  eor #1
  sta Column
  jsr PuzzleGridRead
  bne AddVirusLoop
XOkay:

  ; Y is now the index of the grid square the virus is going in

  ; Avoid three-in-a-rows
  lda Column
  cmp #2
  bcc :+
    lda TileNum
    cmp PuzzleMap-PUZZLE_HEIGHT*1,y
    bne :+
    cmp PuzzleMap-PUZZLE_HEIGHT*2,y
    bne :+
      dec Failures
      jmp AddVirusLoop
  :

  lda Column
  cmp #PUZZLE_WIDTH-2
  bcs :+
    lda TileNum
    cmp PuzzleMap+PUZZLE_HEIGHT*1,y
    bne :+
    cmp PuzzleMap+PUZZLE_HEIGHT*2,y
    bne :+
      dec Failures
      jmp AddVirusLoop
  :

  lda Row
  cmp #2
  bcc :+
    lda TileNum
    cmp PuzzleMap-1,y
    bne :+
    cmp PuzzleMap-2,y
    bne :+
      dec Failures
      jmp AddVirusLoop
  :

  lda Row
  cmp #PUZZLE_HEIGHT-2
  bcs :+
    lda TileNum
    cmp PuzzleMap+1,y
    bne :+
    cmp PuzzleMap+2,y
    bne :+
      dec Failures
      jmp AddVirusLoop
  :

  ; "Allow some three-in-a-rows (oxo) for really dense virus levels."
  lda Failures
  cmp #150
  bcc Under150
    ; Vertical
    lda Row
    cmp #1
    bcc :+
    cmp #PUZZLE_HEIGHT-1
    bcs :+
    lda TileNum
    cmp PuzzleMap-1,y
    bne :+
    cmp PuzzleMap+1,y
    bne :+
      dec Failures
      jmp AddVirusLoop
    :

    ; Horizontal
    lda Column
    cmp #1
    bcc :+
    cmp #PUZZLE_WIDTH-1
    bcs :+
    lda TileNum
    cmp PuzzleMap-PUZZLE_HEIGHT,y
    bne :+
    cmp PuzzleMap+PUZZLE_HEIGHT,y
    bne :+
      dec Failures
      jmp AddVirusLoop
    :
  Under150:

  ; Place the virus
  ; by writing to the playfield
  ; (Y still the index for the selected X and Y)
  lda TileNum
  sta PuzzleMap,y

  ; Cycle colors
  inc Color
  lda Color
  cmp #3
  bne :+
    lda #0
    sta Color
  :
  jsr CalculateTileNum

  dec VirusesLeft
  jne AddVirusLoop
AbortAddVirus:

  ; ---
  lda #PuzzleStates::INIT_PILL
  sta PuzzleState,x
  inc PuzzleRedraw,x
  rts

CalculateTileNum:
  lda Color
  asl
  asl
  asl
  ora #$80 | PuzzleTiles::VIRUS
  sta TileNum
  rts
.endproc

