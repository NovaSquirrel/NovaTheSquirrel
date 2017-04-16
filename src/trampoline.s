; Princess Engine
; Copyright (C) 2014-2017 NovaSquirrel
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

.proc LoadShopItemIcons
; Ability graphics are in the graphics bank
  lda #GRAPHICS_BANK1
  jsr _SetPRG
; Calculate pointer to the ability icon
  lda #$08
  sta PPUADDR
  lda #$00
  sta PPUADDR

  lda #<AbilityIcons
  sta 0
  lda #>AbilityIcons
  sta 1

; Copy 1 kilobyte to the PPU
  ldx #4
  ldy #0
: lda (0),y
  sta PPUDATA
  iny
  bne :-
  inc 1
  dex
  bne :-
; Decompress shop icons
  lda #GRAPHICS_BANK2
  jsr _SetPRG
  lda #<BGShopIcons
  ldy #>BGShopIcons
  jsr DecompressCHR

; Restore options bank
  lda #OPTIONS_BANK
  jmp _SetPRG
.endproc

; Run inventory code from the main loop bank
.proc FarInventoryCode
  stx TempX
  pha
  lda #INVENTORY_BANK
  jsr _SetPRG
  pla

  tay
  ldx #255
  jsr CallInventoryCodeDirect

  lda #MAINLOOP_BANK
  jsr _SetPRG
  ldx TempX
  rts
.endproc

; Plays a sound, handles bank switching
; input: A (sound number)
.proc PlaySoundAuto
  pha
  lda #SOUND_BANK
  jsr _SetPRG
  pla
  jsr pently_start_sound
  jmp SetPRG_Restore
.endproc

; Plays music, handles bank switching
; input: A (music number)
.proc PlayMusicAuto
  pha
  lda #SOUND_BANK
  jsr _SetPRG
  pla
  jsr pently_start_music
  jmp SetPRG_Restore
.endproc

; Allows a projectile to collect a collectible metatile
.proc DoCollectibleFar
  pha
  lda #MAINLOOP_BANK
  jsr _SetPRG
  pla
  inc CollectedByProjectile
  jsr DoCollectible
  dec CollectedByProjectile
  lda #OBJECT_BANK
  jmp _SetPRG
.endproc

; Allows an object bank routine to break bricks
.proc DoBreakBricksFar
  pha
  lda #MAINLOOP_BANK
  jsr _SetPRG
  pla
  jsr DoBreakBricks
  lda #OBJECT_BANK
  jmp _SetPRG
.endproc

; Allows any bank to change blocks
.proc ChangeBlockFar
  pha
  lda #MAINLOOP_BANK
  jsr _SetPRG
  pla
  jsr ChangeBlock
  jmp SetPRG_Restore
.endproc

; Allows any bank to change blocks on a delay
.proc DelayChangeBlockFar
  pha
  lda #MAINLOOP_BANK
  jsr _SetPRG
  pla
  jsr DelayChangeBlock
  jmp SetPRG_Restore
.endproc

