falldown:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $2
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
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
  .byt $80, $01 ; boundaries
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
  LObjN LO::R_GROUND,         0, 4, 4, 8
  LObjN LO::R_GROUND,         0, 13, 6, 1
  LObjN LO::WIDE_1,           5, 4, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 11, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 7, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 13
  LObjN LO::WIDE_1,           0, 14, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 13, 5, 1
  LObj  LO::S_COIN,           1, 9
  LObjN LO::R_GROUND,         2, 7, 2, 5
  LObjN LO::R_FG_GLASS_BLUE,  3, 0, 5, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 3, 1, 9
  LObjN LO::R_FG_GLASS_BLUE,  0, 13, 2, 1
  LObj  LO::R_CUSTOM,         2, 3, Metatiles::FORCE_RIGHT, (0<<4)|3
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORCE_UP, (10<<4)|0
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_COIN,           1, 4, 2, 1
  LObjN LO::R_COIN,           0, 9, 0, 2
  LObj  LO::S_CUSTOM,         0, 13, Metatiles::TOGGLE_BLOCK_ON
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|3
  LObjN LO::R_FG_GLASS_RED,   0, 12, 11, 2
  LObjN LO::WIDE_1,           2, 2, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         3, 11
  LObjN LO::R_FG_GLASS_RED,   1, 0, 5, 4
  LObj  LO::S_SOLID_BLOCK,    2, 8
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::TOGGLE_SWITCH
  LObjN LO::WIDE_1,           0, 9, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 5, 1, 6
  LObjN LO::R_SOLID_ROCK,     2, 0, 1, 14
  LObj  LO::S_SOLID_ROCK,     2, 0
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::SPRING, (7<<4)|0
  LObjN LO::WIDE_1,           0, 5, 7, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::LOCK_RED
  LObj  LO::S_SOLID_BLOCK,    1, 4
  LObjN LO::R_SOLID_ROCK,     0, 12, 7, 0
  LObjN LO::R_SOLID_ROCK,     1, 0, 9, 0
  LObj  LO::S_SPRING,         0, 9
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::FORCE_UP
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::WIDE_1,           0, 14, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 8
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
  LObjN LO::R_SOLID_ROCK,     2, 0, 1, 14
  LObjN LO::R_FG_GLASS_BLUE,  2, 0, 1, 14
  LObjN LO::R_SOLID_BLOCK,    2, 4, 4, 0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::SPRING, (1<<4)|0
  LObjN LO::WIDE_1,           0, 9, 1, LN1::SOLID_LEDGE
  LObj  LO::S_DOOR,           1, 2
  LWriteCol 8, 92
  LObjN LO::TALL_1,           0, 13, 1, LN1::LADDER
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::SPRING, (1<<4)|0
  LObjN LO::R_SOLID_BLOCK,    0, 13, 1, 0
  LObjN LO::TALL_1,           1, 0, 1, LN1::LADDER
  LObjN LO::R_SOLID_BLOCK,    0, 2, 4, 0
  LObjN LO::R_SOLID_BLOCK,    0, 3, 1, 0
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::R_SOLID_BLOCK,    0, 12, 1, 0
  LObjN LO::R_FG_GLASS_RED,   0, 13, 7, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 4, 0
  LObj  LO::S_CUSTOM,         1, 1, Metatiles::LOCK_GREEN
  LObjN LO::R_SOLID_BLOCK,    0, 6, 0, 1
  LObjN LO::R_FG_GLASS_RED,   1, 6, 4, 1
  LObjN LO::R_COIN,           0, 9, 3, 0
  LObjN LO::R_SOLID_BLOCK,    1, 5, 3, 0
  LObjN LO::WIDE_1,           0, 10, 1, LN1::PRIZE
  LObj  LO::S_DOOR,           3, 11
  LWriteCol 8, 67
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 1, 14
  LObjN LO::R_ROCK,           2, 0, 1, 14
  LObjN LO::R_SOLID_BLOCK,    2, 3, 6, 0
  LObjN LO::R_SOLID_BLOCK,    0, 10, 6, 0
  LObjN LO::TALL_1,           1, 0, 2, LN1::LADDER
  LObjN LO::R_COIN,           0, 6, 2, 0
  LObjN LO::WIDE_1,           0, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_DOOR,           0, 8
  LWriteCol 11, 61
  LObj  LO::S_CUSTOM,         1, 5, Metatiles::KEY_RED
  LObjN LO::TALL_1,           2, 7, 2, LN1::LADDER
  LObjN LO::R_SOLID_BLOCK,    2, 0, 0, 1
  LObj  LO::S_CUSTOM,         0, 2, Metatiles::LOCK_RED
  LObjN LO::R_SOLID_BLOCK,    0, 4, 0, 5
  LObjN LO::R_ROCK,           6, 0, 1, 14
  LObjN LO::R_ROCK,           2, 0, 1, 14
  LObjN LO::R_SOLID_BLOCK,    9, 2, 0, 8
  LObjN LO::R_SOLID_BLOCK,    1, 2, 3, 0
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::GREEN_BOOTS
  LObjN LO::R_BRICK,          0, 7, 1, 0
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_SOLID_BLOCK,    0, 10, 3, 0
  LObjN LO::R_BRICK,          2, 5, 1, 0
  LObjN LO::R_SOLID_BLOCK,    0, 6, 0, 1
  LObj  LO::S_DOOR,           0, 8
  LWriteCol 2, 51
  LObjN LO::R_ROCK,           2, 0, 1, 14
  LFinished

falldownSprite:
  LSpr Enemy::GOOMBA,              1,  11,   6
  LSpr Enemy::GOOMBA,              1,  13,   6
  LSpr Enemy::GOOMBA,              1,  17,   7
  .byt 255 ; end
