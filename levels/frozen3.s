frozen3:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $f8
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_HANNAH
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_MINES
  .addr frozen3Data
  .addr frozen3Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt 255 ; end
  .byt $00, $02 ; boundaries

frozen3Data:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::FROZEN_CAVE
  LObjN LO::R_ROCK,           0, 0, 15, 1
  LObjN LO::R_ROCK,           0, 10, 4, 1
  LObjN LO::R_ROCK,           0, 12, 9, 2
  LObj  LO::S_PRIZE,          4, 7
  LWriteCol InventoryItem::BLOCK
  LObj  LO::S_MTRACK_SSL,      3, 11
  LObjN LO::R_ROCK,           1, 2, 9, 1
  LObjN LO::WIDE_1,           0, 8, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_3,           0, 10, 8, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 10, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_SOLID_BLOCK,    0, 11
  LObjN LO::WIDE_1,           3, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::R_MTRACK_SUPPORTSONLY,  3, 11, 0, 3
  LObjN LO::R_ROCK,           1, 0, 12, 1
  LObj  LO::S_MTRACK_SSL,      1, 10
  LObj  LO::S_MTRACK_SSL,      1, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObjN LO::WIDE_3,           1, 7, 7, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  LObjN LO::WIDE_1,           2, 5, 2, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 8, 0, 6
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObjN LO::R_ROCK,           2, 0, 6, 2
  LObjN LO::WIDE_3,           1, 7, 7, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  LObjN LO::R_COIN,           1, 5, 1, 0
  LObjN LO::WIDE_1,           0, 6, 3, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CUSTOM,         2, 5, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_ROCK,           2, 0, 8, 3
  LObjN LO::WIDE_3,           0, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::TOGGLE_BLOCK_OFF, (4<<4)|0
  LObjN LO::WIDE_3,           1, 11, 2, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           2, 11, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::WIDE_3,           1, 7, 2, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSL,      0, 11
  LObj  LO::S_MTRACK_SSL,      1, 10
  LObj  LO::S_MTRACK_UPRIGHT,  1, 9
  LObj  LO::S_MTRACK_UPRIGHT,  0, 9
  LObjN LO::R_ROCK,           2, 0, 7, 2
  LObjN LO::R_SOLID_BLOCK,    0, 3, 0, 1
  LObjN LO::WIDE_3,           2, 7, 5, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           1, 3, 3, 0
  LObjN LO::R_GROUND,         2, 8, 3, 6
  LObjN LO::R_GROUND,         4, 10, 5, 4
  LObjN LO::WIDE_1,           4, 7, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_ROCK,     1, 9
  LObjN LO::WIDE_1,           5, 3, 4, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         1, 8, 4, 6
  LObj  LO::S_HEART,          3, 7
  LObjN LO::R_COIN,           1, 2, 1, 1
  LObjN LO::WIDE_1,           1, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           2, 0, 4, 3
  LObjN LO::WIDE_1,           0, 10, 3, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 11, 0, 2
  LObj  LO::S_MTRACK_SSL,      3, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObjN LO::R_GROUND,         0, 10, 3, 4
  LObjN LO::R_ROCK,           1, 0, 7, 2
  LObj  LO::S_MTRACK_SSL,      0, 7
  LObjN LO::WIDE_1,           1, 7, 3, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 7
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_COIN,           2, 8, 0, 2
  LObjN LO::R_ROCK,           1, 7, 2, 7
  LObjN LO::WIDE_3,           2, 6, 9, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           1, 0, 3, 1
  LObjN LO::R_ROCK,           0, 9, 8, 5
  LObjN LO::R_SOLID_BLOCK,    4, 0, 4, 2
  LObj  LO::S_BIGHEART,       2, 8
  LObj  LO::S_MTRACK_SUPPORTS, 1, 6
  LObjN LO::R_SOLID_BLOCK,    0, 7, 0, 1
  LObj  LO::S_SOLID_BLOCK,    1, 8
  LObj  LO::S_MTRACK_SSR,      1, 7
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObj  LO::S_MTRACK_SSR,      1, 8
  LObj  LO::S_MTRACK_SSR,      1, 9
  LObjN LO::WIDE_3,           1, 9, 1, LN3::MINE_TRACKS
  LObjN LO::WIDE_1,           1, 3, 2, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK_SSL,      1, 9
  LObjN LO::R_GROUND,         0, 12, 3, 2
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObjN LO::WIDE_3,           1, 7, 11, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 3, 15, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_BUMP,     0, 5
  LObjN LO::WIDE_3,           1, 5, 7, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_UPRIGHT,  0, 5
  LObjN LO::R_GROUND,         0, 11, 1, 3
  LObj  LO::S_MTRACK_SUPPORTS, 1, 5
  LObj  LO::S_MTRACK_SUPPORTS, 0, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 2
  LObjN LO::WIDE_1,           1, 4, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,           3, 3, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_SUPPORTS, 0, 5
  LObj  LO::S_MTRACK_SUPPORTS, 0, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  LObj  LO::S_MTRACK_UPLEFT,   2, 7
  LObjN LO::R_COIN,           0, 8, 0, 2
  LObjN LO::WIDE_3,           2, 3, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $30
  LObjN LO::R_CEILING_BARRIER,0, 4, 3, 0
  LObjN LO::R_GROUND,         0, 8, 4, 6
  LObj  LO::S_MTRACK_BUMP,     1, 7
  LObjN LO::R_SOLID_BLOCK,    3, 4, 0, 3
  LObjN LO::R_COIN,           1, 5, 0, 2
  LObjN LO::R_WATER,          0, 11, 15, 3
  LObjN LO::WIDE_3,           1, 3, 3, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 4, 0, 6
  LObjN LO::WIDE_3,           1, 3, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $40
  LObj  LO::R_CUSTOM,         3, 3, Metatiles::CAMPFIRE, (7<<4)|0
  LObj  LO::S_MTRACK_UPRIGHT,  1, 5
  LObjN LO::R_GROUND,         8, 10, 4, 4
  LObjN LO::R_ROCK,           1, 3, 1, 3
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 7, 0, 2
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 16
  LObjN LO::R_ROCK,           0, 2, 4, 1
  LObjN LO::R_GROUND,         3, 8, 4, 6
  LObj  LO::S_BIGHEART,       2, 2
  LObjN LO::R_GROUND,         3, 6, 8, 8
  LObj  LO::S_W_ARROW_RIGHT,  7, 8
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 2, 0, 3
  LObj  LO::R_CUSTOM,         3, 2, Metatiles::METAL_CRATE, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::CAMPFIRE, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::FORK_ARROW_UP, (2<<4)|0
  LObjN LO::WIDE_1,           0, 11, 2, LN1::SOLID_LEDGE
  LObj  LO::S_DOOR,           1, 9
  LWriteCol 9, 248
  LObjN LO::WIDE_1,           4, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_W_ARROW_RIGHT,  2, 7
  LObjN LO::WIDE_1,           0, 11, 0, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         3, 3, Metatiles::METAL_CRATE, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::CAMPFIRE, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORK_ARROW_UP, (2<<4)|0
  LObjN LO::WIDE_1,           4, 4, 2, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       1, 5
  LObjN LO::WIDE_3,           1, 3, 4, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 4, 0, 10
  LObj  LO::S_MTRACK_SSR,      3, 4
  LObj  LO::S_MTRACK_SSR,      1, 5
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObj  LO::S_MTRACK_SSR,      1, 7
  LObj  LO::S_MTRACK_SSR,      1, 8
  LObj  LO::S_MTRACK_SSR,      1, 9
  LObjN LO::WIDE_3,           1, 9, 4, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 9, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 10, 0, 4
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::KEY_RED
  LObjN LO::WIDE_1,           3, 8, 7, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    2, 0, 0, 6
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::LOCK_RED
  LObjN LO::R_ROCK,           0, 8, 1, 3
  LObjN LO::R_ROCK,           0, 11, 11, 3
  LObjN LO::R_ROCK,           1, 0, 10, 3
  LObjN LO::WIDE_3,           4, 7, 4, LN3::MINE_TRACKS
  LObjN LO::R_COIN,           1, 5, 2, 0
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 8, 0, 1
  LObjN LO::R_SOLID_BLOCK,    0, 10, 4, 0
  LObj  LO::S_W_ARROW_RIGHT,  3, 9
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 4, 0, 3
  LObjN LO::R_SOLID_BLOCK,    0, 8, 0, 1
  LObj  LO::S_M_CRATE,        2, 3
  LObjN LO::WIDE_3,           0, 8, 9, LN3::MINE_TRACKS
  LObj  LO::S_M_ARROW_UP,     0, 9
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 9, 0, 5
  LObjN LO::R_MTRACK_SUPPORTSONLY,  5, 9, 0, 5
  LObjN LO::R_GROUND,         4, 8, 8, 6
  LObjN LO::R_COIN,           1, 5, 2, 0
  LObj  LO::S_EXIT_DOOR,      3, 6
  LXPlus16
  LObjN LO::R_ROCK,           7, 0, 15, 3
  LObjN LO::R_ROCK,           0, 4, 4, 6
  LObjN LO::R_ROCK,           0, 11, 15, 3
  LObjN LO::R_COIN,           7, 5, 2, 2
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_DOOR,           1, 9
  LWriteCol 9, 155
  LObj  LO::S_PRIZE,          3, 8
  LWriteCol InventoryItem::ABILITY_BOOMERANG
  LObjN LO::R_ROCK,           2, 4, 2, 6
  LFinished

frozen3Sprite:
  LSpr Enemy::MINECART,            0,   8,  10
  LSpr Enemy::ICE_1,               1,  13,   6
  LSpr Enemy::BIG_LWSS,            0,  35,   4
  LSpr Enemy::FALLING_SPIKE,       0,  52,   3, 3
  LSpr Enemy::CHECKPOINT,          0,  55,   9
  LSpr Enemy::BIG_GLIDER,          0,  58,   2
  LSpr Enemy::BIG_GLIDER,          1,  58,   9, 1
  LSpr Enemy::BOOMERANG_GUY,       0,  60,   6
  LSpr Enemy::BOOMERANG_GUY,       0,  66,   2, 1
  LSpr Enemy::BIG_GLIDER,          1,  70,   5
  LSpr Enemy::FALLING_SPIKE,       0,  74,   4, 2
  LSpr Enemy::BIG_LWSS,            0,  74,   8, 1
  LSpr Enemy::FALLING_SPIKE,       0,  78,   3, 2
  LSpr Enemy::BIG_GLIDER,          1,  81,   7
  LSpr Enemy::BIG_GLIDER,          1,  82,  11
  LSpr Enemy::BIG_GLIDER,          1,  83,   3
  LSpr Enemy::MINECART,            0,  84,   6
  LSpr Enemy::BIG_GLIDER,          1,  87,   2
  LSpr Enemy::BOOMERANG_GUY,       0,  89,   8, 1
  LSpr Enemy::ICE_1,               0,  94,   9
  LSpr Enemy::BOOMERANG_GUY,       0,  99,   2
  LSpr Enemy::BOOMERANG_GUY,       0, 103,  10, 1
  LSpr Enemy::BIG_GLIDER,          1, 123,   7
  LSpr Enemy::BIG_GLIDER,          1, 125,  11
  LSpr Enemy::BIG_GLIDER,          1, 127,   3
  LSpr Enemy::BIG_GLIDER,          1, 129,   6
  LSpr Enemy::BIG_GLIDER,          1, 132,   2
  LSpr Enemy::BOOMERANG_GUY,       0, 133,   9, 0
  LSpr Enemy::CHECKPOINT,          0, 138,   7
  LSpr Enemy::BIG_GLIDER,          1, 142,   8, 1
  LSpr Enemy::BIG_GLIDER,          1, 145,  11, 1
  LSpr Enemy::BIG_GLIDER,          1, 146,   5, 1
  LSpr Enemy::BIG_GLIDER,          1, 148,   8, 1
  LSpr Enemy::BOULDER,             0, 154,   1
  LSpr Enemy::BOULDER,             0, 155,   1
  LSpr Enemy::BOULDER,             0, 156,   1
  LSpr Enemy::BOOMERANG_GUY,       0, 161,  10, 1
  LSpr Enemy::BOULDER,             0, 164,   2
  LSpr Enemy::BOULDER,             0, 165,   2
  LSpr Enemy::BOULDER,             0, 166,   2
  LSpr Enemy::MINECART,            0, 170,   3
  LSpr Enemy::ICE_1,               0, 191,   7, 1
  LSpr Enemy::ICE_1,               1, 198,   9, 1
  LSpr Enemy::MINECART,            0, 202,   2
  .byt 255 ; end
