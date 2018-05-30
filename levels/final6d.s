final6d:
  .byt MusicTracks::WORLD_5|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_CASTLE
  .byt GraphicsUpload::SP_FACEBALL
  .addr final6dData
  .addr final6dSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG
  .byt GraphicsUpload::PAL_ENEMY7
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_TROPICAL
  .byt 255 ; end
  .byt $84, $20 ; boundaries

final6dData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 17
  LObjN LO::TALL_2,           1, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 10, 2, LN2::TRUNK_L
  LObjN LO::R_SOLID_ROCK,     2, 4, 0, 7
  LObjN LO::TALL_2,           0, 12, 0, LN2::TRUNK
  LObjN LO::R_SOLID_ROCK,     1, 5, 6, 5
  LObjN LO::R_WATER,          0, 7, 1, 1
  LObj  LO::S_SOLID_ROCK,     1, 4
  LObj  LO::S_SOLID_ROCK,     2, 4
  LObj  LO::S_DOOR,           0, 11
  LWriteCol 10, 19
  LObj  LO::S_SOLID_ROCK,     2, 4
  LObjN LO::R_WATER,          0, 7, 1, 1
  LObjN LO::R_SOLID_ROCK,     2, 4, 0, 7
  LObjN LO::TALL_2,           0, 12, 0, LN2::TRUNK
  LObjN LO::R_SOLID_ROCK,     1, 0, 1, 12
  LObjN LO::R_SOLID_ROCK,     2, 0, 13, 1
  LObjN LO::WIDE_1,           0, 12, 15, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObj  LO::S_DOOR,           1, 10
  LWriteCol 11, 11
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK_L
  LObjN LO::R_GROUND,         2, 10, 6, 1
  LObjN LO::R_GROUND,         2, 8, 4, 1
  LObjN LO::WIDE_1,           2, 5, 2, LN1::FENCE
  LObjN LO::R_GROUND,         0, 6, 2, 1
  LObjN LO::R_SOLID_ROCK,     1, 0, 15, 1
  LObjN LO::WIDE_1,           2, 12, 15, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObjN LO::R_COIN,           1, 6, 0, 5
  LObj  LO::S_BIG_BUSH, 3, 11
  LObj  LO::S_SPRING,         3, 9
  LObjN LO::WIDE_1,           0, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           1, 8, 6, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           1, 5, 5, 1
  LObjN LO::R_COIN,           0, 9, 5, 0
  LObjN LO::WIDE_1,           0, 11, 5, LN1::FENCE
  LObjN LO::R_SOLID_ROCK,     5, 0, 15, 1
  LObjN LO::R_SOLID_BLOCK,    1, 8, 0, 3
  LObjN LO::TALL_2,           1, 8, 3, LN2::TRUNK_L
  LObjN LO::WIDE_1,           0, 12, 13, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (13<<4)|1
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK_L
  LObjN LO::R_COIN,           2, 4, 2, 1
  LObjN LO::WIDE_2,           0, 7, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 1, 3
  LObjN LO::WIDE_2,           1, 10, 2, LN2::WOOD_PLATFORM_TOP
  LObj  LO::S_BIGHEART,       1, 6
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 0, 1
  LObjN LO::R_WOOD_PLATFORM,  0, 11, 1, 0
  LObjN LO::R_GROUND,         2, 4, 3, 7
  LObjN LO::R_SOLID_ROCK,     4, 0, 15, 1
  LObj  LO::S_PRIZE,          0, 7
  LWriteCol InventoryItem::ABILITY_BOOMERANG | 128
  LObjN LO::WIDE_2,           0, 9, 2, LN2::BUSH
  LObjN LO::R_GROUND,         0, 10, 7, 4
  LObjN LO::R_COIN,           3, 5, 2, 1
  LObjN LO::WIDE_2,           0, 8, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 9, 2, 0
  LObjN LO::WIDE_2,           3, 9, 1, LN2::BUSH
  LObjN LO::WIDE_1,           2, 12, 9, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (9<<4)|1
  LObjN LO::TALL_2,           2, 8, 3, LN2::PALM_TREE
  LObjN LO::TALL_2,           3, 8, 3, LN2::PALM_TREE
  LObjN LO::R_SOLID_ROCK,     3, 0, 13, 1
  LObjN LO::TALL_2,           1, 8, 3, LN2::PALM_TREE
  LObjN LO::WIDE_1,           1, 12, 11, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (11<<4)|1
  LObjN LO::TALL_2,           3, 8, 3, LN2::PALM_TREE
  LObjN LO::TALL_2,           4, 8, 3, LN2::PALM_TREE
  LObj  LO::S_DOOR,           2, 10
  LWriteCol 10, 99
  LObjN LO::R_SOLID_ROCK,     3, 0, 3, 14
  LObjN LO::R_SOLID_ROCK,     4, 0, 13, 1
  LObjN LO::WIDE_2,           0, 4, 5, LN2::STONE_BRIDGE
  LObjN LO::WIDE_1,           0, 12, 5, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (5<<4)|1
  LObj  LO::S_DOOR,           1, 10
  LWriteCol 10, 91
  LObjN LO::WIDE_1,           5, 10, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 11, 6, 3
  LObjN LO::TALL_2,           3, 8, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 8, 2, LN2::TRUNK_L
  LObjN LO::WIDE_2,           2, 8, 3, LN2::BUSH
  LObjN LO::R_GROUND,         0, 9, 3, 5
  LObjN LO::R_SOLID_ROCK,     1, 0, 15, 1
  LObjN LO::WIDE_2,           3, 6, 3, LN2::BUSH
  LObjN LO::R_GROUND,         0, 7, 3, 7
  LObjN LO::WIDE_1,           4, 12, 15, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObjN LO::R_GROUND,         5, 2, 11, 7
  LObjN LO::WIDE_1,           0, 11, 11, LN1::FENCE
  LObjN LO::R_SOLID_ROCK,     4, 0, 15, 1
  LObj  LO::S_BIGHEART,       0, 10
  LObjN LO::WIDE_1,           7, 12, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (2<<4)|1
  LObjN LO::R_GROUND,         3, 11, 6, 3
  LObjN LO::WIDE_1,           1, 6, 4, LN1::FENCE
  LObj  LO::S_SOLID_BLOCK,    0, 7
  LObjN LO::TALL_2,           0, 8, 2, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 7, 2, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_SPRING,         1, 10
  LObj  LO::S_SOLID_BLOCK,    2, 7
  LObjN LO::TALL_2,           0, 8, 2, LN2::TRUNK
  LObjN LO::R_SOLID_ROCK,     1, 0, 15, 1
  LObjN LO::WIDE_1,           0, 7, 15, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObj  LO::R_CUSTOM,         3, 11, Metatiles::LAVA_MAIN, (12<<4)|1
  LObj  LO::R_CUSTOM,         3, 9, Metatiles::LAVA_MAIN, (9<<4)|1
  LObjN LO::R_SOLID_ROCK,     8, 0, 1, 4
  LObjN LO::TALL_2,           1, 5, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           0, 7, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         1, 7, 7, 7
  LObjN LO::WIDE_2,           1, 6, 2, LN2::BUSH
  LObj  LO::S_EXIT_DOOR,      3, 5
  LObj  LO::S_DOOR,           2, 5
  LWriteCol 11, 177
  LObjN LO::R_GROUND,         9, 13, 7, 1
  LObj  LO::S_DOOR,           1, 11
  LWriteCol 5, 167
  LObjN LO::R_COIN,           6, 6, 4, 0
  LObjN LO::TALL_1,           0, 9, 3, LN1::LADDER
  LObjN LO::WIDE_1,           1, 9, 6, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 8
  LObj  LO::S_HEART,          5, 8
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 16
  LObjN LO::TALL_2,           2, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 10, 2, LN2::TRUNK_L
  LObjN LO::R_COIN,           1, 6, 2, 0
  LObjN LO::TALL_1,           1, 7, 3, LN1::LADDER
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::TALL_2,           1, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 10, 2, LN2::TRUNK_L
  LObj  LO::S_SPRING,         5, 12
  LObjN LO::R_COIN,           3, 7, 2, 1
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           3, 9, 3, LN1::LADDER
  LObjN LO::R_GROUND,         0, 13, 6, 1
  LObj  LO::S_HEART,          6, 9
  LObjN LO::WIDE_1,           0, 10, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObjN LO::WIDE_1,           6, 10, 4, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObjN LO::R_GROUND,         2, 13, 6, 1
  LObjN LO::R_COIN,           5, 7, 2, 0
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           1, 9, 3, LN1::LADDER
  LObjN LO::R_GROUND,         1, 12, 4, 2
  LObjN LO::R_COIN,           3, 8, 2, 0
  LObjN LO::WIDE_1,           0, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           4, 7, 2, 0
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           4, 5, 2, 0
  LObjN LO::WIDE_1,           0, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         3, 7, 6, 7
  LObjN LO::R_SOLID_BLOCK,    3, 4, 2, 0
  LObjN LO::TALL_2,           0, 5, 1, LN2::TRUNK
  LObj  LO::S_SOLID_BLOCK,    1, 3
  LObj  LO::S_EXIT_DOOR,      0, 5
  LObjN LO::TALL_2,           1, 5, 1, LN2::TRUNK
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

final6dSprite:
  LSpr Enemy::MAMA_LUIGI,          1,   8,   4
  LSpr Enemy::MAMA_LUIGI,          1,  12,   4
  LSpr Enemy::TOAST,               0,  23,  13
  LSpr Enemy::GREMLIN,             1,  25,  11, 1
  LSpr Enemy::GREMLIN,             1,  27,   9, 1
  LSpr Enemy::GREMLIN,             1,  29,   7, 1
  LSpr Enemy::GREMLIN,             1,  31,   5, 1
  LSpr Enemy::GRILLBERT,           1,  44,   7
  LSpr Enemy::ROVER,               1,  44,  11
  LSpr Enemy::GRILLBERT,           1,  46,   5
  LSpr Enemy::GRILLBERT,           1,  46,   9
  LSpr Enemy::MAMA_LUIGI,          1,  56,  11
  LSpr Enemy::MAMA_LUIGI,          1,  57,   6
  LSpr Enemy::MAMA_LUIGI,          1,  58,   9
  LSpr Enemy::CHECKPOINT,          0,  64,   6
  LSpr Enemy::MAMA_LUIGI,          1,  65,   9
  LSpr Enemy::MAMA_LUIGI,          1,  68,   7
  LSpr Enemy::GRILLBERT,           1,  76,   9
  LSpr Enemy::GRILLBERT,           1,  77,   6
  LSpr Enemy::TOAST,               0,  77,  13
  LSpr Enemy::GRILLBERT,           1,  78,  11
  LSpr Enemy::GRILLBERT,           1,  80,   8
  LSpr Enemy::TOAST,               0,  82,  13
  LSpr Enemy::GRILLBERT,           1,  83,  10
  LSpr Enemy::GRILLBERT,           1,  84,   7
  LSpr Enemy::TOAST,               0,  87,  13
  LSpr Enemy::GREMLIN,             0,  99,   3, 1
  LSpr Enemy::GREMLIN,             0, 102,   3, 1
  LSpr Enemy::MAMA_LUIGI,          1, 108,  10
  LSpr Enemy::MAMA_LUIGI,          1, 111,   8
  LSpr Enemy::MAMA_LUIGI,          1, 114,   8
  LSpr Enemy::MAMA_LUIGI,          1, 116,   6
  LSpr Enemy::GREMLIN,             1, 119,  11, 1
  LSpr Enemy::GREMLIN,             1, 121,  11, 1
  LSpr Enemy::TOAST,               0, 121,  13
  LSpr Enemy::GREMLIN,             1, 123,  11, 1
  LSpr Enemy::TOAST,               0, 126,  13
  LSpr Enemy::MAMA_LUIGI,          1, 129,  11
  LSpr Enemy::TOAST,               0, 130,  13
  LSpr Enemy::MAMA_LUIGI,          1, 134,  11
  LSpr Enemy::TOAST,               0, 135,  13
  LSpr Enemy::TOAST,               0, 146,  13
  LSpr Enemy::MAMA_LUIGI,          1, 147,   6
  LSpr Enemy::GRILLBERT,           1, 149,   5
  LSpr Enemy::TOAST,               0, 149,  11
  LSpr Enemy::MAMA_LUIGI,          1, 151,   6
  LSpr Enemy::TOAST,               0, 153,   9
  LSpr Enemy::MAMA_LUIGI,          1, 155,   6
  LSpr Enemy::GRILLBERT,           1, 157,   4
  LSpr Enemy::TOAST,               0, 157,   9
  LSpr Enemy::CHECKPOINT,          0, 162,   5
  LSpr Enemy::BOMB_POP_GENERATOR,  0, 186,   9
  LSpr Enemy::COLLECTIBLE,         0, 250,   5
  .byt 255 ; end
