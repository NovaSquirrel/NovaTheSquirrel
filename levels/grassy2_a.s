grassy2_a:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr grassy2_aData
  .addr grassy2_aSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ALTGRASS2
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_TROPICAL
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $00, $00 ; boundaries

grassy2_aData:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 16
  LObjN LO::TALL_2,           4, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 10, 2, LN2::TRUNK_L
  LObjN LO::WIDE_1,           2, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 11, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 7, 4, LN1::FENCE
  LObjN LO::R_GROUND,         0, 8, 4, 4
  LObjN LO::R_CEILING_BARRIER,5, 0, 0, 2
  LObjN LO::R_GROUND,         1, 2, 7, 2
  LObjN LO::WIDE_1,           0, 11, 1, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 1, 5, 0
  LObj  LO::S_COIN,           0, 10
  LObjN LO::R_GROUND,         1, 3, 11, 3
  LObjN LO::R_GROUND,         0, 11, 15, 3
  LObjN LO::RECT_2,           1, 7, 3, LN2::BLACK, 3
  LObjN LO::R_GROUND,         4, 7, 5, 0
  LObjN LO::RECT_2,           0, 8, 3, LN2::BLACK, 5
  LObjN LO::R_GROUND,         1, 8, 3, 0
  LObjN LO::RECT_2,           0, 12, 0, LN2::BLACK, 3
  LObjN LO::R_COIN,           1, 2, 4, 0
  LObjN LO::RECT_2,           4, 7, 3, LN2::BLACK, 0
  LObjN LO::R_GROUND,         1, 3, 2, 1
  LObj  LO::S_GROUND,         0, 5
  LObjN LO::RECT_2,           0, 6, 3, LN2::BLACK, 0
  LObj  LO::S_GROUND,         0, 10
  LObj  LO::S_HEART,          1, 2
  LObjN LO::RECT_2,           0, 5, 3, LN2::BLACK, 0
  LObjN LO::R_GROUND,         0, 9, 3, 2
  LObjN LO::WIDE_1,           2, 2, 2, LN1::FENCE
  LObjN LO::R_GROUND,         0, 3, 2, 0
  LObjN LO::WIDE_2,           0, 8, 1, LN2::FLOWER
  LObjN LO::WIDE_2,           4, 8, 1, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 9, 3, 5
  LObjN LO::R_AIR,            0, 11, 0, 3
  LObj  LO::S_PRIZE,          2, 5
  LObjN LO::R_BRICK,          1, 5, 2, 0
  LObj  LO::S_GROUND_CLIMB_R, 0, 9
  LObjN LO::R_GROUND,         1, 10, 4, 4
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_GROUND,         1, 1
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_GROUND,         1, 1, 1, 2
  LObjN LO::R_GROUND,         2, 1, 13, 4
  LObj  LO::S_PRIZE,          0, 10
  LObjN LO::WIDE_1,           0, 12, 3, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObjN LO::WIDE_2,           1, 10, 1, LN2::LOG_HORIZ
  LObjN LO::TALL_2,           3, 6, 6, LN2::TRUNK
  LObjN LO::WIDE_1,           3, 11, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           1, 10, 2, LN2::BUSH
  LObjN LO::R_GROUND,         0, 11, 4, 3
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObjN LO::R_GROUND,         5, 1, 13, 5
  LObjN LO::WIDE_2,           1, 12, 3, LN2::STONE_BRIDGE
  LObjN LO::TALL_2,           6, 7, 5, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObjN LO::R_GROUND,         1, 7, 2, 0
  LObj  LO::S_TROPICAL_FLOWER,1, 10
  LObj  LO::S_MOAI_LEFT,      2, 12
  LObjN LO::R_GROUND,         1, 10, 5, 4
  LObjN LO::R_GROUND,         2, 1, 8, 0
  LObjN LO::WIDE_2,           0, 5, 3, LN2::LOG_HORIZ
  LObj  LO::S_BIGHEART,       1, 4
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_GROUND,         2, 9, 1, 0
  LObjN LO::WIDE_1,           1, 11, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 12, 4, 2
  LObj  LO::S_PRIZE,          1, 9
  LObjN LO::R_COIN,           3, 8, 0, 2
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_1,           1, 7, 0, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           1, 4, 2, LN2::TRUNK_L
  LObjN LO::R_GROUND,         0, 7, 4, 7
  LObjN LO::TALL_2,           3, 4, 2, LN2::TRUNK_L
  LObjN LO::TALL_1,           2, 7, 3, LN1::LADDER
  LObjN LO::R_GROUND,         0, 11, 6, 3
  LObjN LO::WIDE_1,           3, 10, 0, LN1::SPIKES
  LObjN LO::WIDE_1,           2, 10, 1, LN1::FENCE
  LObjN LO::WIDE_2,           1, 4, 5, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           1, 1, 3, 1
  LObjN LO::WIDE_2,           3, 10, 1, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 11, 7, 3
  LObjN LO::WIDE_1,           3, 10, 0, LN1::SPIKES
  LObj  LO::S_BIG_BUSH, 1, 10
  LObjN LO::R_SOLID_BLOCK,    1, 1, 5, 0
  LObj  LO::S_GROUND_CLIMB_L, 2, 10
  LObjN LO::R_GROUND,         1, 10, 8, 4
  LObjN LO::R_SOLID_BLOCK,    2, 2, 0, 2
  LObjN LO::R_SOLID_BLOCK,    0, 5, 5, 0
  LObjN LO::TALL_2,           0, 6, 3, LN2::TRUNK
  LObj  LO::S_SPRING,         1, 4
  LObjN LO::R_COIN,           1, 4, 3, 0
  LObjN LO::WIDE_2,           0, 9, 4, LN2::FLOWER
  LObjN LO::TALL_2,           3, 6, 3, LN2::TRUNK
  LObj  LO::S_COIN,           2, 4
  LObjN LO::WIDE_1,           0, 5, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 10, 0, 2
  LObj  LO::S_COIN,           3, 5
  LObjN LO::WIDE_1,           0, 6, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         1, 10, 11, 4
  LObjN LO::R_SOLID_BLOCK,    2, 7, 5, 0
  LObjN LO::TALL_2,           0, 8, 1, LN2::TRUNK
  LObjN LO::R_BRICK,          1, 4, 1, 0
  LObj  LO::S_HEART,          1, 3
  LObj  LO::S_PRIZE,          0, 7
  LObj  LO::S_PRIZE,          1, 4
  LObjN LO::TALL_2,           2, 8, 1, LN2::TRUNK
  LObj  LO::S_SPRING,         1, 9
  LObj  LO::S_GROUND_CLIMB_L, 3, 9
  LObjN LO::R_GROUND,         1, 9, 1, 5
  LObjN LO::R_GROUND,         2, 7, 3, 7
  LObj  LO::S_SOLID_BLOCK,    2, 6
  LObjN LO::WIDE_2,           2, 7, 4, LN2::STONE_BRIDGE
  LObjN LO::R_WATER,          0, 11, 4, 3
  LObjN LO::R_GROUND,         5, 7, 3, 7
  LObj  LO::S_SOLID_BLOCK,    1, 6
  LObjN LO::WIDE_1,           1, 6, 0, LN1::SPIKES
  LObjN LO::TALL_1,           2, 7, 5, LN1::LADDER
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 34
  LObj  LO::S_PRIZE,          1, 9
  LObjN LO::WIDE_1,           4, 4, 2, LN1::SPIKES
  LObjN LO::R_ROCK,           0, 5, 2, 5
  LObjN LO::TALL_2,           1, 11, 1, LN2::TRUNK
  LObj  LO::S_COIN,           3, 7
  LObj  LO::S_BIGHEART,       0, 8
  LObj  LO::S_SOLID_BLOCK,    0, 9
  LObj  LO::S_COIN,           1, 5
  LObjN LO::WIDE_2,           1, 7, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 2, 4
  LObj  LO::S_COIN,           1, 4
  LObj  LO::S_COIN,           2, 5
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::S_COIN,           1, 7
  LObj  LO::S_SOLID_BLOCK,    0, 9
  LObjN LO::WIDE_1,           2, 4, 2, LN1::SPIKES
  LObjN LO::R_ROCK,           0, 5, 2, 5
  LObjN LO::TALL_2,           1, 11, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           2, 9, 10, LN1::FALLTHROUGH_LEDGE
  LObjN LO::TALL_1,           4, 9, 3, LN1::LADDER
  LObjN LO::WIDE_2,           3, 6, 3, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 7, 3, 1
  LObjN LO::R_COIN,           1, 4, 1, 1
  LObjN LO::WIDE_2,           3, 4, 3, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 5, 3, 2
  LObjN LO::R_GROUND,         0, 8, 3, 4
  LObjN LO::R_COIN,           1, 2, 1, 1
  LObjN LO::WIDE_1,           5, 3, 3, LN1::TALLGRASS
  LObjN LO::R_SAND,           0, 4, 3, 10
  LObj  LO::S_SPRING,         5, 7
  LObjN LO::WIDE_2,           0, 8, 3, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 9, 3, 5
  LObjN LO::WIDE_1,           5, 9, 1, LN1::TALLGRASS
  LObjN LO::R_SAND,           0, 10, 10, 4
  LObjN LO::TALL_2,           3, 7, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 7, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 7, 2, LN2::PALM_TREE
  LObj  LO::S_PRIZE,          2, 7
  LObjN LO::R_SAND,           9, 10, 2, 4
  LObj  LO::S_SPRING,         2, 9
  LObjN LO::R_SAND,           1, 5, 4, 9
  LObj  LO::S_BIG_SPIKY_BUSH, 1, 4
  LObj  LO::S_SOLID_BLOCK,    4, 6
  LObjN LO::R_ROCK,           1, 0, 2, 3
  LObj  LO::S_TROPICAL_FLOWER,1, 10
  LObjN LO::R_COIN,           2, 1, 1, 2
  LObjN LO::WIDE_1,           0, 4, 1, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_TROPICAL_FLOWER,2, 10
  LObjN LO::R_ROCK,           1, 0, 2, 3
  LObj  LO::S_SOLID_BLOCK,    1, 6
  LObjN LO::R_SAND,           1, 5, 4, 9
  LObjN LO::R_GROUND,         5, 9, 6, 5
  LObj  LO::S_BIG_BUSH, 1, 8
  LObj  LO::S_BIG_BUSH, 3, 8
  LObjN LO::R_GROUND,         3, 11, 11, 3
  LObj  LO::S_DOOR,           8, 9
  LWriteCol $21, LevelId::Grassy2B
  LFinished

grassy2_aSprite:
  LSpr Enemy::GOOMBA,              1,  15,   7
  LSpr Enemy::THWOMP,              0,  23,   7
  LSpr Enemy::THWOMP,              0,  27,   9
  LSpr Enemy::THWOMP,              0,  35,   4
  LSpr Enemy::OWL,                 0,  64,  11
  LSpr Enemy::SNEAKER,             1,  86,   6
  LSpr Enemy::OWL,                 1,  90,   6
  LSpr Enemy::GEORGE,              0,  99,   3
  LSpr Enemy::SNEAKER,             1, 139,   5
  LSpr Enemy::GOOMBA,              1, 177,   8
  LSpr Enemy::GOOMBA,              1, 179,   8
  LSpr Enemy::GOOMBA,              0, 194,   7
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 199,   8, 2
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 208,  10, 5
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 223,   5, 7
  LSpr Enemy::GEORGE,              1, 243,   8
  .byt 255 ; end
