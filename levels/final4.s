final4:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_MINES
  .byt GraphicsUpload::SP_FACEBALL
  .addr final4Data
  .addr final4Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG_GRAY
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_JUNGLE
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $00, $00 ; boundaries

final4Data:
  LObjN LO::R_GROUND,         0, 13, 7, 1
  LObjN LO::WIDE_2,           1, 4, 3, LN2::STONE_BRIDGE
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::ABILITY_BOMB | 128
  LObjN LO::R_SKWIRLBUSH,     2, 0, 4, 2
  LObj  LO::S_SIGNPOST,       1, 12
  LWriteCol <AboutBombs2, >AboutBombs2
  LObjN LO::R_WOOD_PLATFORM,  1, 3, 0, 6
  LObjN LO::R_GROUND,         0, 10, 1, 2
  LObjN LO::R_BRICK,          1, 9, 2, 0
  LObj  LO::S_MTRACK_BUMP,     1, 10
  LObjN LO::R_SOLID_ROCK,     0, 11, 0, 3
  LObj  LO::S_MTRACK_BUMP,     1, 5
  LObjN LO::WIDE_3,           0, 10, 7, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_UPRIGHT,  1, 5
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObjN LO::WIDE_3,           1, 3, 9, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           0, 6, 7, LN3::MINE_TRACKS
  LObjN LO::R_CEILING_BARRIER,1, 4, 8, 0
  LObjN LO::WIDE_2,           0, 5, 0, LN2::GRAY_BRICKS
  LObj  LO::S_MTRACK_SUPPORTS, 1, 10
  LObjN LO::WIDE_3,           1, 10, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObj  LO::S_MTRACK_UPRIGHT,  2, 10
  LObjN LO::R_SOLID_ROCK,     0, 11, 0, 3
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 7, 0, 7
  LObjN LO::R_COIN,           2, 6, 5, 0
  LObj  LO::S_MTRACK_UPLEFT,   0, 8
  LObj  LO::S_WOOD_PLATFORM_TOP, 0, 9
  LObjN LO::R_WOOD_PLATFORM,  0, 10, 0, 4
  LObj  LO::S_SPRING,         1, 1
  LObjN LO::R_GROUND,         0, 2, 4, 3
  LObjN LO::WIDE_3,           0, 8, 3, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 8, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObj  LO::S_HEART,          1, 1
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::ABILITY_BOMB | 128
  LObjN LO::R_AIR,            0, 3, 1, 0
  LObjN LO::WIDE_1,           1, 2, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_MTRACK_BUMP,     0, 8
  LObj  LO::S_WOOD_PLATFORM_TOP, 0, 9
  LObjN LO::R_WOOD_PLATFORM,  0, 10, 0, 4
  LObjN LO::WIDE_1,           1, 1, 3, LN1::FENCE
  LObjN LO::R_GROUND,         0, 2, 3, 12
  LObjN LO::WIDE_1,           4, 6, 1, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           0, 10, 4, LN2::TRUNK_L
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::WIDE_3,           0, 5, 6, LN3::MINE_TRACKS
  LObjN LO::WIDE_2,           1, 2, 1, LN2::GRAY_BRICKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 8
  LObjN LO::R_COIN,           1, 4, 4, 0
  LObjN LO::WIDE_3,           0, 5, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::TALL_2,           1, 10, 4, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 10, 4, LN2::TRUNK_L
  LObj  LO::S_MTRACK_UPRIGHT,  2, 5
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 8
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 2
  LObjN LO::WIDE_2,           0, 10, 1, LN2::GRAY_BRICKS
  LObjN LO::WIDE_3,           1, 11, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $40
  LObjN LO::R_WOOD_PLATFORM,  1, 4, 0, 4
  LObj  LO::S_SOLID_BLOCK,    0, 9
  LObjN LO::WIDE_3,           0, 11, 10, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           1, 5, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 8
  LObj  LO::S_MTRACK_SUPPORTS, 0, 11
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObj  LO::S_MTRACK_SSR,      1, 7
  LObj  LO::S_MTRACK_SSR,      1, 8
  LObj  LO::S_MTRACK_SSR,      1, 9
  LObjN LO::WIDE_3,           0, 11, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $10
  LObjN LO::WIDE_3,           1, 9, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $08
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 10, 0, 4
  LObj  LO::S_MTRACK_SUPPORTS, 0, 11
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObjN LO::WIDE_3,           0, 9, 5, LN3::MINE_TRACKS
  LObjN LO::R_COIN,           0, 10, 2, 0
  LObjN LO::R_MTRACK_SUPPORTSONLY,  4, 10, 0, 4
  LObj  LO::S_MTRACK_SUPPORTS, 0, 11
  LObjN LO::WIDE_3,           1, 11, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::R_SKWIRLBUSH,     1, 5, 4, 2
  LObj  LO::S_MTRACK_UPRIGHT,  0, 9
  LObj  LO::S_MTRACK_UPRIGHT,  0, 11
  LObjN LO::R_WOOD_PLATFORM,  2, 8, 0, 6
  LObjN LO::WIDE_3,           2, 11, 1, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 12, 0, 2
  LObj  LO::R_CUSTOM,         2, 4, Metatiles::MINE_TRACK_UP_RIGHT, (0<<4)|7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 12, 0, 2
  LObjN LO::WIDE_1,           1, 3, 3, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 4, 3, 10
  LObj  LO::S_PRIZE,          2, 2
  LWriteCol InventoryItem::ABILITY_BOMB | 128
  LObjN LO::WIDE_1,           2, 3, 1, LN1::FENCE
  LObjN LO::WIDE_1,           0, 4, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SKWIRLBUSH,     2, 1, 4, 2
  LObj  LO::S_HEART,          0, 6
  LObjN LO::WIDE_2,           0, 7, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::TALL_2,           0, 11, 3, LN2::TRUNK_L
  LObjN LO::R_WOOD_PLATFORM,  2, 4, 0, 10
  LObjN LO::WIDE_2,           1, 5, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::TALL_2,           1, 10, 4, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 11, 3, LN2::TRUNK_L
  LObjN LO::R_SKWIRLBUSH,     1, 3, 4, 2
  LObjN LO::WIDE_2,           0, 8, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_WOOD_PLATFORM,  2, 6, 0, 8
  LObjN LO::WIDE_1,           3, 3, 0, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 8, 2, 1
  LObjN LO::WIDE_2,           0, 11, 2, LN2::STONE_BRIDGE
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 2
  LObjN LO::R_GROUND,         1, 0, 3, 8
  LObjN LO::R_GRAYBRICKS,     0, 9, 3, 5
  LObj  LO::S_BIGHEART,       3, 9
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::R_GRAYBRICKS,     0, 3, 3, 11
  LObjN LO::WIDE_2,           4, 5, 3, LN2::BUSH
  LObjN LO::R_GROUND,         0, 6, 3, 8
  LObj  LO::S_FLOWER,         4, 4
  LObjN LO::R_GROUND,         0, 5, 2, 9
  LObj  LO::S_BIGHEART,       1, 4
  LObjN LO::WIDE_2,           2, 5, 2, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           0, 6, 2, 1
  LObjN LO::R_GROUND,         0, 8, 6, 6
  LObjN LO::RECT_2,           1, 10, 2, LN2::BLACK, 5
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 2
  LObjN LO::R_WOOD_PLATFORM,  2, 4, 0, 3
  LObjN LO::WIDE_2,           3, 13, 2, LN2::STONE_BRIDGE
  LObj  LO::S_CEILING_BARRIER,2, 0
  LObjN LO::R_COIN,           0, 4, 0, 1
  LObjN LO::WIDE_1,           0, 6, 0, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 7, 0, 1
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::WIDE_1,           0, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GRAYBRICKS,     1, 0, 3, 4
  LObjN LO::R_GROUND,         0, 5, 3, 9
  LObjN LO::RECT_2,           0, 11, 1, LN2::BLACK, 3
  LObjN LO::R_GROUND,         4, 3, 3, 11
  LObjN LO::RECT_2,           0, 9, 1, LN2::BLACK, 3
  LObjN LO::RECT_2,           0, 11, 1, LN2::BLACK, 0
  LObjN LO::R_GROUND,         4, 8, 10, 6
  LObjN LO::RECT_2,           0, 9, 1, LN2::BLACK, 0
  LObjN LO::RECT_2,           1, 8, 2, LN2::BLACK, 1
  LObj  LO::S_HEART,          1, 7
  LObjN LO::R_COIN,           1, 4, 4, 0
  LObjN LO::R_BRICK,          0, 5, 4, 0
  LObjN LO::WIDE_1,           0, 7, 7, LN1::TALLGRASS
  LObjN LO::R_COIN,           1, 1, 4, 0
  LObjN LO::R_BRICK,          0, 2, 4, 0
  LObjN LO::R_ROCK,           7, 0, 6, 3
  LObjN LO::TALL_2,           0, 4, 2, LN2::TRUNK
  LObjN LO::R_ROCK,           0, 7, 6, 7
  LObjN LO::R_AIR,            2, 3, 2, 0
  LObjN LO::WIDE_1,           0, 4, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_PRIZE,          1, 4
  LWriteCol InventoryItem::ABILITY_BOMB | 128
  LObjN LO::WIDE_1,           1, 4, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::TALL_2,           2, 4, 2, LN2::TRUNK
  LObj  LO::S_MTRACK_SSR,      1, 3
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::R_GROUND,         0, 12, 11, 2
  LObj  LO::S_MTRACK_SSR,      1, 4
  LObjN LO::WIDE_3,           1, 4, 8, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 5, 0, 6
  LObjN LO::R_COIN,           1, 2, 5, 1
  LObjN LO::R_SKWIRLBUSH,     0, 5, 4, 2
  LObjN LO::R_WOOD_PLATFORM,  2, 8, 0, 3
  LObjN LO::R_MTRACK_SUPPORTSONLY,  3, 5, 0, 6
  LObjN LO::WIDE_2,           1, 11, 2, LN2::BUSH
  LObj  LO::S_MTRACK_SSR,      2, 5
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObjN LO::WIDE_2,           0, 9, 4, LN2::BUSH
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObj  LO::S_MTRACK_SSR,      1, 7
  LObjN LO::WIDE_3,           1, 7, 8, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 1
  LObjN LO::R_COIN,           1, 5, 5, 1
  LObjN LO::R_MTRACK_SUPPORTSONLY,  3, 8, 0, 6
  LObjN LO::R_MTRACK_SUPPORTSONLY,  4, 8, 0, 6
  LObjN LO::WIDE_1,           1, 5, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 6, 2, 8
  LObjN LO::WIDE_2,           3, 8, 4, LN2::BUSH
  LObjN LO::R_GROUND,         0, 9, 5, 5
  LObjN LO::R_SKWIRLBUSH,     3, 2, 4, 2
  LObjN LO::R_WOOD_PLATFORM,  2, 5, 0, 3
  LObjN LO::WIDE_2,           1, 6, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_COIN,           0, 9, 3, 0
  LObjN LO::WIDE_2,           0, 11, 3, LN2::STONE_BRIDGE
  LObjN LO::WIDE_2,           3, 3, 4, LN2::STONE_BRIDGE
  LObjN LO::R_SKWIRLBUSH,     0, 4, 4, 2
  LObjN LO::R_GROUND,         1, 11, 2, 3
  LObjN LO::R_WOOD_PLATFORM,  1, 7, 0, 3
  LObj  LO::S_BIGHEART,       1, 1
  LObjN LO::WIDE_2,           0, 8, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::WIDE_1,           2, 10, 2, LN1::FENCE
  LObjN LO::WIDE_2,           0, 11, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 12, 2, 2
  LObjN LO::R_COIN,           2, 5, 2, 0
  LObjN LO::WIDE_2,           0, 6, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     1, 2, 4, 2
  LObjN LO::R_GROUND,         1, 9, 2, 5
  LObjN LO::R_WOOD_PLATFORM,  1, 5, 0, 3
  LObjN LO::WIDE_1,           3, 8, 2, LN1::FENCE
  LObjN LO::WIDE_2,           0, 9, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 10, 2, 4
  LObjN LO::WIDE_1,           4, 6, 5, LN1::FENCE
  LObjN LO::WIDE_2,           0, 7, 5, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 5, 6
  LObjN LO::R_COIN,           1, 4, 3, 0
  LObjN LO::WIDE_2,           6, 5, 2, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 6, 7, 8
  LObjN LO::WIDE_2,           3, 5, 4, LN2::BUSH
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

final4Sprite:
  LSpr Enemy::TURKEY,              0,   2,   3
  LSpr Enemy::MINECART,            0,   9,  10
  LSpr Enemy::CHECKPOINT,          0,  23,   1
  LSpr Enemy::ROVER,               1,  30,   1
  LSpr Enemy::MINECART,            0,  33,   1
  LSpr Enemy::MINECART,            0,  41,   9
  LSpr Enemy::CHECKPOINT,          0,  62,   3
  LSpr Enemy::ROCKET_LAUNCHER,     0,  67,  12
  LSpr Enemy::OWL,                 0,  71,   4
  LSpr Enemy::TURKEY,              0,  75,   7
  LSpr Enemy::OWL,                 1,  76,  10, 1
  LSpr Enemy::ICE_1,               1,  80,   2, 2
  LSpr Enemy::ROCKET_LAUNCHER,     0,  93,   5
  LSpr Enemy::BOMB_GUY,            0,  99,   7
  LSpr Enemy::BOMB_GUY,            1, 102,   7
  LSpr Enemy::ROVER,               0, 102,  12
  LSpr Enemy::ROCKET_LAUNCHER,     0, 105,   8
  LSpr Enemy::ICE_1,               0, 114,   2, 2
  LSpr Enemy::BOMB_GUY,            1, 115,  10
  LSpr Enemy::ROCKET_LAUNCHER,     0, 116,   6
  LSpr Enemy::BOMB_GUY,            1, 117,  10
  LSpr Enemy::CHECKPOINT,          0, 120,   7
  LSpr Enemy::OWL,                 0, 128,   6
  LSpr Enemy::MINECART,            0, 138,   4
  LSpr Enemy::ROCKET_LAUNCHER,     0, 139,  10
  LSpr Enemy::COLLECTIBLE,         0, 143,   2
  LSpr Enemy::ROCKET_LAUNCHER,     0, 154,  13
  LSpr Enemy::BOUNCER,             1, 171,   2
  LSpr Enemy::BOUNCER,             1, 172,  10
  LSpr Enemy::BOUNCER,             1, 180,   7
  LSpr Enemy::OWL,                 0, 187,   6
  LSpr Enemy::BOUNCER,             1, 198,   5
  .byt 255 ; end
