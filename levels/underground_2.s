underground_2:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr underground_2Data
  .addr underground_2Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_TROPICAL
  .byt 255 ; end
  .byt $00, $00 ; boundaries

underground_2Data:
  LObjN LO::R_GROUND,         0, 13, 10, 1
  LObjN LO::R_COIN,           6, 1, 3, 1
  LObjN LO::WIDE_1,           0, 3, 3, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           0, 12, 3, LN2::BUSH
  LObj  LO::S_PRIZE,          1, 10
  LObj  LO::S_SOLID_BLOCK,    3, 12
  LObjN LO::R_ROCK,           1, 11, 4, 3
  LObjN LO::R_ROCK,           1, 1, 1, 1
  LObj  LO::S_PRIZE,          0, 8
  LObjN LO::R_ROCK,           2, 1, 1, 2
  LObjN LO::R_ROCK,           2, 1, 7, 4
  LObjN LO::R_ROCK,           0, 9, 7, 5
  LObjN LO::R_AIR,            6, 4, 1, 1
  LObjN LO::R_ROCK,           2, 1, 3, 2
  LObjN LO::R_COIN,           0, 6, 1, 1
  LObjN LO::R_GROUND,         4, 1, 3, 2
  LObj  LO::S_FLOWER,         0, 11
  LObjN LO::R_GROUND,         0, 12, 3, 2
  LObj  LO::S_SOLID_ROCK,     2, 11
  LObjN LO::R_GROUND,         2, 1, 1, 4
  LObjN LO::R_COIN,           0, 9, 1, 1
  LObjN LO::R_GROUND,         0, 11, 5, 3
  LObjN LO::TALL_2,           3, 4, 5, LN2::PATH_LINE
  LObjN LO::WIDE_2,           2, 5, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::WIDE_2,           0, 11, 1, LN2::STONE_BRIDGE
  LObj  LO::S_HEART,          1, 4
  LObjN LO::WIDE_2,           1, 9, 3, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 10, 3, 0
  LObjN LO::R_GROUND,         0, 11, 3, 3
  LObjN LO::WIDE_1,           5, 0, 0, LN1::SPIKES
  LObj  LO::S_GROUND,         0, 1
  LObjN LO::R_GROUND,         1, 0, 6, 4
  LObjN LO::WIDE_1,           0, 10, 3, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 11, 3, 3
  LObjN LO::R_COIN,           1, 8, 1, 1
  LObjN LO::R_GROUND,         5, 9, 3, 5
  LObjN LO::R_GROUND,         1, 0, 5, 2
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SPIKES
  LObj  LO::S_FLOWER,         2, 8
  LObjN LO::R_GROUND,         3, 7, 3, 7
  LObjN LO::R_GROUND,         1, 0, 2, 3
  LObj  LO::S_BIG_BUSH, 0, 6
  LObjN LO::R_COIN,           1, 4, 1, 1
  LObjN LO::R_GROUND,         2, 10, 4, 4
  LObjN LO::R_AIR,            2, 10, 0, 4
  LObj  LO::S_SPRING,         1, 9
  LObjN LO::R_GROUND,         1, 0, 4, 3
  LObjN LO::WIDE_1,           0, 6, 8, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 10, 2, 0
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::ABILITY_FIRE
  LObjN LO::R_COIN,           0, 12, 3, 0
  LObjN LO::R_SOLID_BLOCK,    2, 6, 0, 3
  LObj  LO::S_HEART,          0, 10
  LObjN LO::WIDE_1,           0, 11, 1, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           3, 5, 0, LN1::SPIKES
  LObjN LO::R_ROCK,           0, 10, 2, 4
  LObjN LO::R_COIN,           3, 7, 1, 0
  LObjN LO::R_ROCK,           0, 8, 4, 6
  LObjN LO::WIDE_1,           1, 6, 3, LN1::SOLID_LEDGE
  LObjN LO::RECT_1,           4, 0, 3, LN1::GROUND, 20
  LObjN LO::R_ROCK,           0, 6, 5, 8
  LObjN LO::R_COIN,           6, 6, 0, 2
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_GROUND,         0, 11, 10, 3
  LObj  LO::S_GROUND_CLIMB_L, 4, 10
  LObjN LO::WIDE_1,           1, 9, 3, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 10, 3, 0
  LObjN LO::WIDE_1,           2, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 5, 0, 1
  LObj  LO::S_SOLID_BLOCK,    0, 7
  LObjN LO::R_GROUND,         0, 8, 6, 2
  LObjN LO::R_GROUND,         2, 11, 1, 1
  LObjN LO::R_COIN,           1, 7, 2, 0
  LObjN LO::RECT_1,           3, 0, 2, LN1::GROUND, 17
  LObjN LO::R_AIR,            1, 2, 5, 0
  LObj  LO::S_SPRING,         0, 7
  LObj  LO::S_GROUND,         0, 8
  LObjN LO::R_AIR,            1, 1, 3, 0
  LObjN LO::WIDE_1,           3, 7, 3, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 8, 6, 2
  LObjN LO::R_COIN,           1, 6, 2, 0
  LObjN LO::R_GROUND,         4, 11, 1, 3
  LObj  LO::S_GROUND_CLIMB_R, 2, 8
  LObjN LO::R_GROUND,         0, 9, 4, 5
  LObjN LO::TALL_2,           2, 6, 2, LN2::TRUNK_L
  LObj  LO::S_GROUND_CLIMB_R, 3, 9
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObjN LO::R_ROCK,           1, 0, 3, 6
  LObjN LO::R_BRICK,          2, 5, 1, 2
  LObj  LO::S_SPRING,         1, 9
  LObjN LO::R_ROCK,           1, 0, 5, 2
  LObjN LO::R_ROCK,           0, 7, 5, 7
  LObjN LO::R_COIN,           2, 4, 2, 0
  LObjN LO::R_BRICK,          1, 7, 1, 1
  LObjN LO::R_BRICK,          2, 7, 1, 2
  LObjN LO::R_ROCK,           1, 0, 3, 4
  LObjN LO::R_ROCK,           0, 10, 5, 4
  LObjN LO::R_BRICK,          3, 6, 2, 0
  LObjN LO::R_ROCK,           1, 0, 8, 3
  LObj  LO::S_PRIZE,          0, 6
  LObjN LO::WIDE_2,           2, 10, 5, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           1, 8, 3, 0
  LObjN LO::R_BRICK,          5, 6, 2, 0
  LObjN LO::R_ROCK,           0, 10, 13, 4
  LObjN LO::R_ROCK,           1, 0, 3, 2
  LObj  LO::S_PRIZE,          0, 6
  LWriteCol InventoryItem::ABILITY_WATER
  LObjN LO::R_SOLID_BLOCK,    2, 9, 1, 0
  LObjN LO::R_GROUND,         2, 0, 15, 2
  LObjN LO::R_SOLID_BLOCK,    0, 8, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 6, 0, 3
  LObjN LO::R_ROCK,           1, 5, 4, 4
  LObjN LO::R_AIR,            3, 8, 1, 3
  LObj  LO::S_PRIZE,          0, 9
  LObj  LO::S_SPRING,         3, 9
  LObjN LO::R_COIN,           1, 5, 2, 0
  LObjN LO::R_ROCK,           0, 7, 1, 7
  LObj  LO::S_PRIZE,          2, 7
  LObjN LO::R_GROUND,         0, 10, 9, 4
  LObj  LO::S_GROUND_CLIMB_L, 2, 9
  LObjN LO::R_COIN,           1, 7, 2, 0
  LObjN LO::R_GROUND,         0, 9, 6, 0
  LObjN LO::R_GROUND,         2, 0, 7, 3
  LObjN LO::WIDE_2,           3, 8, 4, LN2::PATH_LINE
  LObjN LO::TALL_2,           4, 9, 3, LN2::PATH_LINE
  LObjN LO::RECT_1,           1, 0, 1, LN1::GROUND, 20
  LObjN LO::WIDE_2,           0, 12, 5, LN2::PATH_LINE
  LObjN LO::TALL_2,           6, 3, 9, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 3, 2, LN2::PATH_LINE
  LObjN LO::TALL_2,           3, 3, 3, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 6, 3, LN2::PATH_LINE
  LObjN LO::R_GROUND,         3, 7, 6, 7
  LObjN LO::WIDE_2,           4, 6, 2, LN2::BUSH
  LObjN LO::RECT_1,           3, 0, 3, LN1::GROUND, 25
  LObjN LO::WIDE_1,           0, 7, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObjN LO::R_GROUND,         3, 4, 6, 3
  LObjN LO::R_GROUND,         1, 12, 4, 2
  LObjN LO::R_COIN,           1, 11, 2, 0
  LObjN LO::WIDE_2,           2, 10, 3, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           4, 7, 3, 0
  LObjN LO::WIDE_1,           0, 8, 3, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 10, 6, 4
  LObj  LO::S_PRIZE,          6, 7
  LObj  LO::S_SOLID_BLOCK,    1, 7
  LObjN LO::R_GROUND,         0, 8, 6, 6
  LObjN LO::R_AIR,            2, 3, 3, 0
  LObjN LO::R_AIR,            1, 8, 1, 6
  LObj  LO::S_GROUND_CLIMB_R, 3, 8
  LObjN LO::R_ROCK,           1, 0, 4, 4
  LObjN LO::R_ROCK,           0, 9, 5, 5
  LObjN LO::R_GROUND,         0, 9, 0, 5
  LObjN LO::TALL_2,           4, 5, 3, LN2::TRUNK
  LObjN LO::R_ROCK,           1, 0, 6, 2
  LObj  LO::S_SOLID_ROCK,     0, 8
  LObjN LO::R_ROCK,           1, 11, 8, 3
  LObjN LO::R_COIN,           3, 3, 2, 0
  LObjN LO::R_COIN,           0, 5, 2, 0
  LObjN LO::WIDE_1,           0, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 7, 2, 0
  LObj  LO::S_BIGHEART,       1, 4
  LObjN LO::WIDE_1,           1, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 0, 2, 8
  LObjN LO::R_AIR,            1, 8, 1, 0
  LObjN LO::RECT_3,           2, 0, 4, LN3::ROCK, 22
  LObjN LO::R_ROCK,           0, 10, 2, 4
  LObjN LO::RECT_3,           3, 8, 6, LN3::ROCK, 19
  LObj  LO::S_EXIT_DOOR,      12, 6
  LObjN LO::R_COIN,           2, 6, 1, 1
  LObjN LO::R_ROCK,           3, 5, 2, 2
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

underground_2Sprite:
  LSpr Enemy::FIREBAR,             0,  19,   9, 2
  LSpr Enemy::GOOMBA,              1,  21,   8
  LSpr Enemy::FIREBAR,             0,  30,  11, 10
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  35,   8
  LSpr Enemy::SNEAKER,             1,  42,   8
  LSpr Enemy::OWL,                 0,  54,   8
  LSpr Enemy::GOOMBA,              1,  67,   5
  LSpr Enemy::COLLECTIBLE,         0,  67,  11
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0,  67,  13, 4
  LSpr Enemy::GOOMBA,              1,  69,   5
  LSpr Enemy::GEORGE,              1,  74,   9
  LSpr Enemy::OWL,                 1,  86,   5
  LSpr Enemy::FIRE_WALK,           0,  94,   7, 1
  LSpr Enemy::CHECKPOINT,          0, 153,  11
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 166,   8, 1
  LSpr Enemy::CANNON_1,            0, 172,   5
  LSpr Enemy::CANNON_1,            0, 172,   9
  LSpr Enemy::GOOMBA,              1, 201,   9
  LSpr Enemy::GOOMBA,              1, 203,   9
  LSpr Enemy::FIRE_JUMP,           0, 205,   7, 1
  LSpr Enemy::FIRE_JUMP,           1, 228,   5, 1
  .byt 255 ; end
