; Princess Engine
; Copyright (C) 2017-2018 NovaSquirrel
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

; FREE_ITEMS = 1

.proc ShowShop
Cursor = 13
CursorY = 14
NeedUpdateItemInfo = 15
  jsr OptionsScreenSetup
  jsr LoadShopItemIcons
  ; Write Ike's palette
  ; Maybe actually redo this to something that writes an arbitrary list of things to the PPU?
  lda #$3f
  sta PPUADDR
  lda #$08
  sta PPUADDR
  ldx #$30
  stx PPUDATA
  lda #$17
  sta PPUDATA
  lda #$26
  sta PPUDATA
  stx PPUDATA
  ; Write Ike
  ldx #$d0
  lda #>$2079
  sta PPUADDR
  lda #<$2079
  sta PPUADDR
  stx PPUDATA
  inx
  stx PPUDATA
  inx
  lda #>$2099
  sta PPUADDR
  lda #<$2099
  sta PPUADDR
  stx PPUDATA
  inx
  stx PPUDATA
  inx
  lda #>$20b9
  sta PPUADDR
  lda #<$20b9
  sta PPUADDR
  stx PPUDATA
  inx
  stx PPUDATA
  ; Attribute table
  lda #>($23c0+6)
  sta PPUADDR
  lda #<($23c0+6)
  sta PPUADDR
  ldx #%10101010
  stx PPUDATA
  lda #>($23c0+6+8)
  sta PPUADDR
  lda #<($23c0+6+8)
  sta PPUADDR
  stx PPUDATA

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
  jsr PrintCurrentMoney

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
: lda InventorySavedType,x
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
: lda InventorySavedType,x
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

  jsr OptionsScreenCommonLoop ; Update palette and read controller

  lda keynew
  and #KEY_START
  jne GotoPreLevel

  lda keynew
  and #KEY_A
  beq NoA
  ldy Cursor
  jeq GotoPreLevel
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

GotoPreLevel:
  lda #VWF_BANK
  jsr SetPRG
  jmp ShowPreLevel

UpdateInventoryAmounts:
  jsr WaitVblank
  PositionXY 0, 6, 26
  ldx #0
: ldy InventorySavedAmount,x
  beq InventoryZero
  cpy #9
  bcc InventoryUnderTen
; ones and tens
  iny
  lda BCD99,y
  jsr PutHex
UpdateInventoryAmountsBack:
  inx
  cpx #10
  bne :-

  lda #0
  sta PPUSCROLL 
  sta PPUSCROLL 
  rts

InventoryZero:
  lda #10
  sta PPUDATA
  sta PPUDATA
  jmp UpdateInventoryAmountsBack
InventoryUnderTen:
  lda #10
  sta PPUDATA
  tya
  add #'1'
  sta PPUDATA
  jmp UpdateInventoryAmountsBack

.if 0
  jsr ClearOAM
  ldx #0
  ldy #32
  sty OamPtr
@Loop:
  ; Draw the inventory item amounts
  ldy InventorySavedAmount,x
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
.endif

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
  jeq NoBuyItem
    jsr GetBuyItem
    stx 5
    lda ItemShopTable,x
    jeq NoBuyItem

    lda SavedCoins+0
    sta TempVal+0
    lda SavedCoins+1
    sta TempVal+1

    lda keydown
    and #KEY_SELECT
    bne SkipCost
    ; Calculate the new amount of funds, and find out if we even have enough
    lda SavedCoins
    sub ItemShopTable+2,x
    sec
    bpl :+
      add #100
      clc
    :
    sta 0
    ; Carry
    lda SavedCoins+1
    sbc ItemShopTable+3,x
    jmi NotEnoughFunds
    ; Write the new amount
    sta SavedCoins+1
    lda 0
    sta SavedCoins
SkipCost:

    lda ItemShopTable,x
    jsr InventoryGiveSavedItem
    stx 0 ; item slot number
    jcc TooManyItems
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
    jsr PrintCurrentMoney
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
    beq @WrapLeft
    dec Cursor
    inc NeedUpdateItemInfo
    bne :+
@WrapLeft:
    lda #9
    sta Cursor
  :

  lda keynew
  and #KEY_RIGHT
  beq :+
    lda Cursor
    cmp #9
    beq @WrapRight
    inc Cursor
    inc NeedUpdateItemInfo
    bne :+
@WrapRight:
    lda #0
    sta Cursor
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

NotEnoughFunds:
  jsr WaitVblank
  PositionXY 0, 7, 10
  jsr PutStringImmediate
  .byt "Come back when you're",0
  PositionXY 0, 7, 11
  jsr PutStringImmediate
  .byt "a little richer!",0

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  jmp BuyLoop

TooManyItems:
  ; restore the old money count
  lda TempVal+0
  sta SavedCoins+0
  lda TempVal+1
  sta SavedCoins+1

  jsr WaitVblank
  PositionXY 0, 7, 10
  jsr PutStringImmediate
  .byt "You can't carry that ",0
  PositionXY 0, 7, 11
  jsr PutStringImmediate
  .byt "many items!     ",0

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  jmp BuyLoop

; Makes the item index from Cursor and CursorY
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
  ldx #21
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
  ; Erase the insufficient funds message
  lda #' '
  ldx #12
  jsr WritePPURepeated
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
    beq @WrapLeft
    dec Cursor
    inc NeedUpdateItemInfo
    bne :+
@WrapLeft:
    lda #9
    sta Cursor
  :

  lda keynew
  and #KEY_RIGHT
  beq :+
    lda Cursor
    cmp #9
    beq @WrapRight
    inc Cursor
    inc NeedUpdateItemInfo
    bne :+
@WrapRight:
    lda #0
    sta Cursor
  :

  lda keynew
  and #KEY_A ; toss an item
  beq :+
    ldx Cursor
    lda #0
    sta InventorySavedType,x
    sta InventorySavedAmount,x
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
    lda InventorySavedType,x
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

PrintCurrentMoney:
  PositionXY 0, 18, 6
  ldy SavedCoins+1
  lda BCD99,y
  jsr PutHex
  ldy SavedCoins+0
  lda BCD99,y
  jmp PutHex
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
  .byt InventoryItem::SMALL_HEALTH_RESTORE, $B4, (5  .mod 100),   (5 / 100)
  .byt InventoryItem::HEALTH_RESTORE,       $B8, (20 .mod 100),  (20 / 100)
  .byt InventoryItem::BIG_HEALTH_RESTORE,   $BC, (55 .mod 100),  (55 / 100)
  .byt InventoryItem::BALLOON,              $C4, (50 .mod 100),  (50 / 100)
  .byt InventoryItem::AUTO_BALLOON,         $C8, (60 .mod 100),  (60 / 100)
  .byt InventoryItem::ABILITY_BLASTER,      $84, (40 .mod 100),  (40 / 100) ; cutoff where you need to beat world 1 first?
  .byt InventoryItem::ABILITY_GLIDER,       $88, (30 .mod 100),  (30 / 100)
  .byt InventoryItem::LAMP_OIL,             $B0, (20 .mod 100),  (20 / 100)
  .byt InventoryItem::ROPE,                 $B0, (40 .mod 100),  (40 / 100)
  .byt InventoryItem::ABILITY_BOMB,         $8C, (35 .mod 100),  (35 / 100)
  .byt InventoryItem::ABILITY_FIRE,         $90, (35 .mod 100),  (35 / 100)
  .byt InventoryItem::ABILITY_FIREWORK,     $94, (35 .mod 100),  (35 / 100)
  .byt InventoryItem::ABILITY_NICE,         $98, (35 .mod 100),  (35 / 100)
  .byt InventoryItem::ABILITY_BOOMERANG,    $9C, (35 .mod 100),  (35 / 100)
  .byt InventoryItem::ABILITY_WATER,        $A4, (35 .mod 100),  (35 / 100)
  .byt InventoryItem::ABILITY_FAN,          $A8, (30 .mod 100),  (30 / 100)
  .byt InventoryItem::ABILITY_BURGER,       $AC, (35 .mod 100),  (35 / 100)
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
: ldy InventorySavedType,x
  cpy TempVal+2
  bne :+
  ; Item found
  lda InventorySavedAmount,x ; check if 99
  cmp #98
  beq Fail ; can't get more than 99
  inc InventorySavedAmount,x ; amount
  sec
  rts
: ; Item not found, keep looking
  dex
  bpl :--

; If item isn't in the list, put it in the first blank slot
  ldx #0
: ldy InventorySavedType,x
  beq Empty
  inx
  cpx #InventoryLen
  bne :-
Fail:
  clc ; No free slots
  rts

Empty: ; Empty slot, put in item
  sta InventorySavedType,x
  lda #0
  sta InventorySavedAmount,x
  sec
  rts
.endproc

.proc PutHex
    stx TempX
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
    ldx TempX
	rts
hexdigits:	.byt "0123456789ABCDEF"
.endproc
