sky:
  .byt MusicTracks::NONE|0
  .byt 5
  .byt $f5
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr skyData
  .addr skySprite
  .byt $36 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_TROPICAL
  .byt 255 ; end
  .byt $00, $00 ; boundaries

skyData:
  LObjN LO::R_GROUND,         4, 7, 3, 7
  LObjN LO::WIDE_1,           6, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 10, 2, LN1::FENCE
  LObjN LO::R_GROUND,         0, 11, 6, 3
  LObj  LO::S_PRIZE,          3, 7
  LObj  LO::S_SPRING,         3, 10
  LObjN LO::WIDE_1,           4, 8, 1, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    2, 8
  LObjN LO::TALL_2,           0, 9, 5, LN2::TRUNK
  LObjN LO::R_COIN,           3, 5, 2, 0
  LObj  LO::S_SOLID_BLOCK,    0, 6
  LObjN LO::TALL_2,           0, 7, 7, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    5, 6
  LObjN LO::TALL_2,           0, 7, 7, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 6, 3, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_GROUND,         2, 13, 1, 1
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::WIDE_1,           1, 13, 0, LN1::SPIKES
  LObj  LO::S_GROUND,         0, 14
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 4
  LObjN LO::TALL_2,           0, 6, 8, LN2::TRUNK
  LObjN LO::WIDE_1,           2, 10, 6, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           7, 4, 6, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 10, 3, 4
  LObjN LO::TALL_1,           3, 4, 5, LN1::LADDER
  LObjN LO::R_GROUND,         8, 4, 3, 10
  LObjN LO::WIDE_2,           1, 3, 1, LN2::FLOWER
  LObjN LO::R_COIN,           6, 4, 0, 6
  LObjN LO::WIDE_1,           0, 13, 6, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         2, 0, 3, 10
  LObjN LO::WIDE_1,           4, 6, 2, LN1::SPIKES
  LObjN LO::WIDE_1,           0, 7, 3, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       3, 2
  LObj  LO::S_SPRING,         0, 5
  LObj  LO::S_SOLID_BLOCK,    0, 6
  LObjN LO::WIDE_1,           0, 11, 3, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         3, 9
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObjN LO::R_GROUND,         1, 3, 0, 1
  LObjN LO::R_GROUND,         0, 5, 2, 9
  LObjN LO::WIDE_1,           1, 4, 1, LN1::FENCE
  LObjN LO::R_GROUND,         4, 9, 7, 5
  LObjN LO::WIDE_1,           2, 4, 3, LN1::SPIKES
  LObjN LO::WIDE_1,           0, 5, 3, LN1::SOLID_LEDGE
  LObj  LO::S_COIN,           5, 6
  LObjN LO::R_COIN,           2, 5, 1, 0
  LObj  LO::S_COIN,           3, 6
  LObjN LO::WIDE_2,           0, 8, 1, LN2::BUSH
  LObjN LO::R_GROUND,         0, 9, 6, 5
  LObjN LO::TALL_2,           2, 6, 1, LN2::TRUNK_L
  LObj  LO::S_GROUND_CLIMB_L, 0, 8
  LObj  LO::S_GROUND,         1, 8
  LObj  LO::S_GROUND_CLIMB_R, 1, 8
  LObjN LO::WIDE_2,           1, 8, 1, LN2::BUSH
  LObjN LO::WIDE_1,           5, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 12, 0, LN1::SPIKES
  LObjN LO::WIDE_1,           0, 13, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 9
  LObjN LO::TALL_2,           0, 10, 4, LN2::TRUNK
  LObj  LO::S_SOLID_BLOCK,    0, 13
  LObjN LO::WIDE_1,           1, 8, 2, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    0, 8, 0, 1
  LObj  LO::S_BIGHEART,       0, 12
  LObj  LO::S_SPRING,         2, 7
  LObjN LO::TALL_1,           1, 8, 5, LN1::LADDER
  LObjN LO::WIDE_1,           2, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    1, 7
  LObjN LO::TALL_2,           0, 8, 6, LN2::TRUNK
  LObjN LO::R_GROUND,         3, 7, 4, 7
  LObj  LO::S_FLOWER,         4, 6
  LObjN LO::WIDE_1,           5, 6, 4, LN1::FENCE
  LObjN LO::R_GROUND,         0, 7, 4, 7
  LObj  LO::S_GROUND_CLIMB_R, 5, 7
  LObjN LO::R_GROUND,         0, 8, 0, 1
  LObjN LO::R_GROUND,         0, 10, 9, 4
  LObj  LO::S_GROUND_CLIMB_R, 1, 8
  LObj  LO::S_GROUND,         0, 9
  LObj  LO::S_GROUND_CLIMB_R, 1, 9
  LObjN LO::WIDE_1,           2, 9, 4, LN1::TALLGRASS
  LObjN LO::WIDE_1,           1, 5, 0, LN1::SPIKES
  LObj  LO::S_PRIZE,          0, 6
  LObj  LO::S_HEART,          4, 6
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::WIDE_2,           7, 10, 1, LN2::BUSH
  LObjN LO::R_GROUND,         0, 11, 9, 3
  LObj  LO::S_GROUND_CLIMB_L, 3, 10
  LObjN LO::R_GROUND,         1, 10, 5, 0
  LObj  LO::S_GROUND_CLIMB_L, 4, 9
  LObj  LO::S_GROUND,         1, 9
  LObjN LO::R_GROUND,         1, 9, 6, 5
  LObjN LO::R_GROUND,         1, 8, 5, 0
  LObjN LO::WIDE_1,           1, 7, 0, LN1::SPIKES
  LObj  LO::S_BIGHEART,       2, 7
  LObjN LO::WIDE_2,           3, 8, 4, LN2::STONE_BRIDGE
  LObjN LO::R_WATER,          0, 11, 4, 3
  LObjN LO::R_COIN,           1, 6, 2, 0
  LObjN LO::R_GROUND,         4, 8, 3, 6
  LObjN LO::RECT_1,           4, 13, 1, LN1::GROUND, 21
  LObjN LO::R_SOLID_BLOCK,    2, 4, 0, 6
  LObjN LO::WIDE_1,           0, 11, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 9, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 12, 7, LN1::TALLGRASS
  LObjN LO::WIDE_1,           2, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 10, 2, 1
  LObjN LO::WIDE_2,           3, 8, 3, LN2::BUSH
  LObjN LO::R_GROUND,         0, 9, 8, 3
  LObjN LO::WIDE_1,           5, 8, 2, LN1::FENCE
  LObj  LO::S_SPRING,         4, 11
  LObjN LO::R_GROUND,         0, 12, 8, 2
  LObjN LO::WIDE_1,           2, 11, 4, LN1::TALLGRASS
  LObjN LO::R_COIN,           1, 9, 2, 0
  LObj  LO::S_SPRING,         5, 11
  LObjN LO::R_GROUND,         7, 12, 8, 2
  LObjN LO::R_GROUND,         9, 10, 6, 4
  LObj  LO::S_GROUND_CLIMB_R, 7, 10
  LObjN LO::R_GROUND,         0, 11, 3, 3
  LObjN LO::WIDE_1,           1, 10, 2, LN1::FENCE
  LObj  LO::S_GROUND_CLIMB_R, 3, 11
  LObjN LO::RECT_1,           0, 12, 2, LN1::GROUND, 22
  LObjN LO::TALL_2,           5, 9, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 9, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 9, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 9, 2, LN2::TRUNK_L
  LObj  LO::S_EXIT_DOOR,      6, 10
  LFinished

skySprite:
  LSpr Enemy::OWL,                 0,  13,  10
  LSpr Enemy::FIRE_JUMP,           0,  37,   5
  LSpr Enemy::GEORGE,              1,  50,   9
  LSpr Enemy::FIRE_JUMP,           1,  53,   3
  LSpr Enemy::CANNON_1,            1,  57,   6
  LSpr Enemy::GOOMBA,              0,  73,   5
  LSpr Enemy::KING,                0,  95,   1
  LSpr Enemy::GOOMBA,              1, 103,   8
  LSpr Enemy::GOOMBA,              1, 116,   6
  LSpr Enemy::OWL,                 0, 130,   6
  LSpr Enemy::THWOMP,              0, 139,   7
  LSpr Enemy::GOOMBA,              1, 161,   7
  LSpr Enemy::GOOMBA,              1, 184,   6
  LSpr Enemy::KING,                0, 216,   2
  LSpr Enemy::GOOMBA,              1, 232,  10
  LSpr Enemy::GOOMBA,              1, 236,  11
  .byt 255 ; end
