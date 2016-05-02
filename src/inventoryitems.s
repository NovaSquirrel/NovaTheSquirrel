.include "../tools/inventorylist.s"

NameHealth: .byt "Pizza"
NameEmpty: .byt 0
NameHealthSmall: .byt "Pizza slice"
NameLampOil: .byt "Lamp oil",0
NameRope: .byt "Rope",0
NameBlaster: .byt "Blaster Gun",0
NameGlider: .byt "Glider Gun",0
NameBomb: .byt "Bombs",0
NameFire: .byt "Fireballs",0
NameFirework: .byt "Fireworks",0
NameNice: .byt "Ice blocks",0
NameBoomerang: .byt "Boomerang",0
NameBall: .byt "Bouncy ball",0
NameWater: .byt "Water bottle",0
NameFan: .byt "Tornadoes",0
NameBurger: .byt "Dinner Blaster",0
NameFancyCola: .byt "Fa-a-ancy cola",0
NameRedKey: .byt "Red key",0
NameGreenKey: .byt "Green key",0
NameBlueKey: .byt "Blue key",0
NameFlippers: .byt "Flippers",0
NameFireBoots: .byt "Fire boots",0
NameIceSkates: .byt "Iceskates",0
NameSuctionBoots: .byt "Suction boots",0
NameBlock: .byt "Block",0
NameSpring: .byt "Spring",0
NameNuclearPowerPants: .byt "Nuclear Power Pants",0
NameAlwaysJumping: .byt "Always jumping",0
NameBalloon: .byt "Balloon",0

.proc RemoveOneItem
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

.proc DoHealthRestore
  ; Set health to 4 if it's not already 4
  lda #4
  cmp PlayerHealth
  beq :+
  sta PlayerHealth
  jmp RemoveOneItem
: rts
.endproc

.proc DoHealthRestoreSmall
  ; Only increase health if not 4
  lda PlayerHealth
  cmp #4
  beq :+
  inc PlayerHealth
  jmp RemoveOneItem
: rts
.endproc

.proc DoPlaceBlock
  jmp RemoveOneItem
.endproc

.proc DoPlaceSpring
  jmp RemoveOneItem
.endproc

.proc DoPlaceRope
  rts
.endproc

.proc DoSwitchAbility
  pha
  jsr RemoveOneItem
  pla
  sub #InventoryItem::ABILITY_BLASTER-1
  jmp ChangePlayerAbility
.endproc

.proc PauseScreen
Counter = 0
IconList = TempSpace ; can use this since the level will be redrawn anyway
  lda #VWF_BANK
  jsr _SetPRG

  jsr pently_init
  lda LevelSelectInventory
  bne :+
  inc pently_music_playing
:

DrawAgain:
  ; Clear icon list
  ldx #15
  lda #0
: sta IconList,x
  dex
  bpl :-

  ; No swap
  lda #128
  sta InventoryCursorYSwap

; Clear the screen and the background part of the CHR
  jsr WaitVblank
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

  ldy #0
: ldx InventoryType,y
  lda InventoryIIcon,x
  sta IconList+3,y
  sty TouchTemp

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
  add #5
  ldy #0
  jsr copyLineImg

  ldy TouchTemp
  iny
  cpy #InventoryLen
  bne :-

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

; Write an item name
  lda LevelSelectInventory
  bne :+
  ldy #<PausedString
  lda #>PausedString
  ldx #2
  jsr vwfPutsAtRow
:
  lda LevelSelectInventory
  beq :+
  ldy #<LevelSelectString
  lda #>LevelSelectString
  ldx #2
  jsr vwfPutsAtRow
:

  ldy #<InventoryString
  lda #>InventoryString
  ldx #4
  jsr vwfPutsAtRow

; copyLineImg uses vertical writing mode, so switch it back
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL


; Write item quantities as sprites
  jsr ClearOAM
  ldy #4*8
  ldx #0   ; slot 0
ItemQuantityLoop:
  lda InventoryAmount,x
  beq @Skip
  txa
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
  inx
  cpx #InventoryLen
  bne ItemQuantityLoop

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

  lda LevelSelectInventory
  bne :+
  lda keydown
  and #KEY_A
  jne DoInventoryCode
:

  lda keynew
  and #KEY_SELECT
  beq NotSelect
    lda InventoryCursorYSwap
    bmi @SetSwap
    ldx InventoryCursorYSwap
    ldy InventoryCursorY
    lda InventoryType,x
    pha
    lda InventoryType,y
    sta InventoryType,x
    pla
    sta InventoryType,y

    lda InventoryAmount,x
    pha
    lda InventoryAmount,y
    sta InventoryAmount,x
    pla
    sta InventoryAmount,y
    jmp DrawAgain
@SetSwap:
    lda InventoryCursorY
    sta InventoryCursorYSwap
  NotSelect:

  lda keynew
  and #KEY_UP
  beq :+
    dec InventoryCursorY
    bpl :+
    lda #InventoryLen-1
    sta InventoryCursorY
  :

  lda keynew
  and #KEY_DOWN
  beq :+
    inc InventoryCursorY
    lda InventoryCursorY
    cmp #InventoryLen
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

; Wait for unpress
: jsr ReadJoy
  lda keydown
  and #KEY_START
  bne :-

  jmp :+
DoInventoryCode:
  jsr CallInventoryCode
:

  lda LevelSelectInventory
  jne ShowLevelSelect

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
  ldx InventoryCursorY
  ldy InventoryType,x
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

InventoryPalette:
  .byt $30, $0f, $00, $2a
.endproc
PausedString:
  .byt "P A U S E D",0
LevelSelectString:
  .byt "Nova the Squirrel",0
InventoryString:
  .byt " - Inventory - ",0
