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

EnemyEditScreen = ScrollX

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
  jsr WaitVblank
  lda #0
  sta PPUMASK
  sta EnemyEditScreen
  jsr ClearOAM
  lda #GraphicsUpload::CHR_ENEMYEDIT
  jsr DoGraphicUpload

  lda #' '
  jsr ClearNameCustom

  PositionXY 0, 7, 4
  jsr PutStringImmediate
  .byt "-Enemy placement:-",0


  ; Top edge
  PositionXY 0, 7, 7
  lda #4
  sta PPUDATA
  lda #5
  jsr WritePPURepeated16
  lda #6
  sta PPUDATA

  ; Bottom edge
  PositionXY 0, 7, 23
  lda #9
  sta PPUDATA
  lda #10
  jsr WritePPURepeated16
  lda #11
  sta PPUDATA

  ; Make the vertical bars on the sides sides
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL
  PositionXY 0, 7, 8
  lda #7
  ldx #15
  jsr WritePPURepeated
  PositionXY 0, 24, 8
  lda #8
  ldx #15
  jsr WritePPURepeated
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_RIGHT
  sta PPUCTRL

  lda #0
  sta PlaceBlockX
  sta PlaceBlockY

  jsr EnemyEditLevelDraw

Loop:
  jsr WaitVblank
  lda #BG_ON|OBJ_ON
  sta PPUMASK

  lda #2
  sta OAM_DMA

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
  :

  lda keynew
  and #KEY_DOWN
  beq :+
    inc PlaceBlockY
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
  add #8*8-1
  sta OAM_XPOS
  lda PlaceBlockY
  asl
  asl
  asl
  add #8*8-1
  sta OAM_YPOS

  jmp Loop
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
    lda #>($2000+I+(32*8+8))
    sta PPUADDR
    lda #<($2000+I+(32*8+8))
    sta PPUADDR

    .repeat 15, J
      lda ScratchPage+((I*16)+J)
      sta PPUDATA
    .endrep
  .endrep

  ; I also tried to do it with less loop unrolling but it ran out of vblank budget
  .if 0
    .repeat 16, I
      lda #>($2000+I+(32*8+8))
      sta PPUADDR
      lda #<($2000+I+(32*8+8))
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
  rts

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

