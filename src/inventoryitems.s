; Princess Engine
; Copyright (C) 2016-2018 NovaSquirrel
;
; This program is free software: you can redistribute it and/or
; modify it under the terms of the GNU General Public License as
; published by the Free Software Foundation; either version 2 of the
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

.include "../tools/inventorylist.s"

NameHealth: .byt "Pizza"
NameEmpty: .byt 0
NameHealthSmall: .byt "Pizza slice",0
NameHealthBig: .byt "Great Pizza",0
NameLampOil: .byt "Lamp oil",0
NameRope: .byt "Rope",0
NameBlaster: .byt "Blaster Gun",0
NameGlider: .byt "Glider Gun",0
NameBomb: .byt "Bombs",0
NameFire: .byt "Fireballs",0
NameFirework: .byt "Fireworks",0
NameNice: .byt "Ice blocks",0
NameBoomerang: .byt "Boomerang",0
NameMirror: .byt "Mirror",0
NameWater: .byt "Water bottle",0
NameFan: .byt "Tornadoes",0
NameBurger: .byt "Dinner Blaster",0
NameRedKey: .byt "Red key",0
NameGreenKey: .byt "Green key",0
NameBlueKey: .byt "Blue key",0
NameFlippers: .byt "Flippers",0
NameFireBoots: .byt "Fire boots",0
NameIceSkates: .byt "Iceskates",0
NameSuctionBoots: .byt "Suction boots",0
NameBlock: .byt "Block",0
NameSpring: .byt "Spring",0
NameBalloon: .byt "Balloon",0
NameAutoBalloon: .byt "Auto Balloon",0
NameArrowLeft: .byt "Arrow (left)",0
NameArrowDown: .byt "Arrow (down)",0
NameArrowUp: .byt "Arrow (up)",0
NameArrowRight: .byt "Arrow (right)",0
NameArrowLeftMetal: .byt "Arrow (left metal)",0
NameArrowDownMetal: .byt "Arrow (down metal)",0
NameArrowUpMetal: .byt "Arrow (up metal)",0
NameArrowRightMetal: .byt "Arrow (right metal)",0
NameWoodBox: .byt "Wood spring box",0
NameMetalBox: .byt "Metal box",0

NameMineTrack:     .byt "Mine rail",0
NameMineTrackJump: .byt "Mine rail (jump)",0
NameMineTrackBump: .byt "Mine rail (bump)",0

.pushseg
.code
.proc RemoveOneItem
  cpx #255       ; for triggering the item effect without using an actual item
  beq Unlimited

  lda InventoryAmount,x
  beq EmptyNow
  cmp #INVENTORY_UNLIMITED
  beq Unlimited
  ; Not unlimited and not empty - just decrement the amount
  dec InventoryAmount,x
Unlimited: ; Was unlimited, so just skip
  rts
EmptyNow: ; Is empty now, so remove the item
  lda #0
  sta InventoryType,x
  rts
.endproc
.popseg

.proc DoLampOil
  ldy #63
: lda LampFlameGfx,y
  sta UploadTileSpace,y
  dey
  bpl :-

  ; Upload to the same tiles used for thin text
  lda #$17
  sta UploadTileAddress+1
  lda #$c0
  sta UploadTileAddress+0

  ; Left
  jsr MakeFlame
  bcc _rts
  lda #>(-$20)
  sta ObjectVXH,y
  lda #<(-$20)
  sta ObjectVXL,y

  ; Right
  jsr MakeFlame
  bcc _rts
  lda #>($20)
  sta ObjectVXH,y
  lda #<($20)
  sta ObjectVXL,y

  jmp RemoveOneItem
NoRemoveItem:
  rts

MakeFlame:
  jsr FindFreeObjectY
  bcc _rts
  jsr ObjectClearY
  lda #Enemy::PLAYER_PROJECTILE*2
  sta ObjectF1,y
  lda #PlayerProjectileType::LAMP_FLAME
  sta ObjectF2,y
  lda PlayerPXL
  sub #$80
  sta ObjectPXL,y
  lda PlayerPXH
  sbc #0
  sta ObjectPXH,y

  lda PlayerPYL
  add #$80
  sta ObjectPYL,y
  lda PlayerPYH
  adc #0
  sta ObjectPYH,y
  lda #20
  sta ObjectTimer,y
  lda #3          ; initialize the sine counter
  sta ObjectF4,y
  sec
_rts:
  rts
.endproc
LampFlameGfx:  .incbin "../chr/lampflame.chr"

.proc DoBalloon
  lda #1
  sta PlayerHasBalloon
  jmp RemoveOneItem
.endproc

.proc DoHealthRestore
  ; Set health to 4 if it's not already 4
  lda #4
AfterAmount:
  sta 0
  lda PlayerHealth
  cmp 0
  bcs :+
  lda 0
  sta PlayerHealth
  jmp RemoveOneItem
: rts
.endproc

.proc DoHealthRestoreBig
  lda #8
  jmp DoHealthRestore::AfterAmount
.endproc

.proc DoHealthRestoreSmall
  ; Only increase health if not 4
  lda PlayerHealth
  cmp #4
  bcs :+
  inc PlayerHealth
  jmp RemoveOneItem
: rts
.endproc

.proc DoPlaceableItem
  tya
  sub #InventoryItem::BLOCK
  ora #128
  sta PlaceBlockInLevel

  lda PlayerPXL
  add #$80
  lda PlayerPXH
  adc #0
  sub ScrollX+1
  sta PlaceBlockX
  lda PlayerPYH
  sta PlaceBlockY

  stx PlaceBlockItemIndex
  rts
.endproc

.proc DoPlaceRope
  lda PlayerPXL
  add #$8
  lda PlayerPXH
  adc #0
  jsr GetLevelColumnPtr

  lda #0
  sta 0

  ldy PlayerPYH
  ; Don't place it down if the player's head is in a block
  lda (LevelBlockPtr),y
  cmp BackgroundMetatile
  beq :+
  rts
:

  ; Extend to the ground
: lda (LevelBlockPtr),y
  cmp BackgroundMetatile
  bne :+
  iny
  bne :-
: dey

  ; Place ladder
: lda (LevelBlockPtr),y
  cmp BackgroundMetatile
  bne :+
  lda #Metatiles::ROPE
  sta (LevelBlockPtr),y
  inc 0
  dey
  bne :-
:

  iny
  lda (LevelBlockPtr),y
  cmp #Metatiles::ROPE
  bne :+
  lda BackgroundMetatile
  sta (LevelBlockPtr),y
:

  lda 0 ; only use up rope if it was actually placed
  jne RemoveOneItem
  rts
.endproc

.proc DoSwitchAbility
  pha
  jsr RemoveOneItem
  jsr WaitVblank
  pla
  sub #InventoryItem::ABILITY_BLASTER-1
  jmp ChangePlayerAbility
.endproc

.proc PauseScreen
Counter = 0
IconList = TempSpace ; can use this since the level will be redrawn anyway
IconListOffset = IconList+3 ; 3 is where the actual item icons start
SwapList = ScratchPage ; to help with avoiding screen blanking when swapping two items
PauseScreenPage = ScratchPage + 20 ; 0 for inventory, 1 for more options
TossMode = ScratchPage + 21
LastMenuOption = ScratchPage + 22
PerLevelPageHasItems = ScratchPage + 23
ExtraOptionsCount = 4 ; constant
AutoRepeatCount = 5

  lda #VWF_BANK
  jsr _SetPRG

  jsr StopSoundFar

  lda #0
  sta PauseScreenPage
  sta TossMode
  sta AutoRepeatCount
  sta PerLevelPageHasItems
  lda #InventoryLen
  sta LastMenuOption

  ; Check if there is a second inventory page at all
  ldx #InventoryLen-1
: lda InventoryPerLevelType,x
  bne HasPerLevelInventory
  dex
  bpl :-
HasNoPerLevelInventory:
  lda #0
  sta InventoryPage
  beq :+ ; skip
HasPerLevelInventory:
  inc PerLevelPageHasItems
:

DrawAgain:
  ; Clear icon list
  ldx #15
  lda #0
: sta IconList,x
  dex
  bpl :-

  ; Init swap list
  ldx #0
  lda #$50
: sta SwapList,x
  add #$10
  inx
  cpx #InventoryLen
  bne :-

  ; No swap
  lda #128
  sta InventoryCursorYSwap

; Clear the screen and the background part of the CHR
  jsr WaitVblank
; Change palette
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  tax
: lda InventoryPalette,x
  sta PPUDATA
  inx
  cpx #4
  bne :- 

  lda #0
  sta PPUMASK
  jsr ClearBG4kb

  ; Clear attributes
  lda #$23
  sta PPUADDR
  lda #$c0
  sta PPUADDR
  lda #0
  ldx #64
  jsr WritePPURepeated

  lda #GraphicsUpload::INVENTORY_CHR
  jsr DoGraphicUpload

  lda PauseScreenPage
  bne NoDrawInventoryList
  ldy #0
  sty TouchTemp
: ; Write the names of all inventory items
  lda TouchTemp
  add InventoryPage
  tay
  ldx InventoryType,y
  ldy TouchTemp
  lda InventoryIIcon,x
  sta IconListOffset,y

  ; Write item name
  lda InventoryINameH,x
  pha
  lda InventoryINameL,x
  pha
  jsr clearLineImg
  ldx #0
  pla
  tay
  pla
  jsr vwfPuts
  lda TouchTemp
  add #5 ; +5 rows in CHR RAM
  ldy #0
  jsr copyLineImg

  inc TouchTemp
  ldy TouchTemp
  cpy #InventoryLen
  bne :-
NoDrawInventoryList:

; Write the list of "more options" if on that page
  lda PauseScreenPage
  beq NoDrawExtraOptionsList
  ldy #0
: sty TouchTemp
  lda MoreItemsListNameH,y
  pha
  lda MoreItemsListNameL,y
  pha
  jsr clearLineImg
  ldx #0 ; draw at X = 0
  pla ; \
  tay ; | string pointer
  pla ; /
  jsr vwfPuts
  lda TouchTemp
  add #5 ; +5 rows in CHR RAM
  ldy #0
  jsr copyLineImg ; in:  AAYY = destination address in VRAM
  ; Reload the counter
  ldy TouchTemp
  iny
  cpy #ExtraOptionsCount
  bne :-
NoDrawExtraOptionsList:

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
DoNametable:
  ; Make random background
  lda #$20
  sta PPUADDR
  lda #$00
  sta PPUADDR
  ldx #0
  jsr MakeBG_Alt
  lda #$22
  sta PPUADDR
  lda #$c0
  sta PPUADDR
  ldx #0
  jsr MakeBG_Alt
; Make a nametable that lets us make whatever
  lda #0
  sta 0
  PositionXY 0, 0, 7
  jsr MakeBG
  lda #0
  ldx #16
  jsr WritePPURepeated
  jsr MakeBG
: jsr MakeBG
  ldx 0
  lda IconList,x
  sta PPUDATA
  lda #0
  sta PPUDATA
  lda 0
  add #2
  asl
  asl
  asl
  asl
  tay
  ldx #14
  jsr WriteIncreasing
  jsr MakeBG
  inc 0
  lda 0
  cmp #14
  bne :-

; Write "-PAUSED-"
  ldy #<PausedString
  lda #>PausedString
  ldx #2
  jsr vwfPutsAtRow

; Offer to swap inventory pages
  lda PerLevelPageHasItems
  beq :+
  ldy #<SwapPagesString
  lda #>SwapPagesString
  ldx #3
  jsr vwfPutsAtRow
:

; Put the "more options" choice
  lda PauseScreenPage
  bne :+
  ldy #<OtherOptionsStringMenuItem
  lda #>OtherOptionsStringMenuItem
  ldx #15
  jsr vwfPutsAtRow
; Display the -Inventory- at the top, but write -Level stock- if displaying page 2
  lda InventoryPage
  bne DisplayPage2AtTop
  ; Inventory page 1
  ldy #<InventoryString
  lda #>InventoryString
  ldx #4
  jsr vwfPutsAtRow
  jmp :+
DisplayPage2AtTop:
  ; Inventory Page 2
  ldy #<InventoryStringPage2
  lda #>InventoryStringPage2
  ldx #4
  jsr vwfPutsAtRow
:

  lda TossMode
  bne WasTossMode
  lda PauseScreenPage
  beq :+
  ldy #<InventoryStringMenuItem
  lda #>InventoryStringMenuItem
  ldx #15
  jsr vwfPutsAtRow
  ldy #<OtherOptionsString
  lda #>OtherOptionsString
  ldx #4
  jsr vwfPutsAtRow
:
WasTossMode:

  lda TossMode
  beq :+
  ldy #<TossModeString2
  lda #>TossModeString2
  ldx #15
  jsr vwfPutsAtRow
  ldy #<TossModeString
  lda #>TossModeString
  ldx #4
  jsr vwfPutsAtRow
:

; copyLineImg uses vertical writing mode, so switch it back
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL

  jsr UpdateItemQuantity

; Turn rendering back on
  jsr WaitVblank
  lda #2
  sta OAM_DMA
  lda #OBJ_ON|BG_ON
  sta PPUMASK
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
; Wait for Start unpress
: jsr ReadJoy
  ; Start+Select = exit level (disabled)
;  lda keynew
;  and #KEY_SELECT
;  beq NotSelect2
  jmp NotSelect2
GoBackToLevelSelect:
  pla
  pla
  jmp ShowLevelSelect
NotSelect2:
  lda keydown
  and #KEY_START
  bne :-

; Start the menu control loop
Loop:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK
  lda #2
  sta OAM_DMA
  jsr ReadJoy

  ; Auto repeat
  lda keydown
  and #KEY_UP|KEY_DOWN
  cmp keylast
  bne KeysNotSame
  ; Are we at the delay yet?
  lda AutoRepeatCount
  cmp #16
  beq DoAutoRepeat
  ; Count up to the delay needed
  inc AutoRepeatCount  
  bpl KeysAreSame ; unconditional
DoAutoRepeat:
  ; Only every other frame
  lda retraces
  lsr
  bcc KeysAreSame

  ; Apply auto repeat
  lda keydown
  sta keynew
  bne KeysAreSame
KeysNotSame:
  ; Reset the counter
  lda #0
  sta AutoRepeatCount
KeysAreSame:

  ; Allow switching pages
  lda InventoryCursorY
  cmp #InventoryLen
  bne :+
  lda keynew
  and #KEY_A
  beq :+  
    lda PauseScreenPage
    eor #1
    sta PauseScreenPage
    jmp DrawAgain
:

  ; Allow switching between inventory page and per-level page
  lda keynew
  and #KEY_B
  beq :+
  lda PauseScreenPage
  bne :+
  lda PerLevelPageHasItems
  beq :+
    ; No swap
    lda #128
    sta InventoryCursorYSwap

    lda InventoryPage
    eor #InventoryLen
    sta InventoryPage
    jmp DrawAgain
:

  lda PauseScreenPage
  bne :+
  lda TossMode
  bne TossOutItem
  lda keynew
  and #KEY_A
  beq :+
  jmp DoInventoryCode
TossOutItem:
  lda keynew
  and #KEY_A
  beq :+
  ldx InventoryCursorY
  lda #0
  sta InventoryType,x
  sta InventoryAmount,x
  jmp DrawAgain
:

  ; Use extra menu options
  lda PauseScreenPage
  beq :+
  lda keynew
  and #KEY_A
  beq :+
  ldy InventoryCursorY
  cpy #ExtraOptionsCount
  bcs :+
  lda MoreItemsListCodeH,y
  pha
  lda MoreItemsListCodeL,y
  pha

  lda #0
  sta InventoryCursorY
  rts
:

  lda keynew
  and #KEY_SELECT
  jeq NotSelect
    lda PauseScreenPage  ; Don't allow swapping when on page 2
    bne NotSelect
    lda InventoryCursorY ; \ if it's on the "other options" item, don't allow swapping with it
    cmp #InventoryLen    ; /
    beq NotSelect
    lda InventoryCursorYSwap
    bmi @SetSwap
    lda InventoryCursorYSwap
    add InventoryPage
    tax
    lda InventoryCursorY
    add InventoryPage
    tay
    swaparray InventoryType
    swaparray InventoryAmount
    ldx InventoryCursorYSwap
    ldy InventoryCursorY
    swaparray IconListOffset
    swaparray SwapList

    jsr WaitVblank
    jsr UpdateOneLine
    tya
    tax
    jsr UpdateOneLine
    jsr UpdateItemQuantity
    lda #128 ; no swap
    sta InventoryCursorYSwap
    lda #0
    sta PPUSCROLL
    sta PPUSCROLL
    jmp Loop
@SetSwap:
    lda InventoryCursorY
    sta InventoryCursorYSwap
  NotSelect:

  lda keynew
  and #KEY_UP
  beq :+
    dec InventoryCursorY
    bpl :+
    lda LastMenuOption
    sta InventoryCursorY
  :

  lda keynew
  and #KEY_DOWN
  beq :+
    ldy InventoryCursorY
    inc InventoryCursorY
    cpy LastMenuOption
    bne :+
    lda #0
    sta InventoryCursorY
  :

  lda PlayerAbility
  beq NoAbilityIcon
  ; Draw current ability icon
  ldy #$4c
  sty OAM_TILE+(4*2)
  iny
  sty OAM_TILE+(4*3)
  iny
  sty OAM_TILE+(4*4)
  iny
  sty OAM_TILE+(4*5)
  lda #21*8
  sta OAM_XPOS+(4*2)
  sta OAM_XPOS+(4*3)
  lda #22*8
  sta OAM_XPOS+(4*4)
  sta OAM_XPOS+(4*5)
  lda #8*8
  sta OAM_YPOS+(4*2)
  sta OAM_YPOS+(4*4)
  lda #9*8
  sta OAM_YPOS+(4*3)
  sta OAM_YPOS+(4*5)
NoAbilityIcon:

  ; Draw cursor
  lda #7*8
  sta OAM_XPOS
  sta OAM_XPOS+4
  lda InventoryCursorY
  asl
  asl
  asl
  add #8*11-1
  sta OAM_YPOS
  lda #$51
  sta OAM_TILE
  sta OAM_TILE+4
  ldx #0
  stx OAM_ATTR+0
  stx OAM_ATTR+(4*2)
  stx OAM_ATTR+(4*3)
  stx OAM_ATTR+(4*4)
  stx OAM_ATTR+(4*5)
  inx
  stx OAM_ATTR+4

  ; draw swap cursor
  lda #<-16
  sta OAM_YPOS+4
  lda InventoryCursorYSwap
  bmi :+
    and #15
    asl
    asl
    asl
    add #8*11-1
    sta OAM_YPOS+4
    lda #1
    sta OAM_ATTR+4
  :

  lda keydown
  and #KEY_START
  jeq Loop

; Wait for unpress (and keep track of key presses, for codes)
  ; Reset code space first
  lda #0
  ldy #8
: sta TempSpace,y
  dey
  bpl :-

  tay ; A is still zero
@WaitUnpress:
  jsr ReadJoy
  ; If more keys are pressed, add them to the list
  lda keynew
  beq :+
  cpy #8
  beq :+
  sta TempSpace,y
  iny
: lda keydown
  and #KEY_START
  bne @WaitUnpress

  ; Look for matches with the codes
  .scope
  ; Lazy, shorten this *maybe*
  ldx #0
TryCode:
  lda CheatCodeKeys+0,x
  beq Done
  cmp TempSpace+0
  bne Nope
  lda CheatCodeKeys+1,x
  cmp TempSpace+1
  bne Nope
  lda CheatCodeKeys+2,x
  cmp TempSpace+2
  bne Nope
  lda CheatCodeKeys+3,x
  cmp TempSpace+3
  bne Nope
  lda CheatCodeKeys+4,x
  cmp TempSpace+4
  bne Nope
  lda CheatCodeKeys+5,x
  cmp TempSpace+5
  bne Nope
  lda CheatCodeKeys+6,x
  cmp TempSpace+6
  bne Nope
  lda CheatCodeKeys+7,x
  cmp TempSpace+7
  bne Nope
  jsr CheatCodeRoutines

  jsr WaitVblank
  lda #0
  sta PPUMASK

  ldy #<CheaterString
  lda #>CheaterString
  ldx #2
  jsr vwfPutsAtRow

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  jsr WaitVblank
  lda #BG_ON
  sta PPUMASK

  ldx #60
: jsr WaitVblank
  dex
  bne :-

  jmp Done
Nope:
  txa
  add #8
  tax
  jmp TryCode
Done:
  .endscope

; Skip over this
  jmp :+
DoInventoryCode:
  jsr CallInventoryCode
:

CleanupAfterInventory:
  ; Restore old background tiles and palette
  jsr WaitVblank
  lda #0
  sta PPUMASK
  bit PPUSTATUS
  jsr DoLevelUploadList
  jsr ClearOAM
  lda #2
  sta OAM_DMA
  inc NeedLevelRerender
  jmp UpdateScrollRegister

CallInventoryCode:
  jsr WaitVblank
  lda #0
  sta PPUMASK
  lda InventoryCursorY
  add InventoryPage
  tax
  ldy InventoryType,x
CallInventoryCode2:
  lda InventoryICodeH,y
  pha
  lda InventoryICodeL,y
  pha
  tya
  ; Y = inventory type
  ; X = inventory slot
  rts
MakeBG:
  ldx #8
MakeBG_Alt:
: jsr huge_rand
  and #$03
  ora #$18
  sta PPUDATA
  dex
  bne :-
  rts

; Updates line X in the items list
UpdateOneLine:
  lda UpdateOneLineAddrH,x
  sta PPUADDR
  lda UpdateOneLineAddrL,x
  sta PPUADDR
  lda IconListOffset,x
  sta PPUDATA
  lda #0
  sta PPUDATA

  ; Counter
  lda #$e
  sta Counter

  ; Write the tiles
  lda SwapList,x
  clc
: sta PPUDATA
  adc #1
  dec Counter
  bne :-

  rts
UpdateOneLineAddrL:
.repeat 10, I
  .byt <(($2168)+(I*32))
.endrep
UpdateOneLineAddrH:
.repeat 10, I
  .byt >(($2168)+(I*32))
.endrep

UpdateItemQuantity:
  jsr ClearOAM
  lda PauseScreenPage
  beq :+
  rts
:
; Write item quantities as sprites
  ldy #4*8
  ldx #0   ; slot 0
  stx TouchTemp
ItemQuantityLoop:
  lda TouchTemp
  add InventoryPage
  tax
  lda InventoryAmount,x

  beq @Skip
  ; Calculate Y position from index
  lda TouchTemp
  asl
  asl
  asl
  add #11*8-1
  sta OAM_YPOS+0,y
  sta OAM_YPOS+4,y
  lda #22*8
  sta OAM_XPOS+0,y
  lda #23*8
  sta OAM_XPOS+4,y
  lda #OAM_COLOR_0
  sta OAM_ATTR+0,y
  sta OAM_ATTR+4,y
  lda InventoryAmount,x
  cmp #INVENTORY_UNLIMITED
  bne :+
  lda #$51
  sta OAM_TILE+0,y
  sta OAM_TILE+4,y
  bne @Increase
:
  ; Write digits
  sty 0
  ldy InventoryAmount,x
  iny
  lda BCD99,y
  unpack 1, 2
  ldy 0
  lda 2
  ora #$40
  sta OAM_TILE+0,y
  lda 1
  ora #$40
  sta OAM_TILE+4,y

@Increase:
  tya
  add #8
  tay
@Skip:
  inc TouchTemp
  ldx TouchTemp
  cpx #InventoryLen
  bne ItemQuantityLoop
  rts

InventoryPalette:
  .byt $30, $0f, $00, $2a

InventoryString:
  .byt " - Inventory - ",0
InventoryStringPage2:
  .byt " - Level stock - ",0
InventoryStringMenuItem: ; "go back to the inventory"
  .byt "(Inventory)",0
OtherOptionsString:
  .byt " - Other options - ",0
OtherOptionsStringMenuItem: ; "go display more items"
  .byt "(More options)",0
SwapPagesString:
  .byt "B: swap pages",0

TossModeString:
  .byt " - Toss out items - ",0
TossModeString2:
  .byt " ",0

; More options list
MoreItemsListNameL:
.byt <ResetCheckpointString
.byt <TossItemsString
.byt <GameOptionsString
.byt <ExitLevelString
MoreItemsListNameH:
.byt >ResetCheckpointString
.byt >TossItemsString
.byt >GameOptionsString
.byt >ExitLevelString
MoreItemsListCodeL:
.byt <(ResetCheckpointCode-1)
.byt <(TossItemsCode-1)
.byt <(GameOptionsCode-1)
.byt <(ExitLevelCode-1)
MoreItemsListCodeH:
.byt >(ResetCheckpointCode-1)
.byt >(TossItemsCode-1)
.byt >(GameOptionsCode-1)
.byt >(ExitLevelCode-1)

ExitLevelString:
.byt "Exit level",0
TossItemsString:
.byt "Toss items",0
GameOptionsString:
.byt "Game options",0
ResetCheckpointString:
.byt "Reset to checkpoint",0

ExitLevelCode:
  lda #0
  sta PlayerAbility
  jmp PauseScreen::GoBackToLevelSelect
TossItemsCode:
  inc TossMode
  lda #0
  sta InventoryPage
  lsr PauseScreenPage
  dec LastMenuOption
  jmp DrawAgain
GameOptionsCode:
  inc OptionsViaInventory
  jsr ShowOptions
  dec OptionsViaInventory
  jmp CleanupAfterInventory
ResetCheckpointCode:
  lda #0
  sta PlayerHealth
  jmp CleanupAfterInventory
.endproc

CallInventoryCodeDirect = PauseScreen::CallInventoryCode2

.proc CheatCodeKeys
KL = KEY_LEFT
KR = KEY_RIGHT
KU = KEY_UP
KD = KEY_DOWN
KA = KEY_A
KB = KEY_B
  .byt KU, KU, KD, KD, KL, KR, KL, KR ; Konami code
  .byt KA, KB, KL, KR, KL, KR, KD, KD ; reverse Konami code
  .byt KL, KL, KL, KL, KL, KL, KL, KL ; left
  .byt KU, KR, KD, KL, KU, KR, KD, KL ; circles
  .byt KL, KR, KL, KR, KL, KR, KL, KR ; left/right
  .byt KU, KD, KU, KD, KU, KD, KU, KD ; up/down
  .byt KB, KA, KL, KL, KB, KA, KL, KL ; BALL
  .byt KL, KD, KU, KR, KL, KD, KU, KR ; ddr pattern
  .byt KD, KD, KD, KD, KU, KU, KU, KU ; down*4, up*4 (ice)
  .byt KU, KU, KU, KU, KU, KU, KU, KU ; up (balloon)
  .byt KB, KB, KB, KB, KB, KB, KB, KB ; burger
  .byt KD, KA, KD, KU, KU, KU, KU, KU ; rich
  .byt KR, KR, KD, KD, KR, KR, KD, KD ; infinite projectiles
  .byt 0
.endproc

.proc CheatCodeRoutines
  txa
  lsr
  lsr
  tax
  lda Routines+1,x
  pha
  lda Routines+0,x
  pha
  rts

Routines:
  .raddr Health ; Konami Code
  .raddr Health ; reverse Konami code
  .raddr Fireball ; left
  .raddr Boomerang ; circles
  .raddr NextAbility ; left/right
  .raddr Water ; up/down
  .raddr Firework ; BALL
  .raddr Bomb ; ddr pattern
  .raddr Ice ; down, up
  .raddr Balloon ; up
  .raddr Burger ; b repeatedly
  .raddr Rich
  .raddr InfiniteProjectiles
Rich:
  lda #99
  sta Coins+0
  sta Coins+1
  rts
Boomerang:
  lda #AbilityType::BOOMERANG
  jmp ChangePlayerAbility  
Fireball:
  lda #AbilityType::FIRE
  jmp ChangePlayerAbility
Water:
  lda #AbilityType::WATER
  jmp ChangePlayerAbility
Bomb:
  lda #AbilityType::BOMB
  jmp ChangePlayerAbility
Firework:
  lda #AbilityType::FIREWORK
  jmp ChangePlayerAbility
Ice:
  lda #AbilityType::NICE
  jmp ChangePlayerAbility
Burger:
  lda #AbilityType::BURGER
  jmp ChangePlayerAbility
Health:
  lda #4
  sta PlayerHealth
  rts
NextAbility:
  ldx PlayerAbility
  inx
  cpx #AbilityType::LAST
  bne :+
  ldx #0
: stx PlayerAbility
  txa
  jmp ChangePlayerAbility
Balloon:
  lda #128
  sta PlayerHasBalloon
  rts
InfiniteProjectiles:
  inc InfiniteProjectileCheat
  rts
.endproc

PausedString:
  .byt "P A U S E D",0
CheaterString:
  .byt "Cheater!!",0
