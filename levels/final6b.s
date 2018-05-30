final6b:
  .byt MusicTracks::WORLD_5|0
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
  .byt GraphicsUpload::PAL_ENEMY5
  .byt 255 ; end
  .byt $01, $00 ; boundaries

final6bData:
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_GROUND,         3, 3, 3, 4
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 4
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_W_ARROW_RIGHT,  2, 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 4
  LObjN LO::R_BG_GLASS_BLUE,  1, 3, 8, 0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_OFF, (8<<4)|0
  LObjN LO::R_COIN,           1, 6, 6, 0
  LObjN LO::R_BG_GLASS_RED,   0, 9, 4, 0
  LObjN LO::R_BG_GLASS_RED,   1, 8, 0, 2
  LObjN LO::R_BG_GLASS_RED,   1, 10, 0, 1
  LObjN LO::R_BG_GLASS_RED,   1, 8, 0, 2
  LObj  LO::S_SPRING,         4, 12
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
  LObjN LO::R_FG_GLASS_RED,   1, 6, 5, 0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_SWITCH, (3<<4)|0
  LObjN LO::R_FG_GLASS_RED,   0, 8, 3, 0
  LObj  LO::S_SIGNPOST,       1, 5
  LWriteCol <AboutGliderToggle, >AboutGliderToggle
  LObjN LO::R_BG_GLASS_RED,   0, 11, 3, 0
  LObjN LO::R_BG_GLASS_RED,   0, 12, 0, 2
  LObj  LO::S_PRIZE,          2, 3
  LWriteCol InventoryItem::ABILITY_GLIDER | 128
  LObjN LO::R_FG_GLASS_RED,   0, 9, 1, 0
  LObj  LO::R_CUSTOM,         2, 0, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|5
  LObjN LO::R_BG_GLASS_RED,   0, 7, 0, 7
  LObj  LO::S_FG_GLASS_BLUE,  1, 9
  LObjN LO::R_BG_GLASS_GRAY,  3, 1, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 2, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 3, 2, 0
  LObjN LO::R_BG_GLASS_RED,   0, 4, 2, 0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_SWITCH, (2<<4)|0
  LObjN LO::R_BG_GLASS_RED,   0, 10, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 11, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 12, 2, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 13, 2, 0
  LObjN LO::R_SOLID_ROCK,     5, 0, 0, 5
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|3
  LObjN LO::R_SOLID_ROCK,     0, 10, 0, 4
  LObjN LO::R_BG_GLASS_GRAY,  3, 1, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 2, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 3, 2, 0
  LObjN LO::R_BG_GLASS_RED,   0, 4, 2, 0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_SWITCH, (2<<4)|0
  LObjN LO::R_BG_GLASS_RED,   0, 10, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 11, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 12, 2, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 13, 2, 0
  LObjN LO::R_SOLID_ROCK,     5, 0, 0, 5
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|3
  LObjN LO::R_SOLID_ROCK,     0, 10, 0, 4
  LObj  LO::R_CUSTOM,         1, 10, Metatiles::TOGGLE_SWITCH, (3<<4)|0
  LObjN LO::R_BG_GLASS_RED,   0, 11, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 12, 3, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 13, 3, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 14, 3, 0
  LObjN LO::R_BG_GLASS_GRAY,  1, 1, 6, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 2, 6, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 3, 6, 0
  LObjN LO::R_BG_GLASS_RED,   0, 4, 6, 0
  LObjN LO::R_BG_GLASS_RED,   3, 10, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 11, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 12, 2, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 13, 2, 0
  LObj  LO::S_SPRING,         1, 9
  LObj  LO::R_CUSTOM,         1, 6, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|3
  LObj  LO::R_CUSTOM,         2, 6, Metatiles::FORCE_DOWN, (0<<4)|8
  LObjN LO::R_SOLID_ROCK,     1, 5, 2, 0
  LObjN LO::R_SOLID_ROCK,     0, 6, 0, 8
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::ABILITY_GLIDER | 128
  LObjN LO::R_FG_GLASS_RED,   1, 13, 13, 1
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::FORCE_DOWN, (0<<4)|2
  LObj  LO::R_CUSTOM,         1, 0, Metatiles::FORCE_DOWN, (0<<4)|6
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::FORCE_LEFT
  LObjN LO::R_SOLID_ROCK,     1, 0, 0, 7
  LObj  LO::S_GLIDER_BLOCK,   2, 5
  LObj  LO::S_SOLID_BLOCK,    0, 8
  LObjN LO::R_BG_GLASS_RED,   0, 9, 0, 3
  LObj  LO::S_GLIDER_BLOCK,   2, 3
  LObjN LO::WIDE_1,           1, 11, 0, LN1::SOLID_LEDGE
  LObj  LO::S_BG_GLASS_GREEN, 1, 9
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObjN LO::R_BG_GLASS_RED,   0, 11, 0, 1
  LObj  LO::S_GLIDER_BLOCK,   1, 4
  LObj  LO::S_GLIDER_BLOCK,   2, 3
  LObj  LO::S_SOLID_BLOCK,    0, 6
  LObjN LO::R_BG_GLASS_RED,   0, 7, 0, 5
  LObjN LO::R_BG_GLASS_GRAY,  2, 1, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 2, 4, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 3, 4, 0
  LObjN LO::R_BG_GLASS_RED,   0, 4, 4, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 13, 13, 1
  LObj  LO::S_BG_GLASS_GREEN, 2, 7
  LObj  LO::S_SOLID_BLOCK,    0, 8
  LObjN LO::R_SOLID_BLOCK,    1, 7, 0, 1
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 3
  LObjN LO::WIDE_1,           1, 12, 3, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    2, 0, 0, 3
  LObjN LO::R_BG_GLASS_GRAY,  1, 3, 2, 0
  LObj  LO::R_CUSTOM,         1, 5, Metatiles::GLIDER_BLOCK, (0<<4)|1
  LObjN LO::R_FG_GLASS_RED,   0, 7, 2, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 2, 4
  LObjN LO::R_FG_GLASS_RED,   0, 9, 2, 0
  LObjN LO::R_FG_GLASS_RED,   0, 11, 2, 0
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 2
  LObj  LO::S_PRIZE,          1, 4
  LWriteCol InventoryItem::ABILITY_GLIDER | 128
  LObj  LO::S_BIGHEART,       0, 6
  LObjN LO::WIDE_1,           1, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::PICKUP_BLOCK
  LObj  LO::S_SPRING,         1, 10
  LObjN LO::WIDE_1,           0, 11, 0, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         2, 6, Metatiles::CLONE_SWITCH
  LWriteCol 102
  LObj  LO::S_SOLID_BLOCK,    0, 7
  LObjN LO::R_BG_GLASS_GRAY,  0, 8, 0, 4
  LObjN LO::R_FG_GLASS_RED,   0, 13, 13, 1
  LObjN LO::R_BG_GLASS_RED,   4, 1, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 3, 0, 3
  LObjN LO::R_BG_GLASS_RED,   1, 0, 0, 2
  LObj  LO::S_CUSTOM,         0, 1, Metatiles::CLONER
  LWriteCol Enemy::BUDDY * 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 3, 5, 0
  LObj  LO::S_CUSTOM,         0, 4, Metatiles::CAMPFIRE
  LObjN LO::WIDE_1,           0, 5, 5, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_BLUE,  0, 6, 5, 0
  LObj  LO::S_CUSTOM,         3, 4, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_CUSTOM,         2, 4, Metatiles::CAMPFIRE
  LObjN LO::R_BG_GLASS_BLUE,  1, 3, 0, 3
  LObj  LO::S_W_CRATE,        2, 6
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::R_FG_GLASS_BLUE,  0, 13, 13, 1
  LObj  LO::S_W_CRATE,        1, 4
  LObjN LO::WIDE_1,           0, 10, 1, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObjN LO::WIDE_1,           0, 3, 0, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 1
  LObj  LO::S_CUSTOM,         0, 2, Metatiles::LOCK_GREEN
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::TOGGLE_BLOCK_ON, (13<<4)|0
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::FORCE_RIGHT, (12<<4)|0
  LObjN LO::R_FG_GLASS_BLUE,  0, 10, 10, 0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_OFF, (4<<4)|1
  LObjN LO::R_COIN,           1, 2, 10, 0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|1
  LObj  LO::R_CUSTOM,         2, 11, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|1
  LObj  LO::R_CUSTOM,         2, 9, Metatiles::PICKUP_BLOCK, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|1
  LObjN LO::WIDE_1,           1, 10, 0, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::KEY_GREEN
  LObjN LO::R_FG_GLASS_BLUE,  1, 11, 3, 1
  LObjN LO::WIDE_1,           1, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  1, 5, 0, 1
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::LOCK_BLUE
  LObjN LO::R_GROUND,         0, 8, 1, 1
  LObjN LO::R_FG_GLASS_BLUE,  1, 5, 1, 0
  LObj  LO::S_DOOR,           1, 6
  LWriteCol $21, LevelId::Final6C
  LObjN LO::R_GROUND,         0, 8, 1, 6
  LObjN LO::R_FG_GLASS_BLUE,  1, 5, 0, 2
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::KEY_BLUE
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::FORCE_DOWN, (0<<4)|10
  .byt LSpecialCmd, LevelSpecialConfig::STARS
  LFinished

final6bSprite:
  LSpr Enemy::BOOMERANG_GUY,       0,   3,   2, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,   7,   8, 3
  LSpr Enemy::GOOMBA,              1,  13,  12
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  14,   9, 2
  LSpr Enemy::CHECKPOINT,          0,  21,   6
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  25,   8, 1
  LSpr Enemy::CHECKPOINT,          0,  35,   5
  LSpr Enemy::ELECTRIC_FAN,        0,  39,   8
  LSpr Enemy::CHECKPOINT,          0,  67,   4
  LSpr Enemy::BOOMERANG_GUY,       0,  73,  12
  LSpr Enemy::ELECTRIC_FAN,        0,  74,   4
  LSpr Enemy::ELECTRIC_FAN,        1,  76,   2
  LSpr Enemy::ELECTRIC_FAN,        1,  79,   3
  LSpr Enemy::ELECTRIC_FAN,        0,  81,   2
  LSpr Enemy::BOOMERANG_GUY,       0,  84,  12, 1
  LSpr Enemy::CHECKPOINT,          0,  95,   6
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  98,   7, 3
  LSpr Enemy::BOOMERANG_GUY,       0,  99,  12, 0
  LSpr Enemy::BOOMERANG_GUY,       0, 104,  12, 0
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 105,   9, 3
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 109,  10, 3
  .byt 255 ; end
