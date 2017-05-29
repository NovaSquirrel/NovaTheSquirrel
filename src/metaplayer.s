; Princess Engine
; Copyright (C) 2014-2016 NovaSquirrel
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

OpenPrize: ; insert effects here
  lda #Metatiles::USED_PRIZE
  jsr ChangeBlock

  stx TempX
  jsr GetBlockX
  tax

  lda #Metatiles::INVENTORY_ITEM
  sta TempVal

  lda ColumnBytes,x
  beq JustACoin

  ; If it's an ability backup block, it contains 
  cmp #128
  bcc :+
    pha
    lda #Metatiles::INVENTORY_ITEM_AUTO
    sta TempVal
    pla
    and #127 ; take off the top bit
    sta ColumnBytes,x ; change the column byte
  :
  cmp #InventoryItem::ABILITY_BACKUP
  bne :+
    lda PlayerAbility
    beq JustACoin ; if no ability, then it's just a coin
    add #InventoryItem::ABILITY_BLASTER-1
    sta ColumnBytes,x
  :

  ; Open a prize
  ldx TempX
  pha ; item number
  dey
  lda TempVal
  jsr ChangeBlock
  iny
  pla ; item number
  jmp MakeFloatingTextAtBlock

JustACoin:
  ldx TempX
  lda #PoofSubtype::POOF
  jsr MakePoofAtBlock

  lda #SFX::COIN
  jsr PlaySoundDebounce
  jmp AddCoin

BricksLo:
  .byt <(BrokeBricks-1)
  .byt <(BrokeBricksPrize-1)
  .byt <(BrokeBricksReplace-1)
  .byt <(BrokeBricksReplace-1)
  .byt <(BrokeBricksReplace-1)

BricksHi:
  .byt >(BrokeBricks-1)
  .byt >(BrokeBricksPrize-1)
  .byt >(BrokeBricksReplace-1)
  .byt >(BrokeBricksReplace-1)
  .byt >(BrokeBricksReplace-1)

.proc BrokeBricksReplace
  sub #2 ; base index for the replace bricks
  sta 1  ; save it

  jsr GetBlockX
  sub 1  ; go back the specified number of columns
  sty 0  ; save Y

  ; now get the data we need to replace the block with
  tay
  lda ColumnBytes,y
  ldy 0 ; restore Y
  ; change it
  jsr ChangeBlock

  lda #SFX::SMASH
  jmp PlaySoundDebounce
.endproc

.proc BrokeBricksPrize ; maybe just direct it to OpenPrize?
  jmp OpenPrize
.endproc

; inputs: A (Poof subtype)
.proc MakePoofAtBlock
  pha
  sty TempVal+1
  jsr FindFreeObjectY
  bcc NoSlotFree
  lda #Enemy::POOF*2
  sta ObjectF1,y
  pla
  sta ObjectF2,y
  jsr GetBlockX
  sta ObjectPXH,y
  lda TempVal+1
  sta ObjectPYH,y
  lda #0
  sta ObjectPXL,y
  sta ObjectPYL,y
  sta ObjectTimer,y
  rts
NoSlotFree:
  pla
  rts
.endproc

.proc BrokeBricks
  lda BackgroundMetatile
  jsr ChangeBlock

  lda #PoofSubtype::BRICKS
  jsr MakePoofAtBlock

  lda #SFX::SMASH
  jmp PlaySoundDebounce
.endproc
CollectibleLo:
  .byt <(TouchedCoin-1)
  .byt <(TouchedBigHeart-1)
  .byt <(TouchedHeart-1)
  .byt <(TouchedKey-1)
  .byt <(TouchedKey-1)
  .byt <(TouchedKey-1)
  .byt <(TouchedBoots-1)
  .byt <(TouchedBoots-1)
  .byt <(TouchedBoots-1)
  .byt <(TouchedBoots-1)
  .byt <(TouchedWoodArrow-1)
  .byt <(TouchedWoodArrow-1)
  .byt <(TouchedWoodArrow-1)
  .byt <(TouchedWoodArrow-1)
  .byt <(TouchedWoodBomb-1)
  .byt <(TouchedWoodCrate-1)
  .byt <(TouchedInventoryItem-1)
  .byt <(TouchedInventoryItemAuto-1)
  .byt <(TouchedChip-1)
CollectibleHi:
  .byt >(TouchedCoin-1)
  .byt >(TouchedBigHeart-1)
  .byt >(TouchedHeart-1)
  .byt >(TouchedKey-1)
  .byt >(TouchedKey-1)
  .byt >(TouchedKey-1)
  .byt >(TouchedBoots-1)
  .byt >(TouchedBoots-1)
  .byt >(TouchedBoots-1)
  .byt >(TouchedBoots-1)
  .byt >(TouchedWoodArrow-1)
  .byt >(TouchedWoodArrow-1)
  .byt >(TouchedWoodArrow-1)
  .byt >(TouchedWoodArrow-1)
  .byt >(TouchedWoodBomb-1)
  .byt >(TouchedWoodCrate-1)
  .byt >(TouchedInventoryItem-1)
  .byt >(TouchedInventoryItemAuto-1)
  .byt >(TouchedChip-1)

SpecialMiscLo:
  .byt <(TouchedLadder-1)
  .byt <(TouchedLadder-1)
  .byt <(TouchedLadder-1)
  .byt <(TouchedSpring-1)
  .byt <(TouchedSignpost-1)
  .byt <(TouchedDoorBottom-1)
  .byt <(TouchedSpringDown-1)
  .byt <(TouchedToggleSwitch-1)
  .byt <(TouchedTeleporter-1)
  .byt <(TouchedCloneSwitch-1)
  .byt <(TouchedGenericSwitch-1)
  .byt <(TouchedCherryBomb-1)
  .byt <(TouchedCampfire-1)
  .byt <(TouchedForceL-1)
  .byt <(TouchedForceR-1)
  .byt <(TouchedForceU-1)
  .byt <(TouchedForceD-1)
  .byt <(TouchedCeilingBarrier-1)
  .byt <(TouchedStoryTrigger-1)
SpecialMiscHi:
  .byt >(TouchedLadder-1)
  .byt >(TouchedLadder-1)
  .byt >(TouchedLadder-1)
  .byt >(TouchedSpring-1)
  .byt >(TouchedSignpost-1)
  .byt >(TouchedDoorBottom-1)
  .byt >(TouchedSpringDown-1)
  .byt >(TouchedToggleSwitch-1)
  .byt >(TouchedTeleporter-1)
  .byt >(TouchedCloneSwitch-1)
  .byt >(TouchedGenericSwitch-1)
  .byt >(TouchedCherryBomb-1)
  .byt >(TouchedCampfire-1)
  .byt >(TouchedForceL-1)
  .byt >(TouchedForceR-1)
  .byt >(TouchedForceU-1)
  .byt >(TouchedForceD-1)
  .byt >(TouchedCeilingBarrier-1)
  .byt >(TouchedStoryTrigger-1)

SpecialWallLo:
  .byt <(TouchedLock-1)
  .byt <(TouchedLock-1)
  .byt <(TouchedLock-1)
  .byt <(TouchedChipSocket-1)
  .byt <(TouchedPickupBlock-1)
  .byt <(TouchedPushableBlock-1)

SpecialWallHi:
  .byt >(TouchedLock-1)
  .byt >(TouchedLock-1)
  .byt >(TouchedLock-1)
  .byt >(TouchedChipSocket-1)
  .byt >(TouchedPickupBlock-1)
  .byt >(TouchedPushableBlock-1)

.proc TouchedCeilingBarrier
  lda #0
  sta PlayerVYH
  lda #$40
  sta PlayerVYL
  rts
.endproc

.proc TouchedChipSocket
  sty TempY
  jsr GetBlockX
  tay
  lda ChipCount
  cmp ColumnBytes,y
  bcs Delete
  rts
Delete:
  lda #0
  sta ChipCount
  lda #SFX::UNLOCK
  jsr PlaySound
  lda BackgroundMetatile
  ldy TempY
  jmp ChangeBlockFar
.endproc

.proc TouchedPickupBlock
  rts
.endproc
.proc TouchedPushableBlock
OldLevelBlockPtr = 10
OldYIndex = 12
  lda FallingBlockPointer+1
  beq :+
    rts
  :

  ; save the old pointer
  lda LevelBlockPtr+0
  sta OldLevelBlockPtr+0
  lda LevelBlockPtr+1
  sta OldLevelBlockPtr+1
  sty OldYIndex

  jsr GetBlockX
  sta 0
  lda PlayerPXH
  cmp 0
  bcc Right
Left:
  lda LevelBlockPtr
  sub #16
  sta LevelBlockPtr
  subcarry LevelBlockPtr+1
  
  jsr PreMove

  lda #Metatiles::PUSHABLE_BLOCK
  jsr ChangeBlockFar
  jmp Erase
Right:
  lda LevelBlockPtr
  add #16
  sta LevelBlockPtr
  addcarry LevelBlockPtr+1

  jsr PreMove

  lda #Metatiles::PUSHABLE_BLOCK
  jsr ChangeBlockFar
  jmp Erase

Erase:     ; erase old position
  ldy OldYIndex
  lda OldLevelBlockPtr+0
  sta LevelBlockPtr+0
  lda OldLevelBlockPtr+1
  sta LevelBlockPtr+1
  lda BackgroundMetatile
  jmp ChangeBlockFar

EraseBoth: ; hit a cherry bomb
  lda #SFX::BOOM1
  jsr PlaySound
  lda BackgroundMetatile
  jsr ChangeBlockFar
  jmp Erase

PreMove:   ; check if the block should move up or anything
  ; can't move if the block has another pushable block on top
  dey
  lda (OldLevelBlockPtr),y
  cmp #Metatiles::PUSHABLE_BLOCK
  beq Abort
  iny

  lda (LevelBlockPtr),y ; only overwrite blank blocks
  cmp BackgroundMetatile
  beq MoveIsOkay
  cmp #Metatiles::CHERRY_BOMB
  beq EraseBoth
; okay it's solid, but is the one above solid?
    dey
    lda (LevelBlockPtr),y ; nope, move over there
    cmp BackgroundMetatile
    beq MoveIsOkay
Abort:
    pla
    pla
    rts
MoveIsOkay:
  ; check if moving onto air
  iny
  lda (LevelBlockPtr),y
  cmp BackgroundMetatile
  bne :+
    ; if moving into air, start falling
    lda LevelBlockPtr+0
    sta FallingBlockPointer+0
    lda LevelBlockPtr+1
    sta FallingBlockPointer+1
    sty FallingBlockY
  :
  dey
  rts
.endproc

.proc TouchedLock
  pha
  lda CarryingSunKey
  bne HasSunKey
  pla
  sub #Metatiles::LOCK_RED
  add #InventoryItem::RED_KEY
  jsr InventoryHasItem
  bcc NoItem
  jsr InventoryTakeItem
UnlockNow:
  lda BackgroundMetatile
  jsr ChangeBlock
  lda #SFX::UNLOCK
  jsr PlaySound
NoItem:
  rts

; If they have the sun key, destroy it and unlock the door
HasSunKey:
  pla ; fix the stack
  lsr CarryingSunKey ; no longer holding the key
  sty TempY

  ; Erase the key being held
  ldy #ObjectLen-1
: lda ObjectF1,y
  and #<~1
  cmp #Enemy::SUN_KEY*2
  bne :+ ; skip if not sun key
  lda ObjectF4,y
  beq :+ ; skip if not being held
  lda #0
  sta ObjectF1,y
: dey
  bpl :--

  ldy TempY  
  jmp UnlockNow
.endproc

.proc TouchedBigHeart
  lda PlayerHealth
  cmp #4
  bcs :+
  lda BackgroundMetatile
  jsr ChangeBlock
  lda #SFX::COIN
  jsr PlaySound
  lda #4
  sta PlayerHealth
: rts
.endproc

.proc TouchedHeart
  lda PlayerHealth
  cmp #4
  bcs :+
  lda BackgroundMetatile
  jsr ChangeBlock
  lda #SFX::COIN
  jsr PlaySound
  inc PlayerHealth
: rts
.endproc

.proc TouchedCoin
  lda BackgroundMetatile
  jsr ChangeBlock
  lda #SFX::COIN
  jsr PlaySound
  jmp AddCoin
.endproc

.proc TouchedInventoryItem
  lda BackgroundMetatile
  jsr ChangeBlock
  jsr GetBlockX
  tay
  lda ColumnBytes,y
  jsr InventoryGiveItem

  lda #SFX::ITEM_GET
  jmp PlaySound
.endproc

.proc TouchedInventoryItemAuto
  lda BackgroundMetatile
  jsr ChangeBlock
  jsr GetBlockX
  tay
  lda ColumnBytes,y
  jmp FarInventoryCode
.endproc

.proc TouchedLadder
XForMiddle = TempSpace+5
  lda keydown
  and #KEY_UP|KEY_DOWN
  rtseq
  lda #2
  sta PlayerOnLadder

  ; snap onto the ladder
  lda #$50
  sta PlayerPXL
  lda XForMiddle
  sta PlayerPXH
  rts
.endproc

.proc TouchedSpring
  inc HandlePlayer::SkipFourCorners
  lda #<-1
  sta PlayerVYH
  lda #<-$70
  sta PlayerVYL
  lda #30
  sta PlayerJumpCancelLock
  sta PlayerJumping
  lda #SFX::SPRING
  jsr PlaySoundDebounce

  lda #0
  sta PlayerNeedsGround

  ldy TempSpace
  ; animate the spring
  lda #1
  sta 0
  lda #Metatiles::SPRING
  jsr DelayChangeBlock
  lda #Metatiles::SPRING_PRESSED
  jmp ChangeBlock
.endproc

.proc TouchedSignpost
  lda keynew
  and #KEY_UP
  beq Nope
  jsr GetBlockX
  tax
  lda ColumnBytes+0,x
  sta ScriptPtr+0
  lda ColumnBytes+1,x
  sta ScriptPtr+1
  inc NeedDialog
Nope:
  rts
.endproc

.proc TouchedStoryTrigger
  lda #0
  tay
Loop:
  lda (LevelBlockPtr),y
  cmp #Metatiles::STORY_DIALOG_TRIGGER
  bne :+
  lda #Metatiles::EMPTY
  sta (LevelBlockPtr),y
: iny
  cpy #15
  bne Loop

  jsr GetBlockX
  tax
  lda ColumnBytes+0,x
  sta ScriptPtr+0
  lda ColumnBytes+1,x
  sta ScriptPtr+1
  inc NeedDialog
  rts
.endproc

.proc TouchedDoorBottom
  lda keynew
  and #KEY_UP
  beq NoPressUp
    dey  
    lda (LevelBlockPtr),y
    cmp #Metatiles::EXIT_DOOR_TOP
    beq ExitDoor

    jsr GetBlockX        ; Get the block's X position
    jsr DoTeleport
NoPressUp:
  rts

ExitDoor:
  ; Mark current level as cleared
  ldy StartedLevelNumber
  jsr IndexToBitmap
  ora LevelCleared,y
  sta LevelCleared,y

  ; Mark the next level as available
  ldy StartedLevelNumber
  iny
  sty LevelNumber
  sty StartedLevelNumber
  jsr IndexToBitmap
  ora LevelAvailable,y
  sta LevelAvailable,y

  ; Copy some state back to the savefile
  jsr ConfiscateItems
  jsr CopyToSavedInventory
  jsr SaveEventFlags

  lda StartedLevelNumber
  jmp StartLevel
.endproc

.proc ConfiscateItems
; Remove items that the player shouldn't exit the level with
  ldx #InventoryLen
Loop:
  ; Loop through the bad items, looking for a match
  ldy #0
: lda BadItems,y ; read from bad items list
  beq ItemIsGood ; end of the list? item must be good then
  iny
  cmp InventoryType,x
  bne :-
  lda #0
  sta InventoryType,x
  sta InventoryAmount,x
ItemIsGood:
  dex
  bpl Loop
  rts
BadItems:
  .byt InventoryItem::RED_KEY, InventoryItem::GREEN_KEY, InventoryItem::BLUE_KEY
  .byt InventoryItem::FIRE_BOOTS, InventoryItem::SUCTION_BOOTS, InventoryItem::ICE_SKATES, InventoryItem::FLIPPERS
  .byt InventoryItem::ALWAYS_JUMPING
  .byt InventoryItem::BLOCK, InventoryItem::SPRING
  .byt InventoryItem::ARROW_LEFT, InventoryItem::ARROW_DOWN, InventoryItem::ARROW_RIGHT, InventoryItem::ARROW_UP
  .byt InventoryItem::ARROW_LEFT_METAL, InventoryItem::ARROW_DOWN_METAL, InventoryItem::ARROW_RIGHT_METAL, InventoryItem::ARROW_UP_METAL
  .byt InventoryItem::WOOD_BOX, InventoryItem::METAL_BOX
  .byt 0
.endproc

.proc SaveEventFlags
  ldy #31
: lda ScriptFlags,y
  sta ScriptFlagsSaved
  dey
  bpl :-
  rts
.endproc

.proc TouchedSpringDown
  rts
.endproc

.proc TouchedKey
  sty TempY
  sub #Metatiles::KEY_RED
  add #InventoryItem::RED_KEY
  jsr InventoryGiveItem
  bcc Failed ; can't pick up the key if you have a full inventory
  ldy TempY
  lda BackgroundMetatile
  jsr ChangeBlock

  lda #SFX::ITEM_GET
  jmp PlaySound  
Failed:
  rts
.endproc

.proc TouchedToggleSwitch
  lda SwitchCooldownTimer
  beq :+
    rts
  :
  lda #60
  sta SwitchCooldownTimer

  jmp HitToggleSwitch
.endproc

.proc TouchedTeleporter
  lda SwitchCooldownTimer
  beq :+
    rts
  :
  lda #60
  sta SwitchCooldownTimer
  jsr GetBlockX        ; Get the block's X position
  jmp DoTeleport
.endproc

.proc TouchedCloneSwitch
  rts
.endproc

.proc TouchedGenericSwitch
  rts
.endproc

.proc TouchedForceCheckBoots
  lda #InventoryItem::SUCTION_BOOTS
  jsr InventoryHasItem
  bcc :+
  pla
  pla
: rts
.endproc

.proc TouchedForceU
  jsr TouchedForceCheckBoots
  lda #<(-$40)
  sta PlayerVYL
  lda #>(-$40)
  sta PlayerVYH
  lda #0
  sta PlayerVXL
  sta PlayerVXH
Align:
  jsr GetBlockX
  sta PlayerPXH
  lda #$40
  sta PlayerPXL
  rts
.endproc

.proc TouchedForceL
  jsr TouchedForceCheckBoots
  lda #<(-$40)
  sta PlayerVXL
  lda #>(-$40)
  sta PlayerVXH
  lda #0
  sta PlayerVYL
  sta PlayerVYH

Align:
  ldy TempY
  dey
  sty PlayerPYH
  lda #0
  sta PlayerPYL
  rts
.endproc

.proc TouchedForceR
  jsr TouchedForceCheckBoots
  lda #<($40)
  sta PlayerVXL
  lda #>($40)
  sta PlayerVXH
  lda #0
  sta PlayerVYL
  sta PlayerVYH

  jmp TouchedForceL::Align
.endproc

.proc TouchedForceD
  jsr TouchedForceCheckBoots
  lda #<($40)
  sta PlayerVYL
  lda #>($40)
  sta PlayerVYH
  lda #0
  sta PlayerVXL
  sta PlayerVXH

  jmp TouchedForceU::Align
.endproc


.proc TouchedChip
  lda BackgroundMetatile
  jsr ChangeBlock
  lda #SFX::COIN
  jsr PlaySound
  inc ChipCount
  rts
.endproc

.proc TouchedCherryBomb
;SaveY = 10
;  sty SaveY
;  lda #0
;  jsr ChangeBlock
;  lda #SFX::BOOM1
;  jsr PlaySound
;  jsr HurtPlayer
  lda #0
  sta PlayerHealth
  rts
.endproc

.proc TouchedCampfire
  lda #InventoryItem::FIRE_BOOTS
  jsr InventoryHasItem
  bcc :+
  rts
: jmp HurtPlayer
.endproc

.proc TouchedBoots
  sty TempY
  sub #Metatiles::RED_BOOTS
  add #InventoryItem::FIRE_BOOTS
  jsr InventoryGiveItem
  bcc Failed ; can't pick up the key if you have a full inventory
  ldy TempY
  lda BackgroundMetatile
  jsr ChangeBlock

  lda #SFX::ITEM_GET
  jmp PlaySound  
Failed:
  rts
.endproc

.proc TouchedWoodArrow
SaveY = 10
Offset = 11
  sty SaveY
  sub #Metatiles::WOOD_ARROW_LEFT
  sta Offset

  pha
  ; X and Y are preserved
  lda BackgroundMetatile
  jsr ChangeBlock
  pla

  lda #Enemy::FLYING_ARROW*2
  jsr FindFreeObjectForTypeX
  bcc Exit
  jsr GetBlockX
  sta ObjectPXH,x
  lda SaveY
  sta ObjectPYH,x

  ldy Offset
  jsr ArrowChangeDirection
Exit:

  ldy SaveY
  lda #PoofSubtype::POOF
  jmp MakePoofAtBlock
.endproc

.proc TouchedWoodBomb
  lda BackgroundMetatile
  jsr ChangeBlock
  rts
.endproc

.proc TouchedWoodCrate
  lda #4
  sta 0 ; delay time
  lda BackgroundMetatile
  jsr DelayChangeBlock
  lda #Metatiles::SPRING
  jsr ChangeBlock

  ; Snap player to the block
  cpy PlayerPYH ; make sure the player is actually above the block
  bcc :+
  lda CollectedByProjectile
  bne :+
  jsr GetBlockX
  sta PlayerPXH
  ldy PlayerDir
  lda Offset,y
  sta PlayerPXL
  ldy TempY
  lda #0
  sta PlayerVXL
  sta PlayerVXH
  lda #3
  sta PlayerLeftRightLock
:

  lda #PoofSubtype::BRICKS
  jmp MakePoofAtBlock
Offset:
  .byt $60, $20
.endproc

.proc DoSpecialMisc
  sty TempY
  sta TempVal
  sub #M_FIRST_SPECIAL_MISC
  tay
  lda SpecialMiscHi,y
  pha
  lda SpecialMiscLo,y
  pha
  ldy TempY
  lda TempVal
  rts
.endproc

.proc DoCollectible
  sty TempY
  stx TempX
  sta TempVal
  ; Is this a collectible??
  sub #M_FIRST_COLLECTIBLE
  cmp #M_LAST_COLLECTIBLE+1-M_FIRST_COLLECTIBLE
  bcs :+
  jsr Call
: ldy TempY
  ldx TempX
  lda TempVal
  rts
Call:
  lda TempVal
  sub #M_FIRST_COLLECTIBLE
  tay
  lda CollectibleHi,y
  pha
  lda CollectibleLo,y
  pha
  ldy TempY
  ldx TempX
  lda TempVal
  rts
.endproc

.proc DoSpecialWall
  sty TempY
  sta TempVal
  sub #M_FIRST_SPECIAL_WALL
  tay
  lda SpecialWallHi,y
  pha
  lda SpecialWallLo,y
  pha
  ldy TempY
  lda TempVal
  rts
.endproc

; Breaks the bricks at (LevelBlockPtr),y
; Be certain that it's pointing at bricks though or it'll crash!
.proc DoBreakBricks
  lda (LevelBlockPtr),y
  sty TempY
  sub #Metatiles::BRICKS
  sta TempVal
  tay
  lda BricksHi,y
  pha
  lda BricksLo,y
  pha
  ldy TempY
  lda TempVal
  rts
.endproc
