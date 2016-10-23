glass2:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_HANNAH
  .addr glass2Data
  .addr glass2Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt 255 ; end
  .byt $00, $00 ; boundaries

glass2Data:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 24
  LObj  LO::S_W_ARROW_RIGHT,  6, 9
  LObj  LO::S_W_ARROW_UP,     2, 9
  LObjN LO::R_GROUND,         3, 11, 4, 1
  LObj  LO::S_PRIZE,          2, 7
  LObjN LO::R_FG_GLASS_BLUE,  1, 3, 0, 4
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 3, 10, 0
  LObjN LO::WIDE_1,           2, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 10, 1, 1
  LObjN LO::R_BG_GLASS_BLUE,  2, 4, 0, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 0, 4
  LObjN LO::WIDE_1,           1, 8, 4, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 1
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::KEY_GREEN
  LObj  LO::S_M_CRATE,        0, 5
  LObj  LO::S_W_ARROW_UP,     0, 11
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 1
  LObjN LO::R_BG_GLASS_BLUE,  2, 4, 0, 3
  LObj  LO::S_FG_GLASS_BLUE,  0, 8
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 1
  LObjN LO::R_GROUND,         0, 11, 4, 3
  LObjN LO::WIDE_1,           2, 9, 0, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          2, 7
  LObjN LO::R_FG_GLASS_BLUE,  1, 3, 5, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 7, 7, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 7, 0
  LObjN LO::R_FG_GLASS_BLUE,  2, 4, 0, 1
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::LOCK_GREEN
  LObj  LO::S_CUSTOM,         2, 6, Metatiles::KEY_RED
  LObjN LO::R_FG_GLASS_BLUE,  1, 4, 0, 2
  LObjN LO::R_BG_GLASS_RED,   2, 3, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 2
  LObjN LO::R_BG_GLASS_RED,   1, 2, 0, 2
  LObj  LO::S_PRIZE,          0, 7
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_GROUND,         0, 11, 4, 3
  LObjN LO::R_BG_GLASS_RED,   1, 4, 0, 1
  LObjN LO::R_BG_GLASS_RED,   1, 2, 0, 2
  LObjN LO::WIDE_1,           2, 7, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_FG_GLASS_BLUE,  1, 3, 0, 2
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::LOCK_RED
  LObjN LO::R_FG_GLASS_BLUE,  0, 7, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  1, 7, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 8, 2, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 2, 0
  LObjN LO::R_FG_GLASS_BLUE,  3, 7, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  1, 3, 4, 0
  LObjN LO::R_SOLID_ROCK,     0, 7, 7, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 2, 0
  LObjN LO::R_COIN,           0, 1, 1, 1
  LObj  LO::S_COIN,           0, 2
  LObj  LO::S_FG_GLASS_BLUE,  2, 1
  LObj  LO::S_CUSTOM,         0, 2, Metatiles::LOCK_BLUE
  LObjN LO::R_FG_GLASS_BLUE,  1, 3, 0, 2
  LObjN LO::WIDE_1,           1, 3, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 5, 0, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         2, 7, Metatiles::WOOD_CRATE, (4<<4)|0
  LObj  LO::R_CUSTOM,         2, 11, Metatiles::WOOD_CRATE, (4<<4)|0
  LObj  LO::R_CUSTOM,         4, 9, Metatiles::WOOD_CRATE, (4<<4)|0
  LObj  LO::R_CUSTOM,         6, 10, Metatiles::WOOD_CRATE, (4<<4)|0
  LObj  LO::S_W_CRATE,        3, 6
  LObj  LO::S_W_CRATE,        1, 7
  LObj  LO::S_W_CRATE,        2, 8
  LObj  LO::S_W_CRATE,        2, 5
  LObj  LO::S_W_CRATE,        1, 7
  LObj  LO::S_W_CRATE,        1, 10
  LObj  LO::S_W_CRATE,        1, 7
  LObj  LO::S_W_CRATE,        3, 5
  LObj  LO::S_W_CRATE,        0, 8
  LObj  LO::S_W_CRATE,        2, 7
  LObjN LO::R_SOLID_BLOCK,    2, 7, 3, 0
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 2
  LObj  LO::S_W_ARROW_RIGHT,  0, 5
  LObj  LO::S_SOLID_BLOCK,    1, 1
  LObj  LO::S_CUSTOM,         0, 2, Metatiles::KEY_BLUE
  LObj  LO::S_M_CRATE,        0, 3
  LObjN LO::WIDE_1,           0, 5, 0, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 2
  LObj  LO::S_W_ARROW_LEFT,   1, 3
  LObj  LO::S_W_ARROW_UP,     0, 9
  LObj  LO::S_W_ARROW_DOWN,   3, 5
  LObj  LO::S_W_ARROW_LEFT,   0, 9
  LFinished

glass2Sprite:
  LSpr Enemy::GOOMBA,              1,  17,   7
  .byt 255 ; end
