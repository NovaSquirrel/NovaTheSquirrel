bummer1:
  .byt MusicTracks::NONE|0
  .byt 4
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr bummer1Data
  .addr bummer1Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt 255 ; end
  .byt $00, $00 ; boundaries

bummer1Data:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 30
  LObjN LO::R_BRICK,          8, 9, 3, 0
  LObj  LO::S_SIGNPOST,       0, 12
  LObj  LO::S_PRIZE,          2, 9
  LObjN LO::WIDE_1,           2, 11, 1, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::CAMPFIRE, (1<<4)|0
  LObj  LO::R_CUSTOM,         6, 13, Metatiles::ICE, (7<<4)|0
  LObjN LO::WIDE_1,           3, 10, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 11, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 5, Metatiles::GRAY_BOOTS
  LObjN LO::R_COIN,           2, 7, 2, 0
  LObjN LO::R_BRICK,          0, 8, 3, 0
  LObj  LO::S_PRIZE,          3, 8
  LObj  LO::S_GROUND_CLIMB_L, 0, 12
  LObjN LO::R_GROUND,         1, 12, 1, 2
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObjN LO::WIDE_1,           0, 10, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_SIGNPOST,       1, 9
  LObjN LO::R_GROUND,         0, 10, 2, 4
  LObj  LO::S_SPRING,         2, 9
  LObj  LO::R_CUSTOM,         1, 10, Metatiles::CHIP_WATER, (5<<4)|4
  LObjN LO::WIDE_1,           2, 8, 1, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::BLUE_BOOTS
  LObjN LO::R_GROUND,         1, 0, 1, 9
  LObj  LO::R_CUSTOM,         2, 5, Metatiles::CHIP_WATER, (3<<4)|9
  LObjN LO::R_GROUND,         4, 5, 5, 9
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::RED_BOOTS
  LObj  LO::R_CUSTOM,         2, 4, Metatiles::CAMPFIRE, (2<<4)|0
  LObjN LO::TALL_1,           3, 5, 4, LN1::LADDER
  LObjN LO::R_GROUND,         0, 10, 15, 4
  LObj  LO::S_CUSTOM,         3, 9, Metatiles::GREEN_BOOTS
  LObjN LO::R_GROUND,         1, 0, 5, 1
  LObjN LO::WIDE_1,           1, 3, 0, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::FORCE_LEFT, (1<<4)|7
  LObjN LO::R_GROUND,         4, 0, 5, 4
  LObj  LO::S_SIGNPOST,       3, 9
  LObjN LO::R_GROUND,         3, 4, 13, 0
  LObjN LO::R_COIN,           1, 10, 1, 3
  LObjN LO::R_GROUND,         3, 5, 4, 4
  LObjN LO::RECT_1,           0, 10, 4, LN1::GROUND, 43
  LObj  LO::S_CUSTOM,         6, 8, Metatiles::KEY_RED
  LObjN LO::TALL_2,           3, 5, 4, LN2::TRUNK
  LObjN LO::WIDE_1,           2, 5, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           2, 8, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_GROUND,         5, 1, 0, 7
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::LOCK_RED
  LObjN LO::R_GROUND,         1, 1, 4, 0
  LObj  LO::S_CUSTOM,         2, 7, Metatiles::KEY_GREEN
  LObjN LO::R_GROUND,         3, 1, 0, 7
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::LOCK_GREEN
  LObjN LO::R_GROUND,         1, 6, 5, 0
  LObjN LO::R_COIN,           1, 5, 3, 0
  LObjN LO::R_GROUND,         1, 7, 0, 1
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::LOCK_GREEN
  LObjN LO::R_GROUND,         3, 7, 0, 1
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::LOCK_GREEN
  LObj  LO::S_CUSTOM,         4, 9, Metatiles::TELEPORTER
  LObjN LO::R_SOLID_BLOCK,    2, 8, 2, 1
  LObj  LO::S_CUSTOM,         4, 9, Metatiles::TELEPORTER
  LObj  LO::R_CUSTOM,         3, 5, Metatiles::CHIP, (6<<4)|0
  LObjN LO::R_SOLID_BLOCK,    0, 6, 6, 0
  LObjN LO::TALL_2,           0, 7, 2, LN2::TRUNK
  LObjN LO::R_GROUND,         1, 12, 12, 2
  LObj  LO::R_CUSTOM,         1, 11, Metatiles::CHIP, (9<<4)|0
  LObjN LO::TALL_2,           4, 7, 4, LN2::TRUNK
  LObjN LO::R_COIN,           1, 4, 3, 0
  LObj  LO::R_CUSTOM,         4, 6, Metatiles::CHIP, (6<<4)|0
  LObjN LO::R_SOLID_BLOCK,    0, 7, 6, 0
  LObj  LO::S_GROUND_CLIMB_L, 2, 11
  LObjN LO::TALL_2,           1, 8, 2, LN2::TRUNK
  LObjN LO::RECT_1,           0, 11, 3, LN1::GROUND, 28
  LObj  LO::S_GROUND_CLIMB_L, 3, 10
  LObjN LO::R_GROUND,         1, 10, 6, 0
  LObjN LO::R_GROUND,         2, 1, 0, 7
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::CHIP_SOCKET
  LObjN LO::R_BRICK,          2, 7, 2, 0
  LObj  LO::S_PRIZE,          1, 7
  LObj  LO::S_GROUND_CLIMB_R, 2, 10
  LObj  LO::S_SIGNPOST,       3, 10
  LObj  LO::R_CUSTOM,         3, 10, Metatiles::PICKUP_BLOCK, (2<<4)|0
  LObj  LO::R_CUSTOM,         6, 9, Metatiles::CHERRY_BOMB, (0<<4)|1
  LObj  LO::S_GROUND_CLIMB_R, 6, 11
  LObjN LO::R_GROUND,         0, 12, 2, 0
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 17
  LObj  LO::S_GROUND_CLIMB_R, 3, 12
  LObj  LO::S_EXIT_DOOR,      11, 11
  LFinished

bummer1Sprite:
  LSpr Enemy::GOOMBA,              1,  17,  12
  LSpr Enemy::SNEAKER,             1,  57,   2
  LSpr Enemy::THWOMP,              0,  80,   5
  LSpr Enemy::SNEAKER,             1,  81,   3
  LSpr Enemy::THWOMP,              0,  93,   2
  LSpr Enemy::GOOMBA,              0, 117,  11
  LSpr Enemy::OWL,                 0, 118,   5
  LSpr Enemy::OWL,                 1, 129,   6
  .byt 255 ; end
