; to do: figure out how I want to select banks

MasterLevelListL:
  .byt <Level1

MasterLevelListH:
  .byt >Level1

Level1:
  .byt 0   ; music 0
  .byt 5   ; X pos 5
  .byt $25 ; 2 screens, start at Y pos 5
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr Level1Data
  .addr Level1Sprite
  .byt $2c ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_CHIP
  .byt 255
  .word %0000000000000000 ; boundaries

Level1Data:
  .include "../tools/level1.s"

Level1Sprite:
  LSpr Enemy::GOOMBA,    1, 17,  7
;  LSpr Enemy::FIRE_JUMP, 1, 37,  11
  LSpr Enemy::GOOMBA,    1, 37,  11
  LSpr Enemy::OWL,       1, 56,  12
  LSpr Enemy::OWL,       1, 66,  8
  LSpr Enemy::GOOMBA,    1, 89,  9
  LSpr Enemy::OWL,       1, 114, 9
  LSpr Enemy::OWL,       1, 143, 9
  LSpr Enemy::GOOMBA,    1, 157, 5
  LSpr Enemy::FIRE_JUMP, 1, 179, 12
  .byt 255

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

