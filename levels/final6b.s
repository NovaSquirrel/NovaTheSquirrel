final6b:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_WIND
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_HANNAH
  .addr final6bData
  .addr final6bSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY3
  .byt 255 ; end
  .byt $00, $00 ; boundaries

final6bData:
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_GROUND,         3, 3, 3, 4
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 4
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_W_ARROW_RIGHT,  2, 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 4
  LObjN LO::R_BG_GLASS_BLUE,  1, 3, 8, 0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_OFF, (8<<4)|0
  LObj  LO::S_SPRING,         8, 12
  LObj  LO::S_SOLID_BLOCK,    1, 3
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 2
  LObjN LO::R_GROUND,         0, 7, 5, 7
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::FORK_ARROW_DOWN, (1<<4)|0
  LObj  LO::S_M_ARROW_RIGHT,  0, 4
  LObj  LO::S_M_ARROW_RIGHT,  1, 5
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_M_ARROW_DOWN,   0, 2
  LObj  LO::S_M_ARROW_RIGHT,  0, 6
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 3
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::METAL_CRATE, (0<<4)|2
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 10, 0
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::FORCE_RIGHT, (1<<4)|0
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::FORCE_UP, (0<<4)|2
  LObj  LO::S_FG_GLASS_BLUE,  0, 7
  LObj  LO::S_DOOR,           0, 10
  LWriteCol 4, 34
  LObjN LO::R_FG_GLASS_BLUE,  0, 12, 2, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 3, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 0, 2
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::LOCK_RED
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::FORCE_DOWN, (0<<4)|2
  LObj  LO::S_W_ARROW_RIGHT,  0, 5
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::FORCE_RIGHT
  LObjN LO::R_FG_GLASS_BLUE,  0, 7, 0, 2
  LObj  LO::S_M_ARROW_DOWN,   0, 10
  LObj  LO::S_M_CRATE,        0, 11
  LObj  LO::R_CUSTOM,         1, 1, Metatiles::METAL_ARROW_RIGHT, (2<<4)|0
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 0, 3
  LObj  LO::S_M_ARROW_UP,     1, 2
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::FORCE_DOWN, (0<<4)|2
  LObj  LO::R_CUSTOM,         1, 1, Metatiles::METAL_ARROW_LEFT, (1<<4)|0
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::KEY_RED
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::FORCE_LEFT
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORCE_UP, (0<<4)|7
  LObj  LO::S_M_ARROW_LEFT,   1, 2
  LObj  LO::S_M_ARROW_UP,     0, 3
  LObj  LO::S_M_ARROW_UP,     0, 5
  LObj  LO::S_CUSTOM,         1, 1, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_CRATE,        0, 3
  LObj  LO::S_M_ARROW_DOWN,   1, 1
  LObj  LO::S_M_ARROW_RIGHT,  0, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 1, 1
  LObj  LO::S_M_ARROW_DOWN,   0, 2
  LObjN LO::R_FG_GLASS_RED,   0, 6, 2, 8
  LObj  LO::S_M_ARROW_LEFT,   0, 10
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 0, 3
  LObj  LO::S_DOOR,           1, 4
  LWriteCol 10, 22
  LObjN LO::R_FG_GLASS_RED,   1, 6, 3, 0
  LObj  LO::S_W_ARROW_DOWN,   2, 5
  LObj  LO::S_FG_GLASS_RED,   0, 9
  LObj  LO::S_DOOR,           1, 4
  LWriteCol $21, LevelId::Final6C
  LObjN LO::R_BG_GLASS_RED,   0, 7, 0, 7
  .byt LSpecialCmd, LevelSpecialConfig::STARS
  LFinished

final6bSprite:
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,   7,   8, 3
  LSpr Enemy::GOOMBA,              1,  13,  12
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  14,   9, 2
  LSpr Enemy::CHECKPOINT,          0,  21,   6
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  25,   8, 1
  LSpr Enemy::CHECKPOINT,          0,  35,   5
  LSpr Enemy::ELECTRIC_FAN,        0,  37,   8
  .byt 255 ; end
