arrows:
  .byt MusicTracks::NONE|0
  .byt 4
  .byt $f4
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_HANNAH
  .addr arrowsData
  .addr arrowsSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY3
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
  LWriteCol <SignPuzzleAbout, >SignPuzzleAbout
  LObjN LO::R_BG_GLASS_RED,   3, 6, 0, 3
  LObjN LO::WIDE_1,           2, 5, 1, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           0, 6, 1, 0
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
  LObj  LO::S_W_ARROW_UP,     0, 9
  LObjN LO::R_FG_GLASS_BLUE,  1, 9, 3, 0
  LObj  LO::S_W_ARROW_DOWN,   1, 5
  LObj  LO::S_W_CRATE,        0, 7
  LObj  LO::S_W_ARROW_RIGHT,  0, 8
  LObj  LO::S_W_ARROW_DOWN,   2, 2
  LObj  LO::S_W_ARROW_LEFT,   0, 7
  LObj  LO::S_FG_GLASS_RED,   0, 8
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 10
  LObj  LO::S_W_ARROW_DOWN,   0, 8
  LObj  LO::S_M_CRATE,        0, 11
  LObjN LO::R_BG_GLASS_GRAY,  4, 2, 2, 2
  LObjN LO::R_GROUND,         1, 11, 6, 3
  LObj  LO::S_PRIZE,          2, 7
  LObjN LO::R_COIN,           0, 9, 2, 0
  LObjN LO::R_BRICK,          1, 7, 2, 0
  LObjN LO::R_BG_GLASS_GRAY,  1, 1, 3, 1
  LObjN LO::WIDE_1,           2, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_BRICK,          3, 3, 2, 0
  LObjN LO::R_GROUND,         0, 7, 3, 7
  LObj  LO::S_SIGNPOST,       2, 6
  LWriteCol <SignPushableAbout, >SignPushableAbout
  LObjN LO::R_FG_GLASS_BLUE,  4, 7, 8, 0
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::PUSHABLE_BLOCK
  LObjN LO::R_FG_GLASS_BLUE,  3, 8, 0, 6
  LObj  LO::S_PRIZE,          3, 3
  LObjN LO::WIDE_1,           0, 3, 3, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           4, 3, 3, 3
  LObjN LO::R_GROUND,         0, 7, 3, 7
  LObjN LO::R_FG_GLASS_BLUE,  6, 7, 15, 0
  LObj  LO::R_CUSTOM,         2, 4, Metatiles::PUSHABLE_BLOCK, (0<<4)|2
  LObjN LO::R_FG_GLASS_BLUE,  3, 8, 0, 6
  LObjN LO::R_FG_GLASS_BLUE,  2, 9, 2, 2
  LObjN LO::R_BG_GLASS_RED,   1, 10, 5, 2
  LObjN LO::WIDE_1,           2, 3, 0, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 3, 3, 3
  LObjN LO::R_FG_GLASS_BLUE,  1, 13, 1, 0
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 1
  LObj  LO::S_W_ARROW_RIGHT,  0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 0, 2
  LObjN LO::R_SOLID_ROCK,     1, 3, 2, 3
  LObjN LO::R_GROUND,         1, 7, 3, 7
  LObjN LO::R_CEILING_BARRIER,4, 0, 0, 1
  LObjN LO::WIDE_1,           0, 8, 6, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 1, 7, 0
  LObj  LO::S_M_CRATE,        0, 2
  LObjN LO::R_SOLID_BLOCK,    0, 3, 7, 0
  LObjN LO::R_COIN,           1, 5, 1, 0
  LObjN LO::R_SOLID_BLOCK,    1, 8, 0, 6
  LObjN LO::R_GROUND,         1, 11, 9, 3
  LObj  LO::S_BIGHEART,       1, 10
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 2
  LObj  LO::S_W_ARROW_RIGHT,  0, 7
  LObjN LO::R_SOLID_BLOCK,    1, 4, 2, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 7, 0
  LObj  LO::S_SOLID_BLOCK,    1, 2
  LObj  LO::S_PRIZE,          2, 2
  LObj  LO::S_PRIZE,          2, 2
  LObj  LO::S_W_ARROW_RIGHT,  1, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 5, 3, 0
  LObj  LO::S_W_ARROW_UP,     0, 7
  LObjN LO::WIDE_1,           1, 11, 0, LN1::SOLID_LEDGE
  LObj  LO::S_W_ARROW_RIGHT,  2, 2
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::FORK_ARROW_UP
  LObj  LO::S_W_ARROW_DOWN,   1, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 4, 11, 1
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::METAL_CRATE, (1<<4)|0
  LObj  LO::S_W_ARROW_DOWN,   1, 3
  LObjN LO::R_COIN,           2, 3, 3, 0
  LObjN LO::WIDE_1,           1, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         1, 8, 1, 4
  LObjN LO::R_BG_GLASS_GREEN, 2, 2, 2, 0
  LObjN LO::R_GROUND,         0, 9, 0, 1
  LObjN LO::R_GROUND,         0, 11, 8, 3
  LObjN LO::R_BG_GLASS_GREEN, 1, 1, 0, 2
  LObj  LO::S_GROUND,         0, 10
  LObjN LO::WIDE_1,           3, 6, 1, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 5
  LObjN LO::R_BG_GLASS_RED,   2, 2, 5, 0
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 6
  LObjN LO::WIDE_1,           1, 11, 4, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 10, Metatiles::KEY_GREEN
  LObj  LO::S_BG_GLASS_RED,   1, 0
  LObj  LO::S_BG_GLASS_RED,   0, 4
  LObjN LO::WIDE_1,           0, 6, 1, LN1::SOLID_LEDGE
  LObj  LO::S_BG_GLASS_RED,   1, 1
  LObj  LO::S_BG_GLASS_RED,   0, 3
  LObj  LO::S_BG_GLASS_RED,   1, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 4, 0, 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 7, 0, 3
  LObjN LO::WIDE_1,           1, 4, 3, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::PUSHABLE_BLOCK
  LObjN LO::R_BG_GLASS_GREEN, 0, 7, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 1, 6, 0, 2
  LObj  LO::S_CEILING_BARRIER,2, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 3, 8
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 5
  LObjN LO::WIDE_1,           2, 13, 4, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 10, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 11
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::LOCK_GREEN
  LObjN LO::R_FG_GLASS_BLUE,  1, 6, 6, 0
  LObjN LO::WIDE_1,           3, 10, 5, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 9, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_BG_GLASS_GREEN, 0, 12, 2, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 7, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 3, 0, 2
  LObjN LO::R_BG_GLASS_GREEN, 0, 11, 0, 2
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObjN LO::R_BG_GLASS_BLUE,  1, 6, 4, 0
  LObjN LO::WIDE_1,           4, 12, 6, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  1, 3, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 4, 0
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_CUSTOM,         2, 5, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|4
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::TOGGLE_SWITCH
  LObjN LO::WIDE_1,           0, 9, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_BG_GLASS_GREEN, 1, 2, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 1, 1, 0, 2
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_ON
  LObj  LO::S_CUSTOM,         2, 6, Metatiles::TOGGLE_BLOCK_OFF
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::TOGGLE_BLOCK_ON, (3<<4)|1
  LObj  LO::S_CUSTOM,         3, 7, Metatiles::TOGGLE_BLOCK_OFF
  LObjN LO::R_FG_GLASS_BLUE,  3, 2, 7, 0
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|5
  LObjN LO::WIDE_1,           0, 9, 4, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         5, 9, 4, 5
  LObjN LO::R_FG_GLASS_BLUE,  2, 3, 0, 4
  LObj  LO::S_M_ARROW_RIGHT,  0, 4
  LObj  LO::S_W_ARROW_UP,     0, 8
  LObjN LO::WIDE_1,           3, 9, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           7, 8, 1, LN1::SOLID_LEDGE
  LObj  LO::S_M_ARROW_DOWN,   2, 4
  LObj  LO::S_M_ARROW_RIGHT,  0, 8
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::FORK_ARROW_DOWN, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::METAL_CRATE, (4<<4)|0
  LObjN LO::WIDE_1,           6, 7, 1, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         3, 7, Metatiles::METAL_CRATE, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::FORK_ARROW_UP, (3<<4)|0
  LObjN LO::WIDE_1,           6, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 11, 4
  LObjN LO::R_SOLID_BLOCK,    1, 7, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 10, 10, 4
  LObj  LO::S_EXIT_DOOR,      4, 8
  LFinished

arrowsSprite:
  LSpr Enemy::CHECKPOINT,          0,  34,   9
  LSpr Enemy::OWL,                 0,  39,   9
  LSpr Enemy::CHECKPOINT,          0,  52,   4
  LSpr Enemy::CHECKPOINT,          0,  79,  11
  LSpr Enemy::OWL,                 0,  84,  10
  LSpr Enemy::BIG_GLIDER,          0, 107,   1
  LSpr Enemy::BIG_GLIDER,          1, 123,   2
  LSpr Enemy::CHECKPOINT,          0, 126,   2
  LSpr Enemy::SNEAKER,             0, 137,   2
  LSpr Enemy::SNEAKER,             0, 139,   2
  LSpr Enemy::SNEAKER,             0, 141,   2
  LSpr Enemy::BIG_LWSS,            0, 162,   1
  LSpr Enemy::GOOMBA,              1, 172,   3
  LSpr Enemy::CHECKPOINT,          0, 183,  12
  LSpr Enemy::BIG_LWSS,            0, 185,  12, 1
  LSpr Enemy::CHECKPOINT,          0, 212,   8
  .byt 255 ; end
