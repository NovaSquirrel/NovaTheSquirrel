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
  .byt GraphicsUpload::PAL_ALTGRASS1
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_TROPICAL
  .byt 255 ; end
  .byt $00, $00 ; boundaries

waterData:
  LObjN LO::R_GROUND,         0, 13, 7, 1
  LObjN LO::WIDE_1,           6, 12, 6, LN1::TALLGRASS
  LObjN LO::R_SAND,           2, 13, 11, 1
  LObj  LO::S_TROPICAL_FLOWER,5, 10
  LObjN LO::R_SAND,           2, 11, 4, 1
  LObj  LO::S_SIGNPOST,       1, 10
  LWriteCol <WaterAbout, >WaterAbout
  LObj  LO::S_MOAI_LEFT,      3, 3
  LObj  LO::S_WOOD_PLATFORM_TOP, 0, 4
  LObjN LO::R_WOOD_PLATFORM,  0, 5, 0, 4
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObjN LO::WIDE_2,           1, 4, 9, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_WATER,          0, 10, 9, 3
  LObjN LO::R_SAND,           0, 14, 9, 0
  LObjN LO::R_COIN,           1, 2, 4, 1
  LObj  LO::S_WOOD_PLATFORM_TOP, 9, 4
  LObjN LO::R_WOOD_PLATFORM,  0, 5, 0, 4
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObjN LO::R_SAND,           0, 11, 11, 3
  LObjN LO::TALL_2,           1, 7, 3, LN2::PALM_TREE
  LObj  LO::S_SPRING,         2, 10
  LObjN LO::TALL_2,           1, 7, 3, LN2::PALM_TREE
  LObjN LO::R_SAND,           2, 7, 5, 3
  LObjN LO::WIDE_2,           1, 6, 3, LN2::FLOWER
  LObjN LO::R_WATER,          5, 7, 4, 7
  LObjN LO::R_GROUND,         5, 0, 4, 9
  LObjN LO::R_WATER,          0, 10, 4, 4
  LObjN LO::R_WATER,          5, 7, 4, 7
  LObjN LO::R_SOLID_BLOCK,    3, 13, 1, 0
  LObjN LO::R_BRICK,          2, 3, 1, 0
  LObjN LO::R_SAND,           0, 7, 3, 7
  LObj  LO::S_PRIZE,          2, 3
  LObjN LO::WIDE_1,           2, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SAND,           0, 10, 0, 1
  LObjN LO::R_SAND,           0, 12, 12, 2
  LObjN LO::R_GROUND,         1, 0, 2, 4
  LObjN LO::R_WATER,          1, 5, 1, 1
  LObjN LO::WIDE_1,           0, 11, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         2, 0, 7, 1
  LObjN LO::R_WATER,          0, 2, 1, 4
  LObjN LO::R_WATER,          2, 2, 5, 1
  LObjN LO::WIDE_1,           0, 11, 2, LN1::SPIKES
  LObj  LO::S_BIGHEART,       4, 11
  LObj  LO::S_MOAI_LEFT,      1, 11
  LObjN LO::R_SOLID_BLOCK,    1, 7, 0, 4
  LObjN LO::R_COIN,           1, 2, 1, 1
  LObj  LO::S_TROPICAL_FLOWER,0, 6
  LObjN LO::R_GROUND,         0, 9, 10, 5
  LObj  LO::S_BIG_BUSH, 2, 8
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObj  LO::S_TROPICAL_FLOWER,0, 6
  LObjN LO::R_GROUND,         1, 1, 3, 1
  LObjN LO::RECT_1,           1, 0, 1, LN1::GROUND, 24
  LObj  LO::S_BIG_BUSH, 0, 8
  LObjN LO::RECT_1,           3, 2, 1, LN1::WATER, 21
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::WIDE_1,           1, 12, 0, LN1::SPIKES
  LObj  LO::S_GROUND,         0, 13
  LObjN LO::R_GROUND,         0, 14, 5, 0
  LObjN LO::WIDE_1,           1, 13, 4, LN1::SPIKES
  LObjN LO::R_COIN,           5, 6, 2, 0
  LObjN LO::R_GROUND,         0, 9, 10, 5
  LObj  LO::S_BIG_BUSH, 1, 8
  LObj  LO::S_GROUND_CLIMB_L, 3, 8
  LObjN LO::WIDE_2,           1, 7, 1, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 8, 1, 0
  LObj  LO::S_GROUND_CLIMB_R, 2, 8
  LObjN LO::TALL_2,           2, 6, 2, LN2::PALM_TREE
  LObjN LO::R_COIN,           2, 9, 0, 2
  LObjN LO::R_WATER,          0, 12, 14, 2
  LObjN LO::R_GROUND,         3, 0, 2, 0
  LObjN LO::R_GROUND,         0, 5, 6, 6
  LObj  LO::S_PRIZE,          1, 2
  LObjN LO::R_COIN,           1, 2, 0, 2
  LObjN LO::R_GROUND,         1, 0, 14, 4
  LObjN LO::R_WATER,          4, 5, 10, 6
  LObjN LO::R_SAND,           4, 12, 9, 2
  LObj  LO::S_SPRING,         8, 11
  LObjN LO::WIDE_1,           3, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::RECT_2,           4, 12, 2, LN2::SAND, 16
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObjN LO::WIDE_2,           0, 5, 1, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 6, 1, 5
  LObjN LO::R_COIN,           1, 2, 2, 0
  LObjN LO::WIDE_1,           0, 3, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           0, 9, 1, LN2::WOOD_PLATFORM_TOP
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::R_WOOD_PLATFORM,  0, 10, 0, 1
  LObj  LO::S_HEART,          2, 11
  LObjN LO::WIDE_1,           1, 2, 4, LN1::FENCE
  LObjN LO::R_SAND,           0, 3, 4, 8
  LObjN LO::R_COIN,           6, 3, 0, 7
  LObj  LO::S_CEILING_BARRIER,2, 0
  LObjN LO::R_GROUND,         1, 0, 6, 6
  LObj  LO::S_FLOWER,         1, 11
  LObj  LO::S_FLOWER,         4, 11
  LObjN LO::R_SAND,           0, 12, 5, 2
  LObjN LO::R_WATER,          2, 3, 1, 8
  LObjN LO::R_GROUND,         2, 3, 8, 1
  LObj  LO::S_BIGHEART,       1, 11
  LObjN LO::R_COIN,           4, 2, 2, 0
  LObjN LO::R_GROUND,         0, 5, 8, 1
  LObjN LO::R_COIN,           0, 9, 2, 1
  LObjN LO::R_GROUND,         0, 11, 2, 3
  LObj  LO::S_PRIZE,          1, 8
  LObjN LO::R_GROUND,         2, 7, 8, 7
  LObj  LO::S_MOAI_RIGHT,     3, 4
  LObjN LO::R_COIN,           6, 4, 3, 1
  LObjN LO::WIDE_2,           0, 7, 3, LN2::STONE_BRIDGE
  LObjN LO::R_WATER,          0, 10, 3, 4
  LObjN LO::R_SAND,           4, 7, 8, 7
  LObj  LO::S_MOAI_LEFT,      1, 6
  LObjN LO::TALL_2,           2, 4, 2, LN2::TRUNK_L
  LObj  LO::S_CEILING_BARRIER,3, 0
  LObjN LO::WIDE_1,           0, 6, 2, LN1::TALLGRASS
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
  LObjN LO::R_GROUND,         0, 11, 1, 3
  LObjN LO::RECT_1,           2, 13, 1, LN1::GROUND, 41
  LObjN LO::WIDE_2,           2, 10, 4, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 11, 4, 1
  LObjN LO::R_COIN,           1, 9, 2, 0
  LObj  LO::S_COIN,           3, 8
  LObjN LO::RECT_2,           0, 13, 1, LN2::SAND, 16
  LObj  LO::S_COIN,           2, 7
  LObjN LO::R_SAND,           1, 10, 7, 4
  LObj  LO::S_COIN,           1, 8
  LObjN LO::WIDE_2,           2, 6, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 7, 2, 2
  LObjN LO::WIDE_1,           3, 9, 0, LN1::SPIKES
  LObjN LO::TALL_2,           3, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 10, 2, LN2::TRUNK_L
  LObj  LO::S_MOAI_RIGHT,     3, 12
  LObj  LO::S_MOAI_RIGHT,     3, 11
  LObj  LO::S_WOOD_PLATFORM_TOP, 0, 12
  LObj  LO::S_MOAI_RIGHT,     3, 10
  LObj  LO::S_WOOD_PLATFORM_TOP, 0, 11
  LObj  LO::S_WOOD_PLATFORM,  0, 12
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::R_COIN,           2, 4, 2, 0
  LObjN LO::WIDE_2,           0, 9, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 10, 2, 2
  LObj  LO::S_WOOD_PLATFORM_TOP, 1, 6
  LObjN LO::R_WOOD_PLATFORM,  0, 7, 0, 1
  LObjN LO::R_GROUND,         2, 6, 4, 6
  LObj  LO::S_EXIT_DOOR,      2, 4
  LObjN LO::R_GROUND,         3, 2, 2, 12
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  .byt LSpecialCmd, LevelSpecialConfig::ANIMATED_WATER
  LFinished

waterSprite:
  LSpr Enemy::GOOMBA,              1,  18,  10
  LSpr Enemy::COLLECTIBLE,         0,  28,   2
  LSpr Enemy::OWL,                 0,  37,   6
  LSpr Enemy::CANNON_1,            1,  50,  10
  LSpr Enemy::GEORGE,              1,  56,  12
  LSpr Enemy::THWOMP,              0,  79,   3
  LSpr Enemy::THWOMP,              0,  82,   3
  LSpr Enemy::THWOMP,              0,  89,   2
  LSpr Enemy::OWL,                 0,  97,   7
  LSpr Enemy::SPINNER,             1, 103,   2
  LSpr Enemy::FIRE_JUMP,           1, 105,   4, 1
  LSpr Enemy::CANNON_1,            0, 110,  10
  LSpr Enemy::THWOMP,              0, 119,   5
  LSpr Enemy::SNEAKER,             1, 128,   7
  LSpr Enemy::CHECKPOINT,          0, 134,  10
  LSpr Enemy::SPINNER,             0, 147,   7
  LSpr Enemy::BALL_GUY,            1, 160,  10
  LSpr Enemy::GEORGE,              1, 168,   4
  LSpr Enemy::GOOMBA,              1, 184,   6
  LSpr Enemy::FIRE_WALK,           0, 185,  10, 1
  LSpr Enemy::FIRE_WALK,           1, 193,   8, 1
  LSpr Enemy::FIRE_WALK,           1, 198,  10, 1
  LSpr Enemy::THWOMP,              0, 202,   2
  LSpr Enemy::SNEAKER,             1, 224,   5
  LSpr Enemy::GEORGE,              1, 238,  10
  LSpr Enemy::GOOMBA,              1, 252,   5
  .byt 255 ; end
