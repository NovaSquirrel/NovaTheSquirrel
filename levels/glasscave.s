glasscave:
  .byt MusicTracks::WORLD_2|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_RONALD
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr glasscaveData
  .addr glasscaveSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY3
  .byt 255 ; end
  .byt $00, $00 ; boundaries

glasscaveData:
  LObjN LO::R_FG_GLASS_BLUE,  0, 0, 4, 8
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_FG_GLASS_BLUE,  5, 0, 6, 5
  LObjN LO::R_COIN,           2, 10, 2, 0
  LObjN LO::R_GROUND,         0, 11, 8, 1
  LObjN LO::R_COIN,           4, 8, 2, 0
  LObjN LO::R_GROUND,         0, 9, 4, 1
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 13, 3
  LObj  LO::S_PRIZE,          0, 6
  LObjN LO::WIDE_1,           2, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 5, Metatiles::TOGGLE_SWITCH
  LObjN LO::WIDE_1,           2, 10, 9, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           3, 6, 0, 3
  LObjN LO::R_SOLID_ROCK,     1, 10, 1, 4
  LObjN LO::R_COIN,           1, 6, 0, 3
  LObj  LO::S_PRIZE,          2, 6
  LObjN LO::R_FG_GLASS_BLUE,  1, 4, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 15, 0
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::TOGGLE_BLOCK_ON, (10<<4)|0
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::TOGGLE_SWITCH
  LObjN LO::WIDE_1,           0, 5, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 7, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   0, 10, 4, 4
  LObjN LO::R_COIN,           1, 5, 4, 0
  LObj  LO::S_SPRING,         2, 9
  LObjN LO::R_FG_GLASS_RED,   6, 4, 4, 10
  LObjN LO::R_FG_GLASS_BLUE,  5, 0, 2, 0
  LObjN LO::R_FG_GLASS_RED,   0, 11, 6, 3
  LObjN LO::R_COIN,           1, 2, 0, 3
  LObj  LO::S_HEART,          0, 6
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 7, 7
  LObjN LO::R_GROUND,         4, 12, 7, 2
  LObjN LO::TALL_1,           8, 5, 5, LN1::LADDER
  LObjN LO::R_GROUND,         0, 11, 6, 3
  LObjN LO::WIDE_1,           1, 5, 3, LN1::SOLID_LEDGE
  LSetX 64
  LWriteCol Enemy::FRIES
  LObjN LO::R_GROUND,         0, 6, 5, 8
  LObj  LO::S_BIGHEART,       3, 5
  LObjN LO::R_ENEMY_BARRIER      ,  3, 1, 0, 3
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::PUSHABLE_BLOCK
  LObjN LO::WIDE_1,           0, 6, 4, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 7, 1, 2
  LObjN LO::WIDE_1,           0, 10, 6, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 14, 15, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 8, 6, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 12, 4, LN1::SOLID_LEDGE
  LObjN LO::R_CEILING_BARRIER,3, 0, 1, 0
  LObjN LO::R_ENEMY_BARRIER      ,  1, 1, 0, 3
  LObjN LO::R_GROUND,         1, 0, 5, 9
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObjN LO::TALL_1,           8, 5, 4, LN1::LADDER
  LObjN LO::R_GROUND,         0, 10, 3, 4
  LObjN LO::R_COIN,           1, 4, 2, 0
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          0, 7
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_COIN,           2, 6, 0, 3
  LObjN LO::R_GROUND,         1, 5, 1, 9
  LObj  LO::S_SPRING,         2, 8
  LObjN LO::WIDE_1,           0, 9, 6, LN1::SOLID_LEDGE
  LObj  LO::S_SIGNPOST,       1, 8
  LWriteCol <AboutPlaceable, >AboutPlaceable
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::RECT_1,           1, 0, 1, LN1::GROUND, 16
  LObj  LO::S_PRIZE,          1, 6
  LWriteCol InventoryItem::BLOCK | 128
  LObj  LO::S_PRIZE,          1, 5
  LWriteCol InventoryItem::BLOCK | 128
  LObj  LO::S_PRIZE,          1, 4
  LWriteCol InventoryItem::BLOCK | 128
  LObjN LO::WIDE_1,           0, 7, 1, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_SOLID_ROCK,     2, 2, 0, 8
  LObj  LO::S_COIN,           0, 12
  LObj  LO::S_SOLID_BLOCK,    0, 13
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::BLOCK | 128
  LObj  LO::S_BIGHEART,       1, 4
  LObj  LO::S_COIN,           1, 11
  LObj  LO::S_COIN,           1, 9
  LObj  LO::S_COIN,           1, 7
  LObj  LO::S_COIN,           2, 5
  LObjN LO::R_GROUND,         0, 7, 4, 7
  LObj  LO::S_COIN,           2, 4
  LObjN LO::R_FG_GLASS_BLUE,  3, 0, 5, 3
  LObjN LO::R_FG_GLASS_RED,   0, 7, 2, 3
  LObjN LO::R_FG_GLASS_RED,   0, 11, 6, 3
  LObj  LO::S_PRIZE,          5, 8
  LWriteCol InventoryItem::BLOCK | 128
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 7, 4
  LObjN LO::R_SOLID_ROCK,     2, 5, 0, 6
  LObjN LO::WIDE_1,           0, 13, 1, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 9, 0, 3
  LObjN LO::R_FG_GLASS_RED,   1, 11, 6, 3
  LObj  LO::S_PRIZE,          3, 8
  LWriteCol InventoryItem::SPRING | 128
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 12, 1
  LObjN LO::R_FG_GLASS_RED,   3, 4, 6, 10
  LObjN LO::R_FG_GLASS_RED,   7, 11, 9, 3
  LObjN LO::R_COIN,           1, 5, 0, 5
  LSetX 140
  LWriteCol Enemy::FRIES
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 9, 7
  LObjN LO::R_BG_GLASS_GRAY,  0, 8, 0, 2
  LObjN LO::R_BG_GLASS_GRAY,  3, 8, 0, 2
  LObjN LO::R_BG_GLASS_GRAY,  3, 8, 0, 2
  LObjN LO::WIDE_1,           2, 11, 3, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 7, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 3, 2, 1
  LObjN LO::WIDE_1,           4, 10, 3, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 8, 1, 1
  LObjN LO::R_FG_GLASS_BLUE,  3, 0, 7, 1
  LObjN LO::WIDE_1,           2, 8, 3, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   3, 11, 2, 3
  LObj  LO::S_PRIZE,          1, 8
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 6, 3
  LObjN LO::R_BG_GLASS_GRAY,  0, 4, 0, 2
  LObjN LO::R_FG_GLASS_RED,   0, 7, 6, 7
  LObjN LO::R_COIN,           1, 5, 4, 0
  LObjN LO::R_BG_GLASS_GRAY,  2, 4, 0, 2
  LObjN LO::R_BG_GLASS_GRAY,  3, 4, 0, 2
  LObjN LO::R_GROUND,         1, 10, 6, 4
  LObjN LO::WIDE_1,           6, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_BG_GLASS_GRAY,  5, 5
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::TOGGLE_BLOCK_ON, (3<<4)|7
  LObj  LO::S_BG_GLASS_GRAY,  1, 3
  LObj  LO::S_BG_GLASS_GRAY,  3, 2
  LObjN LO::R_COIN,           0, 8, 1, 1
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::TOGGLE_BLOCK_ON, (1<<4)|4
  LObjN LO::WIDE_1,           2, 7, 3, LN1::SOLID_LEDGE
  LObj  LO::S_BG_GLASS_GRAY,  1, 2
  LObj  LO::S_BG_GLASS_GRAY,  3, 3
  LObjN LO::R_GROUND,         0, 7, 3, 7
  LObj  LO::S_BG_GLASS_GRAY,  3, 6
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::TOGGLE_BLOCK_ON, (8<<4)|0
  LObj  LO::S_CUSTOM,         5, 3, Metatiles::TOGGLE_SWITCH
  LObjN LO::WIDE_1,           0, 4, 1, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         3, 9, Metatiles::TOGGLE_BLOCK_OFF, (5<<4)|5
  LObjN LO::R_CEILING_BARRIER,5, 0, 0, 3
  LObj  LO::R_CUSTOM,         1, 3, Metatiles::TOGGLE_BLOCK_ON, (1<<4)|8
  LObj  LO::S_CUSTOM,         2, 2, Metatiles::KEY_GREEN
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::TOGGLE_BLOCK_ON, (1<<4)|0
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::TOGGLE_BLOCK_OFF, (7<<4)|0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_ON, (6<<4)|0
  LObj  LO::R_CUSTOM,         1, 0, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObjN LO::R_COIN,           0, 6, 1, 2
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_BLOCK_OFF, (5<<4)|0
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_COIN,           0, 3, 1, 0
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::TOGGLE_BLOCK_ON
  LObjN LO::R_ENEMY_BARRIER      ,  1, 0, 0, 3
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_ON, (3<<4)|0
  LObjN LO::R_COIN,           1, 3, 2, 0
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         2, 8, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|3
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::TOGGLE_BLOCK_ON, (4<<4)|0
  LObj  LO::S_PRIZE,          2, 4
  LWriteCol InventoryItem::SPRING | 128
  LObjN LO::WIDE_1,           2, 4, 5, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_CEILING_BARRIER,5, 0, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 2
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::LOCK_GREEN
  LObj  LO::S_SOLID_BLOCK,    0, 4
  LObjN LO::R_GROUND,         1, 4, 4, 10
  LObj  LO::S_DOOR,           3, 2
  LWriteCol $21, LevelId::PuzzleBomb
  LObjN LO::R_GROUND,         14, 4, 3, 10
  LObj  LO::S_PRIZE,          2, 2
  LWriteCol InventoryItem::ABILITY_BURGER
  .byt LSpecialCmd, LevelSpecialConfig::STARS
  LFinished

glasscaveSprite:
  LSpr Enemy::THWOMP,              0,  20,   4
  LSpr Enemy::THWOMP,              0,  22,   4
  LSpr Enemy::THWOMP,              0,  25,   7
  LSpr Enemy::RONALD,              1,  38,   3
  LSpr Enemy::BALL_GUY,            1,  54,  11
  LSpr Enemy::FIRE_WALK,           1,  60,   4
  LSpr Enemy::BALL_GUY,            1,  61,   8
  LSpr Enemy::CANNON_2,            0,  64,   1, 3
  LSpr Enemy::CHECKPOINT,          0,  65,   5
  LSpr Enemy::RONALD_BURGER,       0,  73,   2
  LSpr Enemy::FIRE_WALK,           1,  90,   9, 1
  LSpr Enemy::CHECKPOINT,          0,  93,   4
  LSpr Enemy::FIRE_WALK,           0, 113,   6, 1
  LSpr Enemy::FIRE_WALK,           0, 134,   3, 1
  LSpr Enemy::CANNON_2,            1, 140,   2, 2
  LSpr Enemy::FIRE_JUMP,           1, 164,   7
  LSpr Enemy::FIRE_JUMP,           1, 167,   6
  LSpr Enemy::CHECKPOINT,          0, 175,   9
  LSpr Enemy::BALL_GUY,            1, 181,   6
  LSpr Enemy::BALL_GUY,            1, 187,   6
  LSpr Enemy::RONALD_BURGER,       1, 202,   1
  .byt 255 ; end
