frozen5:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fa
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_WIND
  .byt GraphicsUpload::SP_MINES
  .addr frozen5Data
  .addr frozen5Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt GraphicsUpload::BG_CHIP
  .byt 255 ; end
  .byt $00, $00 ; boundaries

frozen5Data:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::FROZEN_CAVE
  LObjN LO::RECT_3,           0, 0, 2, LN3::ROCK, 32
  LObjN LO::R_ROCK,           0, 12, 5, 2
  LObjN LO::WIDE_1,           1, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 7, 0, 1
  LObjN LO::WIDE_1,           1, 7, 4, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::PICKUP_BLOCK
  LObj  LO::S_PRIZE,          0, 9
  LWriteCol InventoryItem::ABILITY_BACKUP
  LObj  LO::S_SIGNPOST,       1, 11
  LWriteCol <AboutPickupBlock, >AboutPickupBlock
  LObjN LO::R_ROCK,           1, 3, 1, 3
  LObjN LO::WIDE_1,           0, 12, 5, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (5<<4)|1
  LObj  LO::S_FLOWER,         6, 7
  LObjN LO::R_GROUND,         0, 8, 4, 6
  LObjN LO::R_COIN,           1, 6, 1, 0
  LObjN LO::WIDE_1,           0, 7, 3, LN1::TALLGRASS
  LObj  LO::S_PRIZE,          3, 5
  LWriteCol InventoryItem::BLOCK | 128
  LObjN LO::WIDE_1,           1, 10, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (11<<4)|1
  LObj  LO::S_CUSTOM,         1, 11, Metatiles::PUSHABLE_BLOCK
  LObj  LO::S_SOLID_BLOCK,    0, 12
  LObjN LO::R_ROCK,           2, 9, 3, 1
  LObjN LO::R_SOLID_BLOCK,    0, 12, 6, 0
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::PICKUP_BLOCK
  LObj  LO::S_BIGHEART,       1, 11
  LObjN LO::R_COIN,           1, 11, 1, 0
  LObjN LO::R_ROCK,           1, 3, 1, 7
  LObjN LO::R_ROCK,           2, 3, 0, 4
  LObjN LO::R_ROCK,           1, 3, 0, 2
  LObjN LO::WIDE_1,           0, 11, 0, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 3, 2, 0
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::PICKUP_BLOCK
  LObjN LO::RECT_1,           0, 11, 3, LN1::GROUND, 16
  LObjN LO::WIDE_1,           1, 10, 0, LN1::FENCE
  LObjN LO::TALL_1,           1, 6, 4, LN1::LADDER
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 20
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::PICKUP_BLOCK
  LObjN LO::R_SOLID_BLOCK,    1, 2, 0, 3
  LObj  LO::S_SNOWMAN,         6, 5
  LObjN LO::R_ROCK,           0, 7, 5, 3
  LObjN LO::WIDE_1,           1, 6, 3, LN1::TALLGRASS
  LObjN LO::R_COIN,           1, 5, 2, 0
  LObjN LO::R_GROUND,         8, 7, 9, 3
  LObjN LO::R_ROCK,           0, 11, 3, 3
  LObjN LO::WIDE_2,           3, 6, 3, LN2::FLOWER
  LObjN LO::R_ROCK,           1, 0, 14, 2
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObjN LO::WIDE_1,           3, 7, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_AIR,            0, 8, 2, 0
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::PUSHABLE_BLOCK
  LObjN LO::R_ROCK,           0, 11, 2, 1
  LObjN LO::R_ROCK,           2, 9, 2, 1
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::PICKUP_BLOCK
  LObjN LO::R_GROUND,         0, 11, 8, 1
  LObj  LO::S_HEART,          3, 5
  LObjN LO::WIDE_1,           0, 6, 0, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 3, 0, 1
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::LOCK_GREEN
  LObjN LO::R_SOLID_BLOCK,    0, 6, 4, 0
  LObj  LO::S_CUSTOM,         1, 10, Metatiles::PICKUP_BLOCK
  LObj  LO::S_BIGHEART,       1, 4
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::KEY_RED
  LObjN LO::R_ROCK,           2, 0, 13, 4
  LObj  LO::S_SOLID_BLOCK,    0, 5
  LObjN LO::R_ROCK,           1, 9, 4, 5
  LObjN LO::R_COIN,           1, 6, 2, 1
  LObjN LO::WIDE_1,           4, 13, 0, LN1::SPIKES
  LObjN LO::R_ROCK,           0, 14, 0, 0
  LObjN LO::R_ROCK,           1, 5, 1, 5
  LObjN LO::WIDE_1,           0, 12, 4, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           2, 5, 2, 2
  LObj  LO::S_MTRACK_STOP,     0, 11
  LObjN LO::WIDE_3,           1, 11, 2, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 12, 0, 2
  LObj  LO::S_MTRACK_SSL,      1, 11
  LObjN LO::R_ROCK,           1, 0, 3, 2
  LObj  LO::S_MTRACK_SSL,      0, 10
  LObjN LO::WIDE_1,           0, 13, 2, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK_SSL,      1, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObjN LO::R_ROCK,           1, 0, 11, 1
  LObjN LO::WIDE_3,           0, 6, 5, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 7, 0, 7
  LObjN LO::R_GROUND,         3, 7, 2, 7
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::KEY_GREEN
  LObj  LO::S_MTRACK_BUMP,     1, 6
  LObjN LO::WIDE_1,           1, 7, 3, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    3, 3, 0, 3
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::LOCK_RED
  LObjN LO::R_SOLID_BLOCK,    0, 3, 2, 0
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_ROCK,           1, 11, 2, 3
  LObjN LO::R_SOLID_BLOCK,    1, 3, 0, 7
  LObj  LO::R_CUSTOM,         1, 3, Metatiles::PICKUP_BLOCK, (3<<4)|4
  LObjN LO::WIDE_1,           1, 11, 7, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           1, 12, 5, 0
  LObjN LO::WIDE_1,           1, 10, 0, LN1::USED_PRIZE
  LObjN LO::R_SOLID_BLOCK,    1, 3, 1, 4
  LObj  LO::S_PRIZE,          0, 10
  LWriteCol InventoryItem::ABILITY_WATER | 128
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_1,           0, 10, 0, LN1::USED_PRIZE
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 7
  LObjN LO::TALL_2,           0, 8, 2, LN2::TRUNK
  LObjN LO::RECT_3,           1, 0, 2, LN3::ROCK, 21
  LObjN LO::R_GROUND,         2, 7, 4, 7
  LObjN LO::WIDE_1,           2, 6, 0, LN1::FENCE
  LObjN LO::R_GROUND,         3, 10, 2, 4
  LObjN LO::WIDE_1,           3, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_ROCK,     3, 9
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObjN LO::WIDE_2,           1, 9, 2, LN2::FLOWER
  LObj  LO::S_BIGHEART,       1, 4
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           2, 3, 4, 1
  LObjN LO::R_ROCK,           1, 9, 3, 5
  LObj  LO::S_CUSTOM,         3, 8, Metatiles::PUSHABLE_BLOCK
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_3,            0, 7, 2, LN3::FROZEN_CRACK
  LObjN LO::WIDE_1,           0, 9, 6, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (6<<4)|1
  LObjN LO::WIDE_3,            1, 4, 2, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,            0, 11, 2, LN3::FROZEN_CRACK
  LObjN LO::R_COIN,           1, 6, 7, 0
  LObjN LO::R_ROCK,           1, 1, 6, 1
  LObjN LO::WIDE_3,            0, 10, 2, LN3::FROZEN_CRACK
  LObjN LO::R_ROCK,           1, 0, 7, 1
  LObjN LO::WIDE_3,            0, 5, 2, LN3::FROZEN_CRACK
  LObjN LO::R_ROCK,           3, 9, 3, 5
  LObjN LO::R_GROUND,         4, 8, 4, 6
  LObjN LO::R_COIN,           5, 1, 3, 1
  LObjN LO::WIDE_1,           0, 3, 0, LN1::FENCE
  LObjN LO::R_GROUND,         0, 4, 3, 10
  LObj  LO::R_CUSTOM,         4, 7, Metatiles::PICKUP_BLOCK, (0<<4)|1
  LObjN LO::R_GROUND,         0, 9, 10, 5
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::R_ROCK,           1, 0, 15, 1
  LObjN LO::R_ROCK,           1, 2, 13, 0
  LObjN LO::WIDE_3,           1, 8, 4, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           1, 3, 9, 0
  LObj  LO::S_MTRACK_SSL,      4, 8
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (12<<4)|2
  LObjN LO::WIDE_3,            1, 5, 1, LN3::FROZEN_CRACK
  LObj  LO::S_MTRACK,         0, 6
  LObjN LO::WIDE_3,            0, 10, 1, LN3::FROZEN_CRACK
  LObjN LO::WIDE_1,           1, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,           2, 6, 4, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,            1, 4, 2, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,            1, 9, 2, LN3::FROZEN_CRACK
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::WIDE_3,            1, 2, 2, LN3::FROZEN_CRACK
  LObj  LO::S_MTRACK_SSL,      0, 6
  LObj  LO::S_MTRACK_SSL,      1, 5
  LObjN LO::WIDE_3,            0, 7, 1, LN3::FROZEN_CRACK
  LObj  LO::S_MTRACK_SSL,      1, 4
  LObjN LO::WIDE_3,           1, 3, 1, LN3::MINE_TRACKS
  LObjN LO::R_GROUND,         1, 4, 5, 10
  LObjN LO::WIDE_2,           2, 3, 2, LN2::FLOWER
  LObjN LO::WIDE_1,           5, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_FLOWER,         1, 4
  LObjN LO::R_SOLID_BLOCK,    0, 5, 0, 9
  LObjN LO::R_COIN,           1, 1, 1, 1
  LObjN LO::WIDE_1,           3, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_FLOWER,         1, 6
  LObjN LO::R_SOLID_BLOCK,    0, 7, 0, 7
  LObjN LO::R_COIN,           1, 3, 1, 1
  LObjN LO::R_GROUND,         3, 8, 5, 6
  LObjN LO::R_COIN,           2, 5, 1, 1
  LObjN LO::WIDE_1,           5, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 6, 1, 1
  LObjN LO::R_SOLID_BLOCK,    0, 10, 0, 4
  LObjN LO::WIDE_1,           4, 11, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 9, 1, 1
  LObjN LO::R_SOLID_BLOCK,    0, 11, 0, 3
  LObjN LO::R_GROUND,         4, 11, 5, 3
  LObjN LO::R_COIN,           1, 7, 1, 1
  LObjN LO::WIDE_1,           6, 12, 10, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 9, 1, 1
  LObjN LO::WIDE_1,           2, 13, 4, LN1::SOLID_LEDGE
  LObj  LO::S_EXIT_DOOR,      2, 10
  LObjN LO::R_SOLID_BLOCK,    0, 12, 0, 2
  LFinished

frozen5Sprite:
  LSpr Enemy::BIG_GLIDER,          0,   8,   3
  LSpr Enemy::BIG_GLIDER,          0,  12,   4
  LSpr Enemy::CLOUD,               1,  22,   7
  LSpr Enemy::BIG_GLIDER,          0,  26,   3
  LSpr Enemy::CLOUD,               1,  34,   7
  LSpr Enemy::CLOUD,               1,  37,   9
  LSpr Enemy::CLOUD,               1,  39,   5
  LSpr Enemy::BIG_LWSS,            0,  51,   3
  LSpr Enemy::CHECKPOINT,          0,  55,   5
  LSpr Enemy::BIG_LWSS,            0,  65,   7, 1
  LSpr Enemy::BIG_LWSS,            0,  68,   5, 1
  LSpr Enemy::MINECART,            0,  80,  11
  LSpr Enemy::BIG_GLIDER,          0,  83,   4
  LSpr Enemy::BIG_LWSS,            0,  93,   2
  LSpr Enemy::CLOUD,               1,  96,   4
  LSpr Enemy::BIG_GLIDER,          1,  97,   8, 1
  LSpr Enemy::CHECKPOINT,          0, 100,   2
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 103,  13, 6
  LSpr Enemy::CLOUD,               1, 123,   5
  LSpr Enemy::CLOUD,               1, 126,   6
  LSpr Enemy::THWOMP,              0, 134,   3
  LSpr Enemy::THWOMP,              0, 138,   3
  LSpr Enemy::THWOMP,              0, 141,   2
  LSpr Enemy::BIG_GLIDER,          1, 142,  13, 1
  LSpr Enemy::BIG_GLIDER,          1, 147,  12, 1
  LSpr Enemy::CHECKPOINT,          0, 149,   3
  LSpr Enemy::CLOUD,               0, 154,   5
  LSpr Enemy::MINECART,            0, 156,   8
  LSpr Enemy::CLOUD,               1, 161,   6
  LSpr Enemy::CLOUD,               0, 165,   4
  LSpr Enemy::CHECKPOINT,          0, 180,   3
  LSpr Enemy::BIG_GLIDER,          1, 186,   1
  LSpr Enemy::BIG_GLIDER,          1, 189,   3
  LSpr Enemy::BIG_GLIDER,          1, 193,   1
  LSpr Enemy::BIG_GLIDER,          1, 193,   5
  LSpr Enemy::BIG_GLIDER,          1, 196,   7
  LSpr Enemy::BIG_GLIDER,          1, 197,   3
  LSpr Enemy::BIG_GLIDER,          1, 200,   5
  LSpr Enemy::BIG_GLIDER,          1, 201,   1
  LSpr Enemy::BIG_GLIDER,          1, 202,   8
  LSpr Enemy::BIG_GLIDER,          1, 206,   6
  LSpr Enemy::BIG_GLIDER,          1, 208,   2
  LSpr Enemy::BIG_GLIDER,          1, 209,   5
  LSpr Enemy::BIG_GLIDER,          1, 210,   9
  LSpr Enemy::BIG_GLIDER,          1, 213,   4
  LSpr Enemy::BIG_GLIDER,          1, 213,   7
  LSpr Enemy::BIG_GLIDER,          1, 216,  10
  LSpr Enemy::BIG_GLIDER,          1, 217,   7
  LSpr Enemy::BIG_GLIDER,          1, 219,  11
  LSpr Enemy::BIG_GLIDER,          1, 221,   9
  .byt 255 ; end
