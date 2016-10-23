glass_intro:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_HANNAH
  .addr glass_introData
  .addr glass_introSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt 255 ; end
  .byt $00, $00 ; boundaries

glass_introData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 17
  LObjN LO::R_GROUND,         11, 11, 5, 1
  LObj  LO::S_PRIZE,          4, 2
  LObjN LO::R_COIN,           0, 4, 1, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 7, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 7, 0, 3
  LObj  LO::S_BG_GLASS_BLUE,  0, 10
  LObjN LO::R_FG_GLASS_BLUE,  2, 2, 10, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 3, 0, 2
  LObj  LO::S_CUSTOM,         1, 5, Metatiles::KEY_GREEN
  LObjN LO::WIDE_1,           1, 12, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_GROUND,         2, 11, 2, 3
  LObjN LO::R_BG_GLASS_BLUE,  1, 7, 0, 3
  LObjN LO::WIDE_1,           1, 7, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_FG_GLASS_RED,   0, 10, 9, 0
  LObjN LO::R_BG_GLASS_BLUE,  4, 3, 0, 12
  LObj  LO::S_FG_GLASS_RED,   0, 10
  LObjN LO::R_CEILING_BARRIER,4, 0, 0, 1
  LObjN LO::R_FG_GLASS_RED,   1, 2, 0, 6
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::LOCK_GREEN
  LObjN LO::R_GROUND,         0, 11, 2, 3
  LObjN LO::R_FG_GLASS_RED,   1, 2, 8, 0
  LObj  LO::S_SPRING,         2, 10
  LObjN LO::R_GROUND,         0, 11, 0, 2
  LObj  LO::S_GROUND,         1, 11
  LObjN LO::R_FG_GLASS_RED,   1, 8, 8, 0
  LObj  LO::S_PRIZE,          2, 5
  LObjN LO::R_BG_GLASS_RED,   2, 3, 0, 4
  LObjN LO::R_BG_GLASS_RED,   0, 9, 0, 5
  LObjN LO::R_SOLID_ROCK,     6, 9, 1, 0
  LObjN LO::R_FG_GLASS_BLUE,  4, 2, 11, 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 5, 0, 6
  LObjN LO::R_FG_GLASS_BLUE,  0, 12, 11, 2
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::R_BRICK,          2, 8, 4, 0
  LObjN LO::R_AIR,            1, 4, 2, 0
  LObj  LO::S_PRIZE,          1, 5
  LObjN LO::R_BRICK,          2, 5, 0, 2
  LObj  LO::S_COIN,           1, 10
  LObjN LO::R_SOLID_ROCK,     0, 11, 2, 0
  LObj  LO::S_COIN,           2, 8
  LObjN LO::R_BG_GLASS_BLUE,  1, 5, 0, 6
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 4, 0
  LObjN LO::WIDE_1,           0, 8, 5, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 12, 5, LN1::SOLID_LEDGE
  LObj  LO::S_COIN,           1, 7
  LObj  LO::S_W_ARROW_DOWN,   2, 6
  LObjN LO::R_SOLID_BLOCK,    0, 8, 0, 2
  LObj  LO::S_M_CRATE,        0, 11
  LObjN LO::R_FG_GLASS_BLUE,  2, 2, 0, 5
  LObjN LO::WIDE_1,           1, 7, 8, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           1, 10, 2, 0
  LObjN LO::WIDE_1,           0, 11, 2, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_GRAY,  1, 2, 3, 0
  LObjN LO::R_BG_GLASS_GRAY,  1, 3, 3, 0
  LObjN LO::R_BG_GLASS_GRAY,  1, 4, 3, 0
  LObjN LO::R_COIN,           0, 8, 2, 0
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         5, 7, 2, 7
  LObjN LO::R_GROUND,         3, 10, 9, 5
  LObjN LO::R_GROUND,         2, 3, 5, 4
  LObjN LO::WIDE_1,           6, 2, 14, LN1::SPIKES
  LObjN LO::R_FG_GLASS_RED,   0, 3, 1, 4
  LObjN LO::R_BG_GLASS_RED,   0, 8, 1, 1
  LObjN LO::R_FG_GLASS_RED,   2, 3, 13, 0
  LObjN LO::R_GROUND,         0, 11, 5, 3
  LObjN LO::R_BG_GLASS_GRAY,  2, 7, 3, 0
  LObjN LO::R_BG_GLASS_GRAY,  1, 6, 3, 0
  LObjN LO::R_BG_GLASS_GRAY,  1, 5, 3, 0
  LObj  LO::S_COIN,           2, 8
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_RED,   2, 4, 0, 3
  LObjN LO::R_GROUND,         0, 8, 5, 6
  LObj  LO::S_PRIZE,          2, 5
  LObjN LO::R_FG_GLASS_RED,   3, 2, 13, 0
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::ICE, (0<<4)|3
  LObjN LO::R_SOLID_BLOCK,    1, 8, 1, 0
  LObjN LO::R_SOLID_BLOCK,    1, 6, 0, 1
  LObj  LO::R_CUSTOM,         2, 8, Metatiles::ICE, (6<<4)|0
  LObjN LO::R_COIN,           1, 1, 5, 0
  LObj  LO::S_COIN,           1, 5
  LObj  LO::S_W_ARROW_DOWN,   2, 7
  LObj  LO::S_W_ARROW_RIGHT,  0, 11
  LObj  LO::S_CUSTOM,         2, 9, Metatiles::ICE
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::ICE, (11<<4)|0
  LObj  LO::S_COIN,           1, 7
  LObjN LO::R_FG_GLASS_RED,   1, 3, 7, 2
  LObj  LO::S_W_ARROW_DOWN,   1, 11
  LObj  LO::S_W_ARROW_RIGHT,  0, 13
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_RED,   0, 6, 8, 0
  LObj  LO::S_COIN,           0, 8
  LObj  LO::S_COIN,           3, 9
  LObj  LO::S_W_ARROW_RIGHT,  1, 2
  LObj  LO::S_W_ARROW_UP,     0, 13
  LObj  LO::S_COIN,           1, 7
  LObjN LO::R_FG_GLASS_RED,   1, 4, 0, 1
  LObj  LO::S_FG_GLASS_RED,   1, 5
  LObj  LO::S_W_ARROW_DOWN,   1, 2
  LObjN LO::R_FG_GLASS_RED,   0, 7, 0, 1
  LObj  LO::S_M_CRATE,        0, 9
  LObjN LO::R_GROUND,         0, 10, 3, 4
  LObjN LO::WIDE_1,           4, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         1, 8, 1, 6
  LObjN LO::WIDE_1,           3, 8, 0, LN1::SPIKES
  LObjN LO::R_GROUND,         0, 9, 10, 5
  LObjN LO::R_COIN,           3, 4, 4, 0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::WOOD_CRATE, (4<<4)|0
  LObjN LO::R_FG_GLASS_BLUE,  6, 3, 10, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 8, 0
  LObj  LO::R_CUSTOM,         2, 9, Metatiles::WOOD_CRATE, (4<<4)|0
  LObjN LO::R_COIN,           1, 6, 2, 0
  LObjN LO::R_GROUND,         5, 9, 3, 5
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 0, 4
  LObj  LO::S_SPRING,         2, 8
  LObjN LO::R_GROUND,         1, 12, 3, 2
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::WIDE_1,           1, 6, 4, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         4, 12, 4, 2
  LObjN LO::R_GROUND,         1, 6, 4, 2
  LObjN LO::R_BG_GLASS_GREEN, 0, 9, 0, 2
  LObjN LO::R_GROUND,         4, 13, 1, 1
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 2, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 2
  LObjN LO::WIDE_1,           0, 13, 4, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 0, 4, 0
  LObj  LO::S_CUSTOM,         0, 1, Metatiles::KEY_RED
  LObj  LO::S_M_CRATE,        0, 2
  LObjN LO::WIDE_1,           0, 4, 0, LN1::SOLID_LEDGE
  LObj  LO::S_W_ARROW_UP,     0, 10
  LObj  LO::S_SOLID_BLOCK,    1, 0
  LObj  LO::S_SOLID_BLOCK,    0, 0
  LObjN LO::R_SOLID_BLOCK,    0, 1, 0, 1
  LObjN LO::R_GROUND,         0, 6, 4, 2
  LObj  LO::S_SOLID_BLOCK,    2, 12
  LObjN LO::R_SOLID_BLOCK,    2, 0, 0, 4
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::LOCK_RED
  LObjN LO::R_BG_GLASS_GREEN, 0, 9, 0, 5
  LObjN LO::WIDE_1,           1, 8, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           6, 11, 4, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         7, 11, Metatiles::WOOD_CRATE, (2<<4)|0
  LObj  LO::R_CUSTOM,         3, 9, Metatiles::WOOD_CRATE, (2<<4)|0
  LObj  LO::R_CUSTOM,         3, 7, Metatiles::WOOD_CRATE, (2<<4)|0
  LObj  LO::R_CUSTOM,         3, 5, Metatiles::WOOD_CRATE, (2<<4)|0
  LObjN LO::R_GROUND,         4, 5, 4, 9
  LFinished

glass_introSprite:
  LSpr Enemy::GOOMBA,              1,  21,   5
  LSpr Enemy::FIRE_WALK,           0,  92,  10, 1
  LSpr Enemy::GOOMBA,              0, 108,   7
  LSpr Enemy::GOOMBA,              0, 117,   9
  LSpr Enemy::BALL_GUY,            1, 124,   8
  LSpr Enemy::ICE_1,               0, 164,  11
  LSpr Enemy::ICE_1,               1, 167,   5
  LSpr Enemy::OWL,                 0, 178,   7
  LSpr Enemy::OWL,                 1, 184,  10
  .byt 255 ; end
