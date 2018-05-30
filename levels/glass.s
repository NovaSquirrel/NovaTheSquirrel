glass:
  .byt MusicTracks::WORLD_2|0
  .byt 9
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr glassData
  .addr glassSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt 255 ; end
  .byt $00, $00 ; boundaries

glassData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 22
  LObjN LO::R_BRICK,          3, 3, 5, 1
  LObjN LO::R_BG_GLASS_BLUE,  0, 6, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 7, 0, 5
  LObj  LO::S_PRIZE,          2, 6
  LObj  LO::S_W_ARROW_UP,     0, 10
  LObjN LO::R_BG_GLASS_BLUE,  2, 7, 0, 5
  LObjN LO::R_BRICK,          2, 2, 3, 1
  LObjN LO::R_BG_GLASS_RED,   2, 6, 0, 6
  LObjN LO::R_BG_GLASS_RED,   1, 6, 2, 0
  LObjN LO::RECT_1,           1, 1, 1, LN1::BRICKS, 18
  LObj  LO::S_PRIZE,          0, 6
  LObj  LO::S_W_ARROW_UP,     0, 10
  LObjN LO::R_BG_GLASS_RED,   2, 6, 0, 6
  LObj  LO::S_COIN,           3, 10
  LObjN LO::R_FG_GLASS_BLUE,  0, 12, 4, 0
  LObj  LO::S_COIN,           1, 9
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 3, 0
  LObj  LO::S_COIN,           1, 8
  LObjN LO::R_FG_GLASS_BLUE,  0, 10, 2, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 9, 1, 0
  LObj  LO::S_COIN,           1, 7
  LObjN LO::R_GROUND,         1, 9, 1, 5
  LObjN LO::R_FG_GLASS_RED,   2, 5, 6, 0
  LObjN LO::R_BG_GLASS_RED,   0, 6, 0, 2
  LObjN LO::R_FG_GLASS_RED,   0, 9, 6, 0
  LObjN LO::R_BG_GLASS_RED,   6, 6, 0, 2
  LObjN LO::R_GROUND,         1, 9, 1, 5
  LObjN LO::R_BG_GLASS_BLUE,  2, 1, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 2, 0, 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 5, 4, 0
  LObjN LO::R_FG_GLASS_RED,   0, 9, 2, 0
  LObjN LO::R_FG_GLASS_RED,   0, 10, 3, 0
  LObjN LO::R_FG_GLASS_RED,   0, 11, 4, 1
  LObjN LO::R_BG_GLASS_BLUE,  4, 2, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 12, 2, 0
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::R_FG_GLASS_RED,   1, 7, 7, 0
  LObjN LO::R_BG_GLASS_RED,   0, 8, 0, 3
  LObj  LO::S_BRICK,          2, 4
  LObj  LO::S_PRIZE,          1, 4
  LObjN LO::R_GROUND,         0, 8, 1, 6
  LObj  LO::S_BRICK,          1, 4
  LObjN LO::R_BG_GLASS_BLUE,  1, 3, 7, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 2
  LObj  LO::S_SPRING,         1, 6
  LObjN LO::R_BG_GLASS_BLUE,  0, 10, 6, 0
  LObjN LO::R_FG_GLASS_RED,   5, 6, 3, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 0, 1
  LObjN LO::R_BG_GLASS_BLUE,  0, 7, 0, 2
  LObjN LO::R_COIN,           1, 4, 2, 0
  LObjN LO::R_FG_GLASS_RED,   1, 7, 0, 7
  LObjN LO::R_FG_GLASS_RED,   1, 6, 2, 0
  LObjN LO::R_GROUND,         3, 10, 4, 4
  LObjN LO::R_BG_GLASS_BLUE,  3, 0, 0, 5
  LObjN LO::R_BG_GLASS_BLUE,  0, 6, 6, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 0, 4, 0
  LObjN LO::R_GROUND,         1, 12, 9, 2
  LObjN LO::R_BG_GLASS_BLUE,  4, 0, 0, 5
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::R_ROCK,           1, 8, 3, 3
  LObjN LO::WIDE_1,           5, 6, 3, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObjN LO::WIDE_1,           1, 12, 8, LN1::SPIKES
  LObjN LO::R_GROUND,         0, 13, 8, 1
  LObjN LO::R_BG_GLASS_GREEN, 2, 2, 6, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 3, 0, 4
  LObjN LO::R_BG_GLASS_GREEN, 0, 8, 6, 0
  LObjN LO::WIDE_1,           2, 6, 3, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObjN LO::R_BG_GLASS_GREEN, 3, 3, 0, 4
  LObjN LO::WIDE_1,           2, 5, 1, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 8
  LObjN LO::R_GROUND,         0, 9, 1, 5
  LObjN LO::WIDE_1,           2, 4, 3, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   0, 11, 1, 3
  LObjN LO::R_FG_GLASS_RED,   2, 13, 5, 1
  LObjN LO::R_COIN,           2, 2, 3, 0
  LObjN LO::R_GROUND,         0, 4, 3, 6
  LObjN LO::R_COIN,           0, 11, 2, 1
  LObjN LO::R_FG_GLASS_RED,   3, 11, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  1, 4, 6, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 12, 4, 2
  LObjN LO::R_FG_GLASS_BLUE,  4, 7, 7, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 8, 0, 3
  LObj  LO::S_PRIZE,          6, 3
  LObjN LO::R_FG_GLASS_BLUE,  1, 1, 0, 5
  LObjN LO::R_BG_GLASS_GRAY,  0, 8, 0, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 12, 6, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 1, 5, 0
  LObjN LO::WIDE_1,           1, 6, 3, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 3
  LObj  LO::S_W_ARROW_UP,     0, 9
  LObj  LO::S_SPRING,         2, 11
  LObjN LO::R_BG_GLASS_GRAY,  1, 2, 0, 9
  LObjN LO::WIDE_1,           1, 6, 3, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  4, 6, 3, 8
  LObjN LO::R_BG_GLASS_GRAY,  4, 2, 5, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 3, 0, 2
  LObjN LO::R_GROUND,         0, 6, 5, 8
  LObjN LO::R_BG_GLASS_GRAY,  5, 3, 0, 2
  LObj  LO::S_PRIZE,          1, 6
  LObjN LO::R_GROUND,         0, 9, 6, 5
  LObjN LO::R_SOLID_ROCK,     5, 7, 1, 1
  LObjN LO::R_COIN,           1, 4, 4, 0
  LObjN LO::R_BG_GLASS_GRAY,  1, 7, 2, 0
  LObjN LO::R_SOLID_ROCK,     3, 7, 1, 1
  LObjN LO::R_GROUND,         0, 9, 5, 5
  LObjN LO::R_FG_GLASS_BLUE,  9, 9, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  2, 10, 0, 4
  LObjN LO::R_BG_GLASS_RED,   5, 5, 4, 0
  LObjN LO::R_BG_GLASS_RED,   0, 6, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 4, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 4, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 13, 4, 0
  LObj  LO::S_PRIZE,          2, 5
  LObjN LO::R_BG_GLASS_RED,   2, 6, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  3, 9, 4, 0
  LObjN LO::R_COIN,           1, 7, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 10, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  5, 7, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 0, 0, 6
  LObjN LO::R_FG_GLASS_BLUE,  4, 5, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 0, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  5, 5, 2, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 0, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 10, 7, 0
  LObjN LO::R_GROUND,         0, 11, 7, 3
  LObjN LO::R_BG_GLASS_BLUE,  1, 0, 0, 4
  LObj  LO::S_SPRING,         2, 9
  LObjN LO::R_GROUND,         5, 12, 7, 2
  LObjN LO::WIDE_1,           7, 8, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 11
  LObj  LO::S_PRIZE,          2, 4
  LObjN LO::R_GROUND,         2, 12, 7, 2
  LFinished

glassSprite:
  LSpr Enemy::GOOMBA,              1,  28,   8
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 103,  12, 4
  .byt 255 ; end
