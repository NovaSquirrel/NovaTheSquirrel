; Princess Engine
; Copyright (C) 2018 NovaSquirrel
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

.proc ShowAbilityHelp
Pointer = 2
PPUPointer = 4
  ; Blank the screen
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  jsr WaitVblank
  bit PPUSTATUS
  lda #0
  sta PPUMASK
  lda #GraphicsUpload::CHR_FONT
  jsr DoGraphicUpload

  ; Upload extra characters
  lda #$08
  sta PPUADDR
  lda #$00
  sta PPUADDR
  ldx #0
: lda CHR,x
  sta PPUDATA
  inx
  cpx #CHR_End-CHR
  bne :-

  lda #' '
  jsr ClearNameCustom

  ; Load text pointer
  ldx PlayerAbility
  lda AbilityLo,x
  sta Pointer+0
  lda AbilityHi,x
  sta Pointer+1

  lda #$21
  sta PPUPointer+1
  lda #$02
  sta PPUPointer+0

  ; Now write the text onto the screen
WriteLoopNewRow:
  bit PPUSTATUS
  lda PPUPointer+1
  sta PPUADDR
  lda PPUPointer+0
  sta PPUADDR

  lda PPUPointer+0
  add #32*2
  sta PPUPointer+0
  addcarry PPUPointer+1
WriteLoop:
  ldy #0
  lda (Pointer),y
  inc16 Pointer
  cmp #0
  beq Done
  cmp #1
  beq WriteLoopNewRow
  sta PPUDATA
  jmp WriteLoop

Done:
  lda PPUPointer+1
  sta PPUADDR
  lda PPUPointer+0
  sta PPUADDR
  jsr PutStringImmediate
  .byt "(Press ",$83," to exit)",0

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  jsr WaitVblank
  lda #BG_ON
  sta PPUMASK
Loop:
  jsr WaitVblank
  jsr ReadJoy
  lda keynew
  and #KEY_A|KEY_B|KEY_START
  beq Loop
  rts

AbilityLo:
  .lobytes Default, Blaster, Glider, Bomb, Fire
  .lobytes Firework, Nice, Boomerang, Mirror, Water, Fan, Burger, GeneralHelp
AbilityHi:
  .hibytes Default, Blaster, Glider, Bomb, Fire
  .hibytes Firework, Nice, Boomerang, Mirror, Water, Fan, Burger, GeneralHelp

DN = $80
UP = $81
BB = $82
AB = $83

Default:
  .byt "DEFAULT",1
  .byt "The default ability!",1
  .byt BB,   ": Stun star",1
  .byt UP,BB,": Copy an enemy",0

Blaster:
  .byt "BLASTER GUN",1
  .byt "Fire a fast-moving bullet!",1
  .byt BB,   ": Blaster shot",0

Glider:
  .byt "GLIDER GUN",1
  .byt "Gliders can break regular",1
  .byt "bricks and trigger green",1
  .byt "toggle switches.",1
  .byt BB,   ": Downwards",1
  .byt UP,BB,": Upwards",0

Bomb:
  .byt "BOMBS",1
  .byt "Bombs can act as platforms",1
  .byt "and also explode bricks.",1
  .byt BB,   ": Mid-air bomb",1
  .byt UP,BB,": Throw bomb",1
  .byt DN,BB,": Drop bomb",0

Fire:
  .byt "FIREBALLS",1
  .byt "Fireballs are an easy-to-use",1
  .byt "weapon that can melt ice.",1
  .byt BB,   ": Fireball",1
  .byt UP,BB,": Throw upwards",1
  .byt DN,BB,": Drop",0

Firework:
  .byt "FIREWORKS",1
  .byt "Release a cursor with B,",1
  .byt "guide it with Up/Down and",1
  .byt "then detonate with B again!",0

Nice:
  .byt "ICE BLOCKS",1
  .byt "Ice blocks can freeze water",1
  .byt "and lava, and can be ridden",1
  .byt "on.",1
  .byt BB,   ": Shoot forward",1
  .byt UP,BB,": Throw upwards",1
  .byt DN,BB,": Ice ride",0

Boomerang:
  .byt "BOOMERANG",1
  .byt "Boomerangs can be thrown in",1
  .byt "four directions, and can",1
  .byt "pick up items for you!",1
  .byt BB,   ": Forward",1
  .byt UP,BB,": Upward",1
  .byt DN,BB,": Downward",0

Mirror:
  .byt "MIRROR",1
  .byt "Reflects the boss's shots",1
  .byt "back at him!",1
  .byt BB,   ": Shoot",0

Water:
  .byt "WATER BOTTLE",1
  .byt "Water bottles move in an arc",1
  .byt "and they can put out fire.",1
  .byt BB,   ": Mid-range",1
  .byt UP,BB,": Long-range",1
  .byt DN,BB,": Short-range",0

Fan:
  .byt "TORNADOES",1
  .byt "Shoot tornadoes that carry",1
  .byt "enemies away from you. Puts",1
  .byt "out fires temporarily.",1
  .byt BB,   ": Curved",1
  .byt UP,BB,": Upwards",1
  .byt DN,BB,": Straight forward",0

Burger:
  .byt "DINNER BLASTER",1
  .byt "Exploding cheeseburgers once",1
  .byt "weaponized by ",34,"The King",34,".",1
  .byt BB,  ": Shoot",1
  .byt DN,BB,": Burger Ride",0

GeneralHelp:
  .byt "NOVA THE SQUIRREL",1
  .byt "  ",AB,":Jump",1
  .byt "  ",BB,":Use ability (Per-ability",1
  .byt "help is on the pause screen)",1
  .byt "  ",UP,":Read signs, go in doors",1
  .byt "  ",DN,":Drop from certain floors",1
  .byt $84,$85,$86,":Pause/Inventory",1
  .byt $87,$88,$89,":Hold to clear ability",0

CHR:
  .incbin "../chr/abilityhelp.chr"
CHR_End:
.endproc

.proc ShowControls
  lda #AbilityType::LAST
  sta PlayerAbility
  jsr ShowAbilityHelp
  lda #AbilityType::NONE
  sta PlayerAbility
  jmp ShowAbilityHelp
.endproc
