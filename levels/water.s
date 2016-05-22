water:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr waterData
  .addr waterSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $00, $00 ; boundaries

waterData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 19
  LObjN LO::WIDE_1,           6, 12, 6, LN1::TALLGRASS
  LObjN LO::R_GROUND,         9, 11, 4, 1
  LObj  LO::S_SIGNPOST,       1, 10
  LWriteCol <WaterAbout, >WaterAbout
  LObjN LO::R_SOLID_BLOCK,    3, 4, 11, 0
  LObjN LO::TALL_2,           0, 5, 4, LN2::TRUNK
  LObj  LO::S_GROUND,         0, 10
  LObjN LO::R_WATER,          1, 10, 9, 3
  LObjN LO::R_GROUND,         0, 14, 9, 0
  LObjN LO::R_COIN,           3, 2, 3, 0
  LObjN LO::TALL_2,           7, 5, 4, LN2::TRUNK
  LObj  LO::S_GROUND,         0, 10
  LObjN LO::R_GROUND,         0, 11, 11, 3
  LObjN LO::TALL_2,           1, 7, 3, LN2::TRUNK_L
  LObj  LO::S_SPRING,         2, 10
  LObjN LO::TALL_2,           1, 7, 3, LN2::TRUNK_L
  LObjN LO::R_GROUND,         2, 7, 5, 3
  LObjN LO::WIDE_2,           1, 6, 3, LN2::FLOWER
  LObjN LO::R_WATER,          5, 7, 4, 7
  LObjN LO::R_GROUND,         5, 0, 4, 9
  LObjN LO::R_WATER,          0, 10, 4, 4
  LObjN LO::R_WATER,          5, 7, 4, 7
  LObjN LO::R_SOLID_BLOCK,    3, 13, 1, 0
  LObjN LO::R_BRICK,          2, 3, 1, 0
  LObjN LO::R_GROUND,         0, 7, 3, 7
  LObj  LO::S_PRIZE,          2, 3
  LObjN LO::WIDE_1,           2, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 10, 0, 1
  LObjN LO::RECT_1,           0, 12, 2, LN1::GROUND, 23
  LObjN LO::R_GROUND,         1, 0, 2, 4
  LObjN LO::R_WATER,          0, 5, 4, 1
  LObjN LO::WIDE_1,           1, 11, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         2, 0, 7, 1
  LObjN LO::R_WATER,          0, 2, 7, 1
  LObjN LO::R_WATER,          0, 4, 1, 0
  LObjN LO::WIDE_1,           2, 11, 2, LN1::SPIKES
  LObjN LO::R_WATER,          4, 4, 1, 0
  LObjN LO::R_WATER,          0, 5, 4, 1
  LObj  LO::S_BIGHEART,       0, 11
  LObjN LO::R_SOLID_BLOCK,    2, 7, 0, 4
  LObjN LO::R_COIN,           1, 2, 1, 1
  LObjN LO::R_WATER,          0, 7, 4, 1
  LObjN LO::R_GROUND,         0, 9, 10, 2
  LObjN LO::R_GROUND,         5, 1, 3, 1
  LObjN LO::WIDE_2,           0, 8, 3, LN2::BUSH
  LObjN LO::RECT_1,           1, 0, 1, LN1::GROUND, 24
  LObjN LO::RECT_1,           3, 2, 1, LN1::WATER, 21
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::WIDE_1,           1, 13, 5, LN1::SPIKES
  LObjN LO::R_GROUND,         0, 14, 5, 0
  LObjN LO::WIDE_2,           6, 8, 3, LN2::BUSH
  LObjN LO::R_GROUND,         0, 9, 10, 5
  LObj  LO::S_GROUND_CLIMB_L, 4, 8
  LObjN LO::WIDE_2,           1, 7, 1, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 8, 1, 0
  LObj  LO::S_GROUND_CLIMB_R, 2, 8
  LObjN LO::TALL_2,           2, 6, 2, LN2::TRUNK_L
  LObjN LO::R_WATER,          2, 12, 14, 2
  LObjN LO::R_GROUND,         3, 0, 2, 0
  LObjN LO::R_GROUND,         0, 5, 6, 6
  LObj  LO::S_PRIZE,          1, 2
  LObjN LO::R_GROUND,         2, 0, 14, 4
  LObjN LO::R_WATER,          4, 5, 10, 6
  LObjN LO::R_GROUND,         5, 12, 7, 2
  LObj  LO::S_SPRING,         7, 11
  LObjN LO::WIDE_1,           3, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 3, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::R_GROUND,         0, 12, 5, 2
  LObjN LO::R_WATER,          2, 3, 1, 8
  LObjN LO::WIDE_1,           2, 2, 8, LN1::FENCE
  LObjN LO::R_GROUND,         0, 3, 8, 1
  LObjN LO::R_GROUND,         0, 5, 1, 1
  LObj  LO::S_SOLID_ROCK,     0, 11
  LObj  LO::S_HEART,          1, 11
  LObjN LO::R_GROUND,         1, 5, 4, 9
  LObjN LO::R_GROUND,         5, 12, 5, 2
  LObjN LO::R_COIN,           1, 8, 0, 2
  LObjN LO::R_WATER,          1, 3, 1, 8
  LObjN LO::R_GROUND,         2, 0, 6, 6
  LObj  LO::S_FLOWER,         1, 11
  LObj  LO::S_FLOWER,         4, 11
  LObjN LO::R_GROUND,         0, 12, 5, 2
  LObjN LO::R_WATER,          2, 3, 1, 8
  LObjN LO::R_GROUND,         2, 3, 8, 1
  LObj  LO::S_BIGHEART,       1, 11
  LObjN LO::R_COIN,           4, 2, 2, 0
  LObjN LO::R_GROUND,         0, 5, 8, 1
  LObjN LO::R_GROUND,         0, 11, 2, 3
  LObj  LO::S_PRIZE,          1, 8
  LObjN LO::R_GROUND,         2, 7, 8, 7
  LObj  LO::S_SOLID_ROCK,     3, 4
  LObjN LO::WIDE_1,           6, 6, 3, LN1::FENCE
  LObjN LO::WIDE_1,           0, 7, 3, LN1::SOLID_LEDGE
  LObjN LO::R_WATER,          0, 10, 3, 4
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObjN LO::R_GROUND,         3, 7, 8, 7
  LObj  LO::S_SOLID_ROCK,     1, 6
  LObjN LO::WIDE_1,           5, 6, 2, LN1::TALLGRASS
  LObjN LO::RECT_1,           1, 0, 1, LN1::GROUND, 19
  LObjN LO::R_WATER,          2, 7, 14, 7
  LObjN LO::R_GROUND,         0, 11, 3, 3
  LObjN LO::R_GROUND,         1, 2, 13, 1
  LObj  LO::S_HEART,          1, 5
  LObjN LO::R_GROUND,         2, 4, 7, 2
  LObjN LO::R_AIR,            0, 11, 4, 0
  LObjN LO::WIDE_1,           0, 12, 4, LN1::SPIKES
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObjN LO::WIDE_1,           3, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_AIR,            0, 10, 2, 0
  LObj  LO::S_HEART,          2, 10
  LObjN LO::R_GROUND,         3, 11, 2, 3
  LObjN LO::WIDE_1,           3, 6, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 7, 8, 7
  LObj  LO::S_BIGHEART,       9, 7
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_GROUND,         0, 11, 8, 3
  LObjN LO::R_WATER,          9, 2, 0, 10
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 34
  LObjN LO::R_WATER,          1, 2, 4, 2
  LObjN LO::R_WATER,          3, 5, 1, 1
  LObjN LO::R_WATER,          2, 5, 5, 2
  LObjN LO::R_WATER,          6, 3, 1, 2
  LObjN LO::R_WATER,          2, 2, 5, 1
  LObjN LO::R_WATER,          6, 3, 1, 2
  LObjN LO::R_WATER,          2, 5, 1, 2
  LObjN LO::R_WATER,          2, 7, 1, 1
  LObjN LO::R_WATER,          2, 5, 1, 2
  LObjN LO::R_WATER,          2, 3, 1, 2
  LObjN LO::R_GROUND,         2, 6, 4, 6
  LObj  LO::S_EXIT_DOOR,      2, 4
  LFinished

waterSprite:
  LSpr Enemy::GOOMBA,              1,  18,  10
  LSpr Enemy::OWL,                 0,  37,   6
  LSpr Enemy::CANNON_1,            1,  50,  10
  LSpr Enemy::GEORGE,              1,  56,  12
  LSpr Enemy::THWOMP,              0,  79,   3
  LSpr Enemy::THWOMP,              0,  82,   3
  LSpr Enemy::THWOMP,              0,  89,   2
  LSpr Enemy::OWL,                 0,  97,   7
  LSpr Enemy::SPINNER,             1, 103,   2
  LSpr Enemy::FIRE_JUMP,           1, 105,   4
  LSpr Enemy::CANNON_1,            0, 110,  10
  LSpr Enemy::THWOMP,              0, 119,   5
  LSpr Enemy::SNEAKER,             1, 128,   7
  LSpr Enemy::SPINNER,             0, 147,   7
  LSpr Enemy::BALL_GUY,            1, 160,  10
  LSpr Enemy::GEORGE,              1, 168,   4
  LSpr Enemy::GOOMBA,              1, 184,   6
  LSpr Enemy::FIRE_WALK,           0, 185,  10, 1
  LSpr Enemy::FIRE_WALK,           1, 193,   8, 1
  LSpr Enemy::FIRE_WALK,           1, 198,  10, 1
  LSpr Enemy::BALL_GUY,            0, 225,  12
  LSpr Enemy::BALL_GUY,            1, 232,  10
  LSpr Enemy::BALL_GUY,            0, 237,  12
  .byt 255 ; end
