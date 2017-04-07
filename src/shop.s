; Princess Engine
; Copyright (C) 2017 NovaSquirrel
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
.proc ShowShop
Cursor = 13
CursorY = 14
NeedUpdateItemInfo = 15
  jsr OptionsScreenSetup
  jsr LoadShopItemIcons
  jsr ClearOAM

  lda #0
  sta Cursor

; Write the options
  PositionXY 0, 11, 4
  jsr PutStringImmediate
  .byt "-Item shop:-",0

  PositionXY 0, 11, 6
  jsr PutStringImmediate
  .byt "Money: ",0
  ldy SavedCoins+1
  lda BCD99,y
  jsr PutHex
  ldy SavedCoins+0
  lda BCD99,y
  jsr PutHex

  ; Menu items
  PositionXY 0, 14, 8
  jsr PutStringImmediate
  .byt "Exit",0
  PositionXY 0, 14, 10
  jsr PutStringImmediate
  .byt "Buy",0
  PositionXY 0, 14, 12
  jsr PutStringImmediate
  .byt "Toss",0

  ; Shop items
  PositionXY 0, 6, 14
  jsr PutStringImmediate
  .byt "Shop items:",0
  ; Make top and bottom sides
  PositionXY 0, 5, 15
  lda #4
  sta PPUDATA
  lda #5
  ldx #20
  jsr WritePPURepeated
  lda #6
  sta PPUDATA
  PositionXY 0, 5, 20
  lda #9
  sta PPUDATA
  lda #10
  ldx #20
  jsr WritePPURepeated
  lda #11
  sta PPUDATA

  ldx #0
  PositionXY 0, 5, 16
  jsr DrawShopRowTop
  PositionXY 0, 5, 17
  jsr DrawShopRowBot
  PositionXY 0, 5, 18
  jsr DrawShopRowTop
  PositionXY 0, 5, 19
  jsr DrawShopRowBot

  ; Player inventory
  PositionXY 0, 6, 22
  jsr PutStringImmediate
  .byt "Your inventory:",0
  ; Make top and bottom sides
  PositionXY 0, 5, 23
  lda #4
  sta PPUDATA
  lda #5
  ldx #20
  jsr WritePPURepeated
  lda #6
  sta PPUDATA
  PositionXY 0, 5, 26
  lda #9
  sta PPUDATA
  lda #10
  ldx #20
  jsr WritePPURepeated
  lda #11
  sta PPUDATA

  ; Draw player inventory
  PositionXY 0, 5, 24
  lda #7
  sta PPUDATA
  ldx #0
: lda InventorySaved,x
  jsr ItemShopTableLookup
  sta PPUDATA
  add #2
  sta PPUDATA

  inx
  cpx #10
  bne :-
  lda #8
  sta PPUDATA
  ; Bottom row
  PositionXY 0, 5, 25
  lda #7
  sta PPUDATA
  ldx #0
: lda InventorySaved,x
  jsr ItemShopTableLookup
  add #1
  sta PPUDATA
  add #2
  sta PPUDATA
  inx
  cpx #10
  bne :-
  lda #8
  sta PPUDATA

  jsr UpdateInventoryAmounts

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
  jne JumpToLevelSelect

  lda keynew
  and #KEY_A
  beq NoA
  ldy Cursor
  jeq JumpToLevelSelect
  dey
  jeq BuyMode
  dey
  jeq TossMode
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
    cmp #2
    beq :+
    inc Cursor
  :

  ; Draw the cursor
  lda #OAM_COLOR_0
  sta OAM_ATTR
  lda #$51
  sta OAM_TILE
  lda #13*8
  sta OAM_XPOS
  lda Cursor
  asl
  asl
  asl
  asl
  add #8*8-1
  sta OAM_YPOS
  jmp Loop

ClearMiddleMenu:
  ldy #0
  sty Cursor
  sty CursorY
  iny
  sty NeedUpdateItemInfo
  jsr WaitVblank
  ldy #' '
  PositionXY 0, 14, 8
  sty PPUDATA
  sty PPUDATA
  sty PPUDATA
  sty PPUDATA
  PositionXY 0, 14, 10
  sty PPUDATA
  sty PPUDATA
  sty PPUDATA
  PositionXY 0, 14, 12
  sty PPUDATA
  sty PPUDATA
  sty PPUDATA
  sty PPUDATA
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  rts

UpdateInventoryAmounts:
  jsr ClearOAM
  ldx #0
  ldy #32
  sty OamPtr
@Loop:
  ; Draw the inventory item amounts
  ldy InventorySaved+InventoryLen,x
  beq @SkipInventoryAmount
    iny
    lda BCD99,y
    unpack 1, 2
    ldy OamPtr
    lda 2
    ora #$40
    sta OAM_TILE,y
    lda 1
    ora #$40
    sta OAM_TILE+4,y
    lda #26*8-1
    sta OAM_YPOS,y
    sta OAM_YPOS+4,y
    lda #0
    sta OAM_ATTR,y
    sta OAM_ATTR+4,y
    txa
    asl
    asl
    asl
    asl
    add #6*8
    sta OAM_XPOS,y
    add #8
    sta OAM_XPOS+4,y
    ; If the tens digit is zero, hide that sprite
    lda 2
    bne @SkipInventoryAmount
    lda #$f8
    sta OAM_YPOS,y
@SkipInventoryAmount:
  tya
  add #8
  sta OamPtr

  inx
  cpx #10
  bne @Loop
  rts

CursorSpin:
  lda retraces
  and #31
  tay
  lda CosineTable,y
  jsr AsrAsrAsr
  sta 0
  lda SineTable,y
  jsr AsrAsrAsr
  sta 1
  rts
AsrAsrAsr:
  asr
  asr
  asr
  rts

BuyMode:
  jsr ClearMiddleMenu
BuyLoop:
  jsr WaitVblank
  jsr OptionsScreenCommonLoop

  lda keynew
  and #KEY_B
  jne ShowShop

  lda #(16*8-1)+4
  sta 2
  jsr DrawCursorShared

  ; Buy items
  lda keynew
  and #KEY_A
  beq NoBuyItem
    jsr GetBuyItem
    stx 5
    lda ItemShopTable,x
    beq NoBuyItem
    jsr InventoryGiveSavedItem
    stx 0 ; item slot number
    bcc NoBuyItem
    jsr WaitVblank
    lda #$23
    sta PPUADDR
    lda 0
    asl
    add #$06
    sta PPUADDR
    ldx 5
    lda ItemShopTable+1,x
    sta PPUDATA
    add #2
    sta PPUDATA
    ; Erase bottom row
    lda #$23
    sta PPUADDR
    lda 0
    asl
    add #$26
    sta PPUADDR
    lda ItemShopTable+1,x
    add #1
    sta PPUDATA
    add #2
    sta PPUDATA
    lda #0
    sta PPUSCROLL
    sta PPUSCROLL
    jsr UpdateInventoryAmounts
NoBuyItem:

  ; Move the cursor
  lda keynew
  and #KEY_LEFT
  beq :+
    lda Cursor
    beq :+
    dec Cursor
    inc NeedUpdateItemInfo
  :

  lda keynew
  and #KEY_RIGHT
  beq :+
    lda Cursor
    cmp #9
    beq :+
    inc Cursor
    inc NeedUpdateItemInfo
  :

  ; Move the cursor
  lda keynew
  and #KEY_UP|KEY_DOWN
  beq :+
    lda CursorY
    eor #1
    sta CursorY
    inc NeedUpdateItemInfo
  :

  lda NeedUpdateItemInfo
  beq :+
    jsr GetBuyItem
    lda ItemShopTable,x
    sec
    jsr UpdateItemInfo
  :

  jmp BuyLoop

GetBuyItem:
  lda #0
  sub CursorY
  and #10
  add Cursor
  asl
  asl
  tax
  rts

UpdateItemInfo:
  php
  sta 3 ; item number
  jsr ItemShopTableLookup
  sty 4

  jsr WaitVblank
  PositionXY 0, 7, 10
  lda #' '
  ldx #20
  jsr WritePPURepeated

  plp ; skip cost if carry clear
  bcc :+
  ; Write cost
  PositionXY 0, 7, 11
  ldy 4
  lda ItemShopTable+3,y
  tay
  lda BCD99,y
  jsr PutHex
  ldy 4
  lda ItemShopTable+2,y
  tay
  lda BCD99,y
  jsr PutHex
:
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  jsr WaitVblank
  PositionXY 0, 7, 10
  lda 3
  tax
  lda InventoryINameL,x
  sta 0
  lda InventoryINameH,x
  sta 1
  ldy #0
: lda (0),y
  beq :+
  sta PPUDATA
  iny
  bne :-
:

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  sta NeedUpdateItemInfo
  rts

DrawCursorShared:
  jsr CursorSpin
  ; Draw the cursor
  lda #OAM_COLOR_0
  sta OAM_ATTR
  sta OAM_ATTR+4
  lda #$51
  sta OAM_TILE
  sta OAM_TILE+4
  lda Cursor
  asl
  asl
  asl
  asl
  add #6*8+4
  sta OAM_XPOS+4
  add 0
  sta OAM_XPOS
  lda CursorY
  asl
  asl
  asl
  asl
  add 2
  sta OAM_YPOS+4
  add 1
  sta OAM_YPOS
  rts

TossMode:
  jsr ClearMiddleMenu
TossLoop:
  jsr WaitVblank
  jsr OptionsScreenCommonLoop

  lda keynew
  and #KEY_B
  jne ShowShop

  ; Move the cursor
  lda keynew
  and #KEY_LEFT
  beq :+
    lda Cursor
    beq :+
    dec Cursor
    inc NeedUpdateItemInfo
  :

  lda keynew
  and #KEY_RIGHT
  beq :+
    lda Cursor
    cmp #9
    beq :+
    inc Cursor
    inc NeedUpdateItemInfo
  :

  lda keynew
  and #KEY_A
  beq :+
    ldx Cursor
    lda #0
    sta InventorySaved,x
    sta InventorySaved+InventoryLen,x
    ; Erase top row of inventory slot
    jsr WaitVblank
    lda #$23
    sta PPUADDR
    lda Cursor
    asl
    add #$06
    sta PPUADDR
    lda #' '
    sta PPUDATA
    sta PPUDATA
    ; Erase bottom row
    lda #$23
    sta PPUADDR
    lda Cursor
    asl
    add #$26
    sta PPUADDR
    lda #' '
    sta PPUDATA
    sta PPUDATA
    lda #0
    sta PPUSCROLL
    sta PPUSCROLL
    jsr UpdateInventoryAmounts
  :

  lda #(24*8-1)+4
  sta 2
  jsr DrawCursorShared

  lda NeedUpdateItemInfo
  beq :+
    ldx Cursor
    lda InventorySaved,x
    clc
    jsr UpdateItemInfo
  :

  jmp TossLoop

DrawShopRowTop:
  lda #7
  sta PPUDATA
  ldy #10
: lda ItemShopTable+1,x
  inx
  inx
  inx
  inx
  sta PPUDATA
  add #2
  sta PPUDATA
  dey
  bne :-
  lda #8
  sta PPUDATA
  rts
DrawShopRowBot:
  ; move back over the same row of items again
  txa
  sub #40
  tax

  lda #7
  sta PPUDATA
  ldy #10
: lda ItemShopTable+1,x
  inx
  inx
  inx
  inx
  add #1
  sta PPUDATA
  add #2
  sta PPUDATA
  dey
  bne :-
  lda #8
  sta PPUDATA
  rts
.endproc

.proc ItemShopTableLookup
  cmp #0
  beq Blank
  stx TempX
  ldy #0
: ldx ItemShopTable+0,y
  beq NotFound
  cmp ItemShopTable+0,y
  beq Found
  iny
  iny
  iny
  iny
  bne :-
NotFound:
  lda #$B0
  ldx TempX
  sec
  rts
Found:
  lda ItemShopTable+1,y
  ldx TempX
  clc
  rts
Blank:
  lda #$1c ; maybe solve this a different way than having a blank tile?
  clc
  ldy #17*4
  rts
.endproc

.proc ItemShopTable
  .byt InventoryItem::SMALL_HEALTH_RESTORE, $B4, (7 .mod 100),   (7 / 100)
  .byt InventoryItem::HEALTH_RESTORE,       $B8, (30 .mod 100),  (30 / 100)
  .byt InventoryItem::BIG_HEALTH_RESTORE,   $BC, (100 .mod 100), (100 / 100)
  .byt InventoryItem::BALLOON,              $C4, (80 .mod 100),  (80 / 100)
  .byt InventoryItem::AUTO_BALLOON,         $C8, (100 .mod 100), (100 / 100)
  .byt InventoryItem::ABILITY_BLASTER,      $84, (100 .mod 100), (100 / 100)
  .byt InventoryItem::ABILITY_GLIDER,       $88, (100 .mod 100), (100 / 100)
  .byt InventoryItem::LAMP_OIL,             $B0, (20 .mod 100),  (20 / 100)
  .byt InventoryItem::ROPE,                 $B0, (60 .mod 100),  (60 / 100)
  .byt InventoryItem::ABILITY_BOMB,         $8C, (100 .mod 100), (100 / 100)
  .byt InventoryItem::ABILITY_FIRE,         $90, (100 .mod 100), (100 / 100)
  .byt InventoryItem::ABILITY_FIREWORK,     $94, (100 .mod 100), (100 / 100)
  .byt InventoryItem::ABILITY_NICE,         $98, (110 .mod 100), (110 / 100)
  .byt InventoryItem::ABILITY_BOOMERANG,    $9C, (100 .mod 100), (100 / 100)
  .byt InventoryItem::ABILITY_WATER,        $A4, (100 .mod 100), (100 / 100)
  .byt InventoryItem::ABILITY_FAN,          $A8, (70 .mod 100),  (70 / 100)
  .byt InventoryItem::ABILITY_BURGER,       $AC, (110 .mod 100), (110 / 100)
  .byt 0, $1C, 0, 0
  .byt 0, $1C, 0, 0
  .byt 0, $1C, 0, 0
.endproc

; A = item to give
; carry = item was given
; output: X = item slot used
.proc InventoryGiveSavedItem
  sta TempVal+2
; See if the item is already in the list
  ldx #InventoryLen-1
: ldy InventorySaved,x
  cpy TempVal+2
  bne :+
  ; Item found
  inc InventorySaved+InventoryLen,x ; amount
  rts
: ; Item not found, keep looking
  dex
  bpl :--

; If item isn't in the list, put it in the first blank slot
  ldx #0
: ldy InventorySaved,x
  beq Empty
  inx
  cpx #InventoryLen
  bne :-
  clc ; No free slots
  rts

Empty: ; Empty slot, put in item
  sta InventorySaved,x
  lda #0
  sta InventorySaved+InventoryLen,x
  sec
  rts
.endproc

.proc PutHex
	pha
	pha
	lsr a
	lsr a
	lsr a
	lsr a
	tax
	lda hexdigits,x
	sta PPUDATA
	pla
	and #$0f
	tax
	lda hexdigits,x
	sta PPUDATA
	pla
	rts
hexdigits:	.byt "0123456789ABCDEF"
.endproc
