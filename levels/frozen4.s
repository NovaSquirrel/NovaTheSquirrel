frozen4:
  .byt MusicTracks::WORLD_3|0
  .byt 2
  .byt $fa
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_MINES
  .addr frozen4Data
  .addr frozen4Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt GraphicsUpload::BG_CHIP
  .byt 255 ; end
  .byt $00, $04 ; boundaries

frozen4Data:
  LObjN LO::R_ROCK,           0, 0, 7, 7
  LObjN LO::R_GROUND,         0, 12, 9, 2
  LObj  LO::S_FLOWER,         4, 11
  LObj  LO::S_FLOWER,         2, 11
  LObjN LO::R_ROCK,           2, 0, 14, 1
  LObjN LO::TALL_1,           0, 8, 3, LN1::LADDER
  LObj  LO::S_SPRING,         1, 7
  LObjN LO::WIDE_1,           0, 8, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_ROCK,           1, 4, 7, 3
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (2<<4)|1
  LObjN LO::WIDE_1,           1, 3, 0, LN1::FENCE
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 12, 9, 2
  LObjN LO::R_COIN,           1, 8, 2, 1
  LObjN LO::WIDE_1,           0, 11, 4, LN1::TALLGRASS
  LObjN LO::WIDE_1,           1, 3, 0, LN1::FENCE
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK
  LObj  LO::S_PRIZE,          3, 9
  LObjN LO::R_SOLID_BLOCK,    1, 9, 0, 2
  LObjN LO::WIDE_1,           1, 9, 3, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 13, Metatiles::LAVA_MAIN, (14<<4)|1
  LObjN LO::TALL_1,           1, 6, 2, LN1::LADDER
  LObj  LO::S_FROZENCRACK,     1, 3
  LObjN LO::WIDE_1,           0, 6, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,            0, 10, 1, LN3::FROZEN_CRACK
  LObj  LO::S_HEART,          0, 11
  LObjN LO::WIDE_3,            2, 1, 1, LN3::FROZEN_CRACK
  LObj  LO::S_SOLID_ROCK,     0, 6
  LObjN LO::WIDE_1,           0, 7, 6, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,            1, 4, 1, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,            1, 8, 2, LN3::FROZEN_CRACK
  LObjN LO::R_COIN,           0, 11, 2, 0
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::KEY_RED
  LObj  LO::S_FROZENCRACK,     0, 12
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 16
  LObjN LO::WIDE_3,            1, 4, 2, LN3::FROZEN_CRACK
  LObj  LO::S_SOLID_ROCK,     1, 6
  LObjN LO::WIDE_3,            1, 11, 2, LN3::FROZEN_CRACK
  LObj  LO::S_FROZENCRACK,     1, 7
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::R_ROCK,           2, 8, 6, 6
  LObjN LO::R_SOLID_BLOCK,    4, 2, 0, 4
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::LOCK_RED
  LObj  LO::S_FROZENCRACK,     2, 6
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::LAVA_MAIN, (4<<4)|2
  LObj  LO::S_FROZENCRACK,     1, 4
  LObj  LO::S_FROZENCRACK,     0, 10
  LObjN LO::WIDE_1,           1, 6, 4, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 0, 15, 0
  LObj  LO::S_FROZENCRACK,     0, 2
  LObj  LO::S_FROZENCRACK,     0, 8
  LObjN LO::R_SOLID_BLOCK,    2, 9, 1, 0
  LObjN LO::TALL_2,           0, 10, 1, LN2::TRUNK
  LObjN LO::R_ROCK,           0, 12, 1, 2
  LObj  LO::S_BIGHEART,       1, 11
  LObjN LO::R_ROCK,           1, 9, 1, 5
  LObjN LO::R_COIN,           1, 3, 0, 5
  LObjN LO::R_ROCK,           1, 8, 1, 6
  LObjN LO::WIDE_1,           1, 3, 2, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 5, 1, 9
  LObjN LO::R_ROCK,           2, 3, 6, 11
  LObjN LO::TALL_2,           1, 1, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 2, 2, LN1::TALLGRASS
  LObjN LO::TALL_2,           3, 1, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           2, 3, 3, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (15<<4)|2
  LObjN LO::R_COIN,           1, 4, 0, 2
  LObj  LO::S_FROZENCRACK,     1, 8
  LObj  LO::S_FROZENCRACK,     2, 10
  LObj  LO::S_FROZENCRACK,     1, 4
  LObj  LO::S_SPRING,         0, 6
  LObjN LO::WIDE_1,           0, 7, 3, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 6, 2, 0
  LObj  LO::S_FROZENCRACK,     2, 2
  LObjN LO::R_ROCK,           2, 0, 11, 2
  LObj  LO::S_FROZENCRACK,     0, 8
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObj  LO::S_FROZENCRACK,     0, 11
  LObj  LO::S_FROZENCRACK,     3, 6
  LObjN LO::TALL_2,           2, 3, 5, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 9, 9, 5
  LObjN LO::WIDE_1,           1, 8, 3, LN1::TALLGRASS
  LObjN LO::R_ROCK,           6, 0, 5, 4
  LObj  LO::S_SOLID_ROCK,     0, 8
  LObjN LO::TALL_2,           2, 5, 3, LN2::TRUNK
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::LAVA_MAIN, (15<<4)|2
  LObjN LO::TALL_2,           1, 9, 1, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 10, 12, LN2::PATH_LINE
  LObjN LO::R_ROCK,           1, 0, 5, 6
  LObj  LO::S_FROZENCRACK,     0, 7
  LObjN LO::R_COIN,           2, 11, 1, 0
  LObj  LO::S_FROZENCRACK,     2, 8
  LObjN LO::R_ROCK,           2, 0, 2, 5
  LObjN LO::R_ROCK,           3, 0, 1, 3
  LObjN LO::TALL_1,           0, 6, 2, LN1::LADDER
  LObjN LO::WIDE_1,           1, 6, 1, LN1::SOLID_LEDGE
  LObj  LO::S_FROZENCRACK,     0, 9
  LObjN LO::TALL_2,           2, 5, 5, LN2::PATH_LINE
  LObj  LO::S_FROZENCRACK,     1, 2
  LObjN LO::WIDE_2,           0, 5, 3, LN2::PATH_LINE
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (15<<4)|2
  LObjN LO::WIDE_1,           2, 9, 2, LN1::SOLID_LEDGE
  LObj  LO::S_FROZENCRACK,     0, 10
  LObjN LO::TALL_2,           1, 3, 1, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 3, 7, LN2::PATH_LINE
  LObjN LO::R_COIN,           2, 1, 4, 0
  LObj  LO::S_FROZENCRACK,     0, 2
  LObjN LO::WIDE_1,           1, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_FROZENCRACK,     0, 9
  LObj  LO::S_FROZENCRACK,     5, 1
  LObjN LO::TALL_2,           0, 3, 6, LN2::PATH_LINE
  LObjN LO::WIDE_2,           0, 10, 11, LN2::PATH_LINE
  LObjN LO::WIDE_1,           2, 7, 4, LN1::SOLID_LEDGE
  LObj  LO::S_FROZENCRACK,     1, 8
  LObjN LO::R_ROCK,           1, 0, 0, 3
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (8<<4)|2
  LObjN LO::R_ROCK,           1, 0, 3, 6
  LObj  LO::S_FROZENCRACK,     2, 11
  LObjN LO::R_ROCK,           2, 0, 2, 4
  LObjN LO::R_COIN,           0, 11, 1, 0
  LObjN LO::R_ROCK,           3, 0, 7, 2
  LObjN LO::R_COIN,           1, 8, 1, 0
  LObjN LO::R_GROUND,         0, 10, 9, 4
  LObjN LO::WIDE_1,           1, 9, 0, LN1::FENCE
  LObj  LO::S_SNOWMAN,         2, 8
  LObjN LO::WIDE_2,           1, 9, 3, LN2::FLOWER
  LObjN LO::WIDE_1,           3, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_HEART,          2, 9
  LObjN LO::R_GROUND,         1, 8, 4, 6
  LObjN LO::R_COIN,           1, 6, 2, 0
  LObjN LO::R_ROCK,           1, 0, 10, 1
  LObjN LO::R_ROCK,           1, 2, 4, 0
  LObjN LO::R_GROUND,         5, 8, 4, 6
  LObjN LO::WIDE_2,           2, 7, 1, LN2::FLOWER
  LObj  LO::S_HEART,          1, 6
  LObjN LO::R_GROUND,         2, 6, 2, 8
  LObjN LO::R_COIN,           3, 4, 0, 4
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_GROUND,         0, 10, 7, 4
  LObjN LO::R_ROCK,           3, 0, 10, 2
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::CAMPFIRE
  LObjN LO::R_ROCK,           2, 3, 7, 1
  LObjN LO::R_COIN,           0, 7, 0, 1
  LObjN LO::WIDE_1,           5, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 7, 4, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 8, 5, 6
  LObj  LO::R_CUSTOM,         6, 12, Metatiles::LAVA_MAIN, (15<<4)|2
  LObjN LO::R_ROCK,           1, 0, 10, 2
  LObj  LO::S_FROZENCRACK,     0, 4
  LObjN LO::WIDE_2,           0, 8, 3, LN2::PATH_LINE
  LObj  LO::S_FROZENCRACK,     2, 9
  LObjN LO::TALL_2,           1, 5, 2, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 5, 3, LN2::PATH_LINE
  LObj  LO::S_COIN,           1, 3
  LObj  LO::S_FROZENCRACK,     1, 11
  LObjN LO::TALL_2,           1, 6, 2, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 8, 5, LN2::PATH_LINE
  LObj  LO::S_FROZENCRACK,     1, 7
  LObj  LO::S_FROZENCRACK,     2, 9
  LObj  LO::S_FROZENCRACK,     1, 3
  LObjN LO::WIDE_1,           1, 3, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::TALL_2,           0, 5, 2, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 5, 12, LN2::PATH_LINE
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::LAVA_MAIN, (11<<4)|2
  LObjN LO::R_COIN,           1, 2, 4, 0
  LObjN LO::WIDE_1,           0, 7, 10, LN1::SPIKES
  LObjN LO::R_ROCK,           0, 8, 10, 1
  LObjN LO::R_COIN,           0, 10, 9, 0
  LObj  LO::S_FROZENCRACK,     3, 1
  LObj  LO::S_FROZENCRACK,     0, 11
  LObj  LO::S_FROZENCRACK,     2, 4
  LObjN LO::WIDE_1,           2, 3, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_DOOR,           3, 10
  LWriteCol 8, 236
  LObjN LO::R_GROUND,         1, 4, 4, 10
  LObjN LO::WIDE_1,           1, 3, 2, LN1::FENCE
  LObjN LO::WIDE_1,           4, 4, 3, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         3, 7
  LObjN LO::R_GROUND,         0, 8, 4, 6
  LObj  LO::S_EXIT_DOOR,      2, 6
  LObjN LO::R_ROCK,           12, 0, 2, 14
  LObjN LO::RECT_3,           3, 0, 4, LN3::ROCK, 25
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::SNOWMAN_TOP, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::SNOWMAN_TOP, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::SNOWMAN_TOP, (15<<4)|0
  LObjN LO::RECT_3,           0, 12, 2, LN3::ROCK, 25
  LObj  LO::S_PRIZE,          6, 7
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObj  LO::S_DOOR,           3, 8
  LWriteCol 10, 201
  LObj  LO::S_EXIT_DOOR,      3, 8
  LObj  LO::S_PRIZE,          3, 7
  LWriteCol InventoryItem::ABILITY_BOOMERANG | 128
  LObj  LO::R_CUSTOM,         1, 10, Metatiles::SNOWMAN_TOP, (9<<4)|0
  LObjN LO::R_COIN,           2, 6, 2, 2
  LObj  LO::R_CUSTOM,         3, 6, Metatiles::SNOWMAN_TOP, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::SNOWMAN_TOP, (4<<4)|0
  LObjN LO::R_ROCK,           5, 0, 2, 14
  .byt LSpecialCmd, LevelSpecialConfig::FROZEN_CAVE
  LFinished

frozen4Sprite:
  LSpr Enemy::GRABBY_HAND,         0,  15,  11
  LSpr Enemy::GRABBY_HAND,         0,  18,   6
  LSpr Enemy::BOOMERANG_GUY,       0,  25,   8, 1
  LSpr Enemy::ICE_1,               1,  30,   6
  LSpr Enemy::FIREBAR,             0,  30,  10, 8
  LSpr Enemy::FALLING_SPIKE,       0,  32,   2, 2
  LSpr Enemy::FALLING_SPIKE,       0,  37,   2, 2
  LSpr Enemy::FIRE_WALK,           0,  39,   7, 1
  LSpr Enemy::GRABBY_HAND,         0,  50,   5
  LSpr Enemy::FALLING_SPIKE,       0,  53,   1, 4
  LSpr Enemy::FALLING_SPIKE,       0,  57,   1, 4
  LSpr Enemy::ICE_1,               1,  66,   2
  LSpr Enemy::ICE_1,               1,  68,   2
  LSpr Enemy::GRABBY_HAND,         0,  72,   9
  LSpr Enemy::GRABBY_HAND,         0,  75,   4
  LSpr Enemy::GRABBY_HAND,         0,  82,   5
  LSpr Enemy::CHECKPOINT,          0,  87,   7
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  91,   9, 1
  LSpr Enemy::BOOMERANG_GUY,       0, 109,   8, 1
  LSpr Enemy::CANNON_1,            0, 114,   7
  LSpr Enemy::BOOMERANG_GUY,       0, 121,   6, 1
  LSpr Enemy::CHECKPOINT,          0, 134,   7
  LSpr Enemy::GRABBY_HAND,         0, 140,   2
  LSpr Enemy::GRABBY_HAND,         1, 145,   7
  LSpr Enemy::GRABBY_HAND,         1, 150,   2
  LSpr Enemy::GRABBY_HAND,         0, 155,   5
  LSpr Enemy::BOOMERANG_GUY,       0, 162,   9, 1
  LSpr Enemy::GRABBY_HAND,         0, 169,   5
  LSpr Enemy::CHECKPOINT,          0, 173,   7
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 175,   8, 1
  LSpr Enemy::CANNON_1,            0, 180,   7
  LSpr Enemy::GRABBY_HAND,         0, 185,   6
  LSpr Enemy::FIRE_JUMP,           0, 188,   2
  LSpr Enemy::FIRE_JUMP,           1, 198,   2
  LSpr Enemy::FIRE_JUMP,           1, 199,   6
  LSpr Enemy::FIRE_JUMP,           1, 201,   6
  LSpr Enemy::COLLECTIBLE,         0, 244,   8
  .byt 255 ; end
