final1:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_FACEBALL
  .addr final1Data
  .addr final1Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $00, $04 ; boundaries

final1Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <MeetRemy, >MeetRemy
  LObjN LO::R_SOLID_ROCK,     0, 11, 0, 1
  LObjN LO::R_GROUND,         0, 13, 13, 1
  LObjN LO::TALL_2,           2, 10, 2, LN2::TRUNK_L
  LObjN LO::WIDE_1,           3, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::R_BRICK,          2, 7, 1, 0
  LObj  LO::S_SOLID_ROCK,     0, 12
  LObjN LO::R_COIN,           1, 4, 1, 1
  LObjN LO::R_SOLID_ROCK,     0, 11, 0, 1
  LObjN LO::R_SOLID_ROCK,     1, 7, 2, 0
  LObjN LO::RECT_2,           0, 8, 2, LN2::BLACK, 2
  LObjN LO::R_GROUND,         0, 11, 3, 1
  LObj  LO::S_PRIZE,          1, 7
  LObjN LO::WIDE_1,           2, 6, 2, LN1::FENCE
  LObjN LO::R_SOLID_ROCK,     0, 7, 0, 3
  LObjN LO::WIDE_1,           1, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         2, 11, 2, 3
  LObjN LO::WIDE_1,           3, 8, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 9, 2, 5
  LObjN LO::R_COIN,           1, 1, 7, 0
  LObjN LO::R_SOLID_ROCK,     0, 2, 4, 0
  LObj  LO::S_PRIZE,          0, 6
  LObjN LO::WIDE_1,           2, 9, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           0, 10, 2, 0
  LObjN LO::WIDE_1,           0, 11, 2, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     3, 2, 2, 4
  LObjN LO::R_GROUND,         0, 9, 3, 5
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_AIR,            0, 3, 1, 0
  LObjN LO::R_BRICK,          0, 7, 2, 0
  LObjN LO::R_BRICK,          2, 4, 2, 0
  LObjN LO::R_BRICK,          0, 5, 0, 1
  LObjN LO::R_GROUND,         1, 7, 2, 7
  LObj  LO::S_BIGHEART,       2, 4
  LObjN LO::WIDE_1,           1, 7, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 6, 3, LN1::FENCE
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::WIDE_1,           0, 12, 5, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          2, 9
  LWriteCol InventoryItem::ABILITY_WATER | 128
  LObjN LO::R_COIN,           0, 10, 1, 1
  LObjN LO::R_SOLID_ROCK,     1, 7, 0, 2
  LObjN LO::WIDE_1,           3, 5, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_GROUND,         0, 10, 2, 4
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 1, 6, LN1::SPIKES
  LObjN LO::R_SOLID_ROCK,     0, 2, 0, 2
  LObjN LO::R_SOLID_ROCK,     1, 2, 5, 0
  LObjN LO::R_GROUND,         0, 13, 5, 1
  LObjN LO::R_BRICK,          1, 6, 3, 0
  LObjN LO::WIDE_1,           1, 10, 8, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       1, 5
  LObjN LO::WIDE_1,           0, 12, 2, LN1::TALLGRASS
  LObjN LO::R_SOLID_ROCK,     2, 3, 0, 3
  LObjN LO::WIDE_1,           0, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 4
  LObjN LO::R_COIN,           0, 5, 1, 1
  LObj  LO::S_SOLID_ROCK,     1, 9
  LObj  LO::S_PRIZE,          3, 7
  LWriteCol InventoryItem::BALLOON | 128
  LObjN LO::TALL_2,           3, 12, 2, LN2::TRUNK_L
  LObj  LO::S_COIN,           3, 6
  LObjN LO::R_SOLID_BLOCK,    0, 7, 0, 2
  LObjN LO::R_GROUND,         0, 10, 7, 4
  LObjN LO::TALL_2,           2, 7, 2, LN2::TRUNK_L
  LObjN LO::WIDE_1,           3, 6, 4, LN1::FENCE
  LObjN LO::WIDE_1,           0, 7, 4, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 9, 2, 0
  LObj  LO::S_GROUND_CLIMB_R, 3, 10
  LObjN LO::R_GROUND,         0, 11, 1, 3
  LObj  LO::S_GROUND_CLIMB_R, 2, 11
  LObjN LO::R_GROUND,         0, 12, 6, 2
  LObjN LO::WIDE_1,           1, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 4, LN1::SOLID_LEDGE
  LObj  LO::S_BIG_BUSH, 1, 11
  LObjN LO::R_SOLID_ROCK,     2, 4, 2, 0
  LObj  LO::S_SOLID_BLOCK,    2, 11
  LObjN LO::R_SOLID_ROCK,     1, 4, 0, 10
  LObjN LO::R_GROUND,         1, 12, 6, 2
  LObjN LO::WIDE_1,           1, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 6
  LObj  LO::S_CUSTOM,         2, 11, Metatiles::PUSHABLE_BLOCK
  LObjN LO::WIDE_1,           1, 9, 4, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_GROUND_CLIMB_L, 2, 11
  LObjN LO::R_GROUND,         0, 12, 0, 2
  LObjN LO::R_GROUND,         1, 3, 8, 2
  LObj  LO::S_HEART,          0, 10
  LObjN LO::R_GROUND,         0, 11, 3, 3
  LObjN LO::WIDE_1,           1, 2, 7, LN1::SPIKES
  LObjN LO::TALL_2,           1, 6, 4, LN2::TRUNK
  LObj  LO::S_GROUND_CLIMB_L, 1, 10
  LObj  LO::S_GROUND_CLIMB_L, 1, 9
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObjN LO::WIDE_1,           1, 8, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 9, 4, 0
  LObjN LO::TALL_2,           3, 6, 2, LN2::TRUNK
  LObjN LO::R_GROUND,         1, 2, 1, 2
  LObjN LO::WIDE_1,           0, 5, 5, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 9, 8, 0
  LObjN LO::RECT_2,           0, 10, 2, LN2::BLACK, 7
  LObjN LO::R_GROUND,         0, 13, 8, 1
  LObjN LO::WIDE_2,           5, 8, 1, LN2::FLOWER
  LObj  LO::S_SPRING,         2, 8
  LObjN LO::WIDE_1,           3, 4, 6, LN1::FENCE
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::PATH_LINE, (1<<4)|1
  LObj  LO::S_SPRING,         2, 13
  LObj  LO::S_SOLID_BLOCK,    0, 14
  LObj  LO::S_SOLID_ROCK,     1, 5
  LObjN LO::TALL_2,           0, 6, 8, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 7, 1, 2
  LObjN LO::WIDE_1,           0, 10, 2, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       2, 7
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_GROUND,         1, 5, 4, 9
  LObj  LO::S_SPRING,         5, 8
  LObjN LO::R_GROUND,         0, 9, 6, 5
  LObjN LO::WIDE_2,           2, 8, 2, LN2::FLOWER
  LObjN LO::TALL_2,           3, 6, 2, LN2::TRUNK_L
  LObjN LO::WIDE_1,           2, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_WATER,          0, 12, 2, 2
  LObjN LO::WIDE_1,           1, 4, 7, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 3, 2, 0
  LObjN LO::R_GROUND,         0, 9, 2, 5
  LObj  LO::S_PRIZE,          1, 6
  LObjN LO::R_COIN,           1, 5, 2, 0
  LObjN LO::R_BRICK,          0, 6, 2, 0
  LObjN LO::WIDE_1,           1, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_WATER,          0, 12, 2, 2
  LObj  LO::S_PRIZE,          2, 6
  LObj  LO::S_SOLID_ROCK,     1, 4
  LObjN LO::TALL_2,           0, 5, 3, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 9, 7, 5
  LObjN LO::TALL_2,           2, 6, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 6, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 6, 2, LN2::TRUNK_L
  LObj  LO::S_SPRING,         2, 9
  LObjN LO::R_SOLID_ROCK,     0, 10, 3, 4
  LObjN LO::WIDE_1,           1, 5, 1, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           2, 5, 4, LN1::LADDER
  LObjN LO::R_GROUND,         1, 5, 3, 9
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_1,           1, 0, 13, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 1, 11, 2
  LObjN LO::RECT_2,           1, 4, 0, LN2::BLACK, 0
  LObjN LO::RECT_2,           1, 4, 7, LN2::BLACK, 9
  LObjN LO::R_SOLID_ROCK,     0, 5, 2, 0
  LObjN LO::R_GROUND,         0, 12, 14, 2
  LObjN LO::R_SOLID_ROCK,     2, 10, 2, 1
  LObjN LO::R_SOLID_ROCK,     5, 8, 2, 0
  LObj  LO::S_PRIZE,          1, 8
  LObjN LO::R_GROUND,         2, 1, 1, 9
  LObjN LO::RECT_2,           0, 11, 0, LN2::BLACK, 0
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObj  LO::S_PRIZE,          0, 8
  LWriteCol InventoryItem::BALLOON | 128
  LObj  LO::S_BIGHEART,       0, 11
  LObj  LO::S_COIN,           1, 6
  LObj  LO::S_COIN,           1, 5
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::R_COIN,           1, 4, 2, 0
  LObj  LO::S_SOLID_ROCK,     4, 7
  LObjN LO::R_GROUND,         0, 8, 4, 6
  LObjN LO::WIDE_1,           1, 7, 2, LN1::FENCE
  LObjN LO::R_GROUND,         3, 1, 8, 2
  LObjN LO::TALL_2,           0, 4, 3, LN2::TRUNK
  LObjN LO::R_COIN,           4, 6, 0, 5
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::S_SOLID_ROCK,     0, 13
  LObjN LO::RECT_1,           3, 11, 3, LN1::GROUND, 17
  LObjN LO::TALL_2,           1, 4, 6, LN2::TRUNK
  LObj  LO::S_FLOWER,         1, 10
  LObj  LO::S_GROUND_CLIMB_L, 1, 10
  LObj  LO::S_GROUND_CLIMB_L, 1, 9
  LObj  LO::S_GROUND,         0, 10
  LObj  LO::S_FLOWER,         1, 8
  LObjN LO::R_GROUND,         0, 9, 12, 1
  LObj  LO::S_GROUND_CLIMB_L, 2, 8
  LObj  LO::S_GROUND_CLIMB_L, 1, 7
  LObj  LO::S_GROUND,         0, 8
  LObjN LO::R_COIN,           1, 6, 3, 0
  LObjN LO::R_GROUND,         0, 7, 8, 1
  LObj  LO::S_GROUND_CLIMB_L, 4, 6
  LObjN LO::TALL_2,           1, 3, 2, LN2::TRUNK_L
  LObjN LO::R_GROUND,         0, 6, 3, 0
  LObjN LO::TALL_2,           2, 3, 2, LN2::TRUNK_L
  LObjN LO::R_SOLID_ROCK,     2, 6, 3, 8
  LObjN LO::R_GROUND,         3, 1, 8, 2
  LObjN LO::TALL_2,           0, 4, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 13, 1, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           3, 4, 10, LN2::TRUNK
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::R_SOLID_ROCK,     0, 12, 2, 2
  LObjN LO::TALL_2,           3, 4, 10, LN2::TRUNK
  LObjN LO::R_SOLID_ROCK,     2, 10, 2, 4
  LObjN LO::R_GROUND,         3, 11, 5, 3
  LObjN LO::TALL_2,           1, 8, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 8, 2, LN2::TRUNK_L
  LObjN LO::R_GROUND,         3, 8, 5, 6
  LObjN LO::R_SOLID_BLOCK,    1, 4, 4, 0
  LObjN LO::TALL_2,           0, 5, 2, LN2::TRUNK
  LObj  LO::S_EXIT_DOOR,      2, 6
  LObjN LO::TALL_2,           2, 5, 2, LN2::TRUNK
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

final1Sprite:
  LSpr Enemy::TURKEY,              1,  11,  10, 1
  LSpr Enemy::FIREWORK_SHOOTER,    0,  16,  10
  LSpr Enemy::CHECKPOINT,          0,  22,   1
  LSpr Enemy::FIRE_JUMP,           0,  31,   6, 1
  LSpr Enemy::FIREWORK_SHOOTER,    0,  35,  11
  LSpr Enemy::FIRE_JUMP,           1,  41,   4
  LSpr Enemy::TURKEY,              1,  41,   9
  LSpr Enemy::FIRE_WALK,           0,  44,  12, 1
  LSpr Enemy::FIREWORK_SHOOTER,    1,  49,   9, 1
  LSpr Enemy::FIRE_WALK,           1,  66,   6, 1
  LSpr Enemy::CHECKPOINT,          0,  71,   3
  LSpr Enemy::FIRE_JUMP,           1,  72,   8
  LSpr Enemy::FIRE_WALK,           1,  73,  11
  LSpr Enemy::ROCKET_LAUNCHER,     0,  78,  11
  LSpr Enemy::SNEAKER,             1,  85,   2
  LSpr Enemy::ROVER,               1,  95,   8
  LSpr Enemy::TURKEY,              1,  95,  12
  LSpr Enemy::OWL,                 0,  96,   4
  LSpr Enemy::COLLECTIBLE,         0,  97,  11
  LSpr Enemy::SNEAKER,             1, 104,   4
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 104,   9
  LSpr Enemy::OWL,                 0, 117,   8
  LSpr Enemy::TURKEY,              1, 125,   3
  LSpr Enemy::TURKEY,              1, 128,   8
  LSpr Enemy::TURKEY,              1, 131,   3
  LSpr Enemy::FIRE_JUMP,           1, 141,   4, 1
  LSpr Enemy::TURKEY,              0, 151,   9
  LSpr Enemy::SPINNER,             0, 153,   5, 3
  LSpr Enemy::CHECKPOINT,          0, 159,  11
  LSpr Enemy::ROVER,               1, 170,   7
  LSpr Enemy::FIRE_JUMP,           1, 184,   8
  LSpr Enemy::FIRE_JUMP,           1, 188,   6
  LSpr Enemy::ROVER,               1, 194,   5
  LSpr Enemy::FIRE_JUMP,           1, 198,   5
  LSpr Enemy::FIREWORK_SHOOTER,    0, 206,  11
  LSpr Enemy::ROVER,               1, 221,   7
  .byt 255 ; end
