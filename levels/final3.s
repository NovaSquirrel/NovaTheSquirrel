final3:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_FACEBALL
  .addr final3Data
  .addr final3Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG_BLUE
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_JUNGLE
  .byt 255 ; end
  .byt $01, $48 ; boundaries

final3Data:
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_SKWIRLBUSH,     2, 4, 2, 2
  LObj  LO::S_SKWIRLBUSH,     1, 3
  LObjN LO::R_WOOD_PLATFORM,  0, 7, 0, 5
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::ABILITY_BLASTER | 128
  LObjN LO::R_SKWIRLBUSH,     2, 3, 4, 2
  LObjN LO::R_SKWIRLBUSH,     1, 2, 2, 0
  LObjN LO::R_WOOD_PLATFORM,  1, 6, 0, 6
  LObjN LO::WIDE_2,           1, 7, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::WIDE_1,           0, 12, 4, LN1::TALLGRASS
  LObj  LO::S_PRIZE,          2, 10
  LObjN LO::R_SKWIRLBUSH,     1, 4, 4, 2
  LObjN LO::R_BRICK,          0, 10, 1, 0
  LSetX 13
  LWriteCol Enemy::GREMLIN
  LObjN LO::R_SKWIRLBUSH,     0, 3, 2, 0
  LObjN LO::R_WOOD_PLATFORM,  1, 7, 0, 5
  LObjN LO::R_SAND,           7, 7, 2, 7
  LObjN LO::WIDE_1,           2, 3, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 6
  LObj  LO::S_PRIZE,          1, 6
  LWriteCol InventoryItem::ABILITY_FIRE | 128
  LObjN LO::R_SAND,           0, 10, 4, 4
  LObjN LO::TALL_2,           2, 6, 3, LN2::PALM_TREE
  LObjN LO::TALL_1,           2, 3, 6, LN1::LADDER
  LObjN LO::R_WATER,          1, 11, 9, 3
  LObjN LO::WIDE_1,           2, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::R_BRICK,          1, 8, 3, 0
  LObjN LO::R_SAND,           7, 10, 4, 4
  LObjN LO::TALL_2,           2, 6, 3, LN2::PALM_TREE
  LObjN LO::R_SKWIRLBUSH,     2, 1, 4, 2
  LObjN LO::R_GROUND,         1, 8, 6, 6
  LObjN LO::R_WOOD_PLATFORM,  1, 4, 0, 3
  LObjN LO::WIDE_1,           3, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::R_SKWIRLBUSH,     2, 1, 4, 2
  LObjN LO::R_WOOD_PLATFORM,  2, 4, 0, 10
  LObjN LO::WIDE_2,           2, 9, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     1, 4, 4, 2
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::R_WOOD_PLATFORM,  1, 7, 0, 7
  LObjN LO::WIDE_2,           4, 7, 3, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     2, 2, 4, 2
  LObj  LO::S_SPRING,         1, 6
  LObjN LO::R_WOOD_PLATFORM,  1, 5, 0, 9
  LObjN LO::WIDE_2,           1, 10, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_BIGHEART,       1, 9
  LObjN LO::WIDE_1,           2, 4, 3, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          0, 10
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE | 128
  LObjN LO::WIDE_2,           1, 9, 4, LN2::BUSH
  LObjN LO::R_GROUND,         0, 10, 9, 4
  LObjN LO::R_SKWIRLBUSH,     3, 2, 4, 2
  LObjN LO::R_WOOD_PLATFORM,  2, 5, 0, 4
  LObjN LO::WIDE_2,           1, 9, 3, LN2::BUSH
  LSetX 79
  LWriteCol Enemy::GREMLIN
  LObjN LO::R_SKWIRLBUSH,     0, 2, 4, 2
  LObjN LO::R_GROUND,         1, 12, 8, 2
  LObjN LO::R_WOOD_PLATFORM,  1, 5, 0, 6
  LObjN LO::TALL_1,           2, 6, 5, LN1::LADDER
  LObjN LO::R_SOLID_ROCK,     1, 6, 0, 5
  LObjN LO::R_SKWIRLBUSH,     1, 2, 4, 2
  LObjN LO::WIDE_2,           0, 11, 1, LN2::BUSH
  LObjN LO::R_WOOD_PLATFORM,  2, 5, 0, 6
  LObjN LO::TALL_2,           2, 8, 3, LN2::PALM_TREE
  LObjN LO::R_SAND,           0, 12, 4, 2
  LObjN LO::R_GROUND,         1, 0, 13, 3
  LSetX 90
  LWriteCol Enemy::GREMLIN
  LObjN LO::TALL_1,           2, 7, 4, LN1::LADDER
  LObjN LO::R_SOLID_ROCK,     1, 7, 0, 4
  LObjN LO::R_WATER,          1, 13, 2, 1
  LObjN LO::TALL_2,           3, 8, 3, LN2::PALM_TREE
  LObjN LO::R_SAND,           0, 12, 1, 2
  LObjN LO::R_SAND,           2, 10, 12, 4
  LObjN LO::TALL_1,           1, 6, 3, LN1::LADDER
  LObjN LO::R_SOLID_ROCK,     1, 6, 0, 3
  LObjN LO::TALL_2,           1, 8, 1, LN2::PALM_TREE
  LObjN LO::R_GROUND,         2, 0, 7, 7
  LObjN LO::RECT_2,           1, 8, 1, LN2::BLACK, 5
  LObjN LO::R_GROUND,         7, 10, 8, 4
  LObjN LO::WIDE_2,           1, 9, 4, LN2::BUSH
  LObjN LO::R_SKWIRLBUSH,     3, 1, 4, 2
  LObjN LO::R_WOOD_PLATFORM,  2, 4, 0, 5
  LObjN LO::R_SKWIRLBUSH,     3, 2, 4, 2
  LObjN LO::R_GROUND,         0, 9, 3, 5
  LObj  LO::S_DOOR,           1, 7
  LWriteCol 2, 129
  LObjN LO::R_WOOD_PLATFORM,  1, 5, 0, 3
  LObjN LO::R_GROUND,         5, 4, 2, 10
  LObjN LO::WIDE_1,           3, 4, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         2, 9, Metatiles::PICKUP_BLOCK
  LObjN LO::R_GROUND,         1, 4, 2, 10
  LObjN LO::RECT_2,           0, 7, 1, LN2::BLACK, 2
  LObjN LO::RECT_2,           0, 11, 1, LN2::BLACK, 2
  LObjN LO::R_CEILING_BARRIER,5, 0, 0, 1
  LObjN LO::R_GROUND,         1, 0, 2, 11
  LObjN LO::RECT_2,           0, 11, 1, LN2::BLACK, 2
  LObjN LO::R_GROUND,         0, 13, 5, 1
  LObjN LO::R_SKWIRLBUSH,     4, 2, 4, 2
  LObjN LO::R_WOOD_PLATFORM,  2, 5, 0, 3
  LObjN LO::R_GROUND,         0, 9, 6, 5
  LObj  LO::S_SPRING,         4, 8
  LObjN LO::R_GROUND,         3, 6, 6, 8
  LObj  LO::S_PRIZE,          1, 3
  LWriteCol InventoryItem::ABILITY_BLASTER | 128
  LObj  LO::S_BIGHEART,       1, 5
  LObj  LO::S_DOOR,           3, 4
  LWriteCol 3, 162
  LObjN LO::R_WATER,          2, 2, 15, 12
  LObjN LO::R_CEILING_BARRIER,6, 0, 0, 1
  LObjN LO::R_SOLID_ROCK,     0, 11, 2, 0
  LObjN LO::R_GROUND,         1, 0, 8, 3
  LObjN LO::R_GROUND,         4, 8, 4, 6
  LObjN LO::R_SOLID_ROCK,     1, 7, 2, 0
  LObjN LO::R_WATER,          4, 2, 15, 12
  LObj  LO::S_HEART,          0, 9
  LObjN LO::R_GROUND,         0, 10, 6, 4
  LObjN LO::R_AIR,            1, 9, 2, 0
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_GROUND,         1, 0, 5, 4
  LObjN LO::R_SOLID_ROCK,     1, 9, 2, 0
  LObjN LO::R_WATER,          5, 0, 6, 1
  LObjN LO::R_SOLID_ROCK,     1, 6, 2, 0
  LObjN LO::R_GROUND,         0, 7, 2, 3
  LObjN LO::R_GROUND,         3, 3, 2, 5
  LObjN LO::R_SOLID_ROCK,     0, 13, 2, 0
  LObjN LO::R_WATER,          3, 0, 15, 14
  LObjN LO::R_GROUND,         0, 3, 3, 5
  LObjN LO::R_SOLID_ROCK,     5, 10, 2, 0
  LObjN LO::R_GROUND,         3, 9, 7, 5
  LObjN LO::R_SOLID_ROCK,     2, 6, 2, 0
  LObjN LO::R_AIR,            3, 6, 2, 2
  LObj  LO::S_DOOR,           1, 7
  LWriteCol 1, 209
  LObjN LO::R_GROUND,         2, 5, 2, 9
  LObj  LO::S_BIGHEART,       2, 4
  LObjN LO::WIDE_1,           1, 6, 4, LN1::FENCE
  LObjN LO::R_SAND,           0, 7, 4, 7
  LObjN LO::R_SAND,           5, 9, 3, 5
  LObjN LO::TALL_2,           1, 6, 2, LN2::PALM_TREE
  LObjN LO::R_SAND,           3, 11, 3, 3
  LObjN LO::TALL_2,           1, 8, 2, LN2::PALM_TREE
  LSetX 222
  LWriteCol Enemy::GREMLIN
  LObjN LO::TALL_1,           1, 4, 6, LN1::LADDER
  LObjN LO::R_SAND,           1, 4, 3, 10
  LObjN LO::TALL_2,           1, 1, 2, LN2::PALM_TREE
  LObjN LO::R_SAND,           3, 6, 3, 8
  LObjN LO::TALL_2,           1, 3, 2, LN2::PALM_TREE
  LSetX 232
  LWriteCol Enemy::GREMLIN
  LObjN LO::R_SAND,           0, 8, 7, 6
  LObjN LO::TALL_1,           2, 4, 3, LN1::LADDER
  LObjN LO::R_SAND,           1, 4, 1, 3
  LObjN LO::TALL_2,           3, 5, 2, LN2::PALM_TREE
  LSetX 239
  LWriteCol Enemy::GREMLIN
  LObjN LO::R_SAND,           3, 6, 3, 8
  LObjN LO::TALL_2,           1, 3, 2, LN2::PALM_TREE
  LObjN LO::R_SAND,           3, 4, 4, 10
  LObjN LO::TALL_2,           1, 1, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 1, 2, LN2::PALM_TREE
  LObjN LO::R_SAND,           2, 6, 4, 8
  LObj  LO::S_EXIT_DOOR,      2, 4
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

final3Sprite:
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,   7,  11, 3
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  12,   7, 0
  LSpr Enemy::CANNON_2,            1,  13,   2, 3
  LSpr Enemy::BOOMERANG_GUY,       1,  13,  12, 1
  LSpr Enemy::TURKEY,              0,  32,   4
  LSpr Enemy::TURKEY,              0,  35,   7
  LSpr Enemy::CHECKPOINT,          0,  43,   9
  LSpr Enemy::TURKEY,              0,  49,   5
  LSpr Enemy::TURKEY,              0,  61,   6
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  63,  13
  LSpr Enemy::BOOMERANG_GUY,       1,  70,   3, 1
  LSpr Enemy::BOOMERANG_GUY,       1,  72,   3, 1
  LSpr Enemy::CANNON_2,            1,  79,   3, 10
  LSpr Enemy::CHECKPOINT,          0,  80,  11
  LSpr Enemy::CANNON_2,            1,  90,   6, 10
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  96,   7, 1
  LSpr Enemy::GREMLIN,             1, 105,   9, 1
  LSpr Enemy::GREMLIN,             1, 107,   9, 1
  LSpr Enemy::GREMLIN,             1, 109,   9, 1
  LSpr Enemy::BIG_GLIDER,          1, 130,  13
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 132,  10, 1
  LSpr Enemy::BIG_GLIDER,          1, 133,   7
  LSpr Enemy::BIG_GLIDER,          1, 135,  12
  LSpr Enemy::BIG_GLIDER,          1, 136,   2
  LSpr Enemy::BIG_GLIDER,          1, 136,   6
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 137,   4, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 137,  13
  LSpr Enemy::BIG_GLIDER,          1, 138,   3
  LSpr Enemy::BIG_GLIDER,          1, 138,   8
  LSpr Enemy::CANNON_1,            0, 143,   8
  LSpr Enemy::CANNON_1,            1, 152,   6
  LSpr Enemy::CHECKPOINT,          0, 156,   5
  LSpr Enemy::TURKEY,              0, 167,  10
  LSpr Enemy::TURKEY,              0, 173,   6
  LSpr Enemy::TURKEY,              0, 177,   9
  LSpr Enemy::BOOMERANG_GUY,       1, 179,   9, 1
  LSpr Enemy::TURKEY,              0, 181,   8
  LSpr Enemy::TURKEY,              0, 187,   5
  LSpr Enemy::TURKEY,              0, 190,  12
  LSpr Enemy::TURKEY,              0, 193,   2
  LSpr Enemy::TURKEY,              0, 198,   9
  LSpr Enemy::TURKEY,              0, 203,   5
  LSpr Enemy::CHECKPOINT,          0, 209,   4
  LSpr Enemy::CANNON_2,            1, 222,   2, 12
  LSpr Enemy::CANNON_2,            1, 232,   2, 12
  LSpr Enemy::CANNON_2,            1, 239,   6, 12
  .byt 255 ; end
