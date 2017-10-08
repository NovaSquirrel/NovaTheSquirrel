frozen2:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $f6
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_MINES
  .addr frozen2Data
  .addr frozen2Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $00, $02 ; boundaries

frozen2Data:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::FROZEN_CAVE
  LObjN LO::R_ROCK,           0, 8, 4, 3
  LObjN LO::R_ROCK,           0, 12, 9, 2
  LObjN LO::WIDE_1,           5, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 11, 0, LN1::FENCE
  LObj  LO::S_MTRACK_STOP,     1, 5
  LObjN LO::WIDE_3,           1, 5, 6, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 5
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::WIDE_1,           1, 9, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,           1, 5, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::R_COIN,           0, 6, 0, 1
  LObj  LO::S_SPRING,         0, 8
  LObj  LO::S_SOLID_BLOCK,    1, 11
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 6, 0, 8
  LObj  LO::S_MTRACK_UPRIGHT,  2, 5
  LObj  LO::S_MTRACK_BUMP,     0, 9
  LObjN LO::WIDE_3,           1, 9, 3, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 9, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObjN LO::R_COIN,           2, 6, 1, 0
  LObjN LO::WIDE_1,           0, 7, 1, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_COIN,           0, 8
  LObjN LO::WIDE_3,           1, 5, 6, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           0, 9, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_UPRIGHT,  1, 9
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 6, 0, 8
  LObj  LO::S_SPRING,         1, 4
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_ROCK,           1, 0, 2, 2
  LObj  LO::S_COIN,           1, 8
  LObj  LO::S_MTRACK_UPRIGHT,  0, 9
  LObj  LO::S_MTRACK_BUMP,     1, 5
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 8
  LObjN LO::R_ROCK,           1, 0, 5, 4
  LObj  LO::S_COIN,           3, 8
  LObj  LO::S_MTRACK_UPRIGHT,  0, 9
  LObjN LO::R_ROCK,           3, 0, 2, 3
  LObjN LO::TALL_2,           0, 4, 4, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 9, 5, 5
  LObjN LO::WIDE_1,           1, 8, 0, LN1::FENCE
  LObjN LO::TALL_2,           1, 4, 4, LN2::TRUNK
  LObj  LO::S_MTRACK,         1, 8
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObj  LO::S_MTRACK_SSL,      1, 6
  LObj  LO::S_MTRACK_SSL,      1, 5
  LObjN LO::WIDE_3,           0, 8, 3, LN3::MINE_TRACKS
  LObj  LO::S_COIN,           1, 2
  LObj  LO::S_SPRING,         0, 3
  LObjN LO::WIDE_3,           0, 4, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObjN LO::R_COIN,           1, 1, 3, 0
  LObjN LO::R_SOLID_BLOCK,    0, 2, 3, 0
  LObjN LO::WIDE_3,           0, 4, 5, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SGR,      3, 9
  LObj  LO::S_MTRACK_SGR,      2, 10
  LObjN LO::WIDE_3,           1, 4, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_SSR,      1, 5
  LObj  LO::S_MTRACK_SGR,      0, 11
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObjN LO::WIDE_3,           0, 11, 2, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSR,      1, 7
  LObj  LO::S_MTRACK_SSR,      1, 8
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_3,           0, 8, 6, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 5
  LObjN LO::R_ROCK,           1, 0, 10, 5
  LObjN LO::WIDE_3,           0, 11, 2, LN3::MINE_TRACKS
  LObjN LO::R_GROUND,         4, 9, 3, 5
  LObjN LO::R_GROUND,         4, 11, 3, 3
  LObjN LO::WIDE_2,           1, 10, 2, LN2::FLOWER
  LObjN LO::R_COIN,           1, 9, 1, 0
  LObj  LO::R_CUSTOM,         2, 12, Metatiles::LAVA_MAIN, (1<<4)|2
  LObjN LO::R_ROCK,           2, 0, 10, 3
  LObjN LO::R_COIN,           0, 8, 1, 0
  LObjN LO::R_GROUND,         0, 10, 3, 4
  LObjN LO::TALL_2,           4, 4, 3, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 8, 6, 6
  LObjN LO::R_COIN,           1, 6, 4, 0
  LObjN LO::WIDE_2,           0, 7, 2, LN2::FLOWER
  LObjN LO::TALL_2,           5, 4, 3, LN2::TRUNK
  LObjN LO::R_ROCK,           1, 0, 5, 4
  LObjN LO::WIDE_3,           0, 9, 2, LN3::MINE_TRACKS
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::R_ROCK,           0, 13, 6, 1
  LObjN LO::WIDE_1,           2, 12, 0, LN1::FENCE
  LObj  LO::S_MTRACK_SSL,      1, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObjN LO::WIDE_1,           0, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,           1, 7, 2, LN3::MINE_TRACKS
  LObj  LO::S_PRIZE,          2, 4
  LObjN LO::R_ROCK,           0, 8, 6, 6
  LObj  LO::S_DOOR,           1, 2
  LWriteCol 8, 243
  LObjN LO::R_BRICK,          0, 4, 3, 0
  LObj  LO::S_BIGHEART,       1, 7
  LObj  LO::S_SPRING,         2, 3
  LObj  LO::S_PRIZE,          1, 4
  LObjN LO::WIDE_1,           2, 8, 6, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (15<<4)|2
  LObj  LO::S_FROZENCRACK,     2, 9
  LObj  LO::S_FROZENCRACK,     1, 2
  LObjN LO::WIDE_1,           1, 2, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 1
  LObj  LO::S_FROZENCRACK,     1, 5
  LObj  LO::S_SPRING,         0, 7
  LObjN LO::R_SOLID_BLOCK,    0, 9, 5, 0
  LObj  LO::S_FROZENCRACK,     1, 11
  LObj  LO::S_FLOWER,         1, 8
  LObjN LO::TALL_1,           2, 5, 3, LN1::LADDER
  LObj  LO::S_PRIZE,          1, 5
  LObjN LO::R_SOLID_BLOCK,    1, 5, 0, 4
  LObj  LO::S_FROZENCRACK,     1, 2
  LObjN LO::R_SOLID_BLOCK,    0, 5, 4, 0
  LObj  LO::S_FROZENCRACK,     0, 6
  LObj  LO::S_FROZENCRACK,     2, 9
  LObj  LO::S_PRIZE,          1, 9
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (4<<4)|2
  LObjN LO::R_SOLID_BLOCK,    1, 6, 0, 1
  LObjN LO::WIDE_1,           1, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 8, 1, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       0, 9
  LObjN LO::WIDE_1,           0, 10, 1, LN1::SOLID_LEDGE
  LObj  LO::S_FROZENCRACK,     1, 4
  LObj  LO::S_FROZENCRACK,     0, 11
  LObjN LO::R_COIN,           1, 6, 3, 0
  LObjN LO::R_SOLID_BLOCK,    0, 7, 3, 0
  LObjN LO::WIDE_1,           1, 3, 3, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           0, 8, 6, 6
  LObjN LO::WIDE_1,           3, 7, 2, LN1::TALLGRASS
  LObj  LO::R_CUSTOM,         4, 12, Metatiles::LAVA_MAIN, (7<<4)|2
  LObj  LO::S_FROZENCRACK,     1, 8
  LObj  LO::S_FROZENCRACK,     1, 3
  LObjN LO::WIDE_1,           0, 8, 3, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,           2, 3, 10, LN3::MINE_TRACKS
  LObj  LO::S_PRIZE,          0, 4
  LObj  LO::S_MTRACK,         1, 3
  LObj  LO::S_FROZENCRACK,     0, 10
  LObj  LO::S_FROZENCRACK,     1, 5
  LObjN LO::R_GROUND,         2, 8, 6, 6
  LObjN LO::WIDE_1,           2, 7, 0, LN1::SPIKES
  LObjN LO::WIDE_1,           0, 7, 1, LN1::SPIKES
  LObj  LO::S_SPRING,         4, 7
  LObj  LO::S_MTRACK_SSR,      1, 4
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (3<<4)|2
  LObj  LO::S_MTRACK_SSR,      1, 5
  LObj  LO::S_FROZENCRACK,     0, 9
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObj  LO::S_FROZENCRACK,     1, 4
  LObj  LO::S_MTRACK_SSR,      0, 7
  LObjN LO::R_GROUND,         1, 8, 6, 6
  LObj  LO::S_HEART,          2, 7
  LObj  LO::S_FLOWER,         1, 7
  LObjN LO::R_COIN,           2, 3, 2, 0
  LObjN LO::WIDE_1,           0, 4, 10, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           1, 4, 3, LN1::LADDER
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::LAVA_MAIN, (8<<4)|2
  LObj  LO::S_FROZENCRACK,     1, 10
  LObj  LO::S_FROZENCRACK,     1, 5
  LObjN LO::WIDE_1,           1, 3, 1, LN1::SPIKES
  LObj  LO::S_FROZENCRACK,     1, 7
  LObj  LO::S_FROZENCRACK,     3, 9
  LObjN LO::R_GROUND,         2, 4, 4, 10
  LObjN LO::R_COIN,           1, 2, 3, 0
  LObjN LO::TALL_1,           4, 4, 5, LN1::LADDER
  LObjN LO::RECT_3,           0, 10, 4, LN3::ROCK, 18
  LObj  LO::S_PRIZE,          1, 7
  LWriteCol InventoryItem::ABILITY_BACKUP
  LObjN LO::R_COIN,           0, 9, 2, 0
  LObjN LO::R_ROCK,           2, 0, 1, 4
  LObjN LO::R_ROCK,           2, 0, 4, 6
  LObj  LO::S_BIGHEART,       0, 9
  LObj  LO::R_CUSTOM,         2, 10, Metatiles::LAVA_MAIN, (1<<4)|4
  LObj  LO::S_SNOWMAN,         3, 2
  LObjN LO::R_ROCK,           0, 4, 3, 2
  LObj  LO::S_SIGNPOST,       1, 9
  LWriteCol <AboutWaterFreeze, >AboutWaterFreeze
  LObj  LO::S_CUSTOM,         2, 3, Metatiles::PUSHABLE_BLOCK
  LObjN LO::WIDE_1,           1, 4, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 7, 5, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         2, 6, Metatiles::PUSHABLE_BLOCK
  LObj  LO::S_CUSTOM,         2, 3, Metatiles::PUSHABLE_BLOCK
  LObjN LO::WIDE_1,           0, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           1, 10, 2, LN2::TRUNK
  LObjN LO::R_ROCK,           0, 13, 2, 1
  LObjN LO::R_ROCK,           2, 0, 1, 6
  LObjN LO::TALL_2,           0, 10, 2, LN2::TRUNK
  LObjN LO::R_ROCK,           1, 10, 2, 4
  LObj  LO::S_MTRACK_UPRIGHT,  1, 9
  LObjN LO::R_GROUND,         2, 9, 8, 5
  LObjN LO::WIDE_1,           2, 8, 0, LN1::FENCE
  LObj  LO::S_MTRACK_UPRIGHT,  5, 8
  LObjN LO::R_GROUND,         2, 8, 3, 6
  LObjN LO::WIDE_1,           1, 7, 2, LN1::TALLGRASS
  LObjN LO::R_WATER,          3, 8, 15, 6
  LXPlus16
  LObjN LO::WIDE_1,           0, 7, 2, LN1::TALLGRASS
  LObjN LO::R_ROCK,           0, 8, 7, 6
  LObjN LO::R_COIN,           2, 6, 3, 0
  LObjN LO::WIDE_3,           5, 7, 11, LN3::MINE_TRACKS
  LObjN LO::WIDE_1,           11, 8, 3, LN1::SOLID_LEDGE
  LObj  LO::S_EXIT_DOOR,      2, 6
  LObjN LO::R_SOLID_BLOCK,    4, 0, 0, 14
  LObjN LO::R_SOLID_BLOCK,    1, 0, 13, 4
  LObj  LO::S_BIGHEART,       0, 8
  LObjN LO::R_SOLID_BLOCK,    0, 10, 13, 4
  LObj  LO::S_DOOR,           2, 8
  LWriteCol 2, 88
  LObjN LO::R_COIN,           2, 7, 6, 2
  LObjN LO::R_AIR,            6, 5, 2, 1
  LObj  LO::S_PRIZE,          1, 7
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_SOLID_BLOCK,    3, 0, 0, 14
  LFinished

frozen2Sprite:
  LSpr Enemy::ICE_1,               1,   7,   9
  LSpr Enemy::MINECART,            0,   9,   5
  LSpr Enemy::CHECKPOINT,          0,  61,   8
  LSpr Enemy::THWOMP,              0,  64,   6
  LSpr Enemy::THWOMP,              0,  70,   4
  LSpr Enemy::THWOMP,              0,  72,   4
  LSpr Enemy::CANNON_1,            1,  72,   8
  LSpr Enemy::ROCKET_LAUNCHER,     0,  84,  12
  LSpr Enemy::CANNON_1,            1,  93,   6
  LSpr Enemy::ROCKET_LAUNCHER,     0,  97,  13
  LSpr Enemy::CANNON_1,            0,  99,   3
  LSpr Enemy::BOMB_GUY,            1, 105,   4
  LSpr Enemy::BOMB_GUY,            1, 110,   4
  LSpr Enemy::BOMB_GUY,            0, 113,   6
  LSpr Enemy::COLLECTIBLE,         0, 113,   9
  LSpr Enemy::BOMB_GUY,            1, 115,   2
  LSpr Enemy::CHECKPOINT,          0, 117,   2
  LSpr Enemy::GEORGE,              1, 126,   7
  LSpr Enemy::GEORGE,              0, 134,   7
  LSpr Enemy::ROCKET_LAUNCHER,     0, 155,  13
  LSpr Enemy::ICE_1,               1, 156,   3, 1
  LSpr Enemy::CANNON_1,            1, 164,   2
  LSpr Enemy::CANNON_1,            1, 166,   6
  LSpr Enemy::CHECKPOINT,          0, 172,   9
  LSpr Enemy::MINECART,            0, 175,   9
  LSpr Enemy::ICE_1,               1, 179,   9, 1
  LSpr Enemy::ICE_1,               1, 183,  12, 1
  .byt 255 ; end
