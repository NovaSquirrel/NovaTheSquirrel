; to do: figure out how I want to select banks

MasterLevelListL:
  .byt <intro_a, <grassy_a, <funkunderground, <sky, <water, <grassy2_a, <underground_2, <boss1, <emptylevel
  .byt <intro_b, <grassy_b, <grassy2_b, <underground, <garden

MasterLevelListH:
  .byt >intro_a, >grassy_a, >funkunderground, >sky, >water, >grassy2_a, >underground_2, >boss1, >emptylevel
  .byt >intro_b, >grassy_b, >grassy2_b, >underground, >garden

.enum LevelId
  IntroA
  GrassyA
  FunkUnderground
  Sky
  Water
  Grassy2A
  Underground_2
  EmptyLevel
  IntroB
  GrassyB
  Grassy2B
  Underground2
  Garden
  Boss1
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

