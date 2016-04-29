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

SpecialMiscLo:
  .byt <(TouchedCoin-1)
  .byt <(TouchedLadder-1)
  .byt <(TouchedLadder-1)
  .byt <(TouchedSpring-1)
  .byt <(TouchedSignpost-1)
  .byt <(TouchedDoorBottom-1)
  .byt <(TouchedSpringDown-1)
  .byt <(TouchedKey-1)
  .byt <(TouchedKey-1)
  .byt <(TouchedKey-1)
  .byt <(TouchedToggleSwitch-1)
  .byt <(TouchedTeleporter-1)
  .byt <(TouchedCloneSwitch-1)
  .byt <(TouchedGenericSwitch-1)
  .byt <(TouchedBoots-1)
  .byt <(TouchedBoots-1)
  .byt <(TouchedBoots-1)
  .byt <(TouchedBoots-1)
  .byt <(TouchedCherryBomb-1)
  .byt <(TouchedCampfire-1)
  .byt <(TouchedForce-1)
  .byt <(TouchedForce-1)
  .byt <(TouchedForce-1)
  .byt <(TouchedForce-1)
  .byt <(TouchedChip-1)

SpecialMiscHi:
  .byt >(TouchedCoin-1)
  .byt >(TouchedLadder-1)
  .byt >(TouchedLadder-1)
  .byt >(TouchedSpring-1)
  .byt >(TouchedSignpost-1)
  .byt >(TouchedDoorBottom-1)
  .byt >(TouchedSpringDown-1)
  .byt >(TouchedKey-1)
  .byt >(TouchedKey-1)
  .byt >(TouchedKey-1)
  .byt >(TouchedToggleSwitch-1)
  .byt >(TouchedTeleporter-1)
  .byt >(TouchedCloneSwitch-1)
  .byt >(TouchedGenericSwitch-1)
  .byt >(TouchedBoots-1)
  .byt >(TouchedBoots-1)
  .byt >(TouchedBoots-1)
  .byt >(TouchedBoots-1)
  .byt >(TouchedCherryBomb-1)
  .byt >(TouchedCampfire-1)
  .byt >(TouchedForce-1)
  .byt >(TouchedForce-1)
  .byt >(TouchedForce-1)
  .byt >(TouchedForce-1)
  .byt >(TouchedChip-1)

.proc TouchedCoin
  lda #0
  jsr ChangeBlock
  lda #SFX::COIN
  jsr PlaySound
  jmp AddCoin
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
  sta ScriptPtr+0,x
  lda ColumnBytes+1,x
  sta ScriptPtr+1,x
  inc NeedDialog
Nope:
  rts
.endproc

.proc TouchedDoorBottom
  lda keynew
  and #KEY_UP
  beq Nope
    dey  
    lda (LevelBlockPtr),y
    cmp #Metatiles::EXIT_DOOR_TOP
    beq ExitDoor
    ; regular door
    ; 0Y XX    - X and Y only
    ; 1Y XX LL - X and Y with level number
    ; 2Y AA AA - start dialog
    inc NeedLevelRerender
    inc IsNormalDoor
    jsr GetBlockX        ; Get the block's X position
    tax
    lda ColumnBytes,x    ; Read the flag to check for special handling
    cmp #$20
    beq DoDialogInstead
    and #$10
    beq NoLevelChange
    lda ColumnBytes+2,x
    sta LevelNumber
    inc NeedLevelReload
NoLevelChange:
  lda ColumnBytes+0,x    ; Read the Y position plus the flag
  and #15                ; (but only use the flag)
  sta PlayerPYH
  lda ColumnBytes+1,x    ; Read the X position
  sta PlayerPXH
Nope:
  rts
DoDialogInstead:
  lda ColumnBytes+1,x
  sta ScriptPtr+0
  lda ColumnBytes+2
  sta ScriptPtr+1
  inc NeedDialog
  rts
ExitDoor:
  inc LevelNumber
  inc NeedLevelReload
  rts
.endproc

.proc TouchedSpringDown
  rts
.endproc

.proc TouchedKey
  rts
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

.proc DoSpecialWall
  rts
.endproc

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
