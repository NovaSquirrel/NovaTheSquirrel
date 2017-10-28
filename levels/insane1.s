insane1:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_MINES
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr insane1Data
  .addr insane1Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_MINES
  .byt GraphicsUpload::BG_TROPICAL
  .byt 255 ; end
  .byt $00, $00 ; boundaries

insane1Data:
  LObjN LO::R_GROUND,         0, 13, 11, 1
  LObjN LO::TALL_2,           3, 10, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           4, 10, 2, LN2::PALM_TREE
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::R_GROUND,         1, 10, 1, 2
  LObj  LO::S_BIGHEART,       1, 5
  LObjN LO::R_BRICK,          0, 6, 2, 0
  LObjN LO::WIDE_2,           1, 10, 3, LN2::STONE_BRIDGE
  LObjN LO::R_WATER,          0, 13, 3, 1
  LObj  LO::S_COIN,           2, 5
  LObj  LO::S_PRIZE,          0, 6
  LObj  LO::S_COIN,           2, 6
  LObjN LO::R_GROUND,         0, 10, 1, 4
  LObjN LO::WIDE_1,           1, 3, 6, LN1::SOLID_LEDGE
  LObj  LO::S_COIN,           1, 9
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WOOD_CRATE, (7<<4)|0
  LObjN LO::R_COIN,           2, 8, 2, 0
  LObjN LO::R_COIN,           1, 2, 2, 0
  LObj  LO::S_COIN,           3, 3
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_COIN,           0, 4, 1, 0
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 2
  LObjN LO::WIDE_1,           0, 3, 6, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 10, 1, 4
  LObjN LO::TALL_2,           1, 7, 2, LN2::PALM_TREE
  LObjN LO::WIDE_2,           2, 8, 3, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 9, 3, 5
  LObjN LO::WIDE_3,           1, 2, 3, LN3::MINE_TRACKS
  LObj  LO::S_SPRING,         0, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  3, 3, 0, 4
  LObjN LO::WIDE_1,           0, 8, 0, LN1::SOLID_LEDGE
  LObj  LO::S_MOAI_LEFT,      0, 11
  LObjN LO::R_SAND,           0, 12, 2, 2
  LObj  LO::S_MTRACK_SSR,      1, 3
  LObjN LO::TALL_2,           0, 9, 2, LN2::PALM_TREE
  LObj  LO::S_MTRACK_SSR,      1, 4
  LObj  LO::S_MTRACK_SSR,      1, 5
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObjN LO::WIDE_3,           1, 6, 3, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 7, 0, 7
  LObjN LO::WIDE_3,           1, 6, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 7, 0, 7
  LObj  LO::S_MTRACK_UPRIGHT,  1, 6
  LObj  LO::R_CUSTOM,         6, 5, Metatiles::WOOD_CRATE, (2<<4)|0
  LObjN LO::WIDE_1,           1, 12, 0, LN1::SPIKES
  LObjN LO::R_SAND,           0, 13, 0, 1
  LObjN LO::WIDE_1,           1, 10, 0, LN1::SPIKES
  LObjN LO::R_SAND,           0, 11, 0, 3
  LObjN LO::R_SAND,           1, 5, 2, 9
  LObj  LO::R_CUSTOM,         3, 5, Metatiles::WOOD_CRATE, (3<<4)|0
  LObjN LO::WIDE_3,           0, 11, 8, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 12, 0, 2
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::R_GROUND,         1, 0, 3, 8
  LObjN LO::WIDE_2,           1, 9, 6, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_MTRACK_SUPPORTSONLY,  3, 12, 0, 2
  LObj  LO::S_MTRACK_UPRIGHT,  1, 11
  LObjN LO::WIDE_2,           2, 4, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_SPRING,         0, 8
  LObj  LO::R_CUSTOM,         2, 6, Metatiles::METAL_CRATE, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORK_ARROW_UP, (2<<4)|0
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 12, 2, 2
  LObjN LO::R_COIN,           1, 2, 0, 2
  LObjN LO::WIDE_3,           2, 10, 4, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 10, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 11, 0, 3
  LObj  LO::S_W_ARROW_LEFT,   2, 7
  LObjN LO::WIDE_2,           0, 8, 4, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_MTRACK_UPRIGHT,  2, 10
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 11, 0, 3
  LObj  LO::S_DOOR,           1, 6
  LWriteCol 1, 53
  LObjN LO::R_SOLID_BLOCK,    2, 3, 2, 0
  LObjN LO::WIDE_3,           0, 7, 3, LN3::MINE_TRACKS
  LObjN LO::R_SAND,           0, 8, 3, 6
  LObj  LO::S_MTRACK_SGR,      5, 8
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 6
  LObj  LO::S_MTRACK_SGR,      0, 9
  LObjN LO::WIDE_3,           1, 11, 1, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_UP,       2, 5
  LObj  LO::S_MTRACK_UP,       0, 7
  LObj  LO::S_MTRACK_UP,       0, 9
  LObj  LO::S_MTRACK_UP,       0, 11
  LObjN LO::R_COIN,           1, 1, 2, 1
  LObjN LO::R_GROUND,         0, 4, 3, 10
  LObj  LO::S_BIGHEART,       1, 3
  LObjN LO::WIDE_1,           3, 7, 3, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 12, 9, 2
  LObjN LO::WIDE_1,           2, 9, 3, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          2, 9
  LObj  LO::S_GROUND_CLIMB_L, 3, 11
  LObj  LO::S_GROUND_CLIMB_L, 1, 10
  LObjN LO::R_GROUND,         0, 11, 1, 0
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::WOOD_CRATE, (1<<4)|2
  LObj  LO::S_GROUND,         0, 10
  LObjN LO::R_GROUND,         1, 10, 0, 4
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::WOOD_CRATE, (11<<4)|0
  LObjN LO::R_GROUND,         12, 7, 4, 7
  LFinished

insane1Sprite:
  LSpr Enemy::CANNON_1,            0,  10,   3
  LSpr Enemy::GOOMBA,              1,  13,   5
  LSpr Enemy::GOOMBA,              1,  16,   9
  LSpr Enemy::SPINNER,             0,  19,   2, 2
  LSpr Enemy::SPINNER,             0,  21,   7, 1
  LSpr Enemy::SPINNER,             0,  22,   2, 3
  LSpr Enemy::MINECART,            0,  31,   2
  LSpr Enemy::CHECKPOINT,          0,  52,   3
  LSpr Enemy::MINECART,            0,  55,  11
  LSpr Enemy::GOOMBA,              1,  57,   4
  LSpr Enemy::OWL,                 0,  66,   3
  LSpr Enemy::BOULDER,             0,  67,   5
  LSpr Enemy::BOULDER,             0,  68,   5
  LSpr Enemy::SNEAKER,             1,  69,   4
  LSpr Enemy::BOULDER,             0,  69,   5
  LSpr Enemy::THWOMP,              0,  80,   4
  LSpr Enemy::CHECKPOINT,          0,  91,   3
  LSpr Enemy::CANNON_1,            0,  93,   4
  LSpr Enemy::BALL_GUY,            1, 112,   6
  LSpr Enemy::BALL_GUY,            1, 114,   6
  .byt 255 ; end
