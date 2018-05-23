extra2:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_CASTLE
  .byt GraphicsUpload::SP_MINES
  .addr extra2Data
  .addr extra2Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_CLOUDS
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $00, $00 ; boundaries

extra2Data:
  LObjN LO::R_ROCK,           0, 0, 11, 2
  LObjN LO::R_ROCK,           0, 3, 4, 6
  LObjN LO::R_ROCK,           0, 13, 11, 1
  LObj  LO::S_SIGNPOST,       5, 12
  LWriteCol <AboutIceAbuse, >AboutIceAbuse
  LObj  LO::S_PRIZE,          2, 10
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObjN LO::R_ROCK,           2, 10, 2, 2
  LObjN LO::R_COIN,           3, 5, 1, 1
  LObjN LO::R_COIN,           1, 9, 1, 0
  LObjN LO::R_COIN,           1, 3, 1, 0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::KEY_GREEN, (1<<4)|1
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::KEY_GREEN, (1<<4)|1
  LObjN LO::R_COIN,           2, 3, 1, 1
  LObjN LO::R_COIN,           0, 8, 1, 1
  LObj  LO::R_CUSTOM,         1, 5, Metatiles::KEY_GREEN, (1<<4)|1
  LObjN LO::R_COIN,           2, 6, 1, 1
  LObjN LO::R_GROUND,         2, 10, 2, 4
  LObjN LO::WIDE_1,           1, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 3
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::FORCE_RIGHT, (13<<4)|0
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 16
  LObjN LO::R_ROCK,           1, 0, 11, 3
  LObj  LO::S_CUSTOM,         0, 4, Metatiles::LOCK_RED
  LObjN LO::R_ROCK,           0, 5, 11, 5
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::LOCK_GREEN, (11<<4)|0
  LObjN LO::RECT_3,           12, 0, 1, LN3::ROCK, 123
  LObjN LO::R_ROCK,           0, 8, 6, 1
  LObjN LO::R_COIN,           1, 10, 1, 1
  LObj  LO::S_PRIZE,          1, 5
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::KEY_RED
  LObjN LO::R_COIN,           2, 5, 1, 1
  LObjN LO::R_ROCK,           0, 10, 2, 4
  LObj  LO::R_CUSTOM,         3, 13, Metatiles::LAVA_MAIN, (6<<4)|1
  LObjN LO::R_COIN,           1, 6, 1, 1
  LObjN LO::R_COIN,           3, 8, 1, 1
  LObjN LO::R_ROCK,           3, 2, 11, 3
  LObjN LO::R_COIN,           0, 10, 11, 0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORCE_LEFT, (11<<4)|0
  LObjN LO::R_ROCK,           0, 12, 11, 2
  LObj  LO::R_CUSTOM,         12, 10, Metatiles::LAVA_MAIN, (2<<4)|4
  LObjN LO::WIDE_3,           3, 5, 4, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 6, 0, 8
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::KEY_RED
  LObj  LO::S_CUSTOM,         2, 2, Metatiles::KEY_RED
  LObjN LO::R_MTRACK_SUPPORTSONLY,  1, 6, 0, 8
  LObj  LO::S_MTRACK_SSR,      1, 6
  LObj  LO::S_MTRACK_SSR,      1, 7
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::KEY_RED
  LObj  LO::S_MTRACK_SSR,      1, 8
  LObj  LO::S_CUSTOM,         1, 5, Metatiles::KEY_RED
  LObj  LO::S_MTRACK_SSR,      0, 9
  LObjN LO::WIDE_3,           1, 9, 4, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 10, 0, 4
  LObj  LO::S_CUSTOM,         1, 11, Metatiles::KEY_RED
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::KEY_RED
  LObjN LO::R_MTRACK_SUPPORTSONLY,  2, 10, 0, 4
  LObjN LO::R_ROCK,           6, 6, 6, 1
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  LObjN LO::R_COIN,           1, 9, 5, 4
  LObjN LO::R_ROCK,           1, 2, 5, 2
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::LOCK_RED, (5<<4)|0
  LObjN LO::R_ROCK,           5, 6, 2, 8
  LObjN LO::R_GROUND,         3, 7, 2, 7
  LObj  LO::S_PRIZE,          1, 4
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObjN LO::R_ROCK,           6, 2, 8, 7
  LObj  LO::R_CUSTOM,         9, 3, Metatiles::FORCE_RIGHT, (4<<4)|0
  LObjN LO::R_COIN,           1, 5, 1, 8
  LObjN LO::R_ROCK,           3, 5, 4, 9
  LObj  LO::S_PRIZE,          5, 5
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObjN LO::R_GROUND,         0, 8, 2, 6
  LObj  LO::R_CUSTOM,         4, 4, Metatiles::CHIP, (1<<4)|1
  LObj  LO::R_CUSTOM,         6, 9, Metatiles::CHIP, (1<<4)|1
  LObj  LO::R_CUSTOM,         5, 6, Metatiles::CHIP, (1<<4)|1
  LObj  LO::R_CUSTOM,         6, 9, Metatiles::CHIP, (1<<4)|1
  LObj  LO::R_CUSTOM,         4, 5, Metatiles::CHIP, (1<<4)|1
  LObj  LO::R_CUSTOM,         5, 3, Metatiles::CHIP, (1<<4)|1
  LObjN LO::R_GROUND,         7, 8, 5, 6
  LObjN LO::R_ROCK,           1, 2, 2, 4
  LSetX 160
  LWriteCol 24
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::CHIP_SOCKET
  LObjN LO::WIDE_3,           3, 7, 15, LN3::MINE_TRACKS
  LObjN LO::WIDE_3,           2, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $20
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $30
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $40
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $50
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $60
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $70
  LObjN LO::WIDE_3,           1, 7, 0, LN3::MINE_TRACKS_BRAKES
  LWriteCol $80
  LObjN LO::R_MTRACK_SUPPORTSONLY,  6, 8, 0, 6
  LObjN LO::WIDE_3,           2, 7, 15, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  14, 8, 0, 6
  LObjN LO::WIDE_3,           2, 7, 15, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  14, 8, 0, 6
  LObjN LO::WIDE_3,           2, 7, 15, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  14, 8, 0, 6
  LObj  LO::S_EXIT_DOOR,      1, 8
  LObjN LO::WIDE_1,           0, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,           1, 7, 15, LN3::MINE_TRACKS
  LObjN LO::R_MTRACK_SUPPORTSONLY,  14, 8, 0, 6
  LObjN LO::WIDE_3,           2, 7, 12, LN3::MINE_TRACKS
  LObj  LO::S_CUSTOM,         12, 6, Metatiles::CHERRY_BOMB
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 6
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

extra2Sprite:
  LSpr Enemy::OWL,                 1,  30,   4
  LSpr Enemy::OWL,                 1,  34,   4
  LSpr Enemy::CHECKPOINT,          0,  39,   6
  LSpr Enemy::TOAST,               0,  46,  13
  LSpr Enemy::TOAST,               0,  50,  13
  LSpr Enemy::OWL,                 1,  59,  11
  LSpr Enemy::MINECART,            0,  67,   5
  LSpr Enemy::CHECKPOINT,          0,  94,   5
  LSpr Enemy::CHECKPOINT,          0, 118,   4
  LSpr Enemy::GRILLBERT,           0, 127,  10
  LSpr Enemy::GRILLBERT,           0, 130,   5
  LSpr Enemy::GRILLBERT,           0, 135,   9
  LSpr Enemy::GRILLBERT,           0, 138,   3
  LSpr Enemy::GRILLBERT,           0, 139,  13
  LSpr Enemy::GRILLBERT,           0, 143,   7
  LSpr Enemy::GRILLBERT,           0, 148,  12
  LSpr Enemy::GRILLBERT,           0, 150,   5
  LSpr Enemy::GRILLBERT,           0, 155,   9
  LSpr Enemy::CHECKPOINT,          0, 161,   7
  LSpr Enemy::MINECART,            0, 163,   7
  LSpr Enemy::COLLECTIBLE,         0, 244,   9
  .byt 255 ; end
