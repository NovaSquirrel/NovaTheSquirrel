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

.proc BrokeBricks
  lda #Metatiles::EMPTY
  jsr ChangeBlock
  lda #SFX::SMASH
  jmp PlaySoundDebounce
.endproc

SpecialMiscLo:
  .byt <(TouchedCoin-1)
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

.proc TouchedSpring
  inc HandlePlayer::SkipFourCorners
  lda #<-1
  sta PlayerVYH
  lda #<-$70
  sta PlayerVYL
  lda #30
  sta PlayerJumpCancelLock
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
  rts
.endproc

.proc TouchedDoorBottom
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
