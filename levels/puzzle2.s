puzzle2:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_HANNAH
  .addr puzzle2Data
  .addr puzzle2Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY3
  .byt 255 ; end
  .byt $c0, $00 ; boundaries

puzzle2Data:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 38
  LObj  LO::S_DOOR,           7, 1
  LWriteCol 11, 34
  LObj  LO::S_FG_GLASS_BLUE,  0, 3
  LObj  LO::S_FG_GLASS_BLUE,  1, 4
  LObj  LO::S_FG_GLASS_BLUE,  1, 5
  LObj  LO::S_FG_GLASS_BLUE,  1, 6
  LObjN LO::WIDE_1,           1, 3, 2, LN1::SOLID_LEDGE
  LObj  LO::S_FG_GLASS_BLUE,  0, 7
  LObj  LO::S_DOOR,           1, 1
  LWriteCol 1, 28
  LObj  LO::S_FG_GLASS_BLUE,  0, 8
  LObj  LO::S_FG_GLASS_BLUE,  1, 9
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_FG_GLASS_BLUE,  0, 10
  LObj  LO::S_DOOR,           0, 11
  LWriteCol 11, 30
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 12
  LObj  LO::S_DOOR,           8, 1
  LWriteCol 11, 34
  LObj  LO::S_FG_GLASS_BLUE,  0, 10
  LObj  LO::S_FG_GLASS_BLUE,  1, 9
  LObj  LO::S_FG_GLASS_BLUE,  1, 8
  LObj  LO::S_FG_GLASS_BLUE,  1, 7
  LObjN LO::WIDE_1,           1, 3, 2, LN1::SOLID_LEDGE
  LObj  LO::S_FG_GLASS_BLUE,  0, 6
  LObj  LO::S_DOOR,           1, 1
  LWriteCol 1, 12
  LObj  LO::S_FG_GLASS_BLUE,  0, 5
  LObj  LO::S_FG_GLASS_BLUE,  1, 4
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_FG_GLASS_BLUE,  0, 3
  LObj  LO::S_DOOR,           0, 11
  LWriteCol 11, 14
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 12
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_SOLID_BLOCK,    0, 5, 1, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 9, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 6, 0, 6
  LObjN LO::WIDE_1,           1, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_DOOR,           0, 11
  LWriteCol 1, 7
  LObj  LO::S_CUSTOM,         2, 3, Metatiles::KEY_GREEN
  LObjN LO::R_BG_GLASS_RED,   1, 2, 0, 1
  LObjN LO::R_BG_GLASS_RED,   0, 5, 0, 7
  LObjN LO::R_BG_GLASS_RED,   1, 2, 7, 0
  LObjN LO::R_BG_GLASS_BLUE,  4, 5, 0, 6
  LObjN LO::R_GROUND,         0, 12, 12, 2
  LObj  LO::S_PRIZE,          2, 9
  LWriteCol InventoryItem::ABILITY_BACKUP
  LObjN LO::R_BG_GLASS_RED,   2, 2, 0, 9
  LObj  LO::S_BRICK,          1, 11
  LObjN LO::R_COIN,           4, 2, 1, 1
  LObjN LO::WIDE_1,           0, 4, 1, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::TELEPORTER
  LWriteCol 3, 34
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::TALL_1,           0, 9, 2, LN1::LADDER
  LObjN LO::R_SOLID_ROCK,     1, 1, 0, 9
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::LOCK_GREEN
  LObjN LO::R_SOLID_ROCK,     3, 10, 1, 0
  LObjN LO::R_BG_GLASS_RED,   1, 3, 2, 2
  LObj  LO::S_BIGHEART,       0, 9
  LObjN LO::R_GROUND,         2, 9, 12, 5
  LObj  LO::S_PRIZE,          3, 6
  LWriteCol InventoryItem::ABILITY_BOMB | 128
  LObj  LO::S_SIGNPOST,       1, 8
  LWriteCol <AboutBombs, >AboutBombs
  LObjN LO::R_SOLID_ROCK,     2, 1, 0, 1
  LObjN LO::WIDE_1,           0, 3, 3, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_RED,   0, 5, 2, 2
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_SOLID_ROCK,     5, 5, 0, 3
  LObjN LO::WIDE_1,           1, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::R_GROUND,         0, 12, 12, 2
  LObjN LO::R_BG_GLASS_RED,   1, 1, 2, 2
  LObj  LO::S_SPRING,         0, 7
  LObjN LO::R_COIN,           0, 11, 2, 0
  LObjN LO::R_SOLID_ROCK,     1, 3, 0, 1
  LObjN LO::R_CEILING_BARRIER,4, 0, 0, 2
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|9
  LObjN LO::WIDE_1,           1, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_COIN,           1, 7
  LObjN LO::R_BG_GLASS_BLUE,  1, 2, 2, 2
  LObj  LO::S_COIN,           2, 5
  LObjN LO::WIDE_1,           0, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_HEART,          1, 5
  LObj  LO::S_COIN,           1, 9
  LObjN LO::WIDE_1,           0, 10, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 12, 1, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_BLUE,  1, 6, 2, 2
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_BG_GLASS_BLUE,  2, 1, 2, 2
  LObjN LO::R_GROUND,         1, 9, 12, 5
  LObj  LO::S_COIN,           2, 4
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|6
  LObjN LO::R_BG_GLASS_GRAY,  3, 2, 5, 0
  LObj  LO::S_SOLID_BLOCK,    1, 7
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::FORCE_LEFT
  LObjN LO::R_SOLID_BLOCK,    1, 7, 2, 0
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::KEY_BLUE
  LObj  LO::S_HEART,          1, 8
  LObjN LO::R_BG_GLASS_GRAY,  1, 5, 8, 0
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::LOCK_GREEN
  LObjN LO::WIDE_1,           1, 9, 4, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 6, 5, 0
  LObjN LO::R_FG_GLASS_RED,   2, 3, 1, 0
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::R_COIN,           1, 4, 5, 0
  LObjN LO::WIDE_1,           2, 3, 2, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_GRAY,  0, 8, 5, 0
  LObjN LO::WIDE_1,           2, 6, 4, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         2, 5, Metatiles::KEY_GREEN
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 4
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::LOCK_BLUE
  LObjN LO::R_GROUND,         0, 6, 5, 8
  LObj  LO::S_BIGHEART,       3, 5
  LObjN LO::WIDE_1,           3, 6, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_GROUND,         0, 13, 13, 1
  LObjN LO::WIDE_1,           2, 9, 2, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::S_M_ARROW_RIGHT,  1, 7
  LObj  LO::S_M_ARROW_UP,     0, 10
  LObj  LO::S_M_ARROW_RIGHT,  3, 7
  LObj  LO::S_W_ARROW_LEFT,   0, 10
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 7
  LObj  LO::S_M_CRATE,        1, 7
  LObjN LO::R_FG_GLASS_BLUE,  1, 8, 3, 4
  LObjN LO::WIDE_1,           3, 4, 3, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 7
  LObjN LO::WIDE_1,           1, 8, 3, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_GRAY,  1, 2, 8, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 5, 8, 0
  LObj  LO::S_SPRING,         1, 3
  LObjN LO::R_FG_GLASS_BLUE,  2, 8, 3, 4
  LObjN LO::R_GROUND,         0, 13, 3, 1
  LObj  LO::S_SPRING,         4, 3
  LObjN LO::WIDE_1,           0, 4, 5, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 8, 3, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 2, 2, 0
  LObj  LO::S_SPRING,         2, 7
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 3, 4
  LObjN LO::R_GROUND,         0, 13, 10, 1
  LObj  LO::S_W_ARROW_RIGHT,  1, 1
  LObj  LO::S_M_ARROW_DOWN,   3, 1
  LObj  LO::S_M_CRATE,        0, 7
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 7
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::ABILITY_BOMB
  LObj  LO::S_BIGHEART,       0, 4
  LObjN LO::R_BG_GLASS_GRAY,  2, 8, 2, 2
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::R_BG_GLASS_GRAY,  3, 2, 2, 2
  LObjN LO::WIDE_1,           1, 9, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         2, 8, 6, 6
  LObjN LO::R_FG_GLASS_BLUE,  1, 6, 1, 1
  LObjN LO::R_FG_GLASS_BLUE,  2, 4, 3, 3
  LObjN LO::TALL_1,           4, 4, 8, LN1::LADDER
  LObjN LO::R_GROUND,         0, 13, 5, 1
  LObj  LO::S_BG_GLASS_GRAY,  2, 6
  LObj  LO::S_BG_GLASS_GRAY,  2, 5
  LObj  LO::S_EXIT_DOOR,      0, 11
  LObj  LO::S_BG_GLASS_GRAY,  2, 4
  LObj  LO::S_BG_GLASS_GRAY,  2, 3
  LObjN LO::R_GROUND,         3, 3, 3, 11
  LObjN LO::R_GROUND,         4, 12, 5, 2
  LObj  LO::S_PRIZE,          1, 9
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObj  LO::S_EXIT_DOOR,      3, 10
  LFinished

puzzle2Sprite:
  LSpr Enemy::CHECKPOINT,          0,  36,  12
  LSpr Enemy::SPINNER,             0,  40,   7, 3
  LSpr Enemy::SNEAKER,             0,  43,  11
  LSpr Enemy::BOMB_GUY,            1,  52,   3
  LSpr Enemy::BOMB_GUY,            0,  67,   2
  LSpr Enemy::BOMB_GUY,            1,  72,   4
  LSpr Enemy::FIRE_WALK,           0,  87,  11, 1
  LSpr Enemy::ROCKET_LAUNCHER,     0,  89,   9
  LSpr Enemy::CHECKPOINT,          0,  97,   8
  LSpr Enemy::ROCKET_LAUNCHER,     0, 108,  12
  LSpr Enemy::ROCKET_LAUNCHER,     0, 113,  11
  LSpr Enemy::BOULDER,             0, 132,   4
  LSpr Enemy::BOULDER,             0, 132,   5
  LSpr Enemy::BOULDER,             0, 132,   6
  LSpr Enemy::BOMB_GUY,            0, 138,   3
  LSpr Enemy::BOMB_GUY,            1, 143,   7
  LSpr Enemy::BOMB_GUY,            1, 146,   3
  LSpr Enemy::GOOMBA,              0, 149,   3
  LSpr Enemy::BOULDER,             0, 153,   4
  LSpr Enemy::BOULDER,             0, 153,   5
  LSpr Enemy::BOULDER,             0, 153,   6
  LSpr Enemy::CHECKPOINT,          0, 153,   9
  LSpr Enemy::ROCKET_LAUNCHER,     1, 163,  12
  LSpr Enemy::COLLECTIBLE,         0, 188,   7
  .byt 255 ; end
