final6d:
  .byt MusicTracks::NONE|0
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
  .byt 255 ; end
  .byt $84, $00 ; boundaries

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
  LObj  LO::S_EXIT_DOOR,      1, 10
  LObj  LO::S_BIG_BUSH, 2, 11
  LObj  LO::S_SPRING,         3, 9
  LObjN LO::WIDE_1,           0, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 8, 6, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 5, 3, 1
  LObjN LO::WIDE_1,           0, 11, 5, LN1::FENCE
  LObjN LO::R_SOLID_ROCK,     5, 0, 15, 1
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK_L
  LObjN LO::WIDE_1,           0, 12, 13, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (13<<4)|1
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 8, 3, LN2::TRUNK_L
  LObjN LO::R_COIN,           2, 4, 2, 1
  LObjN LO::WIDE_1,           0, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 11, 2, LN1::FENCE
  LObj  LO::S_HEART,          1, 6
  LObjN LO::R_GROUND,         2, 4, 3, 7
  LObjN LO::R_SOLID_ROCK,     4, 0, 15, 1
  LObj  LO::S_PRIZE,          0, 7
  LWriteCol InventoryItem::ABILITY_BOOMERANG | 128
  LObjN LO::WIDE_2,           0, 9, 2, LN2::BUSH
  LObjN LO::R_GROUND,         0, 10, 7, 4
  LObjN LO::R_COIN,           3, 5, 2, 1
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           3, 9, 1, LN2::BUSH
  LObjN LO::WIDE_1,           2, 12, 9, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (9<<4)|1
  LObjN LO::R_SOLID_ROCK,     8, 0, 13, 1
  LObjN LO::WIDE_1,           2, 12, 11, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (11<<4)|1
  LObj  LO::S_DOOR,           9, 10
  LWriteCol 10, 99
  LObjN LO::R_SOLID_ROCK,     3, 0, 3, 14
  LObjN LO::R_SOLID_ROCK,     4, 0, 13, 1
  LObjN LO::WIDE_1,           0, 4, 5, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 12, 15, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (5<<4)|1
  LObj  LO::S_DOOR,           1, 10
  LWriteCol 10, 91
  LObjN LO::R_GROUND,         5, 11, 6, 3
  LObjN LO::R_GROUND,         7, 9, 3, 5
  LObjN LO::R_SOLID_ROCK,     1, 0, 15, 1
  LObjN LO::R_GROUND,         3, 7, 3, 7
  LObjN LO::WIDE_1,           4, 12, 10, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (10<<4)|1
  LObjN LO::R_SOLID_ROCK,     9, 0, 15, 1
  LObjN LO::WIDE_1,           2, 12, 15, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObjN LO::R_SOLID_ROCK,     14, 0, 15, 1
  LObjN LO::WIDE_1,           2, 12, 15, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (13<<4)|1
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
  LSpr Enemy::GRILLBERT,           1,  80,   9
  LSpr Enemy::TOAST,               0,  82,  13
  LSpr Enemy::GRILLBERT,           1,  83,  10
  LSpr Enemy::GRILLBERT,           1,  84,   7
  LSpr Enemy::TOAST,               0,  87,  13
  LSpr Enemy::TURKEY,              0,  99,   3
  LSpr Enemy::MAMA_LUIGI,          1, 108,  10
  LSpr Enemy::MAMA_LUIGI,          1, 111,   8
  LSpr Enemy::MAMA_LUIGI,          1, 114,   8
  LSpr Enemy::MAMA_LUIGI,          1, 116,   6
  LSpr Enemy::GREMLIN,             1, 119,  11, 1
  LSpr Enemy::GREMLIN,             1, 121,  11, 1
  LSpr Enemy::TOAST,               0, 121,  13
  LSpr Enemy::GREMLIN,             1, 123,  11, 1
  LSpr Enemy::TOAST,               0, 126,  13
  LSpr Enemy::TOAST,               0, 130,  13
  LSpr Enemy::TOAST,               0, 135,  13
  .byt 255 ; end
