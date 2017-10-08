frozen:
  .byt MusicTracks::NONE|0
  .byt 1
  .byt $f5
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_MINES
  .addr frozenData
  .addr frozenSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $00, $00 ; boundaries

frozenData:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::FROZEN_CAVE
  LObjN LO::R_ROCK,           0, 0, 6, 1
  LObjN LO::R_GROUND,         0, 7, 4, 4
  LObjN LO::RECT_3,           0, 12, 2, LN3::ROCK, 18
  LObjN LO::WIDE_3,           5, 6, 10, LN3::MINE_TRACKS
  LObjN LO::RECT_3,           2, 0, 2, LN3::ROCK, 41
  LObjN LO::R_COIN,           0, 8, 3, 1
  LObj  LO::S_TALL_GRASS,     4, 11
  LObjN LO::R_ROCK,           2, 3, 1, 0
  LObjN LO::WIDE_1,           0, 11, 0, LN1::FENCE
  LObj  LO::S_PRIZE,          1, 9
  LObjN LO::RECT_3,           1, 3, 1, LN3::ROCK, 22
  LObjN LO::R_BRICK,          0, 9, 1, 0
  LObjN LO::WIDE_1,           0, 11, 0, LN1::FENCE
  LObj  LO::S_MTRACK_SGR,      2, 7
  LObjN LO::WIDE_1,           0, 11, 0, LN1::FENCE
  LObj  LO::S_FLOWER,         1, 11
  LObj  LO::S_MTRACK_SGR,      1, 8
  LObj  LO::S_FLOWER,         0, 10
  LObjN LO::R_ROCK,           0, 11, 2, 3
  LObjN LO::R_ROCK,           1, 10, 1, 0
  LObj  LO::S_COIN,           1, 7
  LObj  LO::S_MTRACK_SGR,      0, 9
  LObjN LO::WIDE_1,           1, 8, 3, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::LAVA_MAIN, (3<<4)|4
  LObjN LO::R_COIN,           1, 6, 4, 0
  LObjN LO::R_ROCK,           3, 10, 1, 0
  LObjN LO::R_ROCK,           0, 11, 3, 3
  LObjN LO::R_GROUND,         4, 8, 3, 6
  LObj  LO::S_FLOWER,         2, 7
  LObj  LO::S_FLOWER,         4, 9
  LObjN LO::R_GROUND,         0, 10, 1, 1
  LObjN LO::R_ROCK,           0, 12, 12, 2
  LObjN LO::R_GROUND,         2, 9, 3, 2
  LObj  LO::S_MTRACK_SSL,      4, 8
  LObjN LO::WIDE_3,           1, 7, 2, LN3::MINE_TRACKS
  LObjN LO::R_COIN,           0, 10, 2, 1
  LObj  LO::S_MTRACK_SSR,      3, 8
  LObj  LO::S_MTRACK_SSR,      1, 9
  LObjN LO::R_ROCK,           0, 11, 1, 0
  LObj  LO::S_SPRING,         1, 9
  LObjN LO::R_ROCK,           0, 10, 0, 0
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 20
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (14<<4)|2
  LObj  LO::S_FROZENCRACK,     1, 4
  LObj  LO::S_FROZENCRACK,     0, 10
  LObjN LO::TALL_2,           1, 5, 4, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 9, 6, LN2::PATH_LINE
  LObj  LO::S_FROZENCRACK,     1, 3
  LObj  LO::S_FROZENCRACK,     0, 8
  LObjN LO::WIDE_2,           1, 6, 6, LN2::PATH_LINE
  LObj  LO::S_FROZENCRACK,     3, 4
  LObj  LO::S_FROZENCRACK,     0, 11
  LObj  LO::S_FROZENCRACK,     3, 5
  LObj  LO::S_FROZENCRACK,     1, 3
  LObj  LO::S_FROZENCRACK,     0, 9
  LObjN LO::WIDE_1,           1, 7, 3, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_ROCK,           1, 2, 6, 0
  LObj  LO::S_SPRING,         1, 9
  LObjN LO::R_ROCK,           0, 10, 0, 0
  LObjN LO::R_ROCK,           0, 11, 1, 0
  LObjN LO::R_ROCK,           0, 12, 10, 2
  LObj  LO::S_PRIZE,          2, 9
  LWriteCol InventoryItem::ABILITY_BACKUP
  LObj  LO::S_SIGNPOST,       2, 11
  LWriteCol <AboutIceJump, >AboutIceJump
  LObjN LO::WIDE_1,           1, 11, 3, LN1::TALLGRASS
  LObjN LO::RECT_3,           1, 0, 3, LN3::ROCK, 16
  LObjN LO::TALL_2,           5, 4, 3, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 8, 2, 6
  LObjN LO::WIDE_1,           1, 7, 0, LN1::FENCE
  LObjN LO::TALL_2,           1, 4, 3, LN2::TRUNK
  LObjN LO::R_COIN,           1, 7, 3, 0
  LObjN LO::WIDE_1,           0, 8, 3, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (4<<4)|2
  LObj  LO::S_FROZENCRACK,     1, 10
  LObj  LO::S_FROZENCRACK,     1, 5
  LObjN LO::WIDE_1,           0, 10, 1, LN1::SOLID_LEDGE
  LObj  LO::S_FROZENCRACK,     2, 8
  LObjN LO::R_ROCK,           1, 12, 11, 2
  LObjN LO::TALL_2,           3, 4, 7, LN2::TRUNK
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 20
  LObjN LO::R_ROCK,           1, 8, 5, 3
  LObjN LO::WIDE_1,           1, 7, 0, LN1::FENCE
  LObj  LO::S_MTRACK_STOP,     3, 7
  LObjN LO::WIDE_3,           1, 7, 11, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           3, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_SSL,      5, 5
  LObj  LO::S_MTRACK_SSL,      1, 4
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  LObjN LO::WIDE_3,           1, 3, 4, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSR,      2, 8
  LObj  LO::S_MTRACK_SSR,      1, 9
  LObj  LO::S_MTRACK_SSR,      1, 10
  LObj  LO::S_MTRACK_SSR,      1, 4
  LObjN LO::WIDE_3,           0, 10, 11, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSR,      1, 5
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 11, 0, 3
  LObjN LO::R_COIN,           1, 1, 3, 1
  LObj  LO::S_COIN,           0, 2
  LObjN LO::WIDE_1,           0, 3, 3, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK_SSL,      2, 8
  LObjN LO::WIDE_3,           1, 7, 4, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           2, 10, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::R_ROCK,           1, 11, 5, 3
  LObj  LO::S_MTRACK_SSR,      2, 8
  LObj  LO::S_MTRACK_STOP,     0, 10
  LObjN LO::R_COIN,           1, 4, 3, 1
  LObjN LO::WIDE_1,           0, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 9, 1, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       0, 10
  LObjN LO::R_ROCK,           2, 6, 5, 8
  LObj  LO::S_MTRACK_STOP,     2, 5
  LObjN LO::WIDE_3,           1, 5, 3, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           2, 5, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_UPRIGHT,  2, 5
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 8
  LObj  LO::S_MTRACK,         5, 6
  LObj  LO::S_MTRACK_SUPPORTS, 0, 11
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 12, 0, 2
  LObj  LO::S_MTRACK_BUMP,     1, 6
  LObjN LO::WIDE_3,           0, 11, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::WIDE_3,           0, 11, 3, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           1, 0, 3, 6
  LObj  LO::S_MTRACK_UPRIGHT,  3, 11
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 12, 0, 2
  LObjN LO::R_ROCK,           1, 0, 4, 3
  LObj  LO::S_MTRACK,         2, 9
  LObj  LO::S_MTRACK_UPRIGHT,  1, 9
  LObjN LO::R_ROCK,           2, 0, 4, 1
  LObj  LO::S_MTRACK,         1, 7
  LObj  LO::S_MTRACK_UPRIGHT,  1, 7
  LObjN LO::WIDE_3,           2, 5, 5, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 8
  LObjN LO::WIDE_3,           2, 5, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObjN LO::WIDE_3,           1, 3, 15, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SUPPORTS, 0, 5
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 6, 0, 8
  LObjN LO::WIDE_3,           1, 3, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::R_COIN,           4, 2, 3, 0
  LObjN LO::R_GROUND,         0, 4, 3, 10
  LObjN LO::WIDE_3,           6, 3, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $30
  LObj  LO::S_MTRACK_SSR,      3, 4
  LObj  LO::S_MTRACK_SSR,      1, 5
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObj  LO::S_MTRACK_SSR,      1, 7
  LObjN LO::WIDE_3,           1, 7, 15, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           4, 0, 8, 1
  LObjN LO::R_COIN,           0, 6, 3, 0
  LObjN LO::R_GROUND,         0, 8, 3, 6
  LObjN LO::WIDE_3,           4, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $40
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (15<<4)|1
  LObjN LO::WIDE_3,            1, 10, 2, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,            1, 4, 2, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,            2, 6, 2, LN3::FROZEN_CRACK
  LObjN LO::RECT_3,           1, 0, 2, LN3::ROCK, 23
  LObj  LO::S_MTRACK_UPRIGHT,  3, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 4
  LObjN LO::WIDE_3,            1, 4, 1, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,            1, 11, 2, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,            2, 8, 1, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,            2, 5, 2, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,           1, 7, 12, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 4
  LObj  LO::R_CUSTOM,         1, 13, Metatiles::LAVA_MAIN, (8<<4)|1
  LObjN LO::WIDE_3,            3, 10, 1, LN3::FROZEN_CRACK
  LObjN LO::WIDE_3,            1, 6, 1, LN3::FROZEN_CRACK
  LObjN LO::R_GROUND,         5, 8, 4, 6
  LObj  LO::S_MTRACK_STOP,     3, 7
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 43
  LObjN LO::R_GROUND,         1, 6, 5, 8
  LObjN LO::WIDE_1,           2, 5, 0, LN1::FENCE
  LObj  LO::S_SOLID_ROCK,     2, 5
  LObjN LO::WIDE_1,           2, 6, 7, LN1::SOLID_LEDGE
  LObjN LO::R_WATER,          0, 12, 7, 2
  LObjN LO::R_COIN,           2, 4, 3, 1
  LObjN LO::WIDE_1,           1, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           5, 6, 4, 8
  LObj  LO::S_FLOWER,         1, 5
  LObjN LO::WIDE_2,           0, 5, 2, LN2::FLOWER
  LObjN LO::WIDE_1,           4, 6, 5, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_WATER,          0, 13, 10, 1
  LObjN LO::WIDE_1,           1, 9, 7, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 10, 4, 2
  LObjN LO::WIDE_1,           1, 8, 4, LN1::TALLGRASS
  LObjN LO::RECT_3,           3, 2, 3, LN3::ROCK, 18
  LObjN LO::R_ROCK,           6, 11, 12, 3
  LObjN LO::WIDE_2,           1, 10, 2, LN2::FLOWER
  LObj  LO::S_EXIT_DOOR,      7, 9
  LFinished

frozenSprite:
  LSpr Enemy::ICE_1,               1,  15,   8
  LSpr Enemy::GEORGE,              1,  24,   7
  LSpr Enemy::ICE_1,               0,  31,   7
  LSpr Enemy::ICE_1,               1,  40,   8
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  51,   8
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  54,   6
  LSpr Enemy::CHECKPOINT,          0,  65,   6
  LSpr Enemy::ICE_1,               0,  68,  11
  LSpr Enemy::GEORGE,              1,  85,  11
  LSpr Enemy::MINECART,            0,  93,   7
  LSpr Enemy::COLLECTIBLE,         0, 113,   1
  LSpr Enemy::CHECKPOINT,          0, 115,   2
  LSpr Enemy::GEORGE,              1, 125,   5
  LSpr Enemy::MINECART,            0, 128,   5
  LSpr Enemy::MINECART,            0, 136,  11
  LSpr Enemy::MINECART,            0, 156,   3
  LSpr Enemy::ICE_1,               1, 217,   4
  LSpr Enemy::GEORGE,              1, 223,   8
  LSpr Enemy::GEORGE,              1, 236,   8
  .byt 255 ; end
