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
  jsr WaitVblank
  pla
  sub #InventoryItem::ABILITY_BLASTER-1
  jmp ChangePlayerAbilityScreenOff
.endproc

.proc PauseScreen
Counter = 0
IconList = TempSpace ; can use this since the level will be redrawn anyway
IconListOffset = IconList+3 ; 3 is where the actual item icons start
SwapList = ScratchPage ; to help with avoiding screen blanking when swapping two items
PauseScreenPage = ScratchPage + 20 ; 0 for inventory, 1 for more options
TossMode = ScratchPage + 21
LastMenuOption = ScratchPage + 22
ExtraOptionsCount = 3 ; constant

  lda #VWF_BANK
  jsr _SetPRG

  jsr pently_init
  lda LevelSelectInventory
  bne :+
  inc pently_music_playing
:

  lda #0
  sta PauseScreenPage
  sta TossMode
  lda #InventoryLen
  sta LastMenuOption

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

  lda PauseScreenPage
  bne NoDrawInventoryList
  ldy #0
: ldx InventoryType,y
  lda InventoryIIcon,x
  sta IconListOffset,y
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
  add #5 ; +5 rows in CHR RAM
  ldy #0
  jsr copyLineImg

  ldy TouchTemp
  iny
  cpy #InventoryLen
  bne :-
NoDrawInventoryList:

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

; Write "-PAUSED-" if paused, or another string if on the level select
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

; Put the "more options" choice
  lda PauseScreenPage
  bne :+
  ldy #<OtherOptionsString2
  lda #>OtherOptionsString2
  ldx #15
  jsr vwfPutsAtRow
  ldy #<InventoryString
  lda #>InventoryString
  ldx #4
  jsr vwfPutsAtRow
:

  lda TossMode
  bne WasTossMode
  lda PauseScreenPage
  beq :+
  ldy #<InventoryString2
  lda #>InventoryString2
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
  ; Start+Select = exit level
  lda keynew
  and #KEY_SELECT
  beq NotSelect2
GoBackToLevelSelect:
  lda LevelSelectInventory
  bne :+
  pla
  pla
  lda PuzzleMode
  beq :+
  lda PuzzleModeAbilityBackup
  sta PlayerAbility
:
  jmp ShowLevelSelect
NotSelect2:
  lda keydown
  and #KEY_START
  bne :--

; Start the menu control loop
Loop:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK
  lda #2
  sta OAM_DMA
  jsr ReadJoy

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

  lda LevelSelectInventory ; don't allow using items on the level select
  bne :+
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
  beq NotSelect
    lda InventoryCursorY ; \ if it's on the "other options" item, don't allow swapping with it
    cmp #InventoryLen    ; /
    beq NotSelect
    lda InventoryCursorYSwap
    bmi @SetSwap
    ldx InventoryCursorYSwap
    ldy InventoryCursorY
    swaparray InventoryType
    swaparray InventoryAmount
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
  rts

InventoryPalette:
  .byt $30, $0f, $00, $2a

InventoryString:
  .byt " - Inventory - ",0
InventoryString2:
  .byt "(Inventory)",0
OtherOptionsString:
  .byt " - Other options - ",0
OtherOptionsString2:
  .byt "(More options)",0
TossModeString:
  .byt " - Toss out items - ",0
TossModeString2:
  .byt " ",0

; More options list
MoreItemsListNameL:
.byt <ExitLevelString
.byt <TossItemsString
.byt <GameOptionsString
MoreItemsListNameH:
.byt >ExitLevelString
.byt >TossItemsString
.byt >GameOptionsString
MoreItemsListCodeL:
.byt <(ExitLevelCode-1)
.byt <(TossItemsCode-1)
.byt <(GameOptionsCode-1)
MoreItemsListCodeH:
.byt >(ExitLevelCode-1)
.byt >(TossItemsCode-1)
.byt >(GameOptionsCode-1)

ExitLevelString:
.byt "Exit level",0
TossItemsString:
.byt "Toss items",0
GameOptionsString:
.byt "Game options",0

ExitLevelCode:
  jmp PauseScreen::GoBackToLevelSelect
TossItemsCode:
  inc TossMode
  lsr PauseScreenPage
  dec LastMenuOption
  jmp DrawAgain
GameOptionsCode:
  inc OptionsViaInventory
  jsr ShowOptions
  dec OptionsViaInventory
  jmp CleanupAfterInventory
.endproc

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
  .byt KD, KD, KD, KD, KU, KU, KU, KU ; down*4, up*4
  .byt KU, KU, KU, KU, KU, KU, KU, KU ; up
  .byt KB, KB, KB, KB, KB, KB, KB, KB ; burger
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
Boomerang:
  lda #AbilityType::BOOMERANG
  jmp ChangePlayerAbilityScreenOff  
Fireball:
  lda #AbilityType::FIRE
  jmp ChangePlayerAbilityScreenOff
Water:
  lda #AbilityType::WATER
  jmp ChangePlayerAbilityScreenOff
Bomb:
  lda #AbilityType::BOMB
  jmp ChangePlayerAbilityScreenOff
Firework:
  lda #AbilityType::FIREWORK
  jmp ChangePlayerAbilityScreenOff
Ice:
  lda #AbilityType::NICE
  jmp ChangePlayerAbilityScreenOff
Burger:
  lda #AbilityType::BURGER
  jmp ChangePlayerAbilityScreenOff
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
  jmp ChangePlayerAbilityScreenOff
Balloon:
  lda #128
  sta PlayerHasBalloon
  rts
.endproc

PausedString:
  .byt "P A U S E D",0
LevelSelectString:
  .byt "Nova the Squirrel",0
