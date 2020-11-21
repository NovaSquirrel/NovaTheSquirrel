; Princess Engine
; Copyright (C) 2014-2018 NovaSquirrel
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

.proc OpenPrize
  lda #Metatiles::USED_PRIZE
  jsr ChangeBlock

  stx TempX
  jsr GetBlockX ; Get block X position, to get an index for ColumnBytes
  tax

  ; By default the block that will get placed above is the inventory item pickup.
  lda #Metatiles::INVENTORY_ITEM
  sta TempVal

  lda ColumnBytes,x
  beq JustACoin ; No contents = block only has a coin.

  ; If the top bit is set, it's a forced-use item pickup.
  cmp #128
  bcc :+
    pha
    lda #Metatiles::INVENTORY_ITEM_AUTO
    sta TempVal ; Change the block that will be placed.
    pla
  :

  ; If it's an ability backup block, it contains the current ability
  cmp #InventoryItem::ABILITY_BACKUP
  bne :+
    lda PlayerAbility
    beq JustACoin ; If no ability, then it's just a coin.
    add #InventoryItem::ABILITY_BLASTER-1
    sta ColumnBytes,x
  :

  ; Put the item pickup above the block.
  ldx TempX
  pha ; Save item number
  dey
  lda TempVal
  jsr ChangeBlock
  iny
  pla ; Restore item number
  and #127
  jmp MakeFloatingTextAtBlock

JustACoin:
  ldx TempX
  lda #PoofSubtype::POOF
  jsr MakePoofAtBlock

  lda #SFX::COIN
  jsr PlaySoundDebounce
  jmp AddCoin
.endproc

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

  lda #PoofSubtype::BRICKS
  jsr MakePoofAtBlock

  lda #SFX::SMASH
  jmp PlaySoundDebounce
.endproc

.proc BrokeBricksPrize ; maybe just direct it to OpenPrize?
  jmp OpenPrize
.endproc

; Creates a "poof" effect located at a block.
; inputs: A (Poof subtype), LevelBlockPtr (pointer), Y (Y position)
; locals: TempVal+1
.proc MakePoofAtBlock
  pha
  sty TempVal+1
  jsr FindFreeObjectY
  bcc NoSlotFree
  lda #Enemy::POOF*2
  sta ObjectF1,y
  pla
  sta ObjectF2,y      ; F2 = subtype
  jsr GetBlockX       ; Set X position
  sta ObjectPXH,y
  lda TempVal+1       ; Set Y position
  sta ObjectPYH,y
  lda #0              ; Clear low position bits and state bytes
  sta ObjectPXL,y
  sta ObjectPYL,y
  sta ObjectTimer,y
  sta ObjectF3,y
  sec                 ; Success
  rts
NoSlotFree:
  pla
  clc                 ; Failure
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
  .byt <(TouchedPushableBlock-1)
SpecialWallHi:
  .byt >(TouchedLock-1)
  .byt >(TouchedLock-1)
  .byt >(TouchedLock-1)
  .byt >(TouchedChipSocket-1)
  .byt >(TouchedPushableBlock-1)

SpecialGroundLo:
  .byt <(HurtPlayer-1) ; spikes
  .byt <(TouchedWoodCrate-1)
  .byt <(TouchedPickupBlock-1)
SpecialGroundHi:
  .byt >(HurtPlayer-1)
  .byt >(TouchedWoodCrate-1)
  .byt >(TouchedPickupBlock-1)

.proc TouchedPickupBlock
  lda keynew ; Check for a block to pick up if pressing up.
  and #KEY_UP
  beq :+
    ; Don't allow if already holding something.
    lda CarryingPickupBlock
    ora CarryingSunKey
    bne :+
    jsr FindFreeObjectY
    bcc :+
    sty TempVal

    ; Erase the block being picked up.
    ldy TempY
    lda BackgroundMetatile
    jsr ChangeBlockFar
    ; Create the pickup block object.
    ldy TempVal
    lda #Enemy::POOF*2
    sta ObjectF1,y
    lda #PoofSubtype::CARRYABLE_BLOCK
    sta ObjectF2,y
    lda #8
    sta ObjectF4,y ; animation counter
    lda PlayerPXH
    sta ObjectPXH,y
    lda PlayerPYH
    sta ObjectPYH,y
    ; PXL and PYL are set before the block ever gets drawn,
    ; so don't waste bytes setting them here.
    inc CarryingPickupBlock
  :
  rts
.endproc

.proc TouchedCeilingBarrier
  lda #0
  sta PlayerVYH
  lda #$40
  sta PlayerVYL
  rts
.endproc

.proc TouchedChipSocket
  lda ChipsNeeded
  beq Delete
;  sty TempY
;  jsr GetBlockX
;  tay
;  lda ChipCount
;  cmp ColumnBytes,y
;  bcs Delete
  rts
Delete:
  lda #SFX::UNLOCK
  jsr PlaySound
  lda BackgroundMetatile
  jmp ChangeBlockFar
.endproc

.proc TouchedPushableBlock
GoUp = 9
OldLevelBlockPtr = 10
OldYIndex = 12
  ; Make sure there's a free object slot first,
  ; because the block has to turn into an object.
  sty OldYIndex
  jsr FindFreeObjectY
  bcs :+
    ldy OldYIndex
    rts
  :
  ldy OldYIndex

  ; Save the level block pointer
  lda LevelBlockPtr+0
  sta OldLevelBlockPtr+0
  lda LevelBlockPtr+1
  sta OldLevelBlockPtr+1

  ; Determine whether the player is pushing against the left or right side.
  ; This is done by comparing the block X position against the player X position.
  jsr GetBlockX
  sta 0
  lda PlayerPXH
  cmp 0
  bcc Right ; Player < Block, so block is to be pushed right
Left:       ; Player >= Block, so block is to be pushed left

  ; Move the block pointer left
  lda LevelBlockPtr
  sub #16
  sta LevelBlockPtr
  subcarry LevelBlockPtr+1
  
  jsr PreMove ; Test the new position
  jmp EraseL  ; Erase the old block and create the moving block object

Right:
  ; Move the block pointer right
  lda LevelBlockPtr
  add #16
  sta LevelBlockPtr
  addcarry LevelBlockPtr+1

  jsr PreMove ; Test the new position
  jmp Erase   ; Erase the old block and create the moving block object

EraseL:
  jsr Erase            ; Do all the same work as for moving right
  lda #Enemy::POOF*2+1 ; Set the direction bit in the moving block to left
  sta ObjectF1,y
  rts
Erase:
  ; Put a temporary BOULDER_SOLID where it's moving into.
  ; It's a solid, transparent block meant to give solidity to object.
  lda #Metatiles::BOULDER_SOLID
  jsr ChangeBlockFar

  ; Determine if there's a difference between the original Y coordinate and the desired one.
  ; If there is, GoUp will be nonzero.
  tya
  sub OldYIndex
  sta GoUp

  ; Restore the old block pointer and index so the old block can be erased
  ldy OldYIndex
  lda OldLevelBlockPtr+0
  sta LevelBlockPtr+0
  lda OldLevelBlockPtr+1
  sta LevelBlockPtr+1

  ; Erase the block that just got pushed
  lda BackgroundMetatile
  jsr ChangeBlockFar
  ; Make the moving block object
  lda #PoofSubtype::PUSHABLE_BLOCK
  jsr MakePoofAtBlock
  ; Success is guaranteed since free space was already checked for earlier
  lda GoUp
  sta ObjectVYL,y ; If nonzero, moving block object climbs upwards
  rts

; Verify if the block should move at all, and if it should climb something.
PreMove:
  ; First, refuse to move if another pushable block is on top.
  dey
  lda (OldLevelBlockPtr),y
  cmp #Metatiles::PUSHABLE_BLOCK
  beq Abort
  iny

  ; If the space in front is free, we can move.
  lda (LevelBlockPtr),y
  cmp #Metatiles::CHERRY_BOMB
  beq ExplodeCherryBomb
  cmp BackgroundMetatile
  beq MoveIsOkay
    ; Space in front is taken, but is there a block on top of that?
    dey
    lda (LevelBlockPtr),y
    cmp BackgroundMetatile
    beq MoveIsOkay ; Exit this routine with the modified Y register.
Abort:
    pla
    pla
    rts
MoveIsOkay:
  rts
ExplodeCherryBomb:
  pla
  pla
  lda #SFX::BOOM1
  sta NeedSFX
; Erase bomb
  lda BackgroundMetatile
  jsr ChangeBlockFar
  lda #PoofSubtype::POOF
  jsr MakePoofAtBlock
; Erase block too
  ldy OldYIndex
  lda OldLevelBlockPtr+0
  sta LevelBlockPtr+0
  lda OldLevelBlockPtr+1
  sta LevelBlockPtr+1
  lda BackgroundMetatile
  jmp ChangeBlockFar
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
  ; Clear the forced-item bit to get only the item number.
  and #127
  jmp FarInventoryCode ; Run the item code directly.
.endproc

.proc TouchedLadder
XForMiddle = TempSpace+5
  lda DownLockFromRideable
  bne _rts
  lda keydown
  and #KEY_UP|KEY_DOWN
  beq _rts
  lda #2
  sta PlayerOnLadder

  lda #0
  sta PlayerNeedsGround

  ; snap onto the ladder
  lda #$50
  sta PlayerPXL
  lda XForMiddle
  sta PlayerPXH
_rts:
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

  ; Animate the spring changing
  ; but only if the spring isn't scheduled to disappear before it'd pop back up
  ldy #MaxDelayedMetaEdits-1
DelayedBlockLoop:
  ; Count down the timer, if there is a timer
  lda DelayedMetaEditTime,y
  beq :+
    ; Is it this block?
    lda DelayedMetaEditIndexHi,y
    cmp LevelBlockPtr+1
    bne :+
    lda DelayedMetaEditIndexLo,y
    sub TempSpace
    cmp LevelBlockPtr+0
    bne :+
    lda DelayedMetaEditTime,y
    cmp #6
    bcc DontSpringUp
: dey
  bpl DelayedBlockLoop

  ; animate the spring
  ldy TempSpace
  lda #1
  sta 0
  lda #Metatiles::SPRING
  jsr DelayChangeBlock
DontSpringUp:
  ldy TempSpace
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
  lda CutscenesEnabled
  beq Exit

  ; Remove all the story triggers in the column
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
Exit:
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
  jsr StopSoundFar
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

  jsr CopyToSavedInventory

  jmp ShowLevelEnd
;  jmp ShowPreLevelFar
.endproc

; Remove items that the player shouldn't exit the level with
; (obsoleted by using a second page for these)
.if 0
.proc ConfiscateItems
  ldx #InventoryLen
Loop:
  ; Loop through the bad items, looking for a match
  ldy #0
: lda BadItems,y ; Read from bad items list.
  beq ItemIsGood ; Zero is the end-of-list marker, so stop when it's found.
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
.endproc
.endif

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
  jsr ToggleSwitchCooldown
  bcc :+
  jmp HitToggleSwitch
: rts
.endproc

.proc TouchedTeleporter
  jsr SwitchCooldown
  bcc :+
  jsr GetBlockX        ; Get the block's X position
  jmp DoTeleport       ; Do the teleport encoded in that position
: rts
.endproc

.proc TouchedCloneSwitch
BlockX = 3
BlockY = 4

; To do: make sure I don't need to restore anything?
  jsr SwitchCooldown
  bcc No
  jsr GetBlockX        ; Get the block's X position
  tay
  lda ColumnBytes,y    ; Column byte for switch indicates where the cloner is
  sta BlockX
  jsr GetLevelColumnPtr
  ; Find cloner
  ldy #14
: lda (LevelBlockPtr),y
  cmp #Metatiles::CLONER
  beq FoundCloner
  dey
  bpl :-
No:
  rts

FoundCloner:
  sty BlockY

  ldx BlockX        ; Check if it's a block cloner first
  lda ColumnBytes,x
  cmp #2
  bcc BlockCloner

  jsr FindFreeObjectY
  bcc No

  jsr ObjectClearY

  ldx BlockX        ; Write whatever kind of enemy it is
  lda ColumnBytes,x
  sta ObjectF1,y

  lda BlockY
  sub #1
  sta ObjectPYH,y

  lda BlockX
  sta ObjectPXH,y
  lda #0
  sta ObjectPXL,y
  sta ObjectPYL,y
  rts
Specials:
  .byt Metatiles::PUSHABLE_BLOCK
  .byt Metatiles::PICKUP_BLOCK

BlockCloner:
  tax
  dey
  lda (LevelBlockPtr),y
  cmp BackgroundMetatile
  bne No
  lda Specials,x
  jmp ChangeBlockFar
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
  countdown ChipsNeeded
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

  lda #Enemy::FLYING_ARROW*2
  jsr FindFreeObjectForTypeX
  bcc Exit
  jsr GetBlockX
  sta ObjectPXH,x
  lda SaveY
  sta ObjectPYH,x

  pha
  ; X and Y are preserved
  lda BackgroundMetatile
  jsr ChangeBlock
  pla

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
  ; Don't trigger if there's a crate above this one
  dey
  lda (LevelBlockPtr),y
  iny
  cmp #Metatiles::WOOD_CRATE
  bne :+
    rts
  :

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

.proc DoSpecialGround
  sty TempY
  stx TempX
  sta TempVal
  ; Is this a collectible??
  sub #M_FIRST_SPECIAL_GROUND
  cmp #M_LAST_SPECIAL_GROUND+1-M_FIRST_SPECIAL_GROUND
  bcs :+
  jsr Call
: ldy TempY
  ldx TempX
  lda TempVal
  rts
Call:
  lda TempVal
  sub #Metatiles::SPIKES
  tay
  lda SpecialGroundHi,y
  pha
  lda SpecialGroundLo,y
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
