funkunderground:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr funkundergroundData
  .addr funkundergroundSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt 255 ; end
  .word %0000000000000000 ; boundaries

funkundergroundData:
  LObjN LO::R_GROUND,         0, 1, 0, 11
  LObjN LO::R_GROUND,         0, 13, 10, 1
  LObjN LO::R_SOLID_BLOCK,    10, 11, 0, 1
  LObjN LO::R_GROUND,         4, 13, 9, 1
  LObjN LO::R_SOLID_BLOCK,    2, 9, 3, 1
  LObjN LO::R_SOLID_BLOCK,    2, 1, 1, 7
  LObjN LO::R_BRICK,          2, 9, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 9, 0, 3
  LObjN LO::WIDE_1,           2, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         2, 13, 9, 1
  LObjN LO::WIDE_1,           2, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_BRICK,          0, 1, 2, 0
  LObjN LO::R_SOLID_BLOCK,    5, 10, 0, 2
  LObjN LO::WIDE_1,           4, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_BRICK,          1, 1, 6, 0
  LObj  LO::S_SOLID_BLOCK,    2, 9
  LObjN LO::WIDE_1,           1, 4, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 3
  LObjN LO::R_SOLID_BLOCK,    0, 11, 3, 1
  LObjN LO::R_SOLID_BLOCK,    1, 8, 3, 1
  LObj  LO::S_SPRING,         1, 7
  LObjN LO::R_SOLID_BLOCK,    0, 10, 1, 0
  LObjN LO::R_SOLID_BLOCK,    1, 1, 1, 6
  LObjN LO::R_BRICK,          4, 4, 6, 0
  LObjN LO::R_COIN,           1, 3, 4, 0
  LObjN LO::R_GROUND,         4, 13, 15, 1
  LObjN LO::R_BRICK,          0, 10, 2, 2
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::BRICKPRIZE
  LObjN LO::R_BRICK,          0, 7, 0, 2
  LObjN LO::R_BRICK,          0, 1, 15, 0
  LObjN LO::R_BRICK,          3, 9, 5, 0
  LObjN LO::R_BRICK,          1, 2, 4, 0
  LObjN LO::R_BRICK,          3, 3, 1, 6
  LObj  LO::S_CUSTOM,         2, 9, Metatiles::BRICKPRIZE
  LObj  LO::S_SOLID_BLOCK,    4, 10
  LObj  LO::S_SOLID_BLOCK,    2, 8
  LObj  LO::S_SOLID_BLOCK,    2, 6
  LObjN LO::R_BRICK,          1, 6, 1, 2
  LObjN LO::R_BRICK,          1, 1, 4, 0
  LObjN LO::R_SOLID_BLOCK,    1, 11, 3, 1
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObjN LO::R_BRICK,          1, 7, 2, 0
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::BRICKPRIZE
  LObjN LO::R_SOLID_BLOCK,    2, 9, 0, 1
  LObjN LO::R_BRICK,          0, 2, 0, 1
  LObjN LO::RECT_1,           6, 13, 1, LN1::GROUND, 23
  LObjN LO::R_BRICK,          0, 1, 7, 0
  LObjN LO::R_SOLID_BLOCK,    1, 11, 3, 1
  LObjN LO::R_SOLID_BLOCK,    1, 9, 3, 1
  LObj  LO::S_SOLID_BLOCK,    0, 8
  LObjN LO::R_BRICK,          5, 6, 8, 3
  LObjN LO::R_BRICK,          0, 2, 8, 1
  LObjN LO::R_COIN,           1, 5, 5, 0
  LObj  LO::S_CUSTOM,         2, 2, Metatiles::BRICKPRIZE
  LObjN LO::RECT_1,           5, 1, 0, LN1::BRICKS, 23
  LObjN LO::R_SOLID_BLOCK,    3, 10, 1, 2
  LObjN LO::R_BRICK,          6, 6, 8, 3
  LObjN LO::R_BRICK,          0, 2, 2, 3
  LObjN LO::WIDE_1,           1, 13, 3, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         5, 13, 12, 1
  LObjN LO::R_SOLID_BLOCK,    3, 9, 5, 0
  LObjN LO::RECT_1,           13, 13, 1, LN1::GROUND, 16
  LObjN LO::RECT_1,           2, 1, 3, LN1::BRICKS, 22
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::R_BRICK,          1, 9, 8, 3
  LObjN LO::WIDE_1,           10, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    2, 9, 3, 0
  LObjN LO::R_SOLID_BLOCK,    3, 8, 4, 0
  LObjN LO::RECT_1,           1, 13, 1, LN1::GROUND, 24
  LObjN LO::R_SOLID_BLOCK,    3, 9, 0, 3
  LObjN LO::R_BRICK,          1, 5, 7, 7
  LObjN LO::R_BRICK,          0, 1, 10, 0
  LObjN LO::R_BRICK,          8, 9, 11, 3
  LObjN LO::R_BRICK,          3, 1, 0, 5
  LObj  LO::S_SPRING,         1, 5
  LObj  LO::S_SOLID_BLOCK,    0, 6
  LObjN LO::R_BRICK,          1, 6, 1, 0
  LObjN LO::R_BRICK,          0, 1, 9, 0
  LObjN LO::R_SOLID_BLOCK,    0, 3, 9, 0
  LObjN LO::R_BRICK,          6, 7, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 4
  LObj  LO::S_COIN,           4, 2
  LObj  LO::S_COIN,           2, 4
  LObj  LO::S_COIN,           2, 6
  LObjN LO::RECT_1,           1, 13, 1, LN1::GROUND, 16
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 8
  LObjN LO::R_BRICK,          1, 1, 11, 8
  LObjN LO::R_SOLID_BLOCK,    0, 0, 11, 0
  LObj  LO::S_SPRING,         3, 12
  LObjN LO::R_AIR,            0, 5, 1, 1
  LObj  LO::S_SPRING,         1, 6
  LObjN LO::R_AIR,            0, 1, 2, 1
  LObj  LO::S_DOOR,           1, 2
  LObjN LO::R_BRICK,          7, 1, 11, 1
  LObj  LO::S_PRIZE,          0, 9
  LObjN LO::RECT_1,           6, 13, 1, LN1::GROUND, 20
  LObjN LO::R_SOLID_BLOCK,    1, 10, 1, 2
  LXPlus16
  LObj  LO::S_EXIT_DOOR,      1, 12
  LXPlus16
  LObjN LO::R_GROUND,         3, 13, 15, 1
  LObjN LO::R_SOLID_BLOCK,    0, 1, 15, 1
  LObjN LO::R_SOLID_BLOCK,    0, 3, 1, 9
  LObj  LO::S_DOOR,           3, 12
  LObjN LO::R_COIN,           1, 5, 7, 5
  LObj  LO::S_SPRING,         2, 12
  LObj  LO::S_SPRING,         3, 12
  LObjN LO::R_SOLID_BLOCK,    5, 3, 1, 9
  LFinished

funkundergroundSprite:
  LSpr Enemy::GOOMBA,              1,  20,  12
  LSpr Enemy::THWOMP,              0,  28,   2
  LSpr Enemy::THWOMP,              0,  38,   2
  LSpr Enemy::SPINNER,             1,  55,   2
  LSpr Enemy::GEORGE,              1,  63,  12
  LSpr Enemy::GOOMBA,              1,  73,   5
  LSpr Enemy::GOOMBA,              1,  77,   6
  LSpr Enemy::GOOMBA,              1,  95,  12
  LSpr Enemy::FIRE_JUMP,           1,  98,   5
  LSpr Enemy::SNEAKER,             0, 111,   5
  LSpr Enemy::SNEAKER,             0, 113,   5
  LSpr Enemy::OWL,                 1, 140,   8
  LSpr Enemy::SNEAKER,             1, 161,   4
  LSpr Enemy::SNEAKER,             1, 172,   2
  LSpr Enemy::GOOMBA,              1, 173,   6
  LSpr Enemy::GOOMBA,              1, 195,  12
  LSpr Enemy::GOOMBA,              1, 197,  12
  LSpr Enemy::GEORGE,              1, 208,  12
  .byt 255 ; end
