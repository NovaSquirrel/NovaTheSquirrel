final6c:
  .byt MusicTracks::WORLD_5|0
  .byt 1
  .byt $f6
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_MINES
  .addr final6cData
  .addr final6cSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt GraphicsUpload::BG_CHIP
  .byt 255 ; end
  .byt $00, $80 ; boundaries

final6cData:
  LObjN LO::RECT_3,           0, 0, 2, LN3::ROCK, 22
  LObjN LO::R_ROCK,           0, 8, 5, 6
  LObj  LO::S_PRIZE,          1, 5
  LWriteCol InventoryItem::ABILITY_BOOMERANG | 128
  LObjN LO::R_ROCK,           2, 3, 13, 0
  LObj  LO::R_CUSTOM,         1, 5, Metatiles::KEY_GREEN, (1<<4)|1
  LObjN LO::WIDE_3,           1, 7, 5, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 8, 0, 6
  LObjN LO::R_MTRACK_SUPPORTSONLY,  3, 8, 0, 6
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $30
  LObjN LO::WIDE_1,           1, 8, 5, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    0, 9, 5, 0
  LObjN LO::R_ROCK,           1, 4, 3, 1
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::LOCK_GREEN, (3<<4)|0
  LObjN LO::R_ROCK,           0, 10, 3, 4
  LObjN LO::R_CEILING_BARRIER,4, 6, 2, 0
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObj  LO::S_MTRACK,         1, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObjN LO::R_COIN,           1, 5, 3, 0
  LObjN LO::WIDE_3,           0, 6, 3, LN3::MINE_TRACKS
  LObjN LO::WIDE_1,           2, 1, 0, LN1::FENCE
  LObjN LO::WIDE_1,           0, 2, 1, LN1::SOLID_LEDGE
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 7, 0, 7
  LObj  LO::S_SOLID_BLOCK,    2, 2
  LObjN LO::TALL_2,           0, 3, 3, LN2::TRUNK
  LObj  LO::S_SOLID_BLOCK,    0, 7
  LObjN LO::TALL_2,           0, 8, 1, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 10, 7, 4
  LObjN LO::R_COIN,           1, 8, 2, 1
  LObj  LO::S_PRIZE,          2, 7
  LObjN LO::WIDE_1,           1, 6, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 7, 3, 2
  LObjN LO::R_SOLID_BLOCK,    3, 1, 4, 0
  LObjN LO::TALL_2,           0, 2, 4, LN2::TRUNK
  LObj  LO::S_FROZENCRACK,     1, 11
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (2<<4)|1
  LObj  LO::S_FROZENCRACK,     2, 9
  LObjN LO::TALL_2,           1, 2, 4, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 7, 3, 7
  LObjN LO::WIDE_2,           1, 6, 1, LN2::FLOWER
  LObjN LO::R_COIN,           2, 5, 4, 0
  LObjN LO::WIDE_3,           0, 6, 4, LN3::MINE_TRACKS
  LObjN LO::WIDE_1,           1, 8, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 9, 3, 5
  LObjN LO::R_MTRACK_SUPPORTSONLY,  3, 7, 0, 1
  LObj  LO::S_FROZENCRACK,     1, 10
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (12<<4)|1
  LObj  LO::S_MTRACK_SGR,      1, 7
  LObj  LO::S_FROZENCRACK,     0, 11
  LObj  LO::S_FROZENCRACK,     1, 9
  LObj  LO::S_SOLID_BLOCK,    1, 3
  LObj  LO::S_MTRACK_SGR,      0, 8
  LObj  LO::S_SOLID_BLOCK,    1, 4
  LObjN LO::WIDE_3,           0, 8, 7, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 3
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 4
  LObjN LO::R_COIN,           0, 7, 4, 0
  LObj  LO::S_FROZENCRACK,     0, 11
  LObj  LO::S_SOLID_BLOCK,    1, 4
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::KEY_GREEN
  LObj  LO::S_SOLID_BLOCK,    1, 3
  LObj  LO::S_FROZENCRACK,     0, 10
  LObjN LO::R_SOLID_BLOCK,    2, 1, 0, 4
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::KEY_GREEN
  LObj  LO::S_FROZENCRACK,     0, 12
  LObj  LO::S_SOLID_BLOCK,    1, 1
  LObj  LO::S_SOLID_BLOCK,    0, 3
  LObj  LO::S_SOLID_BLOCK,    0, 5
  LObj  LO::S_FROZENCRACK,     0, 10
  LObj  LO::S_SOLID_BLOCK,    1, 2
  LObj  LO::S_SOLID_BLOCK,    0, 4
  LObj  LO::S_BIGHEART,       0, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 3
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_1,           0, 9, 4, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    0, 10, 4, 0
  LObj  LO::S_FROZENCRACK,     0, 11
  LObjN LO::R_ROCK,           1, 0, 1, 6
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::LOCK_GREEN, (1<<4)|0
  LObjN LO::R_ROCK,           0, 11, 4, 3
  LObjN LO::R_SOLID_BLOCK,    2, 0, 4, 0
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::MINE_TRACK_UP, (0<<4)|4
  LObjN LO::R_COIN,           1, 2, 2, 0
  LObjN LO::WIDE_3,           0, 3, 3, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           0, 4, 2, 10
  LObj  LO::S_CUSTOM,         3, 5, Metatiles::KEY_GREEN
  LObj  LO::S_MTRACK_BUMP,     0, 8
  LObj  LO::S_FROZENCRACK,     0, 10
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObj  LO::S_MTRACK_SSL,      1, 3
  LObjN LO::WIDE_3,           0, 8, 2, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 3
  LObjN LO::WIDE_3,           1, 2, 2, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           0, 6, 3, LN3::MINE_TRACKS
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::KEY_GREEN
  LObj  LO::S_FROZENCRACK,     0, 12
  LObj  LO::S_FROZENCRACK,     1, 9
  LObj  LO::S_MTRACK_SUPPORTS, 1, 6
  LObj  LO::S_MTRACK_SSR,      0, 9
  LObj  LO::S_MTRACK_SSR,      1, 3
  LObj  LO::S_MTRACK_SUPPORTS, 0, 9
  LObj  LO::S_FROZENCRACK,     0, 10
  LObj  LO::S_MTRACK,         1, 3
  LObj  LO::S_MTRACK_SSL,      0, 6
  LObjN LO::WIDE_3,           0, 9, 1, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK,         1, 5
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::KEY_GREEN
  LObj  LO::S_FROZENCRACK,     0, 8
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 10, 0, 2
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::KEY_GREEN
  LObj  LO::S_MTRACK_BUMP,     0, 5
  LObj  LO::S_MTRACK_SSL,      0, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_FROZENCRACK,     0, 11
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObjN LO::WIDE_3,           1, 7, 4, LN3::MINE_TRACKS
  LObj  LO::S_FROZENCRACK,     0, 9
  LObj  LO::S_FROZENCRACK,     1, 11
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::KEY_GREEN
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 4
  LObj  LO::S_FROZENCRACK,     2, 10
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::FORCE_RIGHT, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::FORCE_UP, (0<<4)|2
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObj  LO::S_FROZENCRACK,     1, 12
  LObj  LO::S_FROZENCRACK,     1, 8
  LObj  LO::S_FROZENCRACK,     1, 10
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_1,           0, 3, 6, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 0, 4, 1
  LObj  LO::R_CUSTOM,         0, 2, Metatiles::LOCK_GREEN, (4<<4)|0
  LObjN LO::R_ROCK,           0, 3, 4, 1
  LObjN LO::R_SOLID_ROCK,     1, 5, 2, 7
  LObj  LO::S_FG_GLASS_BLUE,  0, 6
  LObj  LO::S_FG_GLASS_RED,   0, 11
  LObj  LO::S_FG_GLASS_RED,   1, 7
  LObj  LO::S_FG_GLASS_BLUE,  0, 10
  LObj  LO::S_FG_GLASS_RED,   1, 5
  LObj  LO::S_FG_GLASS_BLUE,  0, 7
  LObj  LO::S_FG_GLASS_RED,   0, 9
  LObj  LO::S_FG_GLASS_BLUE,  0, 12
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObj  LO::S_FROZENCRACK,     0, 9
  LObjN LO::WIDE_1,           2, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_FROZENCRACK,     0, 10
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::ABILITY_BOOMERANG | 128
  LObj  LO::S_FROZENCRACK,     1, 9
  LObj  LO::S_FROZENCRACK,     0, 12
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 47
  LObjN LO::WIDE_1,           0, 7, 0, LN1::FENCE
  LObjN LO::R_GROUND,         0, 8, 5, 6
  LObjN LO::WIDE_1,           3, 7, 2, LN1::TALLGRASS
  LObjN LO::WIDE_3,           3, 7, 2, LN3::MINE_TRACKS
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObj  LO::S_FROZENCRACK,     1, 10
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 4
  LObj  LO::S_MTRACK_UPRIGHT,  1, 7
  LObj  LO::S_FROZENCRACK,     1, 11
  LObj  LO::S_CUSTOM,         1, 9, Metatiles::KEY_RED
  LObjN LO::WIDE_3,           1, 6, 3, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_BUMP,     0, 10
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 11, 0, 1
  LObjN LO::WIDE_3,           1, 6, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObjN LO::WIDE_3,           0, 10, 5, LN3::MINE_TRACKS
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::KEY_RED
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::KEY_RED
  LObj  LO::S_FROZENCRACK,     0, 8
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::KEY_RED
  LObj  LO::S_MTRACK_SUPPORTS, 1, 10
  LObjN LO::WIDE_3,           1, 8, 1, LN3::MINE_TRACKS
  LObj  LO::S_FROZENCRACK,     0, 12
  LObj  LO::S_MTRACK_SUPPORTS, 1, 10
  LObj  LO::S_MTRACK_UPRIGHT,  1, 8
  LObj  LO::S_MTRACK_UPLEFT,   1, 6
  LObj  LO::S_FROZENCRACK,     0, 9
  LObj  LO::S_MTRACK_UPRIGHT,  0, 10
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 11, 0, 1
  LObjN LO::WIDE_3,           1, 6, 2, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SUPPORTS, 0, 8
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::KEY_RED
  LObjN LO::WIDE_3,           0, 8, 5, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 3
  LObj  LO::S_FROZENCRACK,     1, 11
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObj  LO::S_MTRACK_BUMP,     1, 6
  LObj  LO::S_CUSTOM,         2, 5, Metatiles::KEY_RED
  LObj  LO::S_FROZENCRACK,     0, 9
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 9, 0, 3
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObj  LO::S_MTRACK_SSL,      1, 6
  LObj  LO::S_FROZENCRACK,     0, 12
  LObj  LO::S_MTRACK,         1, 5
  LObjN LO::WIDE_1,           1, 6, 7, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    0, 7, 7, 0
  LObj  LO::S_FROZENCRACK,     0, 10
  LObjN LO::R_ROCK,           1, 2, 5, 1
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::LOCK_RED, (5<<4)|0
  LObjN LO::R_ROCK,           0, 8, 5, 4
  LObj  LO::S_FROZENCRACK,     6, 10
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (6<<4)|1
  LObjN LO::WIDE_3,           1, 5, 4, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 6
  LObj  LO::S_FROZENCRACK,     1, 9
  LObj  LO::S_FROZENCRACK,     2, 11
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 6, 0, 6
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObj  LO::S_FROZENCRACK,     0, 10
  LObjN LO::R_GROUND,         1, 9, 2, 5
  LObj  LO::S_DOOR,           1, 7
  LWriteCol $21, LevelId::Final6D
  .byt LSpecialCmd, LevelSpecialConfig::FROZEN_CAVE
  .byt LSpecialCmd, LevelSpecialConfig::ANIMATED_WATER
  LFinished

final6cSprite:
  LSpr Enemy::MINECART,            0,   6,   7
  LSpr Enemy::ICE_1,               1,  25,   1
  LSpr Enemy::ICE_2,               1,  30,   3
  LSpr Enemy::GEORGE,              1,  37,   6
  LSpr Enemy::MINECART,            0,  40,   6
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  54,  11, 2
  LSpr Enemy::CHECKPOINT,          0,  90,   2
  LSpr Enemy::GEORGE,              1, 101,   7
  LSpr Enemy::MINECART,            0, 102,   7
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 124,   9, 2
  .byt 255 ; end
