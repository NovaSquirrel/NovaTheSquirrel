final2:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_FACEBALL
  .addr final2Data
  .addr final2Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG_GRAY
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_CHIP_DABG
  .byt 255 ; end
  .byt $00, $00 ; boundaries

final2Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <MeetRemy, >MeetRemy
  LObjN LO::R_GROUND,         0, 13, 13, 1
  LObj  LO::S_SPRING,         5, 12
  LObjN LO::R_SOLID_BLOCK,    2, 10, 0, 2
  LObj  LO::S_SPRING,         1, 9
  LObjN LO::WIDE_1,           0, 10, 2, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       0, 12
  LObj  LO::S_CUSTOM,         1, 12, Metatiles::KEY_RED
  LObjN LO::R_SOLID_BLOCK,    1, 7, 0, 2
  LObjN LO::R_COIN,           0, 11, 2, 0
  LObj  LO::S_SPRING,         1, 6
  LObjN LO::WIDE_1,           0, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 10, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 2
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_OFF, (5<<4)|0
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::TOGGLE_BLOCK_ON, (1<<4)|0
  LObjN LO::R_COIN,           0, 9, 2, 0
  LObjN LO::WIDE_1,           1, 10, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           0, 13, 5, LN2::PATH_LINE
  LObjN LO::WIDE_1,           1, 4, 9, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_SOLID_BLOCK,    1, 4
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObj  LO::S_HEART,          0, 9
  LObjN LO::TALL_2,           1, 8, 4, LN2::PATH_LINE
  LObjN LO::R_CEILING_BARRIER,5, 0, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 2
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::LOCK_RED
  LObjN LO::R_ROCK,           0, 4, 4, 10
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_PRIZE,          4, 4
  LObjN LO::R_GROUND,         0, 8, 4, 6
  LObjN LO::R_COIN,           3, 3, 2, 0
  LObjN LO::WIDE_1,           0, 4, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 7
  LObjN LO::R_WATER,          1, 12, 1, 2
  LObjN LO::WIDE_1,           1, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_GROUND,         0, 11, 9, 3
  LObjN LO::WIDE_1,           1, 7, 0, LN1::SPIKES
  LObj  LO::S_CUSTOM,         1, 10, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_COIN,           2, 3, 2, 0
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     0, 9, 5, 1
  LObj  LO::R_CUSTOM,         4, 5, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LObj  LO::R_CUSTOM,         3, 9, Metatiles::TOGGLE_BLOCK_ON, (3<<4)|0
  LObjN LO::WIDE_1,           1, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       1, 8
  LObjN LO::WIDE_2,           3, 4, 5, LN2::PATH_LINE
  LObjN LO::R_ROCK,           0, 9, 4, 5
  LObj  LO::S_CUSTOM,         5, 8, Metatiles::TOGGLE_SWITCH
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           0, 11, 4, LN2::BUSH
  LObjN LO::R_GROUND,         0, 12, 7, 2
  LObjN LO::R_COIN,           3, 2, 3, 0
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::TOGGLE_BLOCK_ON, (3<<4)|0
  LObj  LO::S_CUSTOM,         3, 4, Metatiles::TOGGLE_BLOCK_ON
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_ON, (3<<4)|0
  LObj  LO::S_PRIZE,          2, 3
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObjN LO::R_WATER,          0, 13, 7, 1
  LObj  LO::S_BIGHEART,       1, 4
  LObjN LO::R_ROCK,           7, 0, 7, 6
  LObjN LO::TALL_2,           0, 7, 4, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 12, 7, 2
  LObjN LO::TALL_2,           2, 9, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           4, 9, 2, LN2::TRUNK_L
  LObjN LO::WIDE_1,           2, 5, 3, LN1::FENCE
  LObjN LO::R_SOLID_ROCK,     0, 6, 3, 0
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::CLONE_SWITCH
  LWriteCol 86
  LObjN LO::R_GROUND,         0, 11, 3, 3
  LObjN LO::TALL_2,           1, 7, 3, LN2::TRUNK
  LObj  LO::S_CUSTOM,         2, 11, Metatiles::CLONER
  LWriteCol Enemy::NONE | 1
  LObjN LO::WIDE_1,           1, 6, 3, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           1, 8, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 9, 2, 5
  LObjN LO::WIDE_1,           3, 5, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 6, 3, 8
  LObj  LO::S_SOLID_ROCK,     3, 5
  LObj  LO::R_CUSTOM,         1, 6, Metatiles::TOGGLE_BLOCK_ON, (3<<4)|0
  LObj  LO::S_SOLID_ROCK,     3, 9
  LObjN LO::TALL_2,           0, 10, 4, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::WIDE_1,           0, 5, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 11, 2, LN1::FENCE
  LObj  LO::S_SOLID_ROCK,     0, 12
  LObjN LO::TALL_2,           0, 13, 1, LN2::TRUNK
  LObjN LO::R_SOLID_ROCK,     1, 0, 0, 3
  LObj  LO::S_CUSTOM,         0, 4, Metatiles::LOCK_GREEN
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_OFF, (4<<4)|0
  LObj  LO::S_SOLID_ROCK,     0, 9
  LObjN LO::TALL_2,           0, 10, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         2, 2, Metatiles::KEY_BLUE
  LObj  LO::S_BIGHEART,       0, 4
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_CUSTOM,         1, 11, Metatiles::KEY_GREEN
  LObj  LO::S_SOLID_ROCK,     0, 12
  LObjN LO::TALL_2,           0, 13, 1, LN2::TRUNK
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_ROCK,           1, 0, 8, 6
  LObjN LO::TALL_2,           0, 7, 4, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 12, 8, 2
  LObj  LO::S_BIG_BUSH, 1, 11
  LObj  LO::S_BIG_BUSH, 3, 11
  LObjN LO::WIDE_1,           2, 11, 1, LN1::TALLGRASS
  LObjN LO::WIDE_1,           1, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     1, 7, 0, 4
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::LOCK_BLUE
  LObjN LO::WIDE_1,           1, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 11, 4, LN1::FENCE
  LObj  LO::S_SOLID_ROCK,     0, 12
  LObjN LO::TALL_2,           0, 13, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 8, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 11
  LObj  LO::S_SOLID_ROCK,     2, 12
  LObjN LO::TALL_2,           0, 13, 1, LN2::TRUNK
  LObjN LO::R_ROCK,           2, 8, 4, 6
  LObj  LO::S_SPRING,         4, 7
  LObjN LO::WIDE_2,           1, 8, 4, LN2::BUSH
  LObjN LO::R_GROUND,         0, 9, 4, 5
  LObjN LO::R_ROCK,           2, 0, 10, 4
  LObjN LO::TALL_2,           6, 5, 3, LN2::TRUNK
  LObjN LO::R_SOLID_BLOCK,    0, 9, 0, 2
  LObjN LO::WIDE_1,           0, 12, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 9, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           0, 10, 2, 1
  LObjN LO::TALL_2,           3, 5, 3, LN2::TRUNK
  LObjN LO::R_SOLID_BLOCK,    0, 9, 0, 2
  LObjN LO::R_ROCK,           1, 0, 10, 1
  LObjN LO::R_COIN,           0, 6, 0, 2
  LObjN LO::WIDE_1,           2, 5, 4, LN1::FENCE
  LObjN LO::R_GROUND,         0, 6, 4, 8
  LObjN LO::R_COIN,           5, 7, 0, 2
  LObjN LO::R_ROCK,           4, 0, 3, 7
  LObjN LO::TALL_2,           0, 8, 6, LN2::TRUNK
  LObjN LO::TALL_2,           3, 8, 6, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 9
  LObj  LO::S_SOLID_BLOCK,    3, 5
  LObjN LO::R_GROUND,         0, 6, 7, 8
  LObjN LO::WIDE_2,           1, 5, 6, LN2::FLOWER
  LObjN LO::RECT_2,           2, 7, 1, LN2::BLACK, 3
  LObjN LO::RECT_2,           0, 9, 2, LN2::BLACK, 1
  LObjN LO::RECT_2,           1, 11, 1, LN2::BLACK, 3
  LObjN LO::R_AIR,            3, 7, 0, 1
  LObjN LO::R_COIN,           1, 6, 0, 2
  LObjN LO::R_GROUND,         0, 9, 3, 5
  LObjN LO::RECT_2,           0, 11, 1, LN2::BLACK, 2
  LObjN LO::R_SOLID_ROCK,     3, 1, 0, 7
  LObjN LO::R_AIR,            0, 11, 0, 1
  LObjN LO::WIDE_1,           3, 2, 2, LN1::FALLTHROUGH_LEDGE
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LObj  LO::S_CUSTOM,         1, 1, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_CEILING_BARRIER,3, 0, 0, 1
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LObjN LO::WIDE_1,           0, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     1, 0, 0, 4
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_SOLID_ROCK,     2, 5, 0, 4
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_OFF
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORCE_DOWN, (0<<4)|4
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::FORCE_RIGHT, (4<<4)|0
  LObjN LO::R_SOLID_ROCK,     1, 5, 0, 4
  LObjN LO::WIDE_1,           1, 5, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     2, 0, 0, 8
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 10
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORCE_UP, (0<<4)|1
  LObjN LO::WIDE_1,           2, 6, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 1, 3, LN1::FENCE
  LObjN LO::R_GROUND,         0, 2, 9, 1
  LObjN LO::R_GROUND,         0, 6, 3, 8
  LObjN LO::RECT_2,           1, 4, 1, LN2::BLACK, 4
  LObj  LO::S_CUSTOM,         3, 1, Metatiles::KEY_BLUE
  LObjN LO::RECT_2,           0, 6, 4, LN2::BLACK, 1
  LObjN LO::R_GROUND,         0, 11, 6, 3
  LObjN LO::R_COIN,           1, 1, 4, 0
  LObjN LO::RECT_2,           1, 4, 1, LN2::BLACK, 3
  LObjN LO::R_GROUND,         0, 6, 6, 2
  LObjN LO::RECT_2,           0, 9, 1, LN2::BLACK, 6
  LObjN LO::RECT_2,           4, 3, 2, LN2::BLACK, 1
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::FORCE_UP
  LObjN LO::RECT_2,           0, 11, 1, LN2::BLACK, 3
  LObjN LO::R_GROUND,         0, 13, 9, 1
  LObj  LO::S_BIGHEART,       1, 1
  LObjN LO::R_GROUND,         0, 2, 3, 3
  LObjN LO::R_GROUND,         1, 6, 2, 4
  LObjN LO::WIDE_1,           3, 12, 3, LN1::TALLGRASS
  LObjN LO::WIDE_1,           4, 1, 7, LN1::SPIKES
  LObjN LO::R_ROCK,           0, 2, 7, 4
  LObjN LO::TALL_2,           0, 7, 4, LN2::TRUNK
  LObj  LO::S_SOLID_BLOCK,    0, 12
  LObjN LO::TALL_2,           7, 7, 7, LN2::TRUNK
  LObjN LO::WIDE_1,           2, 6, 5, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           7, 1, 7, LN1::SPIKES
  LObjN LO::R_ROCK,           0, 2, 7, 4
  LObjN LO::TALL_2,           0, 7, 7, LN2::TRUNK
  LObjN LO::TALL_2,           7, 7, 4, LN2::TRUNK
  LObj  LO::S_SOLID_BLOCK,    0, 12
  LObjN LO::R_GROUND,         0, 13, 9, 1
  LObjN LO::R_COIN,           5, 1, 2, 1
  LObjN LO::WIDE_1,           0, 3, 2, LN1::SOLID_LEDGE
  LObj  LO::S_FLOWER,         0, 7
  LObjN LO::R_GROUND,         0, 8, 4, 4
  LObj  LO::S_FLOWER,         2, 7
  LObj  LO::S_FLOWER,         2, 7
  LObjN LO::R_GROUND,         1, 10, 11, 4
  LObjN LO::R_ROCK,           3, 4, 4, 2
  LObjN LO::TALL_2,           0, 7, 2, LN2::TRUNK
  LObj  LO::S_EXIT_DOOR,      2, 8
  LObjN LO::TALL_2,           2, 7, 2, LN2::TRUNK
  LObjN LO::R_SOLID_ROCK,     1, 6, 0, 2
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::LOCK_BLUE
  LObj  LO::S_PRIZE,          1, 6
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_COIN,           0, 7, 2, 2
  LObjN LO::R_SOLID_ROCK,     1, 6, 1, 0
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

final2Sprite:
  LSpr Enemy::FIRE_JUMP,           1,  13,  12, 1
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  15,  13
  LSpr Enemy::BOUNCER,             1,  21,   3
  LSpr Enemy::BIG_LWSS,            0,  23,   1
  LSpr Enemy::CHECKPOINT,          0,  28,   3
  LSpr Enemy::TURKEY,              0,  32,   7
  LSpr Enemy::BIG_GLIDER,          0,  36,   1
  LSpr Enemy::BOUNCER,             1,  44,   8
  LSpr Enemy::TURKEY,              1,  51,   4
  LSpr Enemy::BIG_LWSS,            1,  53,   5, 1
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  54,   4
  LSpr Enemy::BIG_GLIDER,          1,  60,   4
  LSpr Enemy::BIG_GLIDER,          1,  60,   5, 1
  LSpr Enemy::COLLECTIBLE,         1,  66,   3
  LSpr Enemy::FIRE_JUMP,           1,  66,  11
  LSpr Enemy::FIRE_JUMP,           1,  75,  11, 1
  LSpr Enemy::ROVER,               0,  84,   5
  LSpr Enemy::BIG_GLIDER,          1, 100,   8, 1
  LSpr Enemy::BIG_GLIDER,          1, 101,   6, 1
  LSpr Enemy::BIG_GLIDER,          1, 103,  10, 1
  LSpr Enemy::BIG_GLIDER,          1, 105,   9, 1
  LSpr Enemy::ROVER,               1, 111,  11
  LSpr Enemy::CHECKPOINT,          0, 118,  11
  LSpr Enemy::TURKEY,              1, 125,   7
  LSpr Enemy::ROVER,               1, 132,   8
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 141,   9, 3
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 148,   6, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 150,  10, 0
  LSpr Enemy::FIRE_JUMP,           1, 164,   5, 1
  LSpr Enemy::FIRE_WALK,           0, 165,  12, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 172,  13, 3
  LSpr Enemy::BIG_LWSS,            0, 177,   3
  LSpr Enemy::FIRE_JUMP,           0, 178,   9, 1
  LSpr Enemy::BIG_LWSS,            1, 181,   4, 1
  LSpr Enemy::CHECKPOINT,          0, 188,   8
  LSpr Enemy::ROVER,               1, 198,  10
  LSpr Enemy::OWL,                 1, 201,  10
  LSpr Enemy::SNEAKER,             1, 202,   5
  LSpr Enemy::BIG_GLIDER,          1, 204,   4
  LSpr Enemy::BIG_GLIDER,          1, 205,   6
  LSpr Enemy::ROVER,               1, 205,  12
  LSpr Enemy::BIG_GLIDER,          1, 207,   5
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 213,  12, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 215,  10, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 217,  13, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 220,  12, 1
  LSpr Enemy::TURKEY,              0, 222,   5
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 222,  10, 1
  LSpr Enemy::BIG_LWSS,            1, 223,   2
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 224,  11, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 226,  13, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 229,  12, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 231,  11, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 237,  12, 3
  LSpr Enemy::FIRE_WALK,           1, 241,   7, 1
  .byt 255 ; end
