; Princess Engine
; Copyright (C) 2014-2017 NovaSquirrel
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

; ENEMY DRAWING OPTIONS (for 16x16) ----------------------------------------------------
; DispEnemyWide                     - sequential,    same attributes,      auto flip
; DispEnemyWideCustom               - nonsequential, same attributes,      auto flip
; DispEnemyWideFlipped              - sequential,    same attributes,      manual flip
; DispEnemyWideNonsequential        - nonsequential, different attributes, auto flip
; DispEnemyWideNonsequentialFlipped - nonsequential, different attributes, manual flip
;
; ENEMY DRAWING OPTIONS (for arbitrary sizes) ------------------------------------------
; DispEnemyMetasprite               - 
;
; DEFINITIONS IN THE ABOVE TABLES ------------------------------------------------------
; Sequential:           Tile N is given; sprite is drawn with N+0, N+1, N+2, N+3
; Nonsequential:        Four tiles are arbitrarily chosen
; Same attributes:      Each 8x8 tile has the same attributes for its sprites
; Different attributes: Four attributes are arbitrarily chosen
; Auto flip:            Sprite is automatically flipped for stun status and horizontal direction
; Manual flip:          Flip is specified when calling the routine.
; --------------------------------------------------------------------------------------


; Calculates pixel positions for an object and exits the parent routine
; if the object is too far off the screen.
; inputs: X (object slot)
.proc DispEnemyWideCalculatePositions
; like RealXPosToScreenPosByX but this accounts for hiding the sprite if offscreen
  lda ObjectPXL,x
  sub ScrollX+0
  sta O_RAM::OBJ_DRAWX

  lda #0
  sta O_RAM::ON_SCREEN

  lda ObjectPXH,x
  sbc ScrollX+1
  bcc ParentExit
  cmp #15
  bcs ParentExit
  .repeat 4
    lsr
    ror O_RAM::OBJ_DRAWX
  .endrep
  lda O_RAM::OBJ_DRAWX
  cmp #$f9
  bcs ParentExit
  lda ObjectPYH,x
  cmp #16
  bcs ParentExit
  RealYPosToScreenPosByX ObjectPYL, ObjectPYH, O_RAM::OBJ_DRAWY
  inc O_RAM::ON_SCREEN
.ifdef REAL_COLLISION_TEST
  sec
.endif
  rts
ParentExit:
.ifdef REAL_COLLISION_TEST
  clc
.else
  pla
  pla
.endif
  rts
.endproc

; Displays a 16x16 enemy on the screen composed of four consecutive tiles
; inputs:
; A - first tile of the enemy
; X - object slot
; Y - attributes for the enemy
DispEnemyWide:
  sty 4
  ora O_RAM::TILEBASE
  tay
  sty 0
  iny
  sty 1
  iny
  sty 2
  iny
  sty 3
; Displays a 16x16 enemy made up of arbitrary tiles
; inputs:
; 0 - tile 0 (top left)
; 1 - tile 1 (bottom left)
; 2 - tile 2 (top right)
; 3 - tile 3 (bottom right)
; 4 - attributes to use
; A - flags?
; X - object slot
.proc DispEnemyWideCustom
  Attribute = 4
  Flags = 5
  DrawX = O_RAM::OBJ_DRAWX
  DrawY = O_RAM::OBJ_DRAWY
  Temp  = 0
  sta Flags

  jsr DispEnemyWideCalculatePositions
.ifdef REAL_COLLISION_TEST
  bcs :+
  rts
:
.endif

.if 0
  lda Flags
  and #2
  bne NoHFlip
  ; flip horizontally
  lsr Flags
  bcc :+
    lda retraces
    and #%100
    beq DoHFlip
    bne NoHFlip
  :
.endif
  lda ObjectF1,x
  and #1
  beq NoHFlip
DoHFlip:
    swapy 0, 2
    swapy 1, 3
    lda Attribute
    ora #OAM_XFLIP
    sta Attribute
NoHFlip:

  ; flip vertically
  lda ObjectF2,x
  cmp #ENEMY_STATE_STUNNED
  bne :+
    swapy 0, 1
    swapy 2, 3
    lda Attribute
    ora #OAM_YFLIP
    sta Attribute
  :

  ldy OamPtr

  ; Y positions
  lda DrawY
  sta OAM_YPOS+(4*0),y
  sta OAM_YPOS+(4*2),y
  add #8
  sta OAM_YPOS+(4*1),y
  sta OAM_YPOS+(4*3),y

  ; Write the attributes for the four sprites
  lda Attribute
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y
  sta OAM_ATTR+(4*2),y
  sta OAM_ATTR+(4*3),y

  ; Write the tiles for the four sprites
  lda 0
  sta OAM_TILE+(4*0),y
  lda 1
  sta OAM_TILE+(4*1),y
  lda 2
  sta OAM_TILE+(4*2),y
  lda 3
  sta OAM_TILE+(4*3),y

  ; X positions
  lda DrawX
  sta OAM_XPOS+(4*0),y
  sta OAM_XPOS+(4*1),y
  add #8
  sta OAM_XPOS+(4*2),y
  sta OAM_XPOS+(4*3),y

  ; Move OamPtr ahead four sprites
  tya
  add #16
  sta OamPtr
  rts
.endproc

; Nonsequential object definition:
; top left, top right, bottom left, bottom right
; tiles for 4 bytes, then attributes for 4 bytes

; Draws a square object consisting of four tiles with their own attributes
; inputs: YA (definition), X (object slot)
; locals: 0, 1, 2, TouchTemp to TouchTemp+7, TempX
.proc DispEnemyWideNonsequential
  Data = 0
  Attribute = 2
  Definition = TouchTemp      ; 9 free bytes here, should be enough for a copy of the definition
  DrawX = O_RAM::OBJ_DRAWX
  DrawY = O_RAM::OBJ_DRAWY
  ; note: O_RAM starts at 6, so don't use anything past it

  ; store pointer to definition
  sta Data+0
  sty Data+1
AfterStorePointer:

  jsr DispEnemyWideCalculatePositions
.ifdef REAL_COLLISION_TEST
  bcs :+
  rts
:
.endif
  lda #0
  sta Attribute
  stx TempX     ; save X

  ; copy the definition
  ldy #7
: lda (Data),y
  sta Definition,y
  dey
  bpl :-

  ; flip horizontally
  lda ObjectF1,x
  and #1
  beq NoHFlip
DoHFlip:
    swapy Definition+0+0, Definition+0+2
    swapy Definition+0+1, Definition+0+3
    swapy Definition+4+0, Definition+4+2
    swapy Definition+4+1, Definition+4+3
    lda #OAM_XFLIP
    sta Attribute
NoHFlip:

  ; flip vertically
  lda ObjectF2,x
  cmp #ENEMY_STATE_STUNNED
  bne :+
    swapy Definition+0+0, Definition+0+1
    swapy Definition+0+2, Definition+0+3
    swapy Definition+4+0, Definition+4+1
    swapy Definition+4+2, Definition+4+3
    lda Attribute
    ora #OAM_YFLIP
    sta Attribute
  :

  ldy OamPtr

  ; Y positions
  lda DrawY
  sta OAM_YPOS+(4*0),y
  sta OAM_YPOS+(4*2),y
  add #8
  sta OAM_YPOS+(4*1),y
  sta OAM_YPOS+(4*3),y

  ; Write the attributes for the four sprites
  ldx Attribute
  txa
  eor Definition+4
  sta OAM_ATTR+(4*0),y
  txa
  eor Definition+5
  sta OAM_ATTR+(4*1),y
  txa
  eor Definition+6
  sta OAM_ATTR+(4*2),y
  txa
  eor Definition+7
  sta OAM_ATTR+(4*3),y

  ; Write the tiles for the four sprites
  ldx O_RAM::TILEBASE
  txa
  ora Definition+0
  sta OAM_TILE+(4*0),y
  txa
  ora Definition+1
  sta OAM_TILE+(4*1),y
  txa
  ora Definition+2
  sta OAM_TILE+(4*2),y
  txa
  ora Definition+3
  sta OAM_TILE+(4*3),y

  ; X positions
  lda DrawX
  sta OAM_XPOS+(4*0),y
  sta OAM_XPOS+(4*1),y
  add #8
  sta OAM_XPOS+(4*2),y
  sta OAM_XPOS+(4*3),y

  ; Move OamPtr ahead four sprites
  tya
  add #16
  sta OamPtr
  ldx TempX
  rts
.endproc

; Draws a square object consisting of four tiles with their own attributes, and with custom flipping
; inputs: 0,1 (definition), X (object slot), A ( flips, bit 0:Y, bit 1:X )
.proc DispEnemyWideNonsequentialFlipped
  tay

  ; push the original state bits
  lda ObjectF1,x
  pha
  lda ObjectF2,x
  pha

  lda #0
  sta ObjectF2,x

  tya
  lsr
  sta ObjectF1,x
  bcc :+
    lda #ENEMY_STATE_STUNNED
    sta ObjectF2,x
  :

  ; draw the object with the needed flips
  jsr DispEnemyWideNonsequential::AfterStorePointer

  ; store the original state bits back
  pla
  sta ObjectF2,x
  pla
  sta ObjectF1,x
  rts
.endproc

; Displays a 16x16 enemy on the screen composed of four consecutive tiles, with custom flipping
; inputs: Y (first tile), X (object slot), A ( attributes: bit 0:Y, bit 1:X, bits 2 and 3 are palette )
; locals: TempY
.proc DispEnemyWideFlipped
  sty TempY
  tay

  ; push the original state bits
  lda ObjectF1,x
  pha
  lda ObjectF2,x
  pha

  lda #0
  sta ObjectF2,x

  tya
  lsr
  sta ObjectF1,x
  pha
  bcc :+
    lda #ENEMY_STATE_STUNNED
    sta ObjectF2,x
  :
  pla
  lsr
  tay ; attributes (encoded in the byte that also had the flips) go in Y

  ; draw the object with the needed flips
  lda TempY
  jsr DispEnemyWide

  ; store the original state bits back
  pla
  sta ObjectF2,x
  pla
  sta ObjectF1,x
  rts
.endproc

; ----------------- COMPLICATED METASPRITE STUFF ----------
; more complicated format is canceled
;
; -----------------
; rectangle format:
; ppww whhh
; |||| |+++- height in tiles
; ||++-+---- width in tiles
; ++-------- palette
;[yxet tttt]
; |||+-++++- tile number
; ||+------- empty, skip this tile
; |+-------- X flip
; +--------- Y flip

; Draws a metasprite object
; inputs: YA (metasprite definition), X (object slot)
.proc DispEnemyMetasprite
Temp = TouchTemp
Data        = 0
Width       = 2
Height      = 3
CurHeight   = 4
Attribute   = 5
CurX        = Temp+0
CurY        = Temp+1
OldWidth    = Temp+2
StartIndex  = Temp+3
ColumnX     = Temp+4
  ; store the pointer
  sta Data+0
  sty Data+1
  stx TempX

  ldy #1
  sty StartIndex
  ; not on-screen until it's confirmed to be
  dey ; Y = 0
  sty O_RAM::ON_SCREEN
  
  ; read the header byte and separate it out into width, height and palette
  ; costs like ~6 more cycles than reading 3 separate bytes
  ; ldy #0 - Y still = 0
  lda (Data),y
  tax
  and #7
  sta Height
  txa
  lsr
  lsr
  lsr
  tax
  and #7
  sta Width
  sta OldWidth
  txa
  lsr
  lsr
  lsr
  sta Attribute

  ; width and height go from 1-8, not 0-7
  inc Width
  inc Height

  ldx TempX ; we need the object slot index again to read the object's X position

; --- compute the X and Y positions ---
  RealXPosToScreenPosByX ObjectPXL, ObjectPXH, O_RAM::OBJ_DRAWX
;  sta HighX

  ; divide the columns by 3
  ; to do: optimize
  ldy O_RAM::OBJ_DRAWX
  sty ColumnX
  .repeat 3
    lsr
    ror ColumnX
  .endrep

  ; init CurX
  lda O_RAM::OBJ_DRAWX
  sta CurX

  RealYPosToScreenPosByX ObjectPYL, ObjectPYH, O_RAM::OBJ_DRAWY

; --- do any clipping necessary ---
LeftClip:
  lda ColumnX
  bpl NoLeftClip
    add Width ; make sure the sprite is on the screen at all
    bpl :+
_rts1: rts
  : beq _rts1

    sta Width

    ; inefficient lame code, but shouldn't have to run many iterations
    ldy ColumnX
  : lda StartIndex
    add Height
    sta StartIndex
    lda CurX
    add #8
    sta CurX
    iny
    bne :-
    jmp NoRightClip
  NoLeftClip:
RightClip:
  lda ColumnX
  cmp #32
  bcs _rts1
  add Width
  cmp #32
  bcc NoRightClip
  sub #32

  ; width = width - the number of offscreen tiles
  eor #$FF
  sec
  adc Width
  sta Width

  NoRightClip:

  inc O_RAM::ON_SCREEN

;  ; draw the tiles horizontally flipped if needed
;  lda ObjectF1,x
  ; We no longer need X since we already have the object's positions,
  ; so it's free for use here.
  ldx OamPtr
;  lsr
;  jcs DispEnemyMetaspriteLeft

; --- draw the tiles ---
  ; start Y at the position where it'll start reading tile data
  ldy StartIndex
  dey
@ColumnLoopStart:
  lda O_RAM::OBJ_DRAWY
  sta CurY
  lda Height
  sta CurHeight
@ColumnLoop:
  iny           ; next sprite will use the next tile
  lda (Data),y  ; read a tile
  and #%00100000
  bne @SkipTile
  lda (Data),y
  pha
  and #%00011111
  ora O_RAM::TILEBASE
  sta OAM_TILE,x
  pla
  and #OAM_XFLIP | OAM_YFLIP
  eor Attribute
  sta OAM_ATTR,x

  ; X and Y
  lda CurX
  sta OAM_XPOS,x
  lda CurY
  sta OAM_YPOS,x
  add #8   ; move the next Y position down a tile
  sta CurY

  ; next tile in OAM
  inx
  inx
  inx
  inx
@SkipTileGoBack:
  ; see if there's more tiles for this column or not
  dec CurHeight
  bne @ColumnLoop

  ; no? is this the last column?
  dec Width
  beq Exit

  ; no? then next column
  lda CurX
  add #8
  sta CurX
  jmp @ColumnLoopStart

@SkipTile:
  lda CurY
  add #8
  sta CurY
  jmp @SkipTileGoBack
Exit:
  stx OamPtr
  ldx TempX
  rts
; ------- LEFT VERSION --------
.if 0
DispEnemyMetaspriteLeft:

  ; correct for clipping if needed
  lda Width
  cmp OldWidth
  beq NoClipping
    lda OldWidth
    sub Width
    tay
    lda #0
    clc
  : adc Height ; won't overflow, so adc will keep working
    dey
    bne :-
    sta OldWidth

    lda CurX
    bmi FixClipRight
  FixClipLeft:
    lda StartIndex
    sub OldWidth
    sta StartIndex
    jmp NoClipping

  FixClipRight:
    lda StartIndex
    add OldWidth
    sta StartIndex
  NoClipping:

  ; correct the X position
  lda Width
  asl
  asl
  asl
  add CurX
  sta CurX

  lda Attribute
  ora #%01000000
  sta Attribute

  ; start Y at the position where it'll start reading tile data
  ldy StartIndex
@ColumnLoopStart:
  lda O_RAM::OBJ_DRAWY
  sta CurY
  lda Height
  sta CurHeight
@ColumnLoop:
  ; X and Y
  lda CurX
  sta OAM_XPOS,x
  lda CurY
  sta OAM_YPOS,x
  add #8   ; move the next Y position down a tile
  sta CurY

  lda Attribute
  sta OAM_ATTR,x

  lda (Data),y  ; read a tile
  iny           ; next sprite will use the next tile
  ora O_RAM::TILEBASE
  sta OAM_TILE,x

  ; next tile in OAM
  inx
  inx
  inx
  inx
  ; see if there's more tiles for this column or not
  dec CurHeight
  bne @ColumnLoop

  ; no? is this the last column?
  dec Width
  rtseq

  ; no? then next column
  lda CurX
  sub #8
  sta CurX
  jmp @ColumnLoopStart
.endif
.endproc

.if 0
.proc SampleMetasprite
  MetaspriteHeader 3, 3, 0
  .byt 0, 1, 1
  .byt 2, MS_EMPTY, 3
  .byt 4, 5, 5
.endproc
.endif
