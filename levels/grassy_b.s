grassy_b:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr grassy_bData
  .addr grassy_bSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $00, $02 ; boundaries

grassy_bData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 55
  LObj  LO::S_FLOWER,         7, 12
  LObj  LO::S_FLOWER,         3, 12
  LObj  LO::S_GROUND_CLIMB_L, 3, 12
  LObj  LO::S_GROUND_CLIMB_L, 1, 11
  LObjN LO::R_GROUND,         0, 12, 6, 0
  LObjN LO::R_COIN,           1, 7, 1, 0
  LObjN LO::WIDE_1,           0, 10, 4, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 11, 4, 0
  LObjN LO::WIDE_1,           2, 7, 1, LN1::PRIZE
  LObj  LO::S_GROUND_CLIMB_R, 3, 11
  LObj  LO::S_GROUND_CLIMB_R, 1, 12
  LObj  LO::S_SOLID_ROCK,     2, 12
  LObjN LO::TALL_2,           1, 10, 2, LN2::TRUNK_L
  LObjN LO::R_COIN,           3, 8, 0, 2
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::WIDE_1,           1, 8, 4, LN1::TALLGRASS
  LObjN LO::RECT_1,           0, 9, 3, LN1::GROUND, 21
  LObjN LO::R_AIR,            5, 9, 3, 0
  LObjN LO::TALL_2,           1, 7, 2, LN2::TRUNK_L
  LObjN LO::R_GROUND,         4, 3, 6, 3
  LObjN LO::RECT_2,           1, 7, 1, LN2::BLACK, 4
  LObjN LO::R_BRICK,          6, 5, 4, 0
  LObj  LO::S_FLOWER,         0, 8
  LObj  LO::S_PRIZE,          2, 5
  LObjN LO::R_AIR,            1, 9, 1, 1
  LObj  LO::S_FLOWER,         1, 10
  LObjN LO::R_SOLID_BLOCK,    1, 5, 5, 0
  LObjN LO::R_COIN,           1, 4, 3, 0
  LObjN LO::WIDE_1,           0, 12, 2, LN1::TALLGRASS
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::TALL_2,           3, 6, 2, LN2::TRUNK
  LObjN LO::R_SOLID_BLOCK,    0, 9, 6, 0
  LObjN LO::TALL_2,           0, 10, 2, LN2::TRUNK
  LObj  LO::S_SPRING,         5, 8
  LObjN LO::R_SOLID_BLOCK,    2, 9, 0, 3
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 33
  LObj  LO::S_SOLID_ROCK,     1, 12
  LObjN LO::WIDE_2,           1, 12, 1, LN2::FLOWER
  LObjN LO::R_GROUND,         3, 7, 6, 3
  LObjN LO::WIDE_1,           1, 6, 4, LN1::FENCE
  LObjN LO::RECT_2,           0, 11, 1, LN2::BLACK, 14
  LObjN LO::R_COIN,           1, 5, 2, 0
  LObj  LO::S_BIGHEART,       4, 6
  LObjN LO::R_GROUND,         1, 2, 9, 4
  LObjN LO::R_GROUND,         0, 7, 5, 0
  LObjN LO::RECT_2,           0, 8, 2, LN2::BLACK, 5
  LObjN LO::R_GROUND,         6, 7, 3, 3
  LObj  LO::S_PRIZE,          4, 9
  LObjN LO::R_BRICK,          1, 9, 2, 0
  LObjN LO::WIDE_2,           1, 12, 1, LN2::BUSH
  LObj  LO::S_SOLID_BLOCK,    4, 12
  LObjN LO::R_SOLID_BLOCK,    1, 11, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 10, 0, 2
  LObjN LO::R_SOLID_BLOCK,    1, 9, 0, 3
  LObjN LO::WIDE_1,           4, 7, 2, LN1::FENCE
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 13, 3, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    1, 8
  LObjN LO::TALL_2,           0, 9, 3, LN2::TRUNK
  LObjN LO::R_COIN,           3, 3, 2, 1
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 12, 3, LN1::TALLGRASS
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 22
  LObjN LO::WIDE_1,           3, 8, 2, LN1::FENCE
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    1, 9
  LObjN LO::TALL_2,           0, 10, 2, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 12, 3, LN1::TALLGRASS
  LObjN LO::R_SOLID_BLOCK,    7, 10, 3, 0
  LObjN LO::TALL_2,           0, 11, 1, LN2::TRUNK
  LObjN LO::R_SOLID_BLOCK,    1, 3, 2, 0
  LObjN LO::R_SOLID_BLOCK,    3, 7, 3, 0
  LObjN LO::TALL_2,           0, 8, 1, LN2::TRUNK
  LObj  LO::S_PRIZE,          0, 10
  LObjN LO::TALL_2,           0, 11, 1, LN2::TRUNK
  LObjN LO::TALL_2,           3, 8, 4, LN2::TRUNK
  LObj  LO::S_BIGHEART,       2, 12
  LObjN LO::WIDE_1,           1, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_ROCK,     0, 12
  LObjN LO::WIDE_1,           5, 6, 4, LN1::FENCE
  LObjN LO::R_GROUND,         0, 7, 4, 7
  LObjN LO::WIDE_1,           5, 7, 5, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 1, 2, 0
  LObj  LO::S_COIN,           5, 4
  LObj  LO::S_COIN,           3, 5
  LObj  LO::S_COIN,           2, 8
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::WIDE_1,           0, 11, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           5, 10, 4, LN1::FENCE
  LObjN LO::R_GROUND,         0, 11, 4, 3
  LObjN LO::WIDE_2,           7, 10, 2, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 11, 2, 3
  LObjN LO::R_GROUND,         5, 10, 2, 4
  LObj  LO::S_SPRING,         2, 9
  LObjN LO::R_GROUND,         3, 8, 8, 6
  LObjN LO::TALL_2,           2, 5, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 5, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 5, 2, LN2::TRUNK_L
  LObj  LO::S_GROUND_CLIMB_R, 3, 8
  LObj  LO::S_GROUND,         0, 9
  LObjN LO::R_GROUND,         0, 10, 1, 0
  LObjN LO::R_GROUND,         0, 11, 10, 3
  LObj  LO::S_GROUND_CLIMB_R, 1, 9
  LObj  LO::S_GROUND_CLIMB_R, 1, 10
  LObjN LO::WIDE_2,           2, 10, 3, LN2::BUSH
  LObj  LO::S_SPRING,         4, 10
  LObjN LO::R_SOLID_BLOCK,    2, 7, 6, 0
  LObjN LO::TALL_2,           0, 8, 2, LN2::TRUNK
  LObjN LO::R_BRICK,          1, 3, 4, 0
  LObj  LO::S_GROUND_CLIMB_R, 0, 11
  LObj  LO::S_GROUND,         0, 12
  LObjN LO::R_GROUND,         0, 13, 9, 1
  LObj  LO::S_PRIZE,          1, 3
  LObj  LO::S_GROUND_CLIMB_R, 0, 12
  LObj  LO::S_PRIZE,          2, 3
  LObjN LO::TALL_2,           2, 8, 4, LN2::TRUNK
  LObjN LO::WIDE_1,           2, 12, 2, LN1::TALLGRASS
  LObjN LO::R_COIN,           1, 6, 3, 0
  LObjN LO::WIDE_1,           0, 7, 3, LN1::SOLID_LEDGE
  LObj  LO::S_HEART,          1, 11
  LObjN LO::R_COIN,           6, 7, 3, 0
  LObjN LO::WIDE_1,           0, 8, 3, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           4, 12, 3, LN2::BUSH
  LObjN LO::R_GROUND,         0, 13, 9, 1
  LObjN LO::WIDE_1,           1, 10, 1, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    5, 12
  LObjN LO::R_SOLID_BLOCK,    1, 11, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 10, 0, 2
  LObjN LO::R_SOLID_BLOCK,    1, 9, 0, 3
  LObjN LO::WIDE_1,           2, 9, 7, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    9, 9, 0, 1
  LObjN LO::RECT_1,           0, 11, 3, LN1::GROUND, 29
  LObj  LO::S_SOLID_BLOCK,    1, 10
  LObjN LO::WIDE_1,           2, 10, 6, LN1::FENCE
  LObj  LO::S_EXIT_DOOR,      8, 9
  LFinished

grassy_bSprite:
  LSpr Enemy::GOOMBA,              1,  18,  10
  LSpr Enemy::GEORGE,              1,  36,   9
  LSpr Enemy::GOOMBA,              1,  39,   2
  LSpr Enemy::FIRE_WALK,           0,  52,   4
  LSpr Enemy::SNEAKER,             1,  73,   6
  LSpr Enemy::THWOMP,              0,  75,   8
  LSpr Enemy::THWOMP,              0,  78,   8
  LSpr Enemy::GEORGE,              1,  98,   7
  LSpr Enemy::GEORGE,              1, 106,   8
  LSpr Enemy::THWOMP,              0, 116,   4
  LSpr Enemy::GEORGE,              1, 125,   7
  LSpr Enemy::THWOMP,              0, 136,   2
  LSpr Enemy::GEORGE,              1, 154,  10
  LSpr Enemy::GOOMBA,              1, 174,   7
  LSpr Enemy::FIRE_WALK,           1, 190,  12
  LSpr Enemy::GEORGE,              1, 191,   6
  LSpr Enemy::FIRE_JUMP,           1, 224,   8
  .byt 255 ; end
