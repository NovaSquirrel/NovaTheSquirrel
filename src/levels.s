; to do: figure out how I want to select banks

MasterLevelListL:
  .byt <intro_a, <grassy_a, <funkunderground, <sky, <water, <grassy2_a, <underground_2, <boss1
  .byt <glass_intro, <arrows, <burgers, <glasscave, <chiptall, <falldown, <glass_finale, <boss2
  .byt <frozen, <frozen2, <frozen3, <frozen4, <frozen5, <emptylevel
; sub-levels
  .byt <intro_b, <grassy_b, <grassy2_b, <underground, <garden, <puzzle2

MasterLevelListH:
  .byt >intro_a, >grassy_a, >funkunderground, >sky, >water, >grassy2_a, >underground_2, >boss1
  .byt >glass_intro, >arrows, >burgers, >glasscave, >chiptall, >falldown, >glass_finale, >boss2
  .byt >frozen, >frozen2, >frozen3, >frozen4, >frozen5, >emptylevel
; sub-levels
  .byt >intro_b, >grassy_b, >grassy2_b, >underground, >garden, >puzzle2

.proc LevelBanks
B1 = LEVELS_BANK1
PUZ = 128 ; puzzle
  .byt B1,     B1,     B1,     B1,     B1,     B1,     B1,     B1
  .byt B1,     B1,     B1|PUZ, B1,     B1|PUZ, B1,     B1|PUZ, B1
  .byt B1,     B1,     B1,     B1,     B1,     B1,     B1,     B1

.endproc

.enum LevelId
; world 1
  IntroA
  GrassyA
  FunkUnderground
  Sky
  Water
  Grassy2A
  Underground_2
  Boss1
; world 2
  GlassIntro
  Arrows
  Burgers
  GlassCave
  ChipTall
  Tall
  GlassFinale
  Boss2

; world 3
  Frozen
  Frozen2
  Frozen3
  Frozen4
  Frozen5
  EmptyLevel

; sublevels
  IntroB
  GrassyB
  Grassy2B
  Underground2
  Garden
  PuzzleBomb
.endenum

.include "../levels/intro_a.s"
.include "../levels/intro_b.s"
.include "../levels/grassy_a.s"
.include "../levels/grassy_b.s"
.include "../levels/funkunderground.s"
.include "../levels/underground.s"
.include "../levels/sky.s"
.include "../levels/water.s"
.include "../levels/grassy2_a.s"
.include "../levels/grassy2_b.s"
.include "../levels/emptylevel.s"
.include "../levels/underground_2.s"
.include "../levels/garden.s"
.include "../levels/boss1.s"
.include "../levels/glass_intro.s"
.include "../levels/arrows.s"
.include "../levels/burgers.s"
.include "../levels/puzzle2.s"
.include "../levels/frozen.s"
.include "../levels/frozen2.s"
.include "../levels/frozen3.s"
.include "../levels/frozen4.s"
.include "../levels/frozen5.s"
.include "../levels/falldown.s"
.include "../levels/glasscave.s"
.include "../levels/chiptall.s"
.include "../levels/glass_finale.s"
.include "../levels/boss2.s"

;Level data:
;TTTTTTTT XXXXYYYY [SSSSSSSS]
;T - Object type (0-255)
;Y - Y position absolute (0-15)
;X - X position relative (0-15)
;S - Settings byte, if needed
;
;Level commands
;1111TTTT [SSSSSSSS]
;T - 0 finished with the level
;    1 set X to S
;    2 write 1 column byte at current column
;    3 write 2 column bytes starting at this column
;    4 write 3 column bytes starting at this column
;    5 current X -= 16
;    6 current X += 16

