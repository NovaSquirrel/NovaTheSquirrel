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
  NeedNMIInterrupted = 1
.endmacro
.macro Mapper_MMC3 Banks
  MAPPER_MMC3 = 1
  iNES_Header Banks, 4
  NeedNMIInterrupted = 1
.endmacro
.macro Mapper_Action53 Banks
  MAPPER_ACTION53 = 1
  iNES_Header Banks, 28
.endmacro
REAL_COLLISION_TEST = 1 ; use real coordinates instead of screen coordinates
NMI_MUSIC = 1
LEVEL_INTROS = 1
PLAYTESTING_BUILD = 1
;CPU_METER = 1
;DEBUG = 1
;AUTO_CLIMB = 1
HAS_DICTIONARY_TABLE = 1
; -------------------------------------

.include "../tools/objectenum.s"
.include "../tools/inventoryenum.s"
.include "../tools/metatileenum.s"

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
  BG_FROZEN_FG
  BG_FROZEN_BG
  PAL_ENEMY2
  BG_BUMMER
  CHR_LEVELSEL
  PAL_LEVELSEL
  SP_RONALD
  SP_MINES
  CHR_FONT
  BG_TROPICAL
  BG_SUBURBS
  BG_HANNAH
  PAL_ALTGRASS1
  PAL_ALTGRASS2
  SP_SCHEME_TEAM
  SP_HANNAH
  SP_LIFE
  PAL_ENEMY3
  BG_MINES
  PAL_ENEMY4
  BG_SHOPICONS
  SP_WIND
  SP_BOOMERANG
  BG_EXPOSITION
  SP_MOLSNO
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
  ITEM_GET
  UNLOCK
  ARROW_SHOOT
  PLACE_BLOCK
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
  MIRROR
  WATER
  FAN
  BURGER
  LAST
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
  MIRROR
  MIRROR_SELF
.endenum

.enum PoofSubtype
  POOF
  BRICKS
  BALLOON
  FLOAT_TEXT
  PUSHABLE_BLOCK
  CARRYABLE_BLOCK
  COUNT
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
  SAY           ; .ssn nnnn
  THINK         ; .||+-++++- name/face
  NARRATE       ; .++------- speaker
  SCENE         ; xx - scene number
  TRANSITION    ; transition effect
  NO_SKIP       ; disable skipping the dialog
  MONO_TEXT     ; display monospaced text
  SPEAKER_0 = %0000000
  SPEAKER_1 = %0100000
  SPEAKER_2 = %1000000
  SPEAKER_3 = %1100000
.endenum

.enum CHAR
  NONE
  SIGN
  NOVA
  KEE
  SHERWIN
  FORUM
  KOREY
  REMY
  ECLIPSE
  MOLSNO
  S_TEAM
  SMILOID
  IKE
  RAOUL
  JAFGUAR
  LIA
  ITI
  NEKOED
  NEKOED2
  BILL
  UNUSED_1
  UNUSED_2
  NOVA_AW
  NOVA_YAY
  NOVA_SILLY
  NOVA_WOW
  NOVA_MAD

NOVA_STRAIGHT = 18
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
  WIDE_3
  TALL_3
  RECT_3
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
  S_BIGHEART
  S_HEART
  R_GRAYBRICKS
  S_MOAI_RIGHT
  S_MOAI_LEFT
  S_TROPICAL_FLOWER
  S_TROPICAL_FLOWER_2
  S_BIG_BUSH
  S_BIG_SPIKY_BUSH
  S_WOOD_PLATFORM_TOP
  S_WOOD_PLATFORM
  R_WOOD_PLATFORM
  RS_SAND
  R_SAND
  S_SKWIRLBUSH
  S_STATUE
  R_BRICKWALL
  S_W_ARROW_LEFT
  S_W_ARROW_DOWN
  S_W_ARROW_UP
  S_W_ARROW_RIGHT
  S_W_BOMB
  S_W_CRATE
  S_M_ARROW_LEFT
  S_M_ARROW_DOWN
  S_M_ARROW_UP
  S_M_ARROW_RIGHT
  S_M_BOMB
  S_M_CRATE
  S_BG_GLASS_GREEN
  S_BG_GLASS_GRAY
  S_BG_GLASS_RED
  S_BG_GLASS_BLUE
  S_FG_GLASS_RED
  S_FG_GLASS_BLUE
  R_BG_GLASS_GREEN
  R_BG_GLASS_GRAY
  R_BG_GLASS_RED
  R_BG_GLASS_BLUE
  R_FG_GLASS_RED
  R_FG_GLASS_BLUE
  R_SOLID_ROCK
  R_CEILING_BARRIER
  S_CEILING_BARRIER
  S_STORY_TRIGGER
  S_GLIDER_BLOCK
  S_MTRACK
  S_MTRACK_UP
  S_MTRACK_UPLEFT
  S_MTRACK_UPRIGHT
  S_MTRACK_BUMP
  S_MTRACK_SPECIAL
  S_MTRACK_STOP
  S_MTRACK_SUPPORTS
  S_MTRACK_SSL
  S_MTRACK_SSR
  S_MTRACK_SGL
  S_MTRACK_SGR
  R_MTRACK_SUPPORTSONLY
  R_ENEMY_BARRIER
  S_SNOWMAN
  S_FROZENCRACK
  R_ICE2
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
  GRAY_BRICKS
  STONE_BRIDGE
  SAND
  PALM_TREE
  STRIPED_LOG_HORIZ
  LOG_HORIZ
  WOOD_PLATFORM_TOP
  WOOD_PLATFORM
  PATH_LINE
  WOOD_CRATE
  METAL_CRATE
.endenum

.enum LN3
  WHITEFENCE
  ROCK
  FG_GLASS_RED
  FG_GLASS_BLUE
  SOLID_ROCK
  MINE_TRACKS
  MINE_TRACKS_BRAKES
  FROZEN_CRACK
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
  .assert XPos >= 0 && XPos <= 255, error, "Invalid X position"
  .assert YPos >= 0 && YPos <= 15, error, "Invalid Y position"
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
  .assert XPos >= 0 && XPos <= 255, error, "Invalid X position"
  .assert YPos >= 0 && YPos <= 15, error, "Invalid Y position"
  .assert Width >= 0 && Width <= 15, error, "Invalid width"
  .assert Height >= 0 && Height <= 15, error, "Invalid height"
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

LSpecialCmd = $f7

.enum LevelSpecialConfig
  PUZZLE_MODE       ; [aa][ii] ... 00 - ability, item IDs
  MAKE_BACKGROUNDS  ; sl bb - start screen, length, background id
  SET_START_DIALOG  ; aa aa - dialog address
.endenum

.enum LevelBackgroundId
  CLOUDS
  CLOUDS_EVERYWHERE
  FROZEN_CAVE
.endenum

.macro ThinFontText String
  .repeat 8, I
    .scope
      Char = .strat(String, I)
      .if Char = ' '
        .byt 0
      .endif
      .if Char >= 'A' && Char <= 'Z'
        .byt 1 + Char-'A'
      .endif
    .endscope
  .endrep
.endmacro

.enum EventFlags
.endenum
