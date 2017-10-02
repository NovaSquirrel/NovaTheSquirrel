frozen7:
  .byt MusicTracks::NONE|0
  .byt 1
  .byt $f6
  .byt GraphicsUpload::SP_WIND
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_MINES
  .addr frozen7Data
  .addr frozen7Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt GraphicsUpload::BG_CHIP
  .byt 255 ; end
  .byt $00, $00 ; boundaries

frozen7Data:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::FROZEN_CAVE
  LObjN LO::RECT_3,           0, 0, 2, LN3::ROCK, 18
  LObjN LO::R_SOLID_BLOCK,    0, 8, 1, 3
  LObjN LO::RECT_1,           0, 12, 2, LN1::GROUND, 18
  LObjN LO::WIDE_1,           2, 11, 0, LN1::FENCE
  LObjN LO::TALL_2,           1, 3, 8, LN2::TRUNK
  LObjN LO::R_COIN,           1, 8, 1, 2
  LObj  LO::R_CUSTOM,         2, 12, Metatiles::LAVA_MAIN, (6<<4)|2
  LObjN LO::WIDE_1,           3, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           3, 7, 2, 0
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 5
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObj  LO::S_HEART,          0, 11
  LObjN LO::TALL_2,           2, 3, 8, LN2::TRUNK
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::WIDE_1,           1, 7, 1, LN1::TALLGRASS
  LObjN LO::R_SOLID_BLOCK,    0, 8, 1, 3
  LObjN LO::RECT_3,           2, 0, 3, LN3::ROCK, 16
  LObjN LO::R_AIR,            3, 3, 5, 0
  LObjN LO::WIDE_1,           0, 7, 0, LN1::FENCE
  LObjN LO::R_SOLID_BLOCK,    0, 8, 1, 3
  LObjN LO::R_GROUND,         0, 12, 5, 2
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::PUSHABLE_BLOCK
  LObjN LO::WIDE_1,           0, 5, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 8, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 9, 0, 1
  LObj  LO::S_SPRING,         0, 11
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::PUSHABLE_BLOCK
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::KEY_GREEN
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::PICKUP_BLOCK
  LObj  LO::S_SOLID_BLOCK,    1, 8
  LObjN LO::TALL_2,           0, 9, 2, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 14, 2, LN1::FENCE
  LObjN LO::R_SOLID_BLOCK,    3, 9, 0, 1
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::LOCK_GREEN
  LObjN LO::R_SOLID_BLOCK,    0, 12, 0, 2
  LObjN LO::R_ROCK,           1, 8, 5, 1
  LObjN LO::WIDE_1,           0, 12, 3, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::PUSHABLE_BLOCK
  LObj  LO::S_BIGHEART,       1, 5
  LObjN LO::R_ROCK,           2, 0, 5, 3
  LObjN LO::R_ROCK,           0, 4, 4, 3
  LObjN LO::WIDE_3,           0, 12, 1, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           2, 8, 1, 0
  LObjN LO::WIDE_3,           0, 12, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_SSL,      1, 12
  LObj  LO::S_MTRACK_SSL,      1, 11
  LObj  LO::S_MTRACK_SSL,      1, 10
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_MTRACK_SSL,      0, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObj  LO::S_MTRACK_SSL,      1, 6
  LObjN LO::WIDE_3,           1, 5, 2, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 8
  LObjN LO::WIDE_1,           1, 3, 5, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_2,           1, 1, 3, LN2::GRAY_BRICKS
  LObj  LO::S_SOLID_BLOCK,    0, 2
  LObjN LO::WIDE_3,           0, 5, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $02
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 8
  LObj  LO::S_SOLID_BLOCK,    3, 2
  LObjN LO::R_COIN,           0, 7, 2, 0
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 4, 0, LN1::FENCE
  LObjN LO::R_SOLID_BLOCK,    0, 5, 0, 2
  LObjN LO::TALL_2,           0, 8, 6, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 5, 3, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           1, 4, 7, LN2::FLOWER
  LObjN LO::R_COIN,           0, 6, 2, 2
  LObjN LO::WIDE_1,           0, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           1, 2, 2, LN2::GRAY_BRICKS
  LObjN LO::TALL_2,           0, 3, 1, LN2::TRUNK
  LObj  LO::S_HEART,          1, 1
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::TALL_2,           1, 3, 1, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 5, 5, 9
  LObj  LO::S_SOLID_ROCK,     5, 4
  LObjN LO::WIDE_1,           1, 6, 4, LN1::SOLID_LEDGE
  LObj  LO::S_COIN,           0, 7
  LObjN LO::WIDE_1,           0, 8, 1, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::WIDE_1,           0, 12, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_ROCK,     1, 7
  LObjN LO::R_COIN,           1, 11, 2, 0
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 22
  LObjN LO::WIDE_1,           0, 8, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 13, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 12, 0, LN1::FENCE
  LObjN LO::WIDE_1,           2, 5, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_ROCK,     1, 4
  LObjN LO::R_GROUND,         0, 5, 5, 3
  LObjN LO::TALL_2,           0, 9, 3, LN2::TRUNK
  LObjN LO::WIDE_1,           0, 13, 1, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 4, 4, 0
  LObj  LO::S_HEART,          0, 12
  LObjN LO::TALL_2,           3, 9, 3, LN2::TRUNK
  LObjN LO::WIDE_1,           0, 13, 1, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       1, 3
  LObjN LO::R_ROCK,           1, 2, 4, 4
  LObjN LO::R_ROCK,           0, 7, 3, 1
  LObjN LO::TALL_2,           2, 9, 2, LN2::TRUNK
  LObjN LO::WIDE_1,           0, 12, 3, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 9, 1, 1
  LObjN LO::R_ROCK,           1, 2, 0, 0
  LObjN LO::R_COIN,           1, 5, 0, 3
  LObjN LO::R_SOLID_ROCK,     0, 9, 0, 1
  LObjN LO::WIDE_1,           0, 11, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 12, 1, 2
  LObj  LO::S_COIN,           1, 4
  LObjN LO::WIDE_3,           0, 5, 2, LN3::MINE_TRACKS
  LObjN LO::WIDE_1,           0, 6, 1, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       0, 10
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 6, 0, 8
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::WIDE_1,           0, 10, 0, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK_SSR,      1, 7
  LObjN LO::R_ROCK,           1, 0, 4, 2
  LObj  LO::S_MTRACK_SSR,      0, 8
  LObjN LO::WIDE_3,           1, 8, 2, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 5
  LObj  LO::S_MTRACK_UPRIGHT,  3, 8
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 5
  LObjN LO::R_ROCK,           1, 0, 0, 1
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObj  LO::S_MTRACK_UPRIGHT,  0, 6
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 7, 0, 7
  LObj  LO::S_MTRACK_UPRIGHT,  2, 4
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 5, 0, 9
  LObj  LO::S_CEILING_BARRIER,2, 0
  LObjN LO::R_COIN,           0, 3, 2, 0
  LObjN LO::WIDE_1,           0, 4, 0, LN1::FENCE
  LObjN LO::R_GROUND,         0, 5, 2, 9
  LObjN LO::R_ROCK,           1, 0, 13, 0
  LObj  LO::S_SOLID_BLOCK,    1, 4
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::LAVA_MAIN, (11<<4)|2
  LObjN LO::WIDE_1,           1, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           1, 1, 3, LN2::TRUNK
  LObjN LO::WIDE_1,           3, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           1, 1, 3, LN2::TRUNK
  LObjN LO::R_ROCK,           4, 1, 1, 6
  LObjN LO::R_ROCK,           2, 0, 0, 5
  LObjN LO::R_GROUND,         0, 11, 5, 3
  LObjN LO::R_ROCK,           1, 0, 0, 2
  LObjN LO::R_COIN,           0, 9, 2, 1
  LObjN LO::WIDE_1,           2, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           1, 0, 6, LN2::TRUNK
  LObj  LO::S_SNOWMAN,         0, 9
  LObjN LO::WIDE_1,           3, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           1, 0, 4, LN2::TRUNK
  LObj  LO::S_MTRACK_SSL,      1, 14
  LObj  LO::S_MTRACK_SSL,      1, 13
  LObj  LO::S_MTRACK_SSL,      1, 12
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObjN LO::WIDE_1,           0, 5, 5, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK_SSL,      0, 11
  LObjN LO::RECT_3,           1, 0, 0, LN3::ROCK, 16
  LObjN LO::R_COIN,           0, 4, 1, 0
  LObj  LO::S_MTRACK_SSL,      0, 10
  LObjN LO::WIDE_3,           1, 9, 13, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 10, 0, 0
  LObjN LO::R_GROUND,         0, 11, 2, 3
  LObjN LO::R_COIN,           1, 3, 1, 1
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 10, 0, 0
  LObjN LO::R_ROCK,           1, 1, 10, 1
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (11<<4)|2
  LObjN LO::R_ROCK,           2, 3, 6, 1
  LObjN LO::R_ROCK,           1, 5, 4, 1
  LObj  LO::S_MTRACK_SSL,      7, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObjN LO::WIDE_1,           1, 3, 4, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK_SSL,      0, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 2
  LObjN LO::R_GROUND,         0, 11, 2, 3
  LObjN LO::R_COIN,           1, 2, 2, 0
  LObj  LO::S_MTRACK_SSL,      0, 6
  LObjN LO::WIDE_3,           1, 5, 13, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 4
  LObjN LO::R_ROCK,           1, 6, 3, 8
  LObjN LO::WIDE_1,           4, 6, 4, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (4<<4)|2
  LObjN LO::WIDE_1,           4, 2, 1, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 6, 3, 8
  LObj  LO::S_HEART,          4, 3
  LObjN LO::R_SOLID_BLOCK,    0, 6, 2, 0
  LObj  LO::S_SPRING,         2, 5
  LObjN LO::TALL_2,           0, 7, 7, LN2::TRUNK
  LObjN LO::WIDE_1,           5, 5, 0, LN1::FENCE
  LObjN LO::R_SOLID_BLOCK,    0, 6, 2, 0
  LObjN LO::TALL_2,           0, 7, 7, LN2::TRUNK
  LObj  LO::S_PRIZE,          2, 3
  LObjN LO::TALL_2,           0, 4, 1, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 7, 2, 7
  LObjN LO::WIDE_1,           1, 3, 3, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         2, 11
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (11<<4)|2
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::TALL_2,           0, 6, 4, LN2::PATH_LINE
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 1
  LObj  LO::S_CUSTOM,         0, 2, Metatiles::LOCK_GREEN
  LObjN LO::R_SOLID_BLOCK,    0, 3, 8, 0
  LObjN LO::WIDE_2,           0, 6, 7, LN2::PATH_LINE
  LObjN LO::WIDE_2,           0, 10, 7, LN2::PATH_LINE
  LObj  LO::S_DOOR,           2, 1
  LWriteCol 10, 195
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 1, 2, 0
  LObjN LO::WIDE_1,           1, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           3, 6, 4, LN2::PATH_LINE
  LObjN LO::R_ROCK,           1, 0, 6, 3
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObjN LO::R_GROUND,         0, 12, 8, 2
  LObj  LO::S_CUSTOM,         1, 9, Metatiles::KEY_GREEN
  LObj  LO::S_BIGHEART,       0, 10
  LObjN LO::R_ROCK,           2, 4, 2, 7
  LObjN LO::R_CEILING_BARRIER,3, 0, 0, 1
  LObjN LO::WIDE_3,           0, 4, 4, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_BUMP,     1, 4
  LObj  LO::S_DOOR,           0, 10
  LWriteCol 1, 180
  LObjN LO::R_COIN,           1, 2, 1, 1
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 5, 0, 6
  LObj  LO::S_MTRACK_UPRIGHT,  1, 4
  LObjN LO::WIDE_3,           1, 11, 3, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 2, 14, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSR,      0, 5
  LObjN LO::R_COIN,           0, 8, 1, 1
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 12, 0, 2
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObj  LO::S_MTRACK_SUPPORTS, 1, 6
  LObj  LO::S_MTRACK_SUPPORTS, 0, 11
  LObjN LO::WIDE_3,           1, 6, 3, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSL,      0, 11
  LObjN LO::R_COIN,           1, 3, 1, 1
  LObj  LO::S_MTRACK_SSL,      0, 10
  LObj  LO::S_MTRACK_SSL,      1, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObjN LO::R_COIN,           1, 4, 1, 1
  LObjN LO::WIDE_3,           0, 7, 2, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_UPLEFT,   1, 7
  LObj  LO::S_MTRACK_SUPPORTS, 1, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  LObj  LO::S_MTRACK_BUMP,     1, 7
  LObjN LO::R_GROUND,         2, 3, 1, 11
  LObj  LO::R_CUSTOM,         2, 3, Metatiles::TOGGLE_BLOCK_ON, (10<<4)|0
  LFinished

frozen7Sprite:
  LSpr Enemy::ICE_2,               1,  10,   9
  LSpr Enemy::ICE_2,               1,  20,   8
  LSpr Enemy::CHECKPOINT,          0,  23,   7
  LSpr Enemy::CLOUD,               0,  29,   9
  LSpr Enemy::CHECKPOINT,          0,  34,  11
  LSpr Enemy::MINECART,            0,  36,  12
  LSpr Enemy::CHECKPOINT,          0,  47,   2
  LSpr Enemy::ICE_1,               0,  51,   2
  LSpr Enemy::ICE_2,               1,  70,   7
  LSpr Enemy::ICE_2,               0,  72,   4
  LSpr Enemy::FIRE_JUMP,           1,  79,  12
  LSpr Enemy::FIRE_WALK,           0,  84,  11, 1
  LSpr Enemy::MINECART,            0,  89,   5
  LSpr Enemy::CLOUD,               1,  94,   6
  LSpr Enemy::CHECKPOINT,          0, 104,   4
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 106,   9, 8
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 108,  11, 8
  LSpr Enemy::ICE_2,               0, 110,   6
  LSpr Enemy::ICE_1,               1, 113,   4, 1
  LSpr Enemy::FIRE_JUMP,           1, 130,   4
  LSpr Enemy::FIRE_JUMP,           1, 133,   4
  LSpr Enemy::FIRE_JUMP,           0, 134,  10
  LSpr Enemy::FIRE_JUMP,           0, 134,  10, 1
  LSpr Enemy::MINECART,            0, 136,   9
  LSpr Enemy::FIRE_JUMP,           1, 149,  10, 1
  LSpr Enemy::CHECKPOINT,          0, 152,   2
  LSpr Enemy::ICE_1,               1, 158,   5, 1
  LSpr Enemy::FIRE_WALK,           0, 159,   1, 1
  LSpr Enemy::ICE_1,               1, 161,   5, 1
  LSpr Enemy::ICE_2,               0, 164,   7
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 177,  10
  LSpr Enemy::FIRE_JUMP,           1, 180,   8, 1
  LSpr Enemy::FIRE_JUMP,           1, 183,   8, 1
  LSpr Enemy::CHECKPOINT,          0, 196,  11
  LSpr Enemy::MINECART,            0, 199,  11
  .byt 255 ; end
