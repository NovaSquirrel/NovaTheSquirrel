insane6:
  .byt MusicTracks::NONE|0
  .byt 1
  .byt $fa
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_HANNAH
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_MINES
  .addr insane6Data
  .addr insane6Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_JUNGLE
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $00, $02 ; boundaries

insane6Data:
  LObjN LO::RECT_3,           0, 0, 2, LN3::ROCK, 17
  LObjN LO::R_ROCK,           0, 3, 2, 3
  LObjN LO::RECT_3,           0, 12, 2, LN3::ROCK, 18
  LObjN LO::R_ROCK,           3, 3, 5, 1
  LObjN LO::R_ROCK,           0, 5, 3, 0
  LObjN LO::WIDE_3,           2, 9, 2, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 10, 0, 1
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 10, 0, 1
  LObj  LO::S_MTRACK_SSL,      1, 9
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (3<<4)|2
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_MTRACK_UPRIGHT,  1, 7
  LObjN LO::WIDE_3,           1, 7, 1, LN3::MINE_TRACKS
  LObjN LO::WIDE_1,           0, 8, 4, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    3, 10, 1, 1
  LObjN LO::WIDE_1,           2, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    0, 8, 1, 3
  LObjN LO::R_ROCK,           2, 0, 13, 1
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK,         0, 11
  LObj  LO::S_MTRACK_SSR,      1, 12
  LObjN LO::R_SKWIRLBUSH,     1, 2, 4, 3
  LObjN LO::WIDE_2,           0, 9, 1, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_MTRACK_SSR,      0, 13
  LObj  LO::S_MTRACK_SSR,      1, 14
  LObjN LO::R_WOOD_PLATFORM,  1, 6, 0, 8
  LObj  LO::S_HEART,          1, 9
  LObjN LO::WIDE_2,           0, 11, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_COIN,           3, 5, 1, 0
  LObjN LO::WIDE_2,           0, 9, 3, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     2, 2, 4, 3
  LObjN LO::R_COIN,           0, 6, 1, 0
  LObjN LO::R_COIN,           1, 10, 0, 2
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::LAVA_MAIN, (4<<4)|1
  LObjN LO::R_WOOD_PLATFORM,  1, 6, 0, 6
  LObjN LO::WIDE_2,           1, 8, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_MTRACK,         0, 12
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObj  LO::S_MTRACK_SSL,      0, 12
  LObj  LO::S_SPRING,         1, 7
  LObjN LO::WIDE_3,           0, 11, 3, LN3::MINE_TRACKS
  LObjN LO::WIDE_1,           1, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 10, 2, 0
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (4<<4)|2
  LObjN LO::R_COIN,           1, 1, 3, 1
  LObjN LO::WIDE_1,           0, 4, 3, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK_SSL,      2, 11
  LObjN LO::WIDE_3,           1, 10, 1, LN3::MINE_TRACKS
  LObjN LO::R_COIN,           1, 9, 2, 0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::LAVA_MAIN, (5<<4)|3
  LObjN LO::WIDE_2,           3, 7, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     1, 2, 4, 3
  LObj  LO::S_BIGHEART,       0, 6
  LObj  LO::S_MTRACK_UPRIGHT,  1, 10
  LObjN LO::R_WOOD_PLATFORM,  1, 6, 0, 3
  LObjN LO::R_GROUND,         0, 10, 6, 4
  LObjN LO::R_ROCK,           1, 0, 9, 1
  LObj  LO::S_FLOWER,         0, 9
  LObjN LO::R_GROUND,         1, 7, 0, 2
  LObjN LO::R_ROCK,           1, 2, 7, 0
  LObj  LO::S_GROUND_CLIMB_R, 0, 7
  LObjN LO::R_GROUND,         0, 8, 0, 1
  LObj  LO::S_GROUND_CLIMB_R, 1, 8
  LObj  LO::S_GROUND,         0, 9
  LObj  LO::S_GROUND_CLIMB_R, 1, 9
  LObjN LO::R_AIR,            1, 2, 0, 0
  LObjN LO::WIDE_1,           1, 10, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           1, 7, 3, LN2::STONE_BRIDGE
  LObjN LO::R_AIR,            2, 2, 0, 0
  LObjN LO::R_SKWIRLBUSH,     0, 9, 2, 2
  LObjN LO::R_WOOD_PLATFORM,  1, 12, 0, 2
  LObjN LO::WIDE_2,           2, 9, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     1, 3, 2, 4
  LObjN LO::R_WOOD_PLATFORM,  1, 8, 0, 6
  LObjN LO::WIDE_1,           2, 12, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           1, 8, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     1, 1, 2, 4
  LObjN LO::R_WOOD_PLATFORM,  1, 6, 0, 8
  LObj  LO::S_BIGHEART,       1, 8
  LObjN LO::WIDE_2,           0, 9, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_COIN,           2, 1, 5, 0
  LObjN LO::WIDE_2,           0, 3, 5, LN2::STONE_BRIDGE
  LObjN LO::R_SKWIRLBUSH,     0, 5, 2, 3
  LObjN LO::R_WOOD_PLATFORM,  1, 9, 0, 5
  LObjN LO::WIDE_2,           1, 13, 1, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObj  LO::S_SPRING,         2, 8
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 4, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 5, 4, 9
  LObjN LO::R_SKWIRLBUSH,     5, 1, 2, 4
  LObjN LO::R_WOOD_PLATFORM,  1, 6, 0, 8
  LObjN LO::R_COIN,           1, 11, 1, 0
  LObjN LO::R_WATER,          0, 12, 1, 2
  LObjN LO::WIDE_1,           1, 9, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 3
  LObj  LO::S_PRIZE,          0, 7
  LWriteCol InventoryItem::SPRING | 128
  LObjN LO::R_COIN,           0, 10, 1, 0
  LObjN LO::R_WATER,          0, 11, 1, 3
  LObjN LO::WIDE_1,           1, 3, 3, LN1::SOLID_LEDGE
  LObj  LO::S_TROPICAL_FLOWER,0, 5
  LObjN LO::R_COIN,           1, 9, 1, 0
  LObjN LO::R_WATER,          0, 10, 1, 4
  LObj  LO::S_SPRING,         2, 2
  LObjN LO::R_COIN,           0, 8, 1, 0
  LObjN LO::R_WATER,          0, 9, 1, 5
  LObjN LO::R_SKWIRLBUSH,     1, 3, 2, 4
  LObjN LO::R_WOOD_PLATFORM,  1, 8, 0, 6
  LObjN LO::R_GROUND,         2, 3, 2, 11
  LObjN LO::R_COIN,           1, 1, 3, 0
  LObj  LO::S_SPRING,         2, 5
  LObjN LO::R_GROUND,         0, 6, 3, 8
  LObj  LO::S_BIGHEART,       2, 1
  LObj  LO::S_TROPICAL_FLOWER,0, 3
  LObjN LO::WIDE_3,           2, 6, 8, LN3::MINE_TRACKS
  LObj  LO::S_CEILING_BARRIER,2, 0
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_GROUND,         0, 10, 6, 4
  LObjN LO::RECT_3,           1, 0, 0, LN3::ROCK, 25
  LObjN LO::RECT_3,           1, 1, 0, LN3::ROCK, 24
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 7, 0, 2
  LObjN LO::RECT_3,           2, 2, 0, LN3::ROCK, 22
  LObjN LO::R_COIN,           0, 7, 1, 2
  LObjN LO::R_SOLID_ROCK,     2, 7, 0, 2
  LObjN LO::R_SKWIRLBUSH,     2, 4, 4, 3
  LObjN LO::R_WOOD_PLATFORM,  2, 8, 0, 6
  LObjN LO::WIDE_2,           1, 9, 5, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           0, 11, 5, 0
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (5<<4)|2
  LObjN LO::R_SKWIRLBUSH,     4, 5, 4, 3
  LObjN LO::R_WOOD_PLATFORM,  2, 9, 0, 5
  LObjN LO::WIDE_3,           3, 7, 4, LN3::MINE_TRACKS
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::R_ROCK,           0, 13, 0, 1
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 8, 0, 1
  LObjN LO::R_ROCK,           0, 10, 7, 4
  LObjN LO::R_MTRACK_SUPPORTSONLY,  3, 8, 0, 1
  LObjN LO::WIDE_1,           2, 7, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 2, LN1::FENCE
  LObjN LO::R_SKWIRLBUSH,     4, 2, 4, 3
  LObjN LO::WIDE_2,           0, 8, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_WOOD_PLATFORM,  2, 6, 0, 8
  LObj  LO::S_SOLID_BLOCK,    1, 3
  LObjN LO::WIDE_3,           0, 9, 1, LN3::MINE_TRACKS
  LObjN LO::WIDE_2,           0, 10, 1, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_MTRACK_SGL,      2, 9
  LObj  LO::S_MTRACK_SGL,      2, 8
  LObj  LO::S_TROPICAL_FLOWER,1, 9
  LObj  LO::S_MTRACK_SGL,      1, 7
  LObjN LO::WIDE_3,           2, 6, 1, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 7, 0, 7
  LObjN LO::WIDE_3,           1, 6, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_UPRIGHT,  1, 6
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 7, 0, 7
  LObj  LO::S_MTRACK_BUMP,     1, 8
  LObj  LO::S_MTRACK_UPRIGHT,  1, 8
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 5
  LObjN LO::WIDE_3,           1, 4, 5, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK,         0, 8
  LObjN LO::R_SKWIRLBUSH,     1, 5, 2, 2
  LObjN LO::WIDE_3,           1, 4, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 0, 6
  LObj  LO::S_SPRING,         1, 3
  LObjN LO::WIDE_1,           1, 2, 1, LN1::SPIKES
  LObjN LO::WIDE_1,           0, 3, 1, LN1::SOLID_LEDGE
  LObj  LO::S_MTRACK,         0, 6
  LObj  LO::S_MTRACK_UPLEFT,   0, 10
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 11, 0, 3
  LObj  LO::S_MTRACK_SSR,      1, 7
  LObjN LO::WIDE_3,           0, 10, 3, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 7, 1, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           0, 10, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_SUPPORTS, 1, 10
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObj  LO::S_MTRACK_BUMP,     0, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 11, 0, 3
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 6
  LObj  LO::S_MTRACK_SSL,      0, 10
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObj  LO::S_MTRACK_SSL,      0, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObj  LO::S_MTRACK_SSL,      1, 6
  LObjN LO::WIDE_3,           0, 9, 1, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSL,      1, 5
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 10, 0, 4
  LObjN LO::WIDE_3,           1, 4, 2, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           0, 9, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $30
  LObjN LO::WIDE_1,           0, 10, 1, LN1::SPIKES
  LObjN LO::WIDE_2,           0, 11, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     1, 5, 2, 2
  LObj  LO::S_MTRACK_UPRIGHT,  0, 9
  LObjN LO::R_WOOD_PLATFORM,  1, 8, 0, 6
  LObjN LO::WIDE_3,           1, 4, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObj  LO::S_TROPICAL_FLOWER,2, 7
  LObjN LO::WIDE_3,           2, 4, 4, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SUPPORTS, 0, 9
  LObjN LO::WIDE_3,           1, 9, 2, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 9, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObjN LO::R_WOOD_PLATFORM,  0, 10, 0, 4
  LObj  LO::S_MTRACK_SUPPORTS, 2, 9
  LObj  LO::S_MTRACK_SSL,      1, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObj  LO::S_MTRACK_SSL,      1, 6
  LObj  LO::S_MTRACK_SSL,      1, 5
  LObj  LO::S_MTRACK_BUMP,     0, 8
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 5
  LObjN LO::WIDE_3,           1, 4, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObjN LO::WIDE_3,           0, 8, 5, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 4, 1, LN3::MINE_TRACKS
  LObjN LO::WIDE_1,           1, 2, 1, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_3,           1, 4, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObj  LO::S_MTRACK_SUPPORTS, 0, 6
  LObj  LO::S_MTRACK_SUPPORTS, 0, 8
  LObjN LO::WIDE_3,           1, 6, 1, LN3::MINE_TRACKS
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 3
  LObj  LO::S_MTRACK_BUMP,     1, 6
  LObj  LO::S_MTRACK_SUPPORTS, 0, 8
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 9, 0, 5
  LObjN LO::R_WOOD_PLATFORM,  1, 5, 0, 9
  LObj  LO::S_SOLID_BLOCK,    1, 5
  LObjN LO::WIDE_3,           0, 11, 5, LN3::MINE_TRACKS
  LObj  LO::R_CUSTOM,         0, 14, Metatiles::LAVA_MAIN, (1<<4)|0
  LObj  LO::R_CUSTOM,         2, 13, Metatiles::LAVA_MAIN, (2<<4)|1
  LObjN LO::R_ROCK,           3, 12, 2, 2
  LObjN LO::R_SKWIRLBUSH,     3, 2, 4, 3
  LObjN LO::R_COIN,           0, 8, 1, 1
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObjN LO::R_WOOD_PLATFORM,  2, 6, 0, 3
  LObjN LO::WIDE_2,           2, 8, 3, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           1, 5, 1, 1
  LObjN LO::R_SKWIRLBUSH,     2, 1, 4, 3
  LObjN LO::WIDE_2,           0, 6, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObj  LO::S_HEART,          1, 5
  LObjN LO::R_WOOD_PLATFORM,  1, 5, 0, 4
  LObjN LO::R_COIN,           3, 2, 1, 1
  LObjN LO::WIDE_1,           0, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           0, 8, 2, 6
  LObj  LO::S_SOLID_BLOCK,    2, 7
  LObjN LO::R_ROCK,           1, 4, 1, 5
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (10<<4)|2
  LObjN LO::WIDE_1,           2, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         2, 5
  LObjN LO::WIDE_1,           4, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 6, 2, 1
  LObjN LO::R_ROCK,           2, 9, 1, 5
  LObjN LO::R_ROCK,           2, 11, 5, 3
  LObj  LO::S_TROPICAL_FLOWER,1, 7
  LObj  LO::S_TROPICAL_FLOWER,2, 7
  LObj  LO::S_TROPICAL_FLOWER,2, 7
  LObjN LO::WIDE_3,           1, 5, 4, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 3
  LObjN LO::R_GROUND,         0, 10, 10, 4
  LObj  LO::S_EXIT_DOOR,      2, 8
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 6, 0, 3
  LObjN LO::R_GROUND,         3, 2, 3, 7
  .byt LSpecialCmd, LevelSpecialConfig::FROZEN_CAVE
  .byt LSpecialCmd, LevelSpecialConfig::ANIMATED_WATER
  LFinished

insane6Sprite:
  LSpr Enemy::MINECART,            0,   5,   9
  LSpr Enemy::GEORGE,              0,  13,  11
  LSpr Enemy::ICE_1,               1,  16,   7
  LSpr Enemy::ICE_1,               1,  17,   4, 2
  LSpr Enemy::FIRE_WALK,           0,  27,   8, 1
  LSpr Enemy::ICE_1,               0,  34,   7, 2
  LSpr Enemy::ICE_1,               1,  38,   3, 2
  LSpr Enemy::FALLING_SPIKE,       0,  41,   2, 2
  LSpr Enemy::ICE_1,               1,  51,   9, 2
  LSpr Enemy::FIRE_WALK,           0,  55,   6, 1
  LSpr Enemy::FIRE_JUMP,           1,  59,   8
  LSpr Enemy::FIRE_JUMP,           1,  62,  11, 1
  LSpr Enemy::CHECKPOINT,          0,  67,   8
  LSpr Enemy::GEORGE,              0,  79,   4
  LSpr Enemy::ICE_2,               0,  80,   7
  LSpr Enemy::ICE_1,               1,  92,   2, 2
  LSpr Enemy::MINECART,            0,  99,   6
  LSpr Enemy::ICE_2,               1, 102,   7
  LSpr Enemy::CHECKPOINT,          0, 113,   8
  LSpr Enemy::COLLECTIBLE,         0, 114,  10
  LSpr Enemy::FALLING_SPIKE,       0, 115,   3, 2
  LSpr Enemy::MINECART,            0, 121,   7
  LSpr Enemy::ICE_1,               1, 123,   9, 2
  LSpr Enemy::ICE_1,               0, 127,   6, 3
  LSpr Enemy::ICE_1,               0, 134,   2, 2
  LSpr Enemy::MINECART,            0, 134,   9
  LSpr Enemy::MINECART,            1, 155,  10
  LSpr Enemy::MINECART,            0, 160,   9
  LSpr Enemy::ICE_1,               1, 187,   4, 2
  LSpr Enemy::CHECKPOINT,          0, 192,  11
  LSpr Enemy::ICE_1,               1, 201,   7, 3
  LSpr Enemy::GEORGE,              0, 208,   7
  .byt 255 ; end
