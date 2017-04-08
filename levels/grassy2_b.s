grassy2_b:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr grassy2_bData
  .addr grassy2_bSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ALTGRASS2
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_TROPICAL
  .byt 255 ; end
  .byt $00, $0c ; boundaries

grassy2_bData:
  LObjN LO::R_GROUND,         0, 13, 11, 1
  LObjN LO::WIDE_1,           9, 12, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         3, 11, 7, 3
  LObjN LO::R_BRICK,          2, 7, 4, 0
  LObj  LO::S_PRIZE,          2, 7
  LObjN LO::WIDE_2,           0, 10, 2, LN2::FLOWER
  LObjN LO::WIDE_1,           4, 12, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           6, 5, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 8
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         9, 4, 1, 0
  LObjN LO::R_GROUND,         0, 5, 5, 9
  LObj  LO::S_GROUND_CLIMB_R, 2, 4
  LObjN LO::WIDE_1,           5, 7, 2, LN1::FENCE
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 8, 0, 6
  LObjN LO::TALL_2,           4, 10, 4, LN2::TRUNK_L
  LObjN LO::R_COIN,           1, 5, 4, 0
  LObjN LO::TALL_2,           2, 10, 4, LN2::TRUNK_L
  LObjN LO::R_GROUND,         2, 0, 9, 1
  LObjN LO::TALL_2,           1, 10, 4, LN2::TRUNK_L
  LObjN LO::WIDE_1,           3, 7, 2, LN1::FENCE
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SIGNPOST,       1, 7
  LWriteCol <LineFollowingAbout, >LineFollowingAbout
  LObjN LO::R_SOLID_BLOCK,    0, 8, 0, 6
  LObjN LO::TALL_2,           3, 7, 4, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 11, 4, LN2::PATH_LINE
  LObjN LO::R_GROUND,         1, 0, 3, 8
  LObjN LO::TALL_2,           4, 7, 4, LN2::PATH_LINE
  LObjN LO::WIDE_1,           3, 6, 4, LN1::FENCE
  LObjN LO::WIDE_1,           0, 7, 4, LN1::SOLID_LEDGE
  LObj  LO::S_HEART,          2, 5
  LObjN LO::R_SOLID_BLOCK,    0, 7, 0, 7
  LObjN LO::WIDE_1,           4, 8, 4, LN1::FENCE
  LObjN LO::WIDE_1,           0, 9, 4, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    2, 9, 0, 5
  LObj  LO::S_SPRING,         2, 8
  LObjN LO::R_GROUND,         9, 4, 4, 10
  LObjN LO::WIDE_2,           5, 6, 4, LN2::BUSH
  LObjN LO::R_GROUND,         0, 7, 7, 7
  LObj  LO::S_HEART,          5, 6
  LObj  LO::S_GROUND_CLIMB_L, 2, 6
  LObjN LO::R_GROUND,         1, 6, 5, 8
  LObjN LO::R_GROUND,         6, 9, 2, 5
  LObjN LO::R_AIR,            0, 11, 2, 1
  LObj  LO::S_DOOR,           0, 11
  LWriteCol 3, 212
  LObj  LO::S_BIG_BUSH, 1, 8
  LObjN LO::TALL_2,           2, 9, 4, LN2::PATH_LINE
  LObjN LO::R_COIN,           1, 5, 2, 0
  LObjN LO::WIDE_1,           2, 13, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObjN LO::R_GROUND,         1, 11, 1, 1
  LObjN LO::WIDE_2,           3, 5, 4, LN2::BUSH
  LObjN LO::R_GROUND,         0, 6, 2, 1
  LObjN LO::TALL_2,           1, 8, 6, LN2::TRUNK
  LObjN LO::R_GROUND,         2, 6, 1, 0
  LObjN LO::R_GROUND,         0, 13, 8, 1
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 11, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 10
  LObjN LO::R_GROUND,         0, 11, 5, 1
  LObjN LO::R_SOLID_BLOCK,    2, 6, 2, 0
  LObjN LO::WIDE_1,           0, 10, 2, LN1::TALLGRASS
  LObjN LO::R_SOLID_BLOCK,    3, 6, 4, 1
  LObj  LO::S_GROUND_CLIMB_L, 0, 10
  LObjN LO::TALL_2,           1, 8, 1, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObj  LO::S_BIGHEART,       1, 9
  LObjN LO::R_COIN,           1, 8, 2, 1
  LObj  LO::S_PRIZE,          2, 6
  LWriteCol InventoryItem::ABILITY_BLASTER
  LObjN LO::WIDE_1,           1, 6, 1, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 7, 1, 1
  LObjN LO::R_GROUND,         0, 9, 1, 5
  LObjN LO::R_GROUND,         2, 6, 4, 8
  LObjN LO::TALL_2,           6, 6, 5, LN2::PATH_LINE
  LObjN LO::TALL_2,           5, 6, 5, LN2::PATH_LINE
  LObjN LO::TALL_2,           5, 6, 5, LN2::PATH_LINE
  LObjN LO::R_GROUND,         3, 0, 5, 7
  LObjN LO::R_AIR,            0, 6, 0, 1
  LObjN LO::R_GROUND,         0, 11, 13, 3
  LObj  LO::S_SPRING,         8, 10
  LObjN LO::R_GROUND,         1, 7, 4, 3
  LObj  LO::S_EXIT_DOOR,      2, 5
  LObjN LO::WIDE_1,           3, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           1, 10, 2, LN2::PATH_LINE
  LObjN LO::WIDE_2,           0, 13, 15, LN2::PATH_LINE
  LObjN LO::R_GROUND,         10, 3, 2, 3
  LObjN LO::R_GROUND,         0, 7, 5, 4
  LObjN LO::R_COIN,           3, 5, 1, 1
  LObjN LO::WIDE_2,           3, 13, 1, LN2::PATH_LINE
  LObjN LO::TALL_2,           1, 11, 1, LN2::PATH_LINE
  LObj  LO::S_SPRING,         2, 10
  LObjN LO::R_GROUND,         0, 11, 5, 3
  LObj  LO::S_PRIZE,          3, 8
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObjN LO::R_GROUND,         15, 1, 0, 4
  LObjN LO::R_COIN,           1, 3, 1, 1
  LObjN LO::R_GROUND,         0, 5, 6, 0
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObj  LO::S_DOOR,           2, 3
  LWriteCol 11, 107
  LObjN LO::R_COIN,           1, 1, 2, 3
  LObj  LO::S_SOLID_BLOCK,    1, 11
  LObjN LO::R_SOLID_BLOCK,    1, 8, 0, 1
  LObjN LO::R_SOLID_BLOCK,    0, 12, 2, 0
  LObjN LO::R_GROUND,         1, 1, 0, 4
  LObjN LO::R_SOLID_BLOCK,    1, 8, 0, 1
  LObj  LO::S_SOLID_BLOCK,    1, 11
  LFinished

grassy2_bSprite:
  LSpr Enemy::GOOMBA,              1,  14,  10
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0,  20,  11, 5
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0,  27,   5, 5
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0,  45,   8, 9
  LSpr Enemy::SNEAKER,             1,  58,   7
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  60,   7
  LSpr Enemy::KING,                0,  72,   2
  LSpr Enemy::GEORGE,              0,  76,   8
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0,  78,   4, 8
  LSpr Enemy::SNEAKER,             1,  92,   3
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 107,   6, 9
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 110,  12
  LSpr Enemy::OWL,                 0, 119,   5
  LSpr Enemy::SNEAKER,             0, 127,   5
  LSpr Enemy::FIRE_JUMP,           1, 129,   9
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 143,   6
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 148,  10
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 153,   8
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 171,  10
  .byt 255 ; end
