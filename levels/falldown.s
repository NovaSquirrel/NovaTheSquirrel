falldown:
  .byt MusicTracks::NONE|64
  .byt 2
  .byt $2
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_WIND
  .addr falldownData
  .addr falldownSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY3
  .byt 255 ; end
  .byt $ff, $ff ; boundaries
  .byt $00, $01 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f0 ; link

falldownData:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::STARS
  LObjN LO::R_GROUND,         0, 4, 4, 8
  LObjN LO::R_GROUND,         0, 13, 6, 1
  LObjN LO::WIDE_1,           5, 4, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 11, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 7, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 13
  LObjN LO::WIDE_1,           0, 14, 0, LN1::SOLID_LEDGE
  LObj  LO::S_BG_GLASS_GREEN, 2, 3
  LObjN LO::WIDE_1,           0, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 13, 5, 1
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObjN LO::R_BG_GLASS_GREEN, 1, 0, 0, 5
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObjN LO::R_GROUND,         0, 7, 2, 5
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 5, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 3, 1, 9
  LObjN LO::R_FG_GLASS_BLUE,  0, 13, 2, 1
  LObj  LO::R_CUSTOM,         2, 3, Metatiles::FORCE_RIGHT, (0<<4)|3
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORCE_UP, (10<<4)|0
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_COIN,           1, 5, 2, 0
  LObjN LO::R_COIN,           0, 9, 0, 2
  LObj  LO::S_CUSTOM,         0, 13, Metatiles::TOGGLE_BLOCK_ON
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|3
  LObjN LO::R_FG_GLASS_RED,   0, 12, 11, 2
  LObj  LO::S_FG_GLASS_BLUE,  2, 0
  LObjN LO::WIDE_1,           0, 2, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         3, 11
  LObjN LO::R_FG_GLASS_RED,   1, 0, 5, 4
  LObj  LO::S_SOLID_BLOCK,    2, 8
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::TOGGLE_SWITCH
  LObjN LO::WIDE_1,           0, 9, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 5, 1, 6
  LObjN LO::R_SOLID_ROCK,     2, 0, 1, 14
  LObj  LO::S_SOLID_ROCK,     2, 0
  LObjN LO::R_SOLID_BLOCK,    0, 4, 2, 0
  LObjN LO::WIDE_1,           0, 5, 7, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 8, 0, 1
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::LOCK_RED
  LObjN LO::R_SOLID_ROCK,     1, 12, 7, 0
  LObjN LO::R_SOLID_ROCK,     1, 0, 9, 0
  LObj  LO::S_SPRING,         0, 9
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::FORCE_UP
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::WIDE_1,           0, 14, 0, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::SPRING, (4<<4)|0
  LObj  LO::S_SPRING,         0, 8
  LObj  LO::S_SOLID_BLOCK,    0, 9
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORCE_LEFT, (8<<4)|0
  LObjN LO::TALL_1,           0, 13, 1, LN1::LADDER
  LObjN LO::WIDE_1,           1, 12, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 14, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 10, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     0, 13, 3, 0
  LObjN LO::R_SOLID_ROCK,     0, 14, 6, 0
  LObj  LO::S_SPRING,         1, 8
  LObj  LO::S_SOLID_BLOCK,    0, 9
  LObjN LO::WIDE_1,           1, 8, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 8, 1, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CUSTOM,         1, 9, Metatiles::KEY_RED
  LObjN LO::R_SOLID_ROCK,     1, 5, 1, 2
  LObj  LO::S_CUSTOM,         0, 13, Metatiles::KEY_GREEN
  LObjN LO::R_COIN,           1, 3, 0, 1
  LObjN LO::R_SOLID_ROCK,     1, 0, 1, 14
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 1, 14
  LObjN LO::R_SOLID_BLOCK,    2, 4, 4, 0
  LObj  LO::S_DOOR,           1, 2
  LWriteCol 8, 93
  LObjN LO::TALL_1,           0, 13, 1, LN1::LADDER
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::SPRING, (1<<4)|0
  LObjN LO::R_SOLID_BLOCK,    0, 13, 1, 0
  LObjN LO::TALL_1,           1, 0, 3, LN1::LADDER
  LObjN LO::R_SOLID_BLOCK,    1, 2, 3, 0
  LObj  LO::S_SOLID_BLOCK,    0, 3
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::R_SOLID_BLOCK,    0, 12, 1, 0
  LObjN LO::R_FG_GLASS_RED,   0, 13, 7, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 6, 0
  LObjN LO::R_BG_GLASS_RED,   0, 7, 0, 4
  LObj  LO::S_CUSTOM,         1, 1, Metatiles::LOCK_GREEN
  LObjN LO::R_SOLID_BLOCK,    0, 6, 0, 1
  LObjN LO::R_FG_GLASS_RED,   1, 6, 4, 1
  LObjN LO::R_SOLID_BLOCK,    1, 5, 3, 0
  LObj  LO::S_PRIZE,          0, 10
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObj  LO::S_BIGHEART,       0, 12
  LObj  LO::S_PRIZE,          1, 10
  LObjN LO::R_COIN,           1, 2, 0, 1
  LObj  LO::S_DOOR,           1, 11
  LWriteCol 8, 67
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 1, 14
  LObjN LO::R_FG_GLASS_RED,   2, 0, 1, 14
  LObjN LO::R_SOLID_BLOCK,    2, 3, 5, 0
  LObj  LO::S_PRIZE,          0, 7
  LWriteCol InventoryItem::SPRING | 128
  LObjN LO::R_SOLID_BLOCK,    0, 10, 5, 0
  LObj  LO::S_COIN,           0, 14
  LObjN LO::TALL_1,           1, 0, 2, LN1::LADDER
  LObjN LO::WIDE_1,           0, 7, 2, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_DOOR,           0, 8
  LWriteCol 11, 61
  LObj  LO::S_COIN,           0, 13
  LObj  LO::S_CUSTOM,         1, 5, Metatiles::KEY_RED
  LObjN LO::TALL_1,           0, 7, 2, LN1::LADDER
  LObj  LO::S_COIN,           0, 12
  LObjN LO::WIDE_2,           0, 13, 5, LN2::PATH_LINE
  LObj  LO::S_PRIZE,          2, 7
  LWriteCol InventoryItem::SPRING | 128
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 1
  LObj  LO::S_CUSTOM,         0, 2, Metatiles::LOCK_RED
  LObjN LO::R_SOLID_BLOCK,    0, 4, 0, 5
  LObjN LO::R_SOLID_BLOCK,    1, 0, 5, 0
  LObjN LO::TALL_1,           0, 3, 5, LN1::LADDER
  LObjN LO::R_SOLID_BLOCK,    0, 9, 3, 0
  LObjN LO::WIDE_1,           0, 14, 5, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 6
  LObjN LO::TALL_2,           1, 12, 1, LN2::PATH_LINE
  LObjN LO::WIDE_2,           1, 12, 1, LN2::PATH_LINE
  LObjN LO::R_SOLID_BLOCK,    1, 3, 0, 6
  LObjN LO::TALL_2,           0, 10, 1, LN2::PATH_LINE
  LObjN LO::R_COIN,           1, 4, 0, 2
  LObjN LO::WIDE_1,           0, 9, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 0, 1, 14
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 1, 14
  LObjN LO::WIDE_1,           2, 3, 3, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 13
  LObjN LO::WIDE_1,           0, 14, 2, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_RED,   1, 4, 0, 6
  LObjN LO::R_BG_GLASS_RED,   1, 4, 3, 0
  LObj  LO::S_SPRING,         0, 8
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_RED,   0, 10, 3, 0
  LObjN LO::WIDE_1,           1, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           0, 13, 1, LN1::LADDER
  LObjN LO::WIDE_1,           2, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 5, 1
  LObjN LO::R_SOLID_BLOCK,    0, 2, 1, 8
  LObjN LO::R_SOLID_BLOCK,    2, 2, 3, 0
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::GREEN_BOOTS
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_SOLID_BLOCK,    0, 10, 3, 0
  LObj  LO::R_CUSTOM,         1, 6, Metatiles::FORCE_LEFT, (0<<4)|3
  LObjN LO::R_BRICK,          1, 5, 1, 0
  LObjN LO::R_SOLID_BLOCK,    0, 6, 0, 1
  LObj  LO::S_DOOR,           1, 8
  LWriteCol 2, 51
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 1, 14
  LObjN LO::R_SOLID_ROCK,     2, 0, 1, 14
  LObj  LO::R_CUSTOM,         2, 4, Metatiles::TOGGLE_BLOCK_OFF, (5<<4)|0
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 8, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 12, 8, 2
  LObjN LO::TALL_1,           1, 6, 4, LN1::LADDER
  LObjN LO::WIDE_1,           1, 6, 7, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_OFF, (5<<4)|0
  LObjN LO::TALL_1,           1, 0, 1, LN1::LADDER
  LObjN LO::WIDE_1,           0, 2, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::SPRING, (3<<4)|0
  LObjN LO::R_COIN,           3, 1, 2, 2
  LObj  LO::S_SOLID_BLOCK,    0, 4
  LObjN LO::WIDE_1,           1, 4, 3, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_CUSTOM,         2, 3, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_SOLID_BLOCK,    0, 4, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 0, 3
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 3
  LObj  LO::S_BIGHEART,       0, 10
  LObjN LO::TALL_1,           0, 11, 3, LN1::LADDER
  LObjN LO::R_SOLID_ROCK,     2, 0, 1, 14
  LObjN LO::R_FG_GLASS_RED,   2, 0, 1, 14
  LObjN LO::R_BG_GLASS_BLUE,  2, 0, 8, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 2, 9, 0
  LObjN LO::WIDE_1,           0, 6, 5, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 7, 0, LN1::SOLID_LEDGE
  LObj  LO::S_EXIT_DOOR,      2, 4
  LObjN LO::TALL_1,           0, 6, 8, LN1::LADDER
  LObjN LO::WIDE_1,           2, 11, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     2, 3, 0, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 7, 5, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 0, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 12, 5, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 8, 4, 3
  LObj  LO::S_DOOR,           1, 5
  LWriteCol 10, 247
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 1
  LObjN LO::TALL_1,           1, 0, 6, LN1::LADDER
  LObjN LO::R_FG_GLASS_RED,   2, 0, 1, 14
  LObjN LO::R_FG_GLASS_RED,   2, 0, 1, 14
  LObjN LO::TALL_1,           4, 0, 4, LN1::LADDER
  LObjN LO::WIDE_1,           0, 5, 3, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 1, 1, 3
  LObjN LO::WIDE_1,           0, 7, 3, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 13, 6, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 9, 1, 3
  LObjN LO::WIDE_1,           2, 2, 0, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           0, 7, 5, LN1::LADDER
  LObjN LO::WIDE_1,           3, 7, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 1, 14
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 1, 14
  LObjN LO::WIDE_1,           2, 13, 2, LN1::SOLID_LEDGE
  LObj  LO::S_BIGHEART,       1, 12
  LObjN LO::WIDE_1,           4, 13, 6, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          2, 10
  LWriteCol InventoryItem::SPRING | 128
  LObjN LO::R_COIN,           0, 12, 4, 0
  LObj  LO::S_PRIZE,          2, 10
  LWriteCol InventoryItem::SPRING | 128
  LObj  LO::S_PRIZE,          2, 10
  LWriteCol InventoryItem::SPRING | 128
  LObjN LO::R_FG_GLASS_RED,   1, 0, 1, 14
  LObjN LO::R_FG_GLASS_RED,   2, 0, 1, 14
  LObjN LO::R_COIN,           2, 11, 2, 2
  LObjN LO::R_FG_GLASS_RED,   0, 14, 5, 0
  LObj  LO::S_BIGHEART,       3, 13
  LObjN LO::WIDE_1,           2, 3, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 2
  LObjN LO::WIDE_1,           0, 13, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 13, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  3, 0, 1, 14
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 1, 14
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 5, 0
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::TOGGLE_BLOCK_OFF, (8<<4)|0
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 11, Metatiles::TOGGLE_SWITCH
  LObjN LO::WIDE_1,           1, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 8, 2, 0
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 11, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 2, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 1
  LObjN LO::WIDE_1,           0, 13, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|1
  LObjN LO::R_FG_GLASS_RED,   4, 0, 1, 14
  LObjN LO::R_FG_GLASS_RED,   2, 0, 1, 14
  LObjN LO::TALL_1,           2, 8, 4, LN1::LADDER
  LObjN LO::WIDE_1,           0, 13, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 8, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 5, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 5, 2, 3
  LObjN LO::WIDE_1,           3, 2, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           0, 12, 2, LN1::LADDER
  LObj  LO::S_SPRING,         1, 1
  LObjN LO::WIDE_1,           0, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  3, 0, 1, 14
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 1, 14
  LObjN LO::WIDE_1,           3, 6, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           0, 10, 9, LN2::PATH_LINE
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::WIDE_1,           0, 13, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 3, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           0, 13, 1, LN1::LADDER
  LObjN LO::TALL_1,           1, 0, 2, LN1::LADDER
  LObjN LO::WIDE_1,           1, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 7
  LObjN LO::R_FG_GLASS_RED,   3, 0, 1, 14
  LObjN LO::R_FG_GLASS_RED,   2, 0, 1, 14
  LObjN LO::R_COIN,           3, 4, 2, 0
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           0, 9, 9, LN2::PATH_LINE
  LObjN LO::WIDE_1,           2, 3, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           3, 0, 2, LN1::LADDER
  LObjN LO::WIDE_1,           0, 13, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::R_COIN,           1, 5, 1, 2
  LObjN LO::WIDE_1,           2, 6, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 1, 14
  LObjN LO::R_SOLID_BLOCK,    2, 0, 1, 0
  LObjN LO::R_SOLID_BLOCK,    0, 1, 0, 10
  LObjN LO::R_GROUND,         0, 12, 15, 2
  LObjN LO::R_BG_GLASS_RED,   1, 6, 0, 5
  LObjN LO::R_BG_GLASS_RED,   1, 6, 7, 0
  LObj  LO::S_PRIZE,          1, 9
  LWriteCol InventoryItem::ABILITY_WATER | 128
  LObjN LO::R_BG_GLASS_BLUE,  2, 4, 0, 7
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 5, 0
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObj  LO::S_DOOR,           1, 10
  LWriteCol 5, 122
  LObjN LO::WIDE_1,           1, 3, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 0, 0, 1
  LObj  LO::S_SPRING,         0, 2
  LObjN LO::R_BG_GLASS_RED,   1, 6, 0, 5
  LObjN LO::TALL_2,           1, 5, 5, LN2::PATH_LINE
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 0, 7
  LObjN LO::R_SOLID_BLOCK,    2, 0, 1, 0
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 10
  LFinished

falldownSprite:
  LSpr Enemy::GOOMBA,              1,   9,   6
  LSpr Enemy::GOOMBA,              1,  11,   6
  LSpr Enemy::OWL,                 0,  39,   4
  LSpr Enemy::CANNON_1,            0,  50,   8
  LSpr Enemy::CANNON_1,            0,  51,   5
  LSpr Enemy::THWOMP,              0,  56,   8
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  68,  13
  LSpr Enemy::CHECKPOINT,          0,  77,   8
  LSpr Enemy::ROCKET_LAUNCHER,     0,  87,   6
  LSpr Enemy::CHECKPOINT,          0, 103,   1
  LSpr Enemy::CANNON_1,            1, 108,   8
  LSpr Enemy::CANNON_1,            1, 109,   2
  LSpr Enemy::ELECTRIC_FAN,        0, 114,   6
  LSpr Enemy::ELECTRIC_FAN,        1, 119,  10
  LSpr Enemy::ELECTRIC_FAN,        0, 133,   9
  LSpr Enemy::ELECTRIC_FAN,        1, 137,   1
  LSpr Enemy::ELECTRIC_FAN,        1, 140,   6
  LSpr Enemy::ROCKET_LAUNCHER,     0, 147,   5
  LSpr Enemy::COLLECTIBLE,         0, 149,   5
  LSpr Enemy::ROCKET_LAUNCHER,     0, 163,   7
  LSpr Enemy::ROCKET_LAUNCHER,     1, 188,   7
  LSpr Enemy::ELECTRIC_FAN,        1, 204,  11
  LSpr Enemy::ELECTRIC_FAN,        0, 211,   5
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 220,  10
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 227,   9
  LSpr Enemy::OWL,                 1, 230,   2
  LSpr Enemy::ELECTRIC_FAN,        1, 236,   5
  LSpr Enemy::CHECKPOINT,          0, 244,  11
  LSpr Enemy::ELECTRIC_FAN,        1, 246,   8
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 251,   5
  .byt 255 ; end
