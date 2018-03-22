MasterLevelListL:
  .byt <intro_a, <grassy_a, <funkunderground, <sky, <water, <grassy2_a, <underground_2, <boss1
  .byt <glass_intro, <arrows, <burgers, <glasscave, <chiptall, <falldown, <glass_finale, <boss2
  .byt <frozen, <frozen2, <frozen3, <frozen4, <frozen5, <frozen6, <frozen7, <boss3
  .byt <insane1, <insane2, <insane3, <insane4, <insane5, <insane6, <boss4a
  .byt <final1, <emptylevel
; sub-levels
  .byt <intro_b, <grassy_b, <grassy2_b, <underground, <garden, <puzzle2, <insane1b

MasterLevelListH:
  .byt >intro_a, >grassy_a, >funkunderground, >sky, >water, >grassy2_a, >underground_2, >boss1
  .byt >glass_intro, >arrows, >burgers, >glasscave, >chiptall, >falldown, >glass_finale, >boss2
  .byt >frozen, >frozen2, >frozen3, >frozen4, >frozen5, >frozen6, >frozen7, >boss3
  .byt >insane1, >insane2, >insane3, >insane4, >insane5, >insane6, >boss4a
  .byt >final1, >emptylevel
; sub-levels
  .byt >intro_b, >grassy_b, >grassy2_b, >underground, >garden, >puzzle2, >insane1b

.proc LevelBanks
B1 = LEVELS_BANK1
B2 = LEVELS_BANK2
PUZ = 128 ; puzzle
  .byt B1,     B1,     B1,     B1,     B1,     B1,     B1,     B1
  .byt B1,     B1,     B1|PUZ, B1,     B1|PUZ, B1,     B2|PUZ, B1
  .byt B1,     B1,     B1,     B1,     B1,     B1,     B1,     B2
  .byt B2,     B2,     B2,     B2,     B2,     B2,     B2
  .byt B2,     B1
; sub-levels
  .byt B1,     B1,     B1,     B1,     B1,     B1,     B2
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
  Frozen6
  Frozen7
  Boss3

; world 4
  Insane1
  Insane2
  Insane3
  Insane4
  Insane5
  Insane6
  Boss4a

; world 5
  Final1

  EmptyLevel

; sublevels
  IntroB
  GrassyB
  Grassy2B
  Underground2
  Garden
  PuzzleBomb
  Insane1B
.endenum

.pushseg
.segment "PRGe"
.proc PreLevelText
  .byt LevelId::IntroA
  .addr PreLevelIntro
  .byt LevelId::FunkUnderground
  .addr PreLevelUnderground
  .byt LevelId::Sky
  .addr PreLevelSky
  .byt LevelId::Water
  .addr PreLevelWater
  .byt LevelId::Boss1
  .addr PreLevelBoss1
  .byt LevelId::GlassIntro
  .addr PreLevelGlassIntro
  .byt LevelId::Burgers
  .addr PreLevelBurgers
  .byt LevelId::ChipTall
  .addr PreLevelChipTall
  .byt LevelId::Tall
  .addr PreLevelTall
  .byt LevelId::GlassFinale
  .addr PreLevelGlassFinale
  .byt LevelId::Boss2
  .addr PreLevelBoss2
  .byt LevelId::Frozen
  .addr PreLevelFrozen
  .byt LevelId::Frozen2
  .addr PreLevelFrozen2
  .byt LevelId::Frozen3
  .addr PreLevelFrozen3
  .byt LevelId::Frozen5
  .addr PreLevelFrozen5
  .byt LevelId::Frozen6
  .addr PreLevelFrozen6
  .byt LevelId::Frozen7
  .addr PreLevelFrozen7
  .byt LevelId::Insane1
  .addr PreLevelInsane1
  .byt LevelId::Insane2
  .addr PreLevelInsane2
  .byt LevelId::Insane3
  .addr PreLevelInsane3
  .byt LevelId::Insane5
  .addr PreLevelInsane5
  .byt LevelId::Insane6
  .addr PreLevelInsane6

  .byt LevelId::Boss3
  .addr PreLevelBoss3
  .byt 255
.endproc

.proc PreLevelHasCutscene
  .byt LevelId::IntroA
  .byt LevelId::Boss1
  .byt LevelId::GlassIntro
  .byt LevelId::Burgers
  .byt LevelId::Boss2
  .byt LevelId::Boss3
  .byt LevelId::ChipTall
  .byt LevelId::Tall
  .byt LevelId::Frozen
  .byt LevelId::Insane1
  .byt LevelId::Final1
  .byt LevelId::Boss4a
  .byt 255
.endproc
.popseg

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
.include "../levels/frozen6.s"
.include "../levels/frozen7.s"
.include "../levels/falldown.s"
.include "../levels/glasscave.s"
.include "../levels/chiptall.s"
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

