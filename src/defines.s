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

.macro iNES_Header Banks, MapperNum
  .segment "INESHDR"
  .byt "NES", $1A  ; these four bytes identify a file as an NES ROM
  .byt Banks ; size of PRG, in 16384 byte units
  .byt 0     ; size of CHR, in 8192 byte units
  .byt (MapperNum&$0f << 4) + 1 + 2 ; vertical, battery
  .byt (MapperNum&$f0) + %1000
  .byt 0     ; extended mapper size
  .byt 0     ; extended ROM sizes
  .byt $70   ; 8KB battery backed RAM
  .byt $07   ; 8KB CHR RAM
  .byt 0     ; NTSC
  .byt 0     ; not VS System
.endmacro
.macro Mapper_UNROM Banks
  MAPPER_UNROM = 1
  iNES_Header Banks, 2
.endmacro
.macro Mapper_MMC1 Banks
  MAPPER_MMC1 = 1
  iNES_Header Banks, 1
;  .if Banks == 32
;    Mapper_SUROM = 1
;  .endif
.endmacro
.macro Mapper_MMC3 Banks
  MAPPER_MMC3 = 1
  iNES_Header Banks, 4
.endmacro
.macro Mapper_Action53 Banks
  MAPPER_ACTION53 = 1
  iNES_Header Banks, 28
.endmacro
; -------------------------------------

.enum GraphicsUpload
  BG_COMMON
  BG_GRASSY
  SP_WALKER
  SP_CANNON
  SP_FIRE
  SP_KING
  SP_GEORGE
  SP_EXPLODE
  PAL_GRASSY
  PAL_BUMMER
  PAL_FROZEN
  BG_CUTSCENE
  BG_GRASSYBG
  BG_CHIP
  TITLE_CHR
  TITLE_NAM
  TITLE_PAL
  INVENTORY_CHR
  SP_SUN
  NPC_CHR
  PAL_ENEMY1
.endenum

.enum SFX
  JUMP = 128
  SNARE2
  KICK2
  HIHAT
  YOUSHOOT
  ENEMY_SMOOSH
  HURT
  PRIZE
  SPRING
  SNARE1
  KICK1
  BOOM1
  BOOM2
  ENEMY_HURT
  COIN
  YOU_DIED
  TELEPORT
  BUMP
  TAIL_WHOOSH
  SMASH
  GET_ABILITY
.endenum

.enum InventoryIcon
  NOTHING
  BULLET
  ABILITY
  STAR
  HEART
  KEY
  SHIELD
  PANTS
  ACTIVE
  PLACEABLE
  ACTION
  EFFECT
.endenum

.macro RealXPosToScreenPos RealLo, RealHi, Store
  lda RealLo
  sub ScrollX+0
  sta Store

  lda RealHi
  sbc ScrollX+1
  .repeat 4
    lsr
    ror Store
  .endrep
.endmacro

.macro RealYPosToScreenPos RealLo, RealHi, Store
  lda RealLo
  sta Store

  lda RealHi
  .repeat 4
    lsr
    ror Store
  .endrep
.endmacro

.macro RealXPosToScreenPosByX RealLo, RealHi, Store
  lda RealLo,x
  sub ScrollX+0
  sta Store

  lda RealHi,x
  sbc ScrollX+1
  .repeat 4
    lsr
    ror Store
  .endrep
.endmacro

.macro RealYPosToScreenPosByX RealLo, RealHi, Store
  lda RealLo,x
  sta Store

  lda RealHi,x
  .repeat 4
    lsr
    ror Store
  .endrep
.endmacro

.macro RealXPosToScreenPosByY RealLo, RealHi, Store
  lda RealLo,y
  sub ScrollX+0
  sta Store

  lda RealHi,y
  sbc ScrollX+1
  .repeat 4
    lsr
    ror Store
  .endrep
.endmacro

.macro RealYPosToScreenPosByY RealLo, RealHi, Store
  lda RealLo,y
  sta Store

  lda RealHi,y
  .repeat 4
    lsr
    ror Store
  .endrep
.endmacro

.macro ChrFile File, Size, Address
  .word Address
  .byt (Size/128)
  .incbin File
.endmacro

.macro MetaspriteHeader Width, Height, Palette
  .byt (Height-1)|((Width-1)<<3)|(Palette<<6)
.endmacro
MS_EMPTY = 32

.enum AbilityType
  NONE
  BLASTER
  GLIDER
  BOMB
  FIRE
  FIREWORK
  NICE
  BOOMERANG
  BALL
  WATER
  FAN
  BURGER
.endenum

.enum Enemy
  NONE
  GOOMBA
  SNEAKER
  SPINNER
  OWL
  KING
  TOASTBOT
  BALL
  POTION
  GEORGE
  BIG_GEORGE
  ALAN
  GLIDER
  ICE_1
  ICE_2
  BALL_GUY
  THWOMP
  CANNON_1
  CANNON_2
  BURGER
  FIRE_WALK
  FIRE_JUMP
  FIRE_BURNING
  MINE
  ROCKET
  ROCKET_LAUNCHER
  FIREWORK_SHOOTER
  TORNADO
  ELECTRIC_FAN
  CLOUD
  BOUNCER
  GREMLIN
  BOMB_GUY
  POOF
  PLAYER_PROJECTILE
  ENEMY_PROJECTILE
.endenum

.enum PlayerProjectileType
  STUN_STAR
  COPY_ORB
  BLASTER_SHOT
  LIFE_GLIDER
  BOOMERANG
  FIREBALL
  FLAME
  WATER_BOTTLE
  FIREWORK_CURSOR
  BOMB
  EXPLOSION
  ICE_BLOCK
  KICKED_ICE
  TORNADO
  BURGER
  BALL
.endenum

.enum PoofSubtype
  POOF
  BRICKS
.endenum

.enum MusicTracks
  NONE
.endenum

; -------------------- scripting stuff --------------------------------------
.enum SCR
  END_SCRIPT    ; end the script
  END_PAGE      ; wait for key, then clear page after it's pressed
  NEWLINE       ; new line
  RUN_ASM       ; runs inline asm
  POKE          ; aa aa xx - poke value in address
  FLAG_ON       ; xx - flag
  FLAG_OFF      ; xx - flag
  FLAG_TOGGLE   ; xx - flag
  IF_FLAG_ON    ; xx - flag
  IF_FLAG_OFF   ; xx - flag
  IF_ITEM       ; xx - item
  IF_NOT_ITEM   ; xx - item
  IF_CHOICE     ; xx - choice number
  GOTO          ; goto
  CALL          ; call in same bank
  RETURN        ; returns from a call
  SAY           ; .ssn nnnn            |
  THINK         ; .||+-++++- name/face |
  NARRATE       ; .++------- speaker   |
  CHOICES       ; xx - choice set
  SCENE         ; xx - scene number
  SPEAKER_0 = %0000000
  SPEAKER_1 = %0100000
  SPEAKER_2 = %1000000
  SPEAKER_3 = %1100000
.endenum

SCRIPT_FIRST_IF = SCR::IF_FLAG_ON
SCRIPT_LAST_IF = SCR::IF_CHOICE

.enum CHAR
  NONE
  SIGN
  NOVA
  KEE
  SHERWIN
  LUVI
  KIERAN
  REMY
  ECLIPSE
  MOLSNO
  S_TEAM
  SMILOID
  IKE
  RAOUL
  JAFGAUR
.endenum

; -------------------- level stuff --------------------------------------
.enum LO ; see leveldecodeobjects.s
  S_CUSTOM
  R_CUSTOM
  WIDE_1
  TALL_1
  RECT_1
  WIDE_2
  TALL_2
  RECT_2
  R_AIR
  R_BRICK
  R_SOLID_BLOCK
  R_COIN
  R_GROUND
  R_ROCK
  R_WATER
  S_SOLID_BLOCK
  S_SPRING
  S_SIGNPOST
  S_BRICK
  S_PRIZE
  S_BRICKPRIZE
  S_GROUND_CLIMB_L
  S_GROUND_CLIMB_R
  S_COIN
  S_GROUND
  S_SOLID_ROCK
  S_DOOR
  S_EXIT_DOOR
  RS_GROUND
  RS_ROCK
  S_TALL_GRASS
  S_FLOWER
  S_BUSH
.endenum

.enum LN1
  EMPTY
  BRICKS
  PRIZE
  USED_PRIZE
  SOLID_BLOCK
  LADDER
  SPIKES
  COIN
  SPRING
  GROUND
  WATER
  SOLID_LEDGE
  FALLTHROUGH_LEDGE
  BRICKPRIZE
  FENCE
  TALLGRASS
.endenum

.enum LN2
  FLOWER
  BLACK
  BUSH
  TRUNK_L
  TRUNK
.endenum

.macro LSpr Type, Direction, XPos, YPos, Extra
  .byt XPos
  .ifnblank Extra
    .byt (Extra<<4)|YPos
  .else
    .byt YPos
  .endif
  .byt (Type<<1)|Direction
.endmacro

.macro LObj Type, XPos, YPos, Extra1, Extra2
  .byt Type
  .byt (XPos<<4)|YPos
  .ifnblank Extra1
    .byt Extra1
    .ifnblank Extra2
      .byt Extra2
    .endif
  .endif
.endmacro

.macro LObjN Type, XPos, YPos, Width, Height, Extra
  LObj Type, XPos, YPos, (Width<<4)|Height
  .ifnblank Extra
    .byt Extra
  .endif
.endmacro

.macro LFinished
  .byt $f0
.endmacro

.macro LSetX NewX
  .byt $f1, NewX
.endmacro

.macro LWriteCol Col1, Col2, Col3
  .ifnblank Col3
    .byt $f4
    .byt Col1, Col2, Col3
  .else
    .ifnblank Col2
      .byt $f3
      .byt Col1, Col2
    .else
      .byt $f2
      .byt Col1
    .endif
  .endif
.endmacro

.macro LXMinus16
  .byt $f5
.endmacro

.macro LXPlus16
  .byt $f6
.endmacro
