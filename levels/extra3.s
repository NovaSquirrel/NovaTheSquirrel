extra3:
  .byt MusicTracks::WORLD_3|0
  .byt 88
  .byt $3a
  .byt GraphicsUpload::SP_MINES
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_RONALD
  .byt GraphicsUpload::SP_BOOMERANG
  .addr extra3Data
  .addr extra3Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $11, $11 ; boundaries
  .byt $03, $04 ; link
  .byt $03, $c4 ; link
  .byt $03, $c4 ; link
  .byt $03, $c0 ; link

extra3Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <SherwinEpilogue, >SherwinEpilogue
  LObjN LO::TALL_1,           15, 11, 3, LN1::LADDER
  LObjN LO::R_GROUND,         1, 11, 8, 3
  LObjN LO::R_GROUND,         9, 13, 9, 1
  LObjN LO::WIDE_2,           7, 12, 2, LN2::FLOWER
  LObjN LO::R_COIN,           5, 11, 7, 1
  LObjN LO::R_CEILING_BARRIER,7, 0, 0, 2
  LObjN LO::R_GROUND,         1, 0, 3, 2
  LObjN LO::R_GROUND,         1, 3, 2, 4
  LObjN LO::WIDE_1,           0, 12, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         2, 8, 15, 1
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORCE_LEFT, (11<<4)|0
  LObjN LO::R_GROUND,         0, 12, 11, 2
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_PRIZE,          0, 3
  LWriteCol InventoryItem::ABILITY_FIRE
  LObjN LO::WIDE_1,           0, 6, 1, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::KEY_RED
  LObjN LO::WIDE_1,           5, 8, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 9, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_SNOWMAN,         3, 6
  LObj  LO::S_SNOWMAN,         2, 6
  LObjN LO::R_GROUND,         0, 9, 3, 5
  LObj  LO::S_SNOWMAN,         2, 6
  LObjN LO::R_GROUND,         9, 5, 4, 1
  LObj  LO::S_GROUND_CLIMB_L, 3, 4
  LObjN LO::R_GROUND,         1, 4, 4, 1
  LObjN LO::R_GROUND,         1, 6, 8, 1
  LObj  LO::S_BIGHEART,       1, 3
  LObjN LO::TALL_1,           2, 0, 3, LN1::LADDER
  LObjN LO::R_SOLID_BLOCK,    1, 0, 6, 0
  LObjN LO::R_COIN,           1, 3, 3, 1
  LObjN LO::WIDE_2,           1, 5, 2, LN2::FLOWER
  LObjN LO::TALL_1,           1, 12, 2, LN1::LADDER
  LObjN LO::R_GROUND,         1, 12, 8, 2
  LObjN LO::TALL_1,           1, 6, 5, LN1::LADDER
  LObjN LO::R_ROCK,           2, 0, 11, 1
  LObj  LO::S_BIGHEART,       3, 9
  LObjN LO::WIDE_2,           3, 10, 2, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 11, 3, 3
  LObjN LO::R_GROUND,         4, 10, 5, 4
  LObjN LO::TALL_2,           1, 2, 7, LN2::TRUNK
  LObj  LO::S_SPRING,         4, 9
  LObjN LO::WIDE_1,           2, 6, 3, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       4, 3
  LObjN LO::R_GROUND,         0, 6, 8, 2
  LObjN LO::R_ROCK,           0, 9, 6, 1
  LObjN LO::TALL_2,           0, 11, 3, LN2::TRUNK
  LObj  LO::S_BIGHEART,       1, 2
  LObj  LO::S_BIGHEART,       1, 3
  LObjN LO::WIDE_2,           0, 5, 2, LN2::FLOWER
  LObj  LO::S_BIGHEART,       1, 2
  LObjN LO::R_ROCK,           1, 0, 15, 1
  LObjN LO::R_ROCK,           2, 8, 2, 1
  LObjN LO::R_ROCK,           2, 2, 4, 2
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::LOCK_RED, (4<<4)|0
  LObjN LO::R_GROUND,         1, 6, 6, 1
  LObj  LO::S_EXIT_DOOR,      5, 4
  LObjN LO::R_GROUND,         2, 2, 1, 4
  LObjN LO::R_SOLID_BLOCK,    5, 2, 3, 0
  LObjN LO::TALL_2,           0, 3, 1, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 5, 3, 1
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::KEY_RED
  LObjN LO::R_GROUND,         0, 7, 0, 1
  LObj  LO::S_BIGHEART,       1, 3
  LObj  LO::S_GROUND,         0, 7
  LObjN LO::TALL_2,           1, 3, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 5, 0, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         6, 13, Metatiles::FORCE_UP, (0<<4)|1
  LObjN LO::WIDE_2,           1, 12, 2, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObj  LO::S_BIGHEART,       3, 11
  LObjN LO::R_GROUND,         1, 6, 6, 1
  LObjN LO::R_ROCK,           0, 8, 6, 1
  LObjN LO::TALL_1,           3, 0, 5, LN1::LADDER
  LObjN LO::R_ROCK,           1, 0, 8, 2
  LObjN LO::TALL_1,           2, 13, 1, LN1::LADDER
  LObjN LO::R_GROUND,         1, 6, 1, 2
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::S_BIGHEART,       1, 4
  LObj  LO::S_GROUND,         1, 7
  LObjN LO::R_SOLID_BLOCK,    0, 12, 1, 0
  LObjN LO::WIDE_1,           1, 7, 3, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::R_ROCK,           3, 0, 9, 1
  LObjN LO::R_GROUND,         1, 7, 6, 1
  LObjN LO::R_ROCK,           0, 9, 6, 1
  LObjN LO::TALL_2,           0, 11, 1, LN2::TRUNK
  LObjN LO::TALL_2,           1, 2, 4, LN2::TRUNK
  LObjN LO::R_COIN,           0, 11, 4, 1
  LObjN LO::WIDE_2,           3, 6, 2, LN2::FLOWER
  LObjN LO::TALL_2,           2, 11, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 4, 3, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_BIGHEART,       1, 3
  LObjN LO::R_GROUND,         1, 12, 3, 2
  LObjN LO::R_GROUND,         2, 4, 10, 3
  LObjN LO::WIDE_1,           2, 4, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_AIR,            0, 5, 0, 0
  LObjN LO::WIDE_1,           0, 12, 1, LN1::FALLTHROUGH_LEDGE
  LObjN LO::TALL_2,           1, 0, 3, LN2::TRUNK
  LObjN LO::R_AIR,            0, 5, 3, 0
  LObjN LO::TALL_1,           1, 12, 2, LN1::LADDER
  LObjN LO::R_GROUND,         1, 8, 5, 4
  LObjN LO::WIDE_1,           2, 4, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_AIR,            0, 5, 0, 0
  LObjN LO::WIDE_2,           1, 3, 2, LN2::FLOWER
  LObjN LO::R_SOLID_BLOCK,    3, 7, 2, 0
  LObj  LO::S_SOLID_BLOCK,    0, 8
  LObjN LO::R_GROUND,         0, 9, 5, 3
  LObj  LO::S_BIGHEART,       1, 6
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::KEY_RED
  LObj  LO::S_SOLID_BLOCK,    1, 8
  LObj  LO::R_CUSTOM,         10, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObj  LO::R_CUSTOM,         11, 0, Metatiles::FORCE_UP, (0<<4)|10
  LObjN LO::R_GROUND,         1, 0, 4, 2
  LObjN LO::R_GROUND,         0, 3, 2, 0
  LObjN LO::R_ROCK,           0, 4, 2, 3
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::FORCE_LEFT, (9<<4)|0
  LObjN LO::WIDE_2,           3, 4, 0, LN2::GRAY_BRICKS
  LObjN LO::WIDE_3,           0, 8, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObjN LO::R_CEILING_BARRIER,0, 9, 15, 0
  LObjN LO::R_CEILING_BARRIER,1, 7, 15, 0
  LObjN LO::WIDE_3,           0, 8, 15, LN3::MINE_TRACKS
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObjN LO::WIDE_1,           3, 5, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::TALL_1,           3, 0, 4, LN1::LADDER
  LObjN LO::R_SOLID_BLOCK,    0, 5, 15, 0
  LObjN LO::WIDE_3,           0, 8, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 19
  LObjN LO::R_ICE2,            1, 2, 9, 2
  LObj  LO::S_CUSTOM,         4, 6, Metatiles::KEY_RED
  LObjN LO::R_CEILING_BARRIER,3, 9, 15, 0
  LObjN LO::R_CEILING_BARRIER,1, 7, 15, 0
  LObjN LO::WIDE_3,           0, 8, 15, LN3::MINE_TRACKS
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObj  LO::S_CUSTOM,         3, 3, Metatiles::KEY_RED
  LObjN LO::R_SOLID_BLOCK,    2, 2, 0, 2
  LObjN LO::R_ROCK,           1, 2, 4, 3
  LObjN LO::R_GROUND,         5, 4, 4, 1
  LObj  LO::S_BIGHEART,       1, 2
  LObjN LO::TALL_1,           1, 0, 3, LN1::LADDER
  LObjN LO::WIDE_1,           2, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,           1, 8, 1, LN3::MINE_TRACKS
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObjN LO::TALL_1,           2, 6, 6, LN1::LADDER
  .byt LSpecialCmd, LevelSpecialConfig::FROZEN_CAVE
  .byt LSpecialCmd, LevelSpecialConfig::ANIMATED_WATER
  LFinished

extra3Sprite:
  LSpr Enemy::BALL_GUY,            0,  17,  10
  LSpr Enemy::BALL_GUY,            1,  22,  10
  LSpr Enemy::RONALD,              0,  24,  10
  LSpr Enemy::BALL_GUY,            1,  27,  12
  LSpr Enemy::BALL_GUY,            1,  33,  12
  LSpr Enemy::ICE_1,               0,  72,   4
  LSpr Enemy::ICE_1,               0,  76,   3
  LSpr Enemy::ICE_1,               0,  80,   5
  LSpr Enemy::BOOMERANG_GUY,       1, 100,   9, 1
  LSpr Enemy::BOOMERANG_GUY,       1, 106,   5, 1
  LSpr Enemy::ICE_1,               0, 144,   5, 2
  LSpr Enemy::CANNON_1,            1, 158,   4
  LSpr Enemy::BOOMERANG_GUY,       1, 161,   6
  LSpr Enemy::ICE_1,               1, 174,   3, 2
  LSpr Enemy::CANNON_1,            1, 188,   5, 1
  LSpr Enemy::CANNON_1,            1, 189,   3, 1
  LSpr Enemy::MINECART,            0, 207,   3
  LSpr Enemy::COLLECTIBLE,         0, 221,  11
  .byt 255 ; end
