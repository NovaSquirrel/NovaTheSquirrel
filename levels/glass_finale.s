glass_finale:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_HANNAH
  .addr glass_finaleData
  .addr glass_finaleSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY3
  .byt 255 ; end
  .byt $00, $00 ; boundaries

glass_finaleData:
  .byt LSpecialCmd, LevelSpecialConfig::PUZZLE_MODE, AbilityType::NONE, InventoryItem::ARROW_UP, 128|15, InventoryItem::HEALTH_RESTORE, 128|4, $00
  LObjN LO::R_GROUND,         0, 13, 10, 1
  LObj  LO::S_SIGNPOST,       3, 12
  LWriteCol <HintUpArrow, >HintUpArrow
  LObjN LO::R_BG_GLASS_GREEN, 1, 2, 7, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 3, 0, 3
  LObjN LO::R_BG_GLASS_GREEN, 1, 6, 6, 0
  LObjN LO::R_COIN,           0, 11, 2, 0
  LObj  LO::S_PRIZE,          1, 5
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 4, 2, 0
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          0, 10
  LObj  LO::S_HEART,          1, 3
  LObjN LO::R_BG_GLASS_GREEN, 2, 3, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 11, 6, 3
  LObjN LO::R_FG_GLASS_RED,   1, 6, 4, 0
  LObjN LO::R_BG_GLASS_RED,   0, 7, 0, 3
  LObjN LO::R_COIN,           1, 4, 2, 1
  LObjN LO::R_FG_GLASS_RED,   3, 3, 6, 0
  LObjN LO::R_BG_GLASS_RED,   0, 4, 0, 1
  LObjN LO::R_BG_GLASS_RED,   0, 7, 0, 3
  LObj  LO::S_SPRING,         1, 10
  LObjN LO::R_BG_GLASS_GRAY,  1, 5, 1, 1
  LObjN LO::WIDE_1,           1, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  2, 6, 2, 8
  LObjN LO::R_BG_GLASS_RED,   1, 4, 0, 1
  LObjN LO::R_BG_GLASS_RED,   1, 3, 3, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 10, 7, 4
  LObj  LO::S_M_ARROW_RIGHT,  1, 2
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObj  LO::S_PRIZE,          0, 7
  LWriteCol InventoryItem::SPRING | 128
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 2
  LObjN LO::R_FG_GLASS_RED,   0, 3, 2, 0
  LObjN LO::R_FG_GLASS_RED,   0, 8, 2, 0
  LObj  LO::S_M_CRATE,        0, 9
  LObj  LO::S_M_ARROW_DOWN,   2, 2
  LObjN LO::R_FG_GLASS_RED,   0, 4, 0, 3
  LObj  LO::S_M_ARROW_LEFT,   0, 9
  LObjN LO::R_FG_GLASS_RED,   4, 5, 4, 0
  LObjN LO::R_BG_GLASS_RED,   0, 6, 0, 8
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::BLOCK | 128
  LObj  LO::S_BG_GLASS_GREEN, 0, 12
  LObj  LO::S_BG_GLASS_GREEN, 1, 11
  LObj  LO::S_BG_GLASS_GREEN, 0, 13
  LObj  LO::S_PRIZE,          1, 9
  LWriteCol InventoryItem::ABILITY_BURGER|128
  LObj  LO::S_SOLID_BLOCK,    0, 12
  LObjN LO::R_BG_GLASS_RED,   1, 6, 0, 8
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 6, 0
  LObj  LO::S_BG_GLASS_GREEN, 4, 1
  LObj  LO::S_BG_GLASS_GREEN, 0, 5
  LObjN LO::R_BG_GLASS_GREEN, 1, 2, 0, 2
  LObjN LO::R_SOLID_ROCK,     3, 4, 0, 3
  LObjN LO::WIDE_1,           0, 8, 7, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 4, 3, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_BG_GLASS_BLUE,  0, 5, 5, 1
  LObjN LO::R_SOLID_ROCK,     3, 2, 1, 0
  LObj  LO::S_M_CRATE,        0, 3
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::PUSHABLE_BLOCK
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_SOLID_ROCK,     0, 4, 2, 0
  LObjN LO::R_SOLID_ROCK,     0, 8, 0, 4
  LObjN LO::WIDE_1,           0, 13, 4, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     1, 0, 0, 2
  LObjN LO::R_SOLID_ROCK,     1, 5, 0, 2
  LObj  LO::S_PRIZE,          0, 10
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 3
  LWriteCol InventoryItem::ABILITY_BURGER|128
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::R_GROUND,         0, 9, 9, 5
  LObjN LO::R_BG_GLASS_BLUE,  2, 2, 0, 3
  LObjN LO::R_BG_GLASS_BLUE,  1, 2, 2, 0
  LObjN LO::R_COIN,           0, 3, 2, 1
  LObjN LO::R_BG_GLASS_BLUE,  0, 5, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  3, 2, 0, 3
  LObj  LO::S_M_ARROW_RIGHT,  1, 3
  LObj  LO::S_M_CRATE,        2, 3
  LObjN LO::R_FG_GLASS_RED,   3, 5, 4, 0
  LObjN LO::R_BG_GLASS_RED,   0, 6, 0, 8
  LObjN LO::R_COIN,           1, 4, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 7, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 10, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 13, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 2, 2, 7, 0
  LObjN LO::R_BG_GLASS_GREEN, 1, 1, 5, 2
  LObjN LO::R_BG_GLASS_RED,   0, 6, 0, 8
  LObj  LO::S_SPRING,         3, 7
  LObjN LO::WIDE_1,           0, 8, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::WIDE_1,           0, 11, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   2, 5, 4, 0
  LObjN LO::R_BG_GLASS_RED,   0, 6, 0, 8
  LObjN LO::R_BG_GLASS_GREEN, 1, 7, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 10, 2, 0
  LObjN LO::WIDE_1,           0, 12, 1, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_GREEN, 0, 13, 2, 0
  LObjN LO::R_BG_GLASS_RED,   3, 6, 0, 8
  LObjN LO::WIDE_1,           1, 11, 1, LN1::SOLID_LEDGE
  LObj  LO::S_M_ARROW_RIGHT,  2, 6
  LObjN LO::RECT_1,           0, 11, 3, LN1::GROUND, 19
  LObjN LO::R_FG_GLASS_BLUE,  1, 1, 0, 3
  LObjN LO::R_BG_GLASS_BLUE,  0, 5, 0, 5
  LObjN LO::R_FG_GLASS_BLUE,  1, 1, 15, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 15, 0
  LObjN LO::R_COIN,           1, 3, 0, 1
  LObjN LO::TALL_1,           0, 6, 4, LN1::LADDER
  LObj  LO::S_M_CRATE,        2, 6
  LObj  LO::S_CUSTOM,         2, 4, Metatiles::KEY_RED
  LObjN LO::R_COIN,           0, 8, 1, 1
  LObjN LO::R_FG_GLASS_BLUE,  2, 7, 0, 3
  LObjN LO::R_COIN,           2, 3, 0, 1
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           1, 6, 4, LN1::LADDER
  LObjN LO::WIDE_1,           1, 4, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    1, 2
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::LOCK_RED
  LObjN LO::R_SOLID_BLOCK,    0, 4, 2, 0
  LObj  LO::S_M_ARROW_RIGHT,  0, 7
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::KEY_GREEN
  LObjN LO::R_FG_GLASS_BLUE,  2, 1, 0, 6
  LObj  LO::S_M_CRATE,        0, 11
  LObjN LO::R_AIR,            0, 12, 0, 1
  LObj  LO::S_SPRING,         1, 10
  LObj  LO::S_M_ARROW_DOWN,   1, 7
  LObj  LO::S_M_ARROW_LEFT,   0, 11
  LObjN LO::R_FG_GLASS_RED,   1, 7, 8, 0
  LObjN LO::R_FG_GLASS_RED,   0, 8, 0, 3
  LObj  LO::S_HEART,          1, 6
  LObjN LO::R_BG_GLASS_RED,   1, 8, 0, 6
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_BG_GLASS_GREEN, 0, 9, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 12, 2, 0
  LObjN LO::R_FG_GLASS_RED,   1, 0, 0, 5
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::LOCK_GREEN
  LObjN LO::R_BG_GLASS_RED,   2, 8, 0, 6
  LObjN LO::R_FG_GLASS_RED,   2, 8, 0, 3
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 13, 0
  LObj  LO::S_FG_GLASS_BLUE,  0, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 4, 13, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 5, 0, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 13, 0
  LObj  LO::S_M_ARROW_RIGHT,  1, 3
  LObj  LO::S_M_CRATE,        2, 3
  LObjN LO::R_BG_GLASS_BLUE,  0, 10, 0, 4
  LObjN LO::R_COIN,           1, 5, 0, 2
  LObj  LO::S_M_CRATE,        1, 3
  LObjN LO::R_COIN,           1, 5, 0, 2
  LObj  LO::S_M_CRATE,        1, 3
  LObj  LO::R_CUSTOM,         3, 3, Metatiles::FORK_ARROW_DOWN, (1<<4)|0
  LObj  LO::S_M_ARROW_RIGHT,  0, 6
  LObjN LO::R_BG_GLASS_BLUE,  0, 10, 0, 4
  LObj  LO::S_M_ARROW_RIGHT,  1, 7
  LObj  LO::S_M_ARROW_DOWN,   1, 3
  LObj  LO::S_SOLID_BLOCK,    0, 5
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::METAL_CRATE, (0<<4)|2
  LObj  LO::S_FG_GLASS_BLUE,  1, 3
  LObjN LO::R_BG_GLASS_BLUE,  0, 5, 0, 3
  LObjN LO::R_GROUND,         0, 11, 12, 3
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObj  LO::S_PRIZE,          3, 4
  LWriteCol InventoryItem::ABILITY_GLIDER | 128
  LObjN LO::WIDE_1,           0, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 8, 0, 2
  LObj  LO::S_SPRING,         1, 10
  LObjN LO::R_BG_GLASS_GRAY,  1, 1, 1, 1
  LObjN LO::R_GROUND,         0, 7, 6, 3
  LObjN LO::R_BG_GLASS_GRAY,  5, 3, 1, 1
  LObjN LO::WIDE_1,           2, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 11, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 1, 11, 0
  LObjN LO::R_FG_GLASS_RED,   0, 2, 0, 1
  LObjN LO::R_FG_GLASS_RED,   0, 4, 11, 0
  LObjN LO::R_BG_GLASS_RED,   1, 5, 0, 1
  LObjN LO::R_GROUND,         0, 7, 1, 7
  LObjN LO::WIDE_1,           2, 7, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           0, 8, 2, 2
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::SPRING, (2<<4)|0
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_RED,   3, 5, 0, 1
  LObjN LO::R_GROUND,         0, 7, 1, 7
  LObjN LO::WIDE_1,           2, 7, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           0, 8, 2, 2
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::SPRING, (2<<4)|0
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   3, 2, 0, 1
  LObjN LO::R_BG_GLASS_RED,   0, 5, 0, 1
  LObjN LO::R_GROUND,         0, 7, 4, 7
  LObjN LO::R_BG_GLASS_GRAY,  2, 3, 1, 1
  LObjN LO::R_COIN,           3, 7, 0, 2
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_GROUND,         0, 11, 0, 3
  LObjN LO::R_GROUND,         3, 11, 11, 3
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 0, 6
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 9, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 9, 0
  LObj  LO::S_M_ARROW_RIGHT,  1, 7
  LObj  LO::S_M_ARROW_RIGHT,  1, 6
  LObj  LO::S_M_ARROW_RIGHT,  1, 5
  LObjN LO::R_BG_GLASS_GREEN, 0, 7, 5, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 9, 5, 1
  LObj  LO::S_M_ARROW_RIGHT,  1, 4
  LObjN LO::R_BG_GLASS_GREEN, 0, 6, 4, 0
  LObj  LO::S_M_ARROW_RIGHT,  1, 3
  LObjN LO::R_BG_GLASS_GREEN, 0, 5, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 1, 4, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 1, 0
  LObj  LO::S_M_ARROW_DOWN,   2, 1
  LObj  LO::S_M_CRATE,        0, 3
  LObj  LO::S_M_CRATE,        0, 11
  LObjN LO::WIDE_1,           0, 13, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 0, 6
  LObjN LO::R_GROUND,         0, 11, 2, 3
  LObj  LO::S_SPRING,         2, 10
  LObjN LO::R_GROUND,         1, 7, 4, 7
  LObjN LO::R_BG_GLASS_BLUE,  2, 3, 1, 1
  LObjN LO::R_FG_GLASS_RED,   5, 2, 9, 0
  LObjN LO::R_BG_GLASS_RED,   0, 3, 0, 11
  LObjN LO::R_FG_GLASS_RED,   0, 7, 9, 0
  LObjN LO::R_FG_GLASS_RED,   1, 1, 7, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 9, 7, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 12, 7, 0
  LObjN LO::R_COIN,           2, 5, 3, 0
  LObjN LO::WIDE_1,           0, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_RED,   3, 3, 0, 11
  LObjN LO::R_GROUND,         3, 7, 4, 7
  LObjN LO::R_BG_GLASS_BLUE,  3, 1, 1, 1
  LObj  LO::S_PRIZE,          2, 6
  LWriteCol InventoryItem::ABILITY_BURGER | 128
  LObjN LO::R_GROUND,         0, 9, 1, 5
  LObjN LO::R_BG_GLASS_BLUE,  1, 6, 1, 1
  LObjN LO::R_GROUND,         1, 10, 4, 4
  LObjN LO::R_FG_GLASS_RED,   3, 5, 7, 0
  LObjN LO::R_BG_GLASS_RED,   0, 6, 0, 3
  LObjN LO::R_BG_GLASS_GREEN, 1, 7, 5, 0
  LObjN LO::R_COIN,           1, 3, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 10, 4, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 13, 4, 0
  LObjN LO::R_BG_GLASS_RED,   5, 6, 0, 8
  LObjN LO::R_BG_GLASS_BLUE,  2, 3, 1, 1
  LObjN LO::R_FG_GLASS_RED,   3, 8, 5, 0
  LObjN LO::R_BG_GLASS_RED,   0, 9, 0, 5
  LObjN LO::R_COIN,           1, 6, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 10, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 13, 3, 0
  LObj  LO::S_W_ARROW_RIGHT,  3, 4
  LObjN LO::R_BG_GLASS_RED,   1, 9, 0, 5
  LObjN LO::R_BG_GLASS_BLUE,  3, 9, 5, 0
  LObj  LO::R_CUSTOM,         1, 3, Metatiles::METAL_CRATE, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::FORK_ARROW_UP, (3<<4)|0
  LObjN LO::R_BG_GLASS_BLUE,  1, 11, 1, 1
  LObjN LO::R_FG_GLASS_RED,   6, 8, 5, 0
  LObjN LO::R_BG_GLASS_RED,   0, 9, 0, 5
  LObjN LO::R_BG_GLASS_GREEN, 1, 10, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 13, 3, 0
  LObjN LO::R_BG_GLASS_BLUE,  4, 3, 1, 1
  LObjN LO::R_BG_GLASS_RED,   0, 9, 0, 5
  LObjN LO::R_GROUND,         3, 10, 11, 4
  LObjN LO::R_FG_GLASS_BLUE,  1, 5, 6, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 4, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 6, 0, 3
  LObjN LO::R_FG_GLASS_BLUE,  1, 3, 2, 0
  LObj  LO::S_FG_GLASS_BLUE,  1, 2
  LObj  LO::S_EXIT_DOOR,      0, 8
  LObjN LO::R_BG_GLASS_BLUE,  2, 6, 0, 3
  LObjN LO::R_GROUND,         3, 8, 2, 1
  LFinished

glass_finaleSprite:
  LSpr Enemy::FIREWORK_SHOOTER,    1,  15,  10
  LSpr Enemy::BIG_GLIDER,          1,  18,   1
  LSpr Enemy::BOMB_GUY,            0,  19,   2
  LSpr Enemy::BOMB_GUY,            0,  22,   2
  LSpr Enemy::BIG_GLIDER,          0,  32,   1
  LSpr Enemy::FIREWORK_SHOOTER,    0,  39,   5, 1
  LSpr Enemy::BIG_LWSS,            0,  42,   8, 1
  LSpr Enemy::CHECKPOINT,          0,  47,   3
  LSpr Enemy::BIG_GLIDER,          0,  58,   3
  LSpr Enemy::BIG_LWSS,            0,  61,   5
  LSpr Enemy::BIG_GLIDER,          1,  65,   1, 1
  LSpr Enemy::BOULDER,             0,  66,   1
  LSpr Enemy::BOULDER,             0,  66,   2
  LSpr Enemy::FIRE_JUMP,           0,  71,   4, 1
  LSpr Enemy::FIRE_JUMP,           0,  79,   4, 1
  LSpr Enemy::CHECKPOINT,          0,  80,   4
  LSpr Enemy::BOULDER,             0,  90,   2
  LSpr Enemy::BOULDER,             0,  90,   3
  LSpr Enemy::BOULDER,             0,  90,   4
  LSpr Enemy::BOULDER,             0,  90,   5
  LSpr Enemy::BIG_LWSS,            0,  92,   2
  LSpr Enemy::FIRE_WALK,           1,  93,  10, 1
  LSpr Enemy::FIRE_JUMP,           1,  96,   5, 1
  LSpr Enemy::FIRE_JUMP,           0,  96,  10
  LSpr Enemy::BOULDER,             0, 103,   8
  LSpr Enemy::BOULDER,             0, 103,   9
  LSpr Enemy::BOULDER,             0, 103,  10
  LSpr Enemy::CHECKPOINT,          0, 112,   6
  LSpr Enemy::BIG_GLIDER,          0, 116,   1
  LSpr Enemy::FIRE_WALK,           1, 120,   8, 1
  LSpr Enemy::BIG_LWSS,            0, 122,   1
  LSpr Enemy::FIRE_WALK,           0, 124,   8, 1
  LSpr Enemy::FIRE_JUMP,           1, 139,   6, 1
  LSpr Enemy::FIREWORK_SHOOTER,    1, 143,  10
  LSpr Enemy::FIRE_JUMP,           1, 146,   3, 1
  LSpr Enemy::FIRE_JUMP,           1, 148,   3, 1
  LSpr Enemy::FIRE_JUMP,           1, 151,   3, 1
  LSpr Enemy::FIRE_JUMP,           1, 153,   3, 1
  LSpr Enemy::CHECKPOINT,          0, 159,   6
  LSpr Enemy::BIG_GLIDER,          0, 166,   4
  LSpr Enemy::BIG_GLIDER,          1, 173,   6
  LSpr Enemy::BOULDER,             0, 175,   9
  LSpr Enemy::BOULDER,             0, 175,  10
  LSpr Enemy::FIRE_JUMP,           1, 187,   6, 1
  LSpr Enemy::FIREWORK_SHOOTER,    0, 189,   9
  LSpr Enemy::FIREWORK_SHOOTER,    0, 192,   9
  LSpr Enemy::FIRE_JUMP,           1, 194,   6, 1
  LSpr Enemy::CHECKPOINT,          0, 201,   6
  LSpr Enemy::ROCKET_LAUNCHER,     0, 217,   9
  LSpr Enemy::BOULDER,             0, 229,   2
  LSpr Enemy::BOULDER,             0, 230,   2
  LSpr Enemy::BOULDER,             0, 231,   2
  LSpr Enemy::BOULDER,             0, 232,   2
  LSpr Enemy::ROCKET_LAUNCHER,     1, 246,   2
  .byt 255 ; end
