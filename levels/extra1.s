extra1:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_HANNAH
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_CASTLE
  .byt GraphicsUpload::SP_WIND
  .addr extra1Data
  .addr extra1Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG_GRAY2
  .byt GraphicsUpload::PAL_ENEMY7
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_JUNGLE
  .byt 255 ; end
  .byt $00, $10 ; boundaries

extra1Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <MeetKeeAgain, >MeetKeeAgain
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 21
  LObjN LO::R_SKWIRLBUSH,     3, 5, 4, 1
  LObjN LO::TALL_2,           0, 9, 3, LN2::PALM_TREE
  LObjN LO::R_SKWIRLBUSH,     1, 4, 2, 0
  LObjN LO::R_WOOD_PLATFORM,  1, 7, 0, 5
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::ABILITY_BOMB | 128
  LObj  LO::S_BIG_SPIKY_BUSH, 0, 12
  LObjN LO::R_SKWIRLBUSH,     2, 7, 2, 1
  LObjN LO::R_SKWIRLBUSH,     1, 3, 4, 1
  LObj  LO::S_SKWIRLBUSH,     0, 6
  LObjN LO::R_WOOD_PLATFORM,  0, 9, 0, 3
  LObjN LO::R_SKWIRLBUSH,     1, 2, 2, 0
  LObjN LO::R_WOOD_PLATFORM,  1, 5, 0, 7
  LObjN LO::TALL_2,           1, 9, 3, LN2::PALM_TREE
  LObjN LO::R_COIN,           2, 5, 0, 2
  LObjN LO::R_SOLID_ROCK,     1, 5, 0, 7
  LObjN LO::R_SKWIRLBUSH,     1, 4, 4, 1
  LObjN LO::R_GROUND,         0, 11, 5, 1
  LObjN LO::R_SKWIRLBUSH,     1, 3, 2, 0
  LObj  LO::S_W_CRATE,        0, 9
  LObjN LO::R_WOOD_PLATFORM,  1, 6, 0, 4
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::R_SOLID_ROCK,     1, 0, 0, 7
  LObjN LO::WIDE_2,           1, 13, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     1, 9, 2, 1
  LObj  LO::S_COIN,           1, 8
  LObjN LO::R_WOOD_PLATFORM,  0, 11, 0, 3
  LObj  LO::S_COIN,           1, 7
  LObjN LO::TALL_2,           0, 13, 1, LN2::PALM_TREE
  LObj  LO::S_COIN,           1, 6
  LObj  LO::S_COIN,           1, 5
  LObjN LO::R_SKWIRLBUSH,     0, 11, 2, 1
  LObj  LO::S_COIN,           1, 4
  LObjN LO::R_WOOD_PLATFORM,  0, 13, 0, 1
  LObjN LO::TALL_2,           2, 13, 1, LN2::PALM_TREE
  LObjN LO::R_SKWIRLBUSH,     1, 10, 2, 1
  LObjN LO::R_SKWIRLBUSH,     1, 3, 4, 1
  LObjN LO::WIDE_2,           0, 7, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_WOOD_PLATFORM,  0, 12, 0, 2
  LObjN LO::R_SKWIRLBUSH,     1, 2, 2, 0
  LObjN LO::R_WOOD_PLATFORM,  1, 5, 0, 9
  LObjN LO::R_SKWIRLBUSH,     1, 9, 2, 1
  LObjN LO::R_WOOD_PLATFORM,  1, 11, 0, 3
  LObjN LO::R_SKWIRLBUSH,     1, 6, 2, 1
  LObjN LO::WIDE_2,           1, 4, 4, LN2::STONE_BRIDGE
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 0, 6
  LObj  LO::S_BIGHEART,       1, 2
  LObjN LO::R_SKWIRLBUSH,     0, 11, 2, 1
  LObjN LO::R_WOOD_PLATFORM,  1, 13, 0, 1
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::ABILITY_BOMB | 128
  LObjN LO::R_SKWIRLBUSH,     0, 8, 2, 1
  LObjN LO::R_WOOD_PLATFORM,  1, 10, 0, 4
  LObjN LO::TALL_2,           1, 13, 1, LN2::PALM_TREE
  LObjN LO::R_SKWIRLBUSH,     1, 10, 2, 1
  LObjN LO::R_WOOD_PLATFORM,  1, 12, 0, 2
  LObjN LO::R_SKWIRLBUSH,     2, 7, 2, 1
  LObjN LO::R_WOOD_PLATFORM,  1, 9, 0, 5
  LObjN LO::WIDE_2,           2, 10, 2, LN2::STONE_BRIDGE
  LObjN LO::R_SKWIRLBUSH,     0, 11, 2, 1
  LObjN LO::R_WOOD_PLATFORM,  1, 13, 0, 1
  LObj  LO::R_CUSTOM,         1, 13, Metatiles::LAVA_MAIN, (7<<4)|1
  LObjN LO::WIDE_2,           7, 10, 2, LN2::STONE_BRIDGE
  LObjN LO::R_SKWIRLBUSH,     0, 11, 2, 1
  LObjN LO::R_WOOD_PLATFORM,  1, 13, 0, 1
  LObj  LO::R_CUSTOM,         1, 13, Metatiles::LAVA_MAIN, (7<<4)|1
  LObjN LO::TALL_2,           8, 4, 3, LN2::PALM_TREE
  LObjN LO::R_GROUND,         0, 8, 5, 6
  LObjN LO::TALL_2,           2, 4, 3, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 4, 3, LN2::PALM_TREE
  LObjN LO::R_GROUND,         2, 6, 4, 8
  LObj  LO::S_BIG_SPIKY_BUSH, 1, 5
  LObj  LO::S_BIG_SPIKY_BUSH, 2, 5
  LObjN LO::R_SKWIRLBUSH,     2, 12, 2, 1
  LObj  LO::S_SPRING,         1, 9
  LObjN LO::WIDE_2,           0, 11, 13, LN2::STONE_BRIDGE
  LObj  LO::S_WOOD_PLATFORM,  0, 14
  LObjN LO::R_SKWIRLBUSH,     3, 13, 2, 1
  LObjN LO::R_SKWIRLBUSH,     5, 12, 2, 1
  LObj  LO::S_WOOD_PLATFORM,  1, 14
  LObjN LO::R_SKWIRLBUSH,     4, 13, 2, 1
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 4
  LObjN LO::WIDE_1,           1, 1, 13, LN1::SPIKES
  LObjN LO::R_GRAYBRICKS,     0, 2, 13, 12
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::LAVA_MAIN, (0<<4)|1
  LObj  LO::R_CUSTOM,         2, 7, Metatiles::LAVA_MAIN, (0<<4)|1
  LObj  LO::R_CUSTOM,         2, 12, Metatiles::LAVA_MAIN, (0<<4)|1
  LObj  LO::R_CUSTOM,         3, 7, Metatiles::LAVA_MAIN, (0<<4)|1
  LObj  LO::R_CUSTOM,         2, 12, Metatiles::LAVA_MAIN, (0<<4)|1
  LObj  LO::R_CUSTOM,         2, 7, Metatiles::LAVA_MAIN, (0<<4)|1
  LObjN LO::R_SKWIRLBUSH,     2, 9, 2, 2
  LObjN LO::WIDE_2,           1, 4, 4, LN2::STONE_BRIDGE
  LObjN LO::R_SKWIRLBUSH,     0, 5, 4, 2
  LObjN LO::R_WOOD_PLATFORM,  0, 12, 0, 2
  LObjN LO::R_SKWIRLBUSH,     2, 0, 6, 2
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 0, 6
  LObjN LO::TALL_2,           1, 11, 3, LN2::PALM_TREE
  LObjN LO::R_WOOD_PLATFORM,  2, 3, 0, 11
  LObjN LO::R_SKWIRLBUSH,     1, 7, 4, 2
  LObjN LO::TALL_2,           0, 11, 3, LN2::PALM_TREE
  LObjN LO::WIDE_2,           1, 4, 4, LN2::STONE_BRIDGE
  LObjN LO::R_WOOD_PLATFORM,  1, 10, 0, 4
  LObjN LO::R_SKWIRLBUSH,     2, 0, 6, 2
  LObjN LO::R_SKWIRLBUSH,     0, 11, 2, 2
  LObjN LO::WIDE_2,           1, 6, 1, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_WOOD_PLATFORM,  0, 14
  LObjN LO::R_WOOD_PLATFORM,  2, 3, 0, 11
  LObjN LO::WIDE_2,           1, 8, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::WIDE_2,           1, 4, 4, LN2::STONE_BRIDGE
  LObjN LO::TALL_2,           0, 11, 3, LN2::PALM_TREE
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 1, 0
  LObjN LO::R_SKWIRLBUSH,     0, 1, 1, 1
  LObjN LO::WIDE_2,           0, 10, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::LAVA_MAIN, (2<<4)|1
  LObjN LO::R_SOLID_BLOCK,    2, 0, 0, 4
  LObjN LO::R_SKWIRLBUSH,     1, 0, 3, 2
  LObjN LO::R_WOOD_PLATFORM,  0, 3, 0, 11
  LObjN LO::WIDE_2,           1, 10, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::LAVA_MAIN, (2<<4)|1
  LObjN LO::R_SKWIRLBUSH,     2, 4, 2, 2
  LObjN LO::R_WOOD_PLATFORM,  1, 7, 0, 7
  LObjN LO::R_SKWIRLBUSH,     1, 0, 6, 2
  LObjN LO::WIDE_2,           0, 8, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_BIGHEART,       1, 7
  LObjN LO::TALL_2,           0, 11, 3, LN2::PALM_TREE
  LObjN LO::R_WOOD_PLATFORM,  2, 3, 0, 11
  LObjN LO::WIDE_2,           1, 5, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     0, 8, 4, 2
  LObjN LO::R_WOOD_PLATFORM,  2, 11, 0, 3
  LObjN LO::R_SKWIRLBUSH,     2, 0, 6, 2
  LObjN LO::WIDE_2,           0, 6, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::TALL_2,           1, 11, 3, LN2::PALM_TREE
  LObjN LO::R_WOOD_PLATFORM,  2, 3, 0, 11
  LObjN LO::WIDE_2,           1, 7, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     0, 9, 2, 2
  LObjN LO::R_WOOD_PLATFORM,  1, 12, 0, 2
  LObj  LO::S_PRIZE,          1, 4
  LWriteCol InventoryItem::ABILITY_BOMB | 128
  LObjN LO::TALL_2,           1, 11, 3, LN2::PALM_TREE
  LObjN LO::R_SKWIRLBUSH,     1, 4, 2, 2
  LObjN LO::R_WOOD_PLATFORM,  1, 7, 0, 7
  LObjN LO::TALL_2,           2, 11, 3, LN2::PALM_TREE
  LObjN LO::R_COIN,           3, 5, 2, 2
  LObjN LO::R_SKWIRLBUSH,     3, 11, 2, 2
  LObjN LO::R_COIN,           1, 2, 2, 2
  LObj  LO::S_WOOD_PLATFORM,  0, 14
  LObjN LO::R_COIN,           2, 7, 3, 1
  LObjN LO::R_SKWIRLBUSH,     1, 11, 2, 2
  LObj  LO::S_WOOD_PLATFORM,  1, 14
  LObjN LO::R_COIN,           2, 4, 2, 1
  LObjN LO::R_SKWIRLBUSH,     1, 11, 2, 2
  LObj  LO::S_WOOD_PLATFORM,  1, 14
  LObjN LO::TALL_2,           4, 5, 2, LN2::PALM_TREE
  LObjN LO::R_GROUND,         0, 8, 5, 6
  LObj  LO::S_EXIT_DOOR,      2, 6
  LObjN LO::TALL_2,           2, 5, 2, LN2::PALM_TREE
  LObjN LO::R_GROUND,         2, 0, 9, 14
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

extra1Sprite:
  LSpr Enemy::BOMB_GUY,            1,  10,  12
  LSpr Enemy::BOMB_POP_GENERATOR,  0,  30,   0, 1
  LSpr Enemy::CHECKPOINT,          0,  40,   3
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  43,   4, 1
  LSpr Enemy::TOAST,               0,  54,  13
  LSpr Enemy::TOAST,               0,  57,  13
  LSpr Enemy::TOAST,               0,  63,  13
  LSpr Enemy::BOMB_POP_GENERATOR,  0,  65,   0, 15
  LSpr Enemy::GRILLBERT,           1,  70,   5
  LSpr Enemy::GRILLBERT,           1,  73,   6
  LSpr Enemy::GRILLBERT,           1,  76,   4
  LSpr Enemy::BOMB_POP_GENERATOR,  0,  77,   0, 15
  LSpr Enemy::CLOUD,               1,  84,   6
  LSpr Enemy::CLOUD,               1,  86,   8
  LSpr Enemy::CLOUD,               1,  89,   5
  LSpr Enemy::TOAST,               0,  98,  12
  LSpr Enemy::TOAST,               0, 100,   7
  LSpr Enemy::TOAST,               0, 102,  12
  LSpr Enemy::TOAST,               0, 105,   7
  LSpr Enemy::TOAST,               0, 107,  12
  LSpr Enemy::TOAST,               0, 109,   7
  LSpr Enemy::CHECKPOINT,          0, 114,   3
  LSpr Enemy::MAMA_LUIGI,          0, 121,   3
  LSpr Enemy::MAMA_LUIGI,          0, 128,   3
  LSpr Enemy::CLOUD,               1, 129,   7
  LSpr Enemy::TOAST,               0, 131,  11
  LSpr Enemy::CLOUD,               1, 132,   6
  LSpr Enemy::TOAST,               0, 135,  11
  LSpr Enemy::BOMB_POP_GENERATOR,  0, 136,   0, 1
  LSpr Enemy::ELECTRIC_FAN,        1, 143,   4
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0, 148,  10
  LSpr Enemy::CHECKPOINT,          0, 151,   6
  LSpr Enemy::COLLECTIBLE,         0, 165,   3
  .byt 255 ; end
