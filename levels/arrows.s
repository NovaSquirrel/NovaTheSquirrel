arrows:
  .byt MusicTracks::NONE|0
  .byt 4
  .byt $f4
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_HANNAH
  .addr arrowsData
  .addr arrowsSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt 255 ; end
  .byt $00, $00 ; boundaries

arrowsData:
  LObjN LO::R_GROUND,         0, 6, 7, 8
  LObjN LO::TALL_1,           8, 6, 5, LN1::LADDER
  LObjN LO::R_GROUND,         0, 12, 10, 2
  LObjN LO::WIDE_1,           3, 6, 4, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          2, 3
  LObjN LO::R_FG_GLASS_BLUE,  3, 6, 2, 4
  LObj  LO::S_W_ARROW_DOWN,   1, 5
  LObj  LO::S_M_CRATE,        0, 11
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 1, 0
  LObjN LO::WIDE_1,           0, 13, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  1, 1, 2, 4
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::WOOD_CRATE, (3<<4)|0
  LObjN LO::R_COIN,           1, 8, 1, 2
  LObjN LO::R_FG_GLASS_BLUE,  2, 1, 9, 2
  LObj  LO::R_CUSTOM,         3, 12, Metatiles::WOOD_CRATE, (3<<4)|0
  LObjN LO::R_COIN,           1, 8, 1, 2
  LObj  LO::R_CUSTOM,         3, 10, Metatiles::WOOD_CRATE, (2<<4)|0
  LObjN LO::R_FG_GLASS_BLUE,  3, 1, 2, 4
  LObjN LO::R_BG_GLASS_BLUE,  0, 6, 0, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 10, 2, 4
  LObjN LO::R_BG_GLASS_BLUE,  2, 6, 0, 3
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_RED,   1, 5, 6, 0
  LObjN LO::R_BG_GLASS_RED,   0, 6, 0, 3
  LObjN LO::R_FG_GLASS_RED,   0, 10, 6, 0
  LObj  LO::S_PRIZE,          1, 2
  LObj  LO::S_W_ARROW_RIGHT,  2, 4
  LObj  LO::S_SIGNPOST,       0, 9
  LObjN LO::R_BG_GLASS_RED,   3, 6, 0, 3
  LObjN LO::WIDE_1,           2, 5, 1, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 7, 1, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 9, 1, LN1::SOLID_LEDGE
  LObj  LO::S_W_CRATE,        3, 4
  LObjN LO::R_FG_GLASS_BLUE,  0, 5, 4, 9
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 3
  LObj  LO::S_M_CRATE,        0, 4
  LObjN LO::RECT_1,           5, 12, 2, LN1::GROUND, 25
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 8
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 15, 0
  LObj  LO::S_W_ARROW_DOWN,   1, 2
  LObj  LO::S_W_ARROW_RIGHT,  0, 5
  LObj  LO::S_W_ARROW_RIGHT,  1, 4
  LObj  LO::S_FG_GLASS_RED,   0, 8
  LObj  LO::S_W_ARROW_UP,     0, 9
  LObj  LO::S_W_ARROW_UP,     2, 5
  LObj  LO::S_W_ARROW_RIGHT,  1, 1
  LObj  LO::S_W_ARROW_UP,     0, 6
  LObj  LO::S_W_ARROW_LEFT,   2, 2
  LObj  LO::S_FG_GLASS_RED,   0, 8
  LObj  LO::S_W_ARROW_UP,     0, 9
  LObj  LO::S_W_ARROW_RIGHT,  2, 1
  LObj  LO::S_W_ARROW_DOWN,   0, 4
  LObj  LO::S_W_ARROW_LEFT,   0, 6
  LObj  LO::S_W_ARROW_LEFT,   3, 2
  LObj  LO::S_FG_GLASS_RED,   0, 8
  LObj  LO::S_W_ARROW_UP,     0, 9
  LObj  LO::S_W_ARROW_DOWN,   2, 1
  LObj  LO::S_W_ARROW_RIGHT,  0, 5
  LObj  LO::S_W_ARROW_RIGHT,  2, 2
  LObj  LO::S_FG_GLASS_RED,   0, 8
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 4, 0
  LObj  LO::S_W_ARROW_UP,     0, 9
  LObj  LO::S_W_ARROW_DOWN,   2, 5
  LObj  LO::S_W_CRATE,        0, 7
  LObj  LO::S_W_ARROW_RIGHT,  0, 8
  LObj  LO::S_W_ARROW_DOWN,   2, 2
  LObj  LO::S_W_ARROW_LEFT,   0, 7
  LObj  LO::S_FG_GLASS_RED,   0, 8
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 10
  LObj  LO::S_W_ARROW_DOWN,   0, 8
  LObj  LO::S_M_CRATE,        0, 11
  LObjN LO::R_GROUND,         5, 11, 6, 3
  LObj  LO::S_PRIZE,          2, 7
  LObjN LO::R_COIN,           0, 9, 2, 0
  LObjN LO::R_BRICK,          1, 7, 2, 0
  LObjN LO::WIDE_1,           3, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_BRICK,          3, 3, 2, 0
  LObjN LO::R_GROUND,         0, 7, 3, 7
  LObjN LO::R_FG_GLASS_BLUE,  6, 7, 8, 0
  LObjN LO::R_COIN,           3, 5, 2, 0
  LObj  LO::S_SPRING,         1, 6
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 0, 6
  LObjN LO::R_GROUND,         7, 7, 3, 7
  LFinished

arrowsSprite:
  LSpr Enemy::CHECKPOINT,          0,  34,   9
  LSpr Enemy::CHECKPOINT,          0,  52,   4
  LSpr Enemy::CHECKPOINT,          0,  79,  11
  .byt 255 ; end
