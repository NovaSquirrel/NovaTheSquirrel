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
  lda ColumnBytes,x
  beq JustACoin
  ; Open a prize
  ldx TempX
  pha ; item number
  dey
  lda #Metatiles::INVENTORY_ITEM
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
  lda #Metatiles::EMPTY
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
  .byt >(TouchedChip-1)

SpecialMiscLo:
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
  .byt <(TouchedForce-1)
  .byt <(TouchedForce-1)
  .byt <(TouchedForce-1)
  .byt <(TouchedForce-1)

SpecialMiscHi:
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
  .byt >(TouchedForce-1)
  .byt >(TouchedForce-1)
  .byt >(TouchedForce-1)
  .byt >(TouchedForce-1)

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

.proc TouchedChipSocket
  rts
.endproc
.proc TouchedPickupBlock
  rts
.endproc
.proc TouchedPushableBlock
  rts
.endproc

.proc TouchedLock
  sub #Metatiles::LOCK_RED
  add #InventoryItem::RED_KEY
  jsr InventoryHasItem
  bcc NoItem
  jsr InventoryTakeItem
  lda #0
  jsr ChangeBlock
NoItem:
  rts
.endproc

.proc TouchedBigHeart
  lda PlayerHealth
  cmp #4
  bcs :+
  lda #0
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
  lda #0
  jsr ChangeBlock
  lda #SFX::COIN
  jsr PlaySound
  inc PlayerHealth
: rts
.endproc

.proc TouchedCoin
  lda #0
  jsr ChangeBlock
  lda #SFX::COIN
  jsr PlaySound
  jmp AddCoin
.endproc

.proc TouchedInventoryItem
  lda #0
  jsr ChangeBlock
  jsr GetBlockX
  tay
  lda ColumnBytes,y
  jsr InventoryGiveItem

  lda #SFX::COIN ; todo: make a more suitable sound effect
  jmp PlaySound
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

  lda Coins+0
  sta SavedCoins+0
  lda Coins+1
  sta SavedCoins+1

  lda StartedLevelNumber
  jmp StartLevel
.endproc

.proc TouchedSpringDown
  rts
.endproc

.proc TouchedKey
  pha
  lda #0
  jsr ChangeBlock
  pla
  sub #Metatiles::KEY_RED
  add #InventoryItem::RED_KEY
  jsr InventoryGiveItem

  lda #SFX::COIN ; todo: make a more suitable sound effect
  jmp PlaySound  
.endproc

.proc TouchedToggleSwitch
  rts
.endproc

.proc TouchedTeleporter
  rts
.endproc

.proc TouchedCloneSwitch
  rts
.endproc

.proc TouchedGenericSwitch
  rts
.endproc

.proc TouchedForce
  rts
.endproc

.proc TouchedChip
  lda #0
  jsr ChangeBlock
  rts
.endproc

.proc TouchedCherryBomb
  rts
.endproc

.proc TouchedCampfire
  rts
.endproc

.proc TouchedBoots
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
  lda #0
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
  jsr MakePoofAtBlock
  rts
.endproc

.proc TouchedWoodBomb
  lda #0
  jsr ChangeBlock
  rts
.endproc

.proc TouchedWoodCrate
  lda #4
  sta 0
  lda #Metatiles::EMPTY
  jsr DelayChangeBlock
  lda #Metatiles::SPRING
  jsr ChangeBlock

  ; Snap player to the block
  ; todo: maybe block left/right shortly after stepping on it?
  lda keydown
;  and #KEY_LEFT|KEY_RIGHT
;  bne :+
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
