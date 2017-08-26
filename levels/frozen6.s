frozen6:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fa
  .byt GraphicsUpload::SP_RONALD
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_MINES
  .addr frozen6Data
  .addr frozen6Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_SUBURBS
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $00, $00 ; boundaries

frozen6Data:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::FROZEN_CAVE
  LObjN LO::R_ROCK,           0, 0, 7, 2
  LObjN LO::R_GROUND,         0, 12, 6, 2
  LObjN LO::WIDE_1,           1, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_ICE2,            5, 6, 10, 3
  LObjN LO::TALL_2,           0, 10, 1, LN2::TRUNK
  LObjN LO::RECT_3,           1, 12, 2, LN3::ROCK, 24
  LObjN LO::R_ROCK,           1, 0, 12, 1
  LObjN LO::R_ROCK,           6, 10, 5, 1
  LObj  LO::S_SPRING,         2, 9
  LObjN LO::R_ROCK,           1, 6, 2, 3
  LObjN LO::WIDE_2,           3, 6, 3, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           0, 10, 2, 0
  LObjN LO::RECT_3,           1, 0, 0, LN3::ROCK, 26
  LObj  LO::S_BIGHEART,       0, 9
  LObjN LO::R_ICE2,            3, 10, 6, 1
  LObjN LO::R_COIN,           2, 4, 2, 0
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::R_ICE2,            2, 8, 2, 1
  LObjN LO::WIDE_3,           3, 7, 7, LN3::MINE_TRACKS
  LObjN LO::R_SOLID_BLOCK,    0, 8, 0, 3
  LObjN LO::R_ICE2,            2, 5, 10, 0
  LObjN LO::R_CEILING_BARRIER,0, 8, 5, 6
  LObj  LO::S_CEILING_BARRIER,0, 8
  LObj  LO::S_MTRACK_SSR,      6, 8
  LObj  LO::S_MTRACK_SSR,      1, 9
  LObj  LO::S_MTRACK_SSR,      1, 10
  LObjN LO::WIDE_3,           1, 10, 6, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 11, 0, 3
  LObjN LO::R_ROCK,           4, 1, 1, 2
  LObjN LO::R_ROCK,           2, 0, 14, 4
  LObj  LO::S_MTRACK_UPRIGHT,  1, 10
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 11, 0, 3
  LObjN LO::WIDE_3,           1, 8, 1, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSR,      0, 11
  LObj  LO::S_MTRACK_SSR,      1, 12
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_MTRACK_SSR,      0, 13
  LObjN LO::WIDE_3,           1, 7, 3, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSR,      0, 14
  LObjN LO::R_ICE2,            2, 8, 7, 6
  LObj  LO::R_CUSTOM,         2, 9, Metatiles::ICE, (0<<4)|1
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::ICE
  LObj  LO::R_CUSTOM,         1, 13, Metatiles::ICE, (1<<4)|0
  LObj  LO::R_CUSTOM,         2, 9, Metatiles::ICE, (0<<4)|1
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::ICE
  LObjN LO::R_ROCK,           3, 8, 1, 2
  LObjN LO::R_ROCK,           0, 13, 5, 1
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObj  LO::S_SNOWMAN,         0, 6
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 2
  LObjN LO::R_SOLID_BLOCK,    0, 4, 4, 0
  LObjN LO::TALL_2,           0, 5, 2, LN2::TRUNK
  LObjN LO::R_SOLID_BLOCK,    0, 8, 1, 0
  LObjN LO::R_COIN,           0, 11, 2, 0
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObj  LO::S_DOOR,           1, 2
  LWriteCol 3, 109
  LObjN LO::WIDE_1,           0, 8, 1, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::R_ROCK,           0, 12, 0, 0
  LObjN LO::R_COIN,           1, 1, 0, 2
  LObjN LO::TALL_2,           0, 5, 2, LN2::TRUNK
  LObjN LO::R_ROCK,           0, 8, 1, 6
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 4
  LObjN LO::WIDE_2,           0, 8, 3, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           0, 9, 3, 3
  LObjN LO::R_ENEMY_BARRIER      ,  1, 1, 0, 2
  LObjN LO::R_ICE2,            3, 8, 11, 0
  LObj  LO::S_HEART,          5, 7
  LObjN LO::R_ICE2,            0, 9, 6, 0
  LObj  LO::S_CUSTOM,         6, 7, Metatiles::PICKUP_BLOCK
  LObjN LO::R_ENEMY_BARRIER      ,  2, 1, 0, 2
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 4
  LObjN LO::R_ROCK,           1, 0, 5, 5
  LObjN LO::TALL_2,           0, 6, 8, LN2::TRUNK
  LObjN LO::WIDE_3,           5, 11, 15, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 12, 0, 2
  LObjN LO::R_COIN,           1, 1, 0, 2
  LObjN LO::WIDE_2,           0, 5, 2, LN2::STONE_BRIDGE
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObj  LO::S_COIN,           0, 3
  LObjN LO::R_COIN,           1, 1, 0, 2
  LObj  LO::S_SPRING,         0, 4
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 4
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::R_COIN,           1, 3, 0, 2
  LObjN LO::WIDE_3,           0, 11, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $40
  LObj  LO::S_SPRING,         6, 5
  LObjN LO::WIDE_2,           1, 5, 2, LN2::STONE_BRIDGE
  LObjN LO::WIDE_2,           0, 5, 2, LN2::STONE_BRIDGE
  LObj  LO::S_DOOR,           1, 3
  LWriteCol 2, 67
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 4
  LObj  LO::S_MTRACK_UPRIGHT,  0, 11
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 12, 0, 2
  LObjN LO::R_ROCK,           1, 0, 11, 4
  LObjN LO::WIDE_2,           6, 9, 3, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           1, 6, 1, 1
  LObjN LO::TALL_2,           3, 5, 3, LN2::TRUNK
  LObjN LO::R_ROCK,           0, 9, 5, 5
  LObj  LO::S_SOLID_BLOCK,    1, 8
  LObjN LO::R_ROCK,           1, 0, 3, 3
  LObj  LO::S_BIGHEART,       1, 6
  LObjN LO::TALL_2,           2, 4, 4, LN2::TRUNK
  LObjN LO::R_ROCK,           1, 0, 4, 2
  LObjN LO::WIDE_2,           0, 9, 3, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           1, 6, 1, 1
  LObj  LO::S_SPRING,         2, 8
  LObjN LO::R_ICE2,            2, 6, 3, 8
  LObjN LO::R_ICE2,            4, 6, 9, 0
  LObj  LO::S_SPRING,         3, 5
  LObjN LO::R_SOLID_BLOCK,    1, 2, 0, 2
  LObjN LO::R_COIN,           2, 2, 1, 2
  LObjN LO::WIDE_2,           5, 5, 3, LN2::STONE_BRIDGE
  LObjN LO::R_ROCK,           0, 13, 3, 1
  LObjN LO::R_COIN,           2, 8, 0, 2
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::R_ROCK,           0, 9, 0, 3
  LObjN LO::R_ROCK,           1, 5, 2, 9
  LObjN LO::R_ROCK,           2, 1, 4, 1
  LObjN LO::TALL_2,           0, 3, 1, LN2::TRUNK
  LObjN LO::TALL_1,           1, 5, 2, LN1::LADDER
  LObjN LO::R_ROCK,           0, 8, 3, 6
  LObj  LO::S_PRIZE,          2, 5
  LWriteCol InventoryItem::ABILITY_FIRE | 128
  LObjN LO::TALL_2,           1, 3, 4, LN2::TRUNK
  LObj  LO::S_MTRACK_SSL,      1, 12
  LObjN LO::WIDE_1,           1, 7, 1, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK_SSL,      0, 11
  LObjN LO::R_ICE2,            1, 9, 2, 3
  LObj  LO::S_PRIZE,          1, 4
  LWriteCol InventoryItem::SPRING
  LObjN LO::TALL_2,           0, 5, 1, LN2::TRUNK
  LObj  LO::S_SOLID_BLOCK,    0, 7
  LObjN LO::R_ICE2,            0, 13, 1, 0
  LObjN LO::R_ICE2,            1, 7, 1, 2
  LObjN LO::R_ICE2,            1, 6, 8, 0
  LObjN LO::R_ICE2,            0, 11, 8, 2
  LObjN LO::R_COIN,           2, 8, 1, 0
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 5
  LObjN LO::R_ICE2,            1, 0, 3, 5
  LObj  LO::S_SNOWMAN,         0, 9
  LObjN LO::R_ICE2,            4, 6, 3, 5
  LObjN LO::R_ICE2,            0, 12, 1, 0
  LObj  LO::S_SPRING,         3, 5
  LObj  LO::S_MTRACK_SSL,      1, 5
  LObj  LO::S_MTRACK_SSL,      1, 4
  LObj  LO::S_MTRACK_SSL,      1, 3
  LObjN LO::WIDE_3,           1, 2, 5, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           0, 3, 1, 7
  LObjN LO::TALL_2,           1, 11, 3, LN2::TRUNK
  LObjN LO::R_ICE2,            1, 3, 3, 8
  LObj  LO::S_HEART,          1, 1
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::R_ROCK,           1, 0, 1, 10
  LObjN LO::R_ICE2,            0, 6, 9, 1
  LObjN LO::TALL_2,           0, 11, 3, LN2::TRUNK
  LObjN LO::R_ROCK,           2, 8, 0, 1
  LObjN LO::R_ICE2,            1, 8, 6, 1
  LObjN LO::R_AIR,            2, 7, 2, 1
  LObjN LO::R_COIN,           1, 7, 1, 0
  LObj  LO::S_MTRACK_SSL,      0, 14
  LObj  LO::S_PRIZE,          1, 3
  LWriteCol InventoryItem::ABILITY_FIRE | 128
  LObj  LO::S_MTRACK_SSL,      0, 13
  LObj  LO::S_MTRACK_SSL,      1, 12
  LObj  LO::S_MTRACK_SSL,      1, 11
  LObjN LO::WIDE_2,           1, 6, 2, LN2::STONE_BRIDGE
  LObj  LO::S_MTRACK_SSL,      0, 10
  LObj  LO::S_MTRACK_SSL,      1, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObjN LO::WIDE_3,           1, 7, 2, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           0, 8, 3, 6
  LObjN LO::WIDE_3,           3, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObj  LO::S_MTRACK_SSL,      1, 6
  LObj  LO::S_MTRACK_SSL,      1, 5
  LObjN LO::WIDE_3,           1, 4, 2, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 5, 0, 9
  LObjN LO::WIDE_3,           1, 4, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObj  LO::S_MTRACK_UPRIGHT,  2, 4
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 5, 0, 9
  LObjN LO::R_ICE2,            2, 5, 7, 0
  LObjN LO::WIDE_3,           2, 8, 5, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_UPRIGHT,  6, 8
  LObj  LO::S_MTRACK_UPRIGHT,  2, 6
  LObjN LO::WIDE_3,           1, 4, 3, LN3::MINE_TRACKS
  LObjN LO::R_ROCK,           2, 5, 1, 9
  LObj  LO::S_MTRACK_STOP,     2, 4
  LObjN LO::R_ICE2,            0, 5, 15, 0
  LObj  LO::S_SPRING,         13, 7
  LObjN LO::WIDE_1,           0, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_ICE2,            3, 5, 6, 0
  LObjN LO::WIDE_1,           7, 7, 5, LN1::SOLID_LEDGE
  LObj  LO::S_EXIT_DOOR,      3, 5
  LFinished

frozen6Sprite:
  LSpr Enemy::FIRE_JUMP,           0,  11,   5, 1
  LSpr Enemy::RONALD,              0,  15,   5, 1
  LSpr Enemy::CHECKPOINT,          0,  18,   5
  LSpr Enemy::ICE_1,               1,  22,  11
  LSpr Enemy::RONALD,              1,  43,   4, 0
  LSpr Enemy::MINECART,            0,  44,  10
  LSpr Enemy::FIRE_WALK,           1,  58,   7, 1
  LSpr Enemy::CHECKPOINT,          0,  65,  12
  LSpr Enemy::RONALD_BURGER,       0,  77,   2
  LSpr Enemy::RONALD,              1,  86,   6, 1
  LSpr Enemy::MINECART,            0, 100,  11
  LSpr Enemy::CHECKPOINT,          0, 108,   4
  LSpr Enemy::FIRE_JUMP,           1, 125,   8, 1
  LSpr Enemy::FIRE_JUMP,           1, 129,   8, 1
  LSpr Enemy::RONALD,              0, 135,   5
  LSpr Enemy::FIRE_JUMP,           1, 153,   4
  LSpr Enemy::CHECKPOINT,          0, 157,   7
  LSpr Enemy::FIRE_JUMP,           1, 167,  10, 1
  LSpr Enemy::FIRE_JUMP,           1, 175,   5, 1
  LSpr Enemy::FIRE_JUMP,           1, 184,   2, 1
  LSpr Enemy::CHECKPOINT,          0, 189,   5
  LSpr Enemy::FIRE_JUMP,           0, 192,   8
  LSpr Enemy::MINECART,            0, 200,   7
  LSpr Enemy::RONALD,              1, 235,   4
  LSpr Enemy::RONALD,              1, 243,   4
  .byt 255 ; end
