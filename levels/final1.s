final1:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_FACEBALL
  .addr final1Data
  .addr final1Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $08, $00 ; boundaries

final1Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <Intro, >Intro
  LObjN LO::R_SOLID_ROCK,     0, 11, 0, 1
  LObjN LO::R_GROUND,         0, 13, 13, 1
  LObjN LO::WIDE_1,           5, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::R_BRICK,          2, 7, 2, 0
  LObj  LO::S_SOLID_ROCK,     0, 12
  LObjN LO::R_COIN,           1, 4, 1, 1
  LObjN LO::R_SOLID_ROCK,     0, 11, 0, 1
  LObjN LO::R_GROUND,         1, 11, 3, 1
  LObj  LO::S_PRIZE,          1, 7
  LObjN LO::R_SOLID_ROCK,     2, 9, 0, 1
  LObjN LO::R_GROUND,         3, 11, 2, 3
  LObjN LO::R_GROUND,         3, 9, 2, 5
  LObjN LO::R_GROUND,         6, 9, 3, 5
  LObjN LO::R_GROUND,         4, 7, 2, 7
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

final1Sprite:
  LSpr Enemy::ROVER,               0,   6,   4
  LSpr Enemy::GREMLIN,             0,   8,   8
  LSpr Enemy::BOUNCER,             1,  11,   6
  LSpr Enemy::TURKEY,              1,  11,  10
  LSpr Enemy::FIRE_JUMP,           0,  18,  10, 1
  LSpr Enemy::FIRE_JUMP,           0,  26,   8, 1
  .byt 255 ; end
