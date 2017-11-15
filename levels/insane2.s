insane2:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_WIND
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_CANNON
  .addr insane2Data
  .addr insane2Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY3
  .byt 255 ; end
  .byt $00, $02 ; boundaries

insane2Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <AfterFirstBattle, >AfterFirstBattle
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 39
  LObjN LO::R_BG_GLASS_GRAY,  3, 10, 0, 2
  LObjN LO::R_BG_GLASS_GRAY,  1, 10, 2, 0
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 4, 9, 0
  LObjN LO::R_COIN,           1, 3, 2, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 5, 0, 7
  LSetX 9
  LWriteCol Metatiles::SPRING
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::REPLACE_BRICK
  LObjN LO::R_FG_GLASS_BLUE,  2, 5, 4, 1
  LObjN LO::R_BG_GLASS_BLUE,  0, 7, 4, 2
  LObjN LO::R_GROUND,         0, 10, 4, 2
  LObjN LO::R_COIN,           2, 3, 2, 0
  LObj  LO::R_CUSTOM,         3, 6, Metatiles::PICKUP_BLOCK, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::PICKUP_BLOCK, (2<<4)|2
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::KEY_GREEN
  LObj  LO::S_BIGHEART,       1, 4
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 11
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::LOCK_GREEN
  LObj  LO::R_CUSTOM,         3, 3, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LSetX 24
  LWriteCol Enemy::ELECTRIC_FAN
  LObjN LO::R_AIR,            0, 13, 0, 1
  LObjN LO::R_CEILING_BARRIER,5, 0, 0, 2
  LObjN LO::R_CEILING_BARRIER,0, 4, 6, 0
  LObjN LO::WIDE_1,           0, 11, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 7, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 5, 0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObjN LO::R_BG_GLASS_BLUE,  1, 1, 5, 0
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_BIGHEART,       1, 7
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::PICKUP_BLOCK, (2<<4)|1
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         1, 10, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObj  LO::S_CUSTOM,         1, 11, Metatiles::KEY_RED
  LObjN LO::R_GROUND,         1, 4, 3, 8
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::LOCK_RED
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::R_BG_GLASS_RED,   3, 7, 0, 5
  LObjN LO::R_COIN,           2, 3, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 7, 0, 5
  LObjN LO::R_BG_GLASS_BLUE,  2, 7, 0, 5
  LObjN LO::R_BG_GLASS_RED,   2, 7, 0, 5
  LObjN LO::R_BG_GLASS_GREEN, 2, 7, 0, 5
  LObjN LO::R_COIN,           1, 3, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 7, 0, 5
  LObjN LO::R_SOLID_ROCK,     4, 6, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 7, 0, 7
  LObj  LO::S_DOOR,           1, 8
  LWriteCol 6, 247
  LObjN LO::R_SOLID_ROCK,     0, 10, 1, 0
  LObjN LO::WIDE_1,           1, 6, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_BG_GLASS_GREEN, 1, 7, 0, 7
  LObjN LO::R_GROUND,         1, 5, 2, 9
  LObjN LO::R_SOLID_BLOCK,    2, 3, 0, 1
  LObjN LO::TALL_2,           2, 3, 7, LN2::PATH_LINE
  LObjN LO::R_SOLID_ROCK,     2, 11, 4, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 12, 0, 2
  LObj  LO::S_SIGNPOST,       1, 10
  LWriteCol <AboutFireWind, >AboutFireWind
  LObjN LO::WIDE_1,           2, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_GRAY,  1, 3, 2, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 4, 0, 6
  LObjN LO::R_BG_GLASS_GRAY,  0, 12, 0, 2
  LObjN LO::WIDE_1,           2, 11, 5, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     1, 2, 3, 0
  LObjN LO::R_SOLID_ROCK,     0, 3, 0, 5
  LObjN LO::R_SOLID_ROCK,     0, 9, 3, 0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::CAMPFIRE, (4<<4)|0
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 1, 5
  LObjN LO::R_SOLID_ROCK,     2, 3, 0, 5
  LObjN LO::R_BG_GLASS_GRAY,  1, 3, 15, 0
  LObjN LO::R_SOLID_ROCK,     2, 11, 4, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 12, 0, 2
  LObjN LO::TALL_1,           1, 6, 4, LN1::LADDER
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         2, 10
  LObjN LO::R_BG_GLASS_GRAY,  0, 12, 0, 2
  LObjN LO::R_SOLID_ROCK,     2, 8, 6, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 9, 0, 5
  LObjN LO::R_BG_GLASS_GRAY,  6, 9, 0, 5
  LObj  LO::S_BG_GLASS_GRAY,  2, 3
  LObjN LO::R_SOLID_ROCK,     1, 2, 3, 0
  LObjN LO::R_SOLID_ROCK,     0, 3, 0, 6
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 1, 5
  LObjN LO::R_SOLID_ROCK,     0, 9, 1, 0
  LObjN LO::R_SOLID_ROCK,     2, 3, 0, 6
  LSetX 241
  LObjN LO::TALL_2,           0, 2, 10, LN2::PATH_LINE
  LObjN LO::R_COIN,           1, 1, 10, 0
  LObjN LO::WIDE_2,           0, 2, 10, LN2::PATH_LINE
  LObjN LO::R_COIN,           0, 11, 10, 0
  LObjN LO::WIDE_2,           0, 12, 10, LN2::PATH_LINE
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObj  LO::S_BG_GLASS_GRAY,  0, 4
  LObjN LO::R_FG_GLASS_BLUE,  0, 5, 9, 0
  LObjN LO::R_COIN,           0, 6, 2, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 9, 0
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GRAY,  0, 10
  LObjN LO::R_BG_GLASS_GRAY,  1, 3, 8, 1
  LObj  LO::S_BG_GLASS_GREEN, 0, 4
  LObjN LO::R_BG_GLASS_GRAY,  0, 9, 8, 1
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObj  LO::S_DOOR,           0, 6
  LWriteCol 8, 56
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObjN LO::R_COIN,           0, 6, 2, 1
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObjN LO::TALL_2,           1, 2, 10, LN2::PATH_LINE
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::STARS
  LFinished

insane2Sprite:
  LSpr Enemy::BIG_LWSS,            0,   3,   7, 1
  LSpr Enemy::BOOMERANG_GUY,       0,  11,   3, 1
  LSpr Enemy::CANNON_2,            0,  24,   0, 2
  LSpr Enemy::ELECTRIC_FAN,        0,  24,   2
  LSpr Enemy::BIG_GLIDER,          1,  33,   5
  LSpr Enemy::CHECKPOINT,          0,  60,   3
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  63,   3
  LSpr Enemy::ELECTRIC_FAN,        0,  68,   7
  LSpr Enemy::CLOUD,               0,  77,   7
  LSpr Enemy::ELECTRIC_FAN,        1,  81,   5
  LSpr Enemy::CLOUD,               1,  89,   5
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 241,   7
  .byt 255 ; end
