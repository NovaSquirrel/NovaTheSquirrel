burgers:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $f6
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_RONALD
  .byt GraphicsUpload::SP_HANNAH
  .addr burgersData
  .addr burgersSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY1
  .byt 255 ; end
  .byt $00, $04 ; boundaries

burgersData:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <MeetLia, >MeetLia
  .byt LSpecialCmd, LevelSpecialConfig::PUZZLE_MODE, AbilityType::NONE, $00
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::STARS
  LObjN LO::R_GROUND,         0, 8, 4, 4
  LObjN LO::R_GROUND,         0, 13, 11, 1
  LObj  LO::S_BG_GLASS_BLUE,  4, 5
  LObjN LO::WIDE_1,           1, 8, 5, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 9, 1, 2
  LObj  LO::S_BG_GLASS_BLUE,  1, 3
  LObj  LO::S_SIGNPOST,       0, 7
  LWriteCol <AboutAutoItem, >AboutAutoItem
  LObj  LO::S_PRIZE,          2, 5
  LWriteCol InventoryItem::ABILITY_BURGER | 128
  LObjN LO::TALL_1,           0, 8, 4, LN1::LADDER
  LObj  LO::S_BG_GLASS_BLUE,  2, 2
  LObj  LO::S_BG_GLASS_BLUE,  3, 4
  LObjN LO::R_SOLID_ROCK,     0, 8, 0, 6
  LObjN LO::R_SOLID_ROCK,     1, 8, 2, 0
  LObj  LO::S_BG_GLASS_BLUE,  2, 6
  LObjN LO::R_SOLID_ROCK,     1, 8, 0, 6
  LObj  LO::S_BG_GLASS_BLUE,  1, 9
  LObj  LO::S_BG_GLASS_BLUE,  1, 12
  LObjN LO::R_GROUND,         2, 9, 4, 5
  LObjN LO::R_FG_GLASS_RED,   1, 6, 2, 0
  LObj  LO::S_FG_GLASS_RED,   0, 7
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::LOCK_GREEN
  LObj  LO::S_DOOR,           1, 7
  LWriteCol 9, 66
  LObjN LO::R_FG_GLASS_RED,   1, 7, 0, 1
  LObjN LO::R_CEILING_BARRIER,3, 0, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 15, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 1, 0, 13
  LObjN LO::R_ENEMY_BARRIER      ,  1, 1, 0, 4
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::WOOD_CRATE, (7<<4)|0
  LObjN LO::R_COIN,           2, 7, 2, 2
  LObj  LO::S_BG_GLASS_RED,   3, 1
  LObj  LO::S_BG_GLASS_RED,   2, 3
  LObj  LO::S_BG_GLASS_RED,   3, 4
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WOOD_CRATE, (5<<4)|0
  LObj  LO::S_BG_GLASS_RED,   3, 5
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 15, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 1, 0, 13
  LObj  LO::S_BG_GLASS_RED,   1, 4
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WOOD_CRATE, (2<<4)|0
  LObj  LO::S_BG_GLASS_RED,   3, 3
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::WOOD_CRATE, (8<<4)|0
  LObj  LO::S_BG_GLASS_RED,   1, 1
  LObjN LO::R_COIN,           3, 5, 2, 2
  LObjN LO::R_ENEMY_BARRIER      ,  5, 1, 0, 4
  LObjN LO::R_BG_GLASS_BLUE,  1, 1, 0, 13
  LObjN LO::R_GROUND,         1, 8, 4, 6
  LObj  LO::S_BIGHEART,       1, 7
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObjN LO::R_CEILING_BARRIER,0, 0, 0, 1
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::KEY_GREEN
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 7
  LObjN LO::R_ENEMY_BARRIER      ,  1, 0, 0, 4
  LObj  LO::S_DOOR,           1, 9
  LWriteCol 7, 24
  LObjN LO::R_GROUND,         0, 11, 5, 3
  LObj  LO::S_PRIZE,          2, 8
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObjN LO::R_FG_GLASS_BLUE,  3, 8, 6, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 0, 1
  LObjN LO::R_BG_GLASS_RED,   1, 4, 0, 3
  LObjN LO::R_BG_GLASS_RED,   1, 4, 2, 0
  LObjN LO::R_COIN,           0, 7, 2, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 9, 0, 5
  LObjN LO::R_BG_GLASS_RED,   2, 4, 0, 3
  LObj  LO::S_BG_GLASS_RED,   0, 9
  LObjN LO::R_FG_GLASS_BLUE,  1, 9, 0, 5
  LObj  LO::S_BG_GLASS_RED,   1, 12
  LObjN LO::WIDE_1,           1, 12, 5, LN1::SOLID_LEDGE
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_COIN,           0, 8, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 9
  LObj  LO::S_BG_GLASS_RED,   1, 13
  LObjN LO::R_COIN,           3, 9, 2, 0
  LObjN LO::WIDE_1,           0, 10, 2, LN1::SOLID_LEDGE
  LObj  LO::S_BG_GLASS_RED,   1, 12
  LObjN LO::WIDE_1,           1, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_BG_GLASS_RED,   1, 10
  LObjN LO::R_COIN,           1, 4, 0, 2
  LObj  LO::S_M_ARROW_RIGHT,  1, 2
  LObj  LO::S_M_ARROW_UP,     0, 11
  LObj  LO::S_W_ARROW_RIGHT,  2, 4
  LObjN LO::R_FG_GLASS_BLUE,  0, 5, 0, 9
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 5
  LObjN LO::WIDE_1,           0, 9, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 13, 5, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObj  LO::S_M_ARROW_DOWN,   1, 4
  LObj  LO::S_M_ARROW_LEFT,   0, 11
  LObj  LO::S_BIGHEART,       2, 8
  LObjN LO::R_COIN,           0, 10, 0, 2
  LObj  LO::S_M_ARROW_DOWN,   2, 2
  LObj  LO::S_M_ARROW_RIGHT,  0, 7
  LObjN LO::R_GROUND,         0, 12, 9, 2
  LObj  LO::S_M_ARROW_DOWN,   2, 7
  LObj  LO::S_M_ARROW_RIGHT,  0, 11
  LObjN LO::WIDE_1,           2, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  3, 0, 0, 10
  LObj  LO::S_M_CRATE,        0, 11
  LObjN LO::R_ENEMY_BARRIER      ,  1, 0, 0, 5
  LObj  LO::S_PRIZE,          0, 9
  LWriteCol InventoryItem::ABILITY_BURGER | 128
  LObjN LO::R_SOLID_BLOCK,    2, 1, 0, 2
  LObjN LO::R_SOLID_BLOCK,    0, 4, 3, 0
  LObjN LO::WIDE_1,           2, 11, 3, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       1, 10
  LObj  LO::S_PRIZE,          1, 8
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_COIN,           3, 8, 3, 0
  LObjN LO::WIDE_1,           0, 9, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 6, 3, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    2, 6, 0, 3
  LObj  LO::S_M_CRATE,        0, 8
  LObj  LO::S_BIGHEART,       1, 7
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::KEY_RED
  LObjN LO::R_GROUND,         0, 9, 2, 5
  LObjN LO::R_COIN,           1, 3, 0, 2
  LObjN LO::R_SOLID_BLOCK,    0, 6, 0, 2
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::R_SOLID_BLOCK,    1, 10, 2, 0
  LObjN LO::R_SOLID_BLOCK,    2, 5, 4, 0
  LObj  LO::R_CUSTOM,         1, 10, Metatiles::WOOD_CRATE, (3<<4)|0
  LObj  LO::S_W_ARROW_DOWN,   1, 4
  LObj  LO::S_M_ARROW_LEFT,   0, 8
  LObjN LO::R_FG_GLASS_BLUE,  3, 0, 2, 5
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 2, 5
  LObjN LO::R_FG_GLASS_BLUE,  1, 6, 0, 1
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::LOCK_RED
  LObjN LO::R_ENEMY_BARRIER      ,  2, 0, 0, 5
  LObjN LO::R_FG_GLASS_RED,   1, 9, 9, 1
  LObj  LO::S_BG_GLASS_GREEN, 0, 12
  LObj  LO::S_BG_GLASS_GREEN, 2, 7
  LObj  LO::S_HEART,          0, 8
  LObjN LO::R_FG_GLASS_RED,   0, 11, 0, 3
  LObj  LO::S_BG_GLASS_GREEN, 3, 4
  LObjN LO::R_COIN,           1, 6, 2, 0
  LObjN LO::R_FG_GLASS_RED,   0, 7, 3, 1
  LObjN LO::R_FG_GLASS_RED,   1, 11, 0, 3
  LObj  LO::S_BG_GLASS_GREEN, 3, 3
  LObjN LO::WIDE_1,           1, 6, 1, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   3, 5, 3, 1
  LObjN LO::R_FG_GLASS_RED,   0, 7, 9, 1
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObjN LO::R_COIN,           0, 4, 2, 0
  LObjN LO::R_FG_GLASS_RED,   1, 9, 0, 5
  LObj  LO::S_BG_GLASS_GREEN, 3, 6
  LObjN LO::R_FG_GLASS_RED,   2, 9, 0, 5
  LObj  LO::S_BG_GLASS_GREEN, 1, 12
  LObjN LO::R_ENEMY_BARRIER      ,  2, 0, 0, 5
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 2, 8
  LObjN LO::WIDE_1,           3, 6, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   3, 7, 2, 1
  LObjN LO::R_FG_GLASS_RED,   0, 9, 8, 1
  LObjN LO::R_FG_GLASS_RED,   2, 11, 0, 3
  LObjN LO::R_COIN,           1, 5, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 2, 4, 1
  LObj  LO::S_PRIZE,          1, 6
  LWriteCol InventoryItem::ABILITY_BURGER | 128
  LObjN LO::R_FG_GLASS_RED,   1, 11, 0, 3
  LObjN LO::R_COIN,           1, 5, 0, 2
  LObjN LO::R_BG_GLASS_RED,   1, 4, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  3, 0, 3, 4
  LObjN LO::R_BG_GLASS_BLUE,  0, 5, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  0, 10, 3, 4
  LObjN LO::R_COIN,           1, 7, 1, 2
  LObjN LO::R_BG_GLASS_BLUE,  2, 5, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 1, 1
  LObjN LO::R_COIN,           1, 9, 2, 0
  LObjN LO::R_FG_GLASS_RED,   0, 11, 4, 3
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 6
  LObjN LO::TALL_1,           3, 4, 6, LN1::LADDER
  LObjN LO::R_FG_GLASS_RED,   2, 4, 3, 10
  LObjN LO::R_COIN,           2, 3, 1, 0
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 2
  LObj  LO::R_CUSTOM,         2, 5, Metatiles::WOOD_CRATE, (2<<4)|0
  LObjN LO::R_SOLID_BLOCK,    4, 4, 0, 2
  LObjN LO::R_COIN,           1, 2, 2, 1
  LObjN LO::R_FG_GLASS_RED,   0, 4, 3, 2
  LObjN LO::R_FG_GLASS_RED,   1, 7, 0, 7
  LObjN LO::R_GROUND,         5, 6, 3, 8
  LObj  LO::S_PRIZE,          4, 5
  LObjN LO::R_GROUND,         0, 8, 6, 6
  LObjN LO::R_COIN,           2, 5, 0, 2
  LObjN LO::R_FG_GLASS_RED,   4, 3, 3, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 3
  LObjN LO::R_BG_GLASS_BLUE,  3, 4, 0, 3
  LObjN LO::R_GROUND,         0, 8, 6, 6
  LObj  LO::S_EXIT_DOOR,      3, 6
  LFinished

burgersSprite:
  LSpr Enemy::RONALD_BURGER,       0,  38,   2
  LSpr Enemy::RONALD_BURGER,       1,  52,   1
  LSpr Enemy::RONALD_BURGER,       0,  76,   1, 0
  LSpr Enemy::FIRE_WALK,           0,  94,  12, 1
  LSpr Enemy::RONALD,              1,  99,   6
  LSpr Enemy::RONALD_BURGER,       0, 103,   2, 0
  LSpr Enemy::RONALD,              1, 104,   3
  LSpr Enemy::CHECKPOINT,          0, 107,  11
  LSpr Enemy::COLLECTIBLE,         0, 111,   2
  LSpr Enemy::RONALD,              1, 120,   5
  LSpr Enemy::RONALD,              1, 129,   3
  LSpr Enemy::RONALD_BURGER,       0, 142,   1
  LSpr Enemy::RONALD,              1, 145,   6
  LSpr Enemy::RONALD,              1, 150,   4
  LSpr Enemy::CHECKPOINT,          0, 162,   5
  LSpr Enemy::FIRE_WALK,           0, 167,   6, 1
  LSpr Enemy::RONALD,              1, 188,   3
  LSpr Enemy::RONALD,              1, 216,   2
  .byt 255 ; end
