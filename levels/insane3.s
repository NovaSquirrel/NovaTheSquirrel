insane3:
  .byt MusicTracks::NONE|0
  .byt 88
  .byt $3a
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_MINES
  .addr insane3Data
  .addr insane3Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_SUBURBS
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $11, $11 ; boundaries
  .byt $03, $04 ; link
  .byt $03, $c4 ; link
  .byt $03, $c4 ; link
  .byt $03, $c0 ; link

insane3Data:
  LObjN LO::R_GROUND,         1, 12, 3, 2
  LObjN LO::R_COIN,           1, 10, 2, 1
  LObj  LO::S_GROUND,         3, 14
  LObjN LO::WIDE_1,           3, 11, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         3, 10, 4, 2
  LObjN LO::R_GROUND,         2, 8, 1, 1
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObjN LO::R_GROUND,         2, 6, 2, 3
  LObjN LO::R_GROUND,         1, 10, 1, 2
  LObjN LO::R_ICE2,            2, 6, 4, 1
  LObjN LO::R_GROUND,         0, 12, 4, 1
  LObj  LO::S_EXIT_DOOR,      1, 10
  LObjN LO::TALL_1,           3, 8, 3, LN1::LADDER
  LObjN LO::R_GROUND,         1, 6, 2, 3
  LObjN LO::R_GROUND,         0, 10, 1, 2
  LObjN LO::R_GROUND,         2, 10, 2, 1
  LObjN LO::R_GROUND,         1, 8, 0, 1
  LObj  LO::S_SPRING,         1, 9
  LObj  LO::S_SPRING,         5, 13
  LObjN LO::WIDE_1,           0, 14, 8, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 9, Metatiles::WOOD_CRATE, (3<<4)|0
  LObj  LO::S_BIGHEART,       3, 13
  LObj  LO::R_CUSTOM,         4, 11, Metatiles::WOOD_CRATE, (3<<4)|0
  LObj  LO::R_CUSTOM,         3, 14, Metatiles::WOOD_CRATE, (3<<4)|0
  LObjN LO::R_ROCK,           5, 13, 15, 1
  LObjN LO::R_BRICKWALL,      2, 11, 6, 1
  LObjN LO::R_COIN,           1, 9, 4, 0
  LObjN LO::R_BRICKWALL,      6, 9, 6, 3
  LObjN LO::R_COIN,           1, 7, 4, 0
  LObjN LO::R_GROUND,         7, 0, 4, 2
  LObjN LO::R_GROUND,         1, 3, 4, 1
  LObjN LO::R_GROUND,         2, 5, 4, 1
  LObj  LO::S_SPRING,         2, 2
  LObjN LO::R_GROUND,         0, 7, 4, 1
  LObjN LO::R_GROUND,         7, 0, 4, 0
  LObjN LO::TALL_1,           2, 12, 2, LN1::LADDER
  LObjN LO::R_ROCK,           1, 12, 15, 2
  LObjN LO::R_BRICKWALL,      2, 10, 2, 1
  LObj  LO::S_PRIZE,          3, 9
  LWriteCol InventoryItem::ABILITY_BOOMERANG | 128
  LObjN LO::R_ICE2,            2, 7, 5, 0
  LObjN LO::WIDE_3,           4, 11, 4, LN3::WHITEFENCE
  LObjN LO::WIDE_2,           5, 12, 9, LN2::STONE_BRIDGE
  LObj  LO::R_CUSTOM,         5, 2, Metatiles::WOOD_CRATE, (3<<4)|0
  LObjN LO::TALL_1,           0, 13, 1, LN1::LADDER
  LObj  LO::R_CUSTOM,         1, 6, Metatiles::WOOD_CRATE, (3<<4)|0
  LObjN LO::R_SOLID_ROCK,     3, 11, 1, 0
  LObj  LO::S_SOLID_ROCK,     1, 9
  LObj  LO::S_FG_GLASS_RED,   0, 10
  LObjN LO::R_GROUND,         0, 12, 3, 2
  LObj  LO::S_FG_GLASS_RED,   1, 9
  LObj  LO::S_SOLID_ROCK,     0, 10
  LObj  LO::S_FG_GLASS_BLUE,  0, 11
  LObj  LO::R_CUSTOM,         1, 6, Metatiles::WOOD_CRATE, (3<<4)|0
  LObj  LO::S_FG_GLASS_BLUE,  0, 10
  LObj  LO::S_SOLID_ROCK,     0, 11
  LObjN LO::R_SOLID_ROCK,     4, 0, 1, 13
  LObj  LO::S_FG_GLASS_BLUE,  0, 1
  LObj  LO::S_FG_GLASS_RED,   0, 7
  LObj  LO::S_FG_GLASS_BLUE,  0, 9
  LObjN LO::R_CEILING_BARRIER,0, 14, 1, 0
  LObj  LO::S_FG_GLASS_RED,   1, 0
  LObj  LO::S_FG_GLASS_RED,   0, 3
  LObj  LO::S_FG_GLASS_BLUE,  0, 5
  LObj  LO::S_FG_GLASS_RED,   0, 10
  LObj  LO::S_FG_GLASS_BLUE,  0, 12
  LObjN LO::R_ROCK,           1, 0, 15, 0
  LObjN LO::R_SOLID_BLOCK,    0, 6, 4, 0
  LObj  LO::S_PRIZE,          2, 3
  LWriteCol InventoryItem::ABILITY_FIRE
  LObjN LO::WIDE_3,           0, 10, 2, LN3::MINE_TRACKS
  LObjN LO::TALL_1,           0, 13, 1, LN1::LADDER
  LObj  LO::S_SOLID_BLOCK,    2, 5
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 11, 0, 3
  LObjN LO::WIDE_3,           1, 4, 6, LN3::MINE_TRACKS
  LObjN LO::R_CEILING_BARRIER,0, 5, 4, 0
  LObj  LO::S_MTRACK_SUPPORTS, 0, 10
  LObj  LO::S_MTRACK,         3, 9
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 10, 0, 4
  LObj  LO::S_MTRACK_SSL,      1, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObj  LO::S_MTRACK_SSL,      1, 7
  LObj  LO::S_MTRACK_UPLEFT,   1, 6
  LObj  LO::S_MTRACK_BUMP,     1, 6
  LObjN LO::TALL_1,           9, 13, 1, LN1::LADDER
  LObjN LO::R_GROUND,         1, 13, 15, 1
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::ABILITY_BURGER | 128
  LObjN LO::TALL_1,           5, 0, 12, LN1::LADDER
  LObjN LO::R_ROCK,           1, 0, 15, 1
  LObj  LO::S_HEART,          1, 4
  LObjN LO::R_ROCK,           1, 2, 13, 0
  LObjN LO::WIDE_2,           0, 7, 4, LN2::STONE_BRIDGE
  LObj  LO::S_SOLID_ROCK,     0, 12
  LObj  LO::S_HEART,          1, 8
  LObjN LO::R_ROCK,           1, 3, 9, 0
  LObj  LO::S_HEART,          2, 5
  LObjN LO::R_COIN,           1, 6, 4, 0
  LObjN LO::WIDE_2,           0, 8, 4, LN2::STONE_BRIDGE
  LObjN LO::RECT_1,           2, 11, 3, LN1::GROUND, 28
  LObjN LO::WIDE_2,           3, 7, 4, LN2::STONE_BRIDGE
  LObj  LO::S_HEART,          1, 8
  LObj  LO::S_HEART,          1, 5
  LObjN LO::WIDE_2,           2, 5, 4, LN2::STONE_BRIDGE
  LObj  LO::S_PRIZE,          1, 8
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::WIDE_1,           2, 3, 4, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           2, 0, 2, LN1::LADDER
  LObj  LO::S_SPRING,         2, 10
  LObjN LO::R_GROUND,         1, 8, 6, 2
  LObjN LO::WIDE_2,           1, 4, 5, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_GROUND,         1, 0, 3, 0
  LObjN LO::R_WOOD_PLATFORM,  0, 1, 0, 2
  LObj  LO::S_SPRING,         1, 7
  LObjN LO::R_BRICKWALL,      1, 6, 2, 1
  LObjN LO::R_WOOD_PLATFORM,  1, 1, 0, 2
  LObjN LO::R_GROUND,         2, 4, 3, 6
  LObjN LO::R_CEILING_BARRIER,1, 0, 1, 0
  LObjN LO::WIDE_3,           0, 3, 2, LN3::WHITEFENCE
  LObjN LO::R_GROUND,         3, 7, 0, 3
  LObjN LO::TALL_1,           1, 0, 1, LN1::LADDER
  LObjN LO::WIDE_1,           0, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 0, 0, 12
  LObjN LO::R_GROUND,         0, 13, 3, 1
  LObjN LO::R_BRICKWALL,      1, 11, 2, 1
  LObjN LO::R_MTRACK_SUPPORTSONLY,  3, 0, 0, 12
  LObjN LO::WIDE_1,           0, 13, 5, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         2, 14
  LObj  LO::R_CUSTOM,         4, 12, Metatiles::LAVA_MAIN, (15<<4)|2
  LObjN LO::TALL_1,           8, 0, 6, LN1::LADDER
  LObjN LO::RECT_3,           1, 0, 1, LN3::ROCK, 48
  LObjN LO::TALL_1,           5, 2, 7, LN1::LADDER
  LObjN LO::RECT_3,           1, 2, 1, LN3::ROCK, 16
  LObjN LO::R_COIN,           1, 8, 4, 0
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (15<<4)|2
  LObjN LO::R_ROCK,           2, 4, 8, 0
  LObjN LO::TALL_1,           4, 5, 5, LN1::LADDER
  LObjN LO::R_COIN,           2, 6, 5, 1
  LObjN LO::TALL_1,           7, 4, 5, LN1::LADDER
  LObjN LO::RECT_3,           1, 2, 0, LN3::ROCK, 25
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (15<<4)|2
  LObjN LO::R_COIN,           2, 6, 5, 0
  LObjN LO::TALL_1,           7, 3, 5, LN1::LADDER
  LObjN LO::R_ROCK,           1, 3, 15, 0
  LObjN LO::WIDE_1,           1, 9, 5, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 4, 3, 0
  LObj  LO::S_PRIZE,          1, 6
  LWriteCol InventoryItem::MINE_TRACK_JUMP
  LObjN LO::R_ROCK,           3, 4, 5, 1
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::LAVA_MAIN, (15<<4)|2
  LObjN LO::TALL_1,           6, 4, 4, LN1::LADDER
  LObjN LO::WIDE_1,           3, 4, 6, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       1, 2
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::SPRING, (1<<4)|0
  LObjN LO::R_SOLID_BLOCK,    0, 8, 1, 0
  LObjN LO::R_COIN,           2, 0, 0, 1
  LObj  LO::S_SPRING,         0, 2
  LObj  LO::S_SOLID_BLOCK,    0, 3
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::FROZEN_CAVE
  LFinished

insane3Sprite:
  LSpr Enemy::KING,                0,  35,   2
  LSpr Enemy::OWL,                 0,  49,   9, 1
  LSpr Enemy::GEORGE,              1,  54,  12
  LSpr Enemy::OWL,                 0,  55,   5, 1
  LSpr Enemy::OWL,                 0,  59,   6, 1
  LSpr Enemy::SNEAKER,             0,  72,   4
  LSpr Enemy::SNEAKER,             0,  74,   6
  LSpr Enemy::GEORGE,              0,  98,  11
  LSpr Enemy::GEORGE,              1, 100,  11
  LSpr Enemy::SPINNER,             0, 106,   1, 3
  LSpr Enemy::MINECART,            0, 116,  10
  LSpr Enemy::CANNON_1,            1, 150,  10
  LSpr Enemy::GEORGE,              0, 159,  10
  LSpr Enemy::GEORGE,              0, 163,  10
  LSpr Enemy::OWL,                 1, 171,   3
  LSpr Enemy::SPINNER,             0, 210,   7, 3
  LSpr Enemy::SPINNER,             1, 219,   8, 3
  LSpr Enemy::SPINNER,             1, 227,   6, 3
  LSpr Enemy::SPINNER,             1, 230,   8, 3
  LSpr Enemy::SPINNER,             1, 242,   7, 3
  LSpr Enemy::CHECKPOINT,          0, 252,   1
  LSpr Enemy::COLLECTIBLE,         0, 254,  10
  .byt 255 ; end
