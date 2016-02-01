introlevel:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr introlevelData
  .addr introlevelSprite
  .byt $2c ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .word %0000000000000000 ; boundaries

introlevelData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 45
  LObj  LO::S_GROUND_CLIMB_L, 8, 12
  LObj  LO::S_GROUND_CLIMB_L, 1, 11
  LObjN LO::R_GROUND,         0, 12, 6, 0
  LObjN LO::R_COIN,           1, 5, 4, 0
  LObj  LO::S_GROUND_CLIMB_L, 0, 10
  LObjN LO::R_GROUND,         0, 11, 4, 0
  LObjN LO::R_GROUND,         1, 10, 2, 0
  LObj  LO::S_SPRING,         1, 9
  LObj  LO::S_GROUND_CLIMB_R, 2, 10
  LObj  LO::S_GROUND_CLIMB_R, 1, 11
  LObj  LO::S_GROUND_CLIMB_R, 1, 12
  LObjN LO::R_BRICK,          3, 9, 5, 0
  LObj  LO::S_PRIZE,          1, 9
  LObjN LO::R_BRICK,          1, 6, 2, 0
  LObj  LO::S_BRICKPRIZE,     1, 6
  LObj  LO::S_SIGNPOST,       0, 12
  LObjN LO::WIDE_1,           1, 9, 1, LN1::BRICKPRIZE
  LObj  LO::S_SOLID_BLOCK,    4, 11
  LObjN LO::R_GROUND,         0, 12, 8, 0
  LObj  LO::S_COIN,           8, 9
  LObj  LO::S_SPRING,         0, 10
  LObj  LO::S_SOLID_BLOCK,    0, 11
  LObj  LO::S_COIN,           1, 8
  LObj  LO::S_COIN,           1, 7
  LObj  LO::S_COIN,           1, 6
  LObjN LO::R_GROUND,         0, 8, 7, 2
  LObjN LO::WIDE_1,           3, 10, 2, LN1::PRIZE
  LObjN LO::R_GROUND,         3, 11, 1, 1
  LObjN LO::R_GROUND,         5, 8, 2, 6
  LObjN LO::R_GROUND,         3, 10, 2, 4
  LObjN LO::WIDE_1,           3, 10, 9, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 12, 2, 2
  LObj  LO::S_PRIZE,          2, 6
  LObjN LO::WIDE_1,           1, 10, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 20
  LObj  LO::S_COIN,           1, 11
  LObjN LO::R_SOLID_BLOCK,    5, 3, 0, 6
  LObj  LO::S_GROUND_CLIMB_L, 4, 12
  LObj  LO::S_GROUND_CLIMB_L, 1, 11
  LObjN LO::R_GROUND,         0, 12, 9, 0
  LObj  LO::S_GROUND_CLIMB_L, 1, 10
  LObjN LO::R_GROUND,         0, 11, 8, 0
  LObj  LO::S_GROUND_CLIMB_L, 1, 9
  LObjN LO::R_GROUND,         0, 10, 7, 0
  LObjN LO::R_GROUND,         1, 9, 6, 0
  LObjN LO::WIDE_1,           1, 5, 4, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 3, 0, 1
  LObjN LO::R_COIN,           0, 6, 0, 1
  LObj  LO::S_SPRING,         0, 8
  LObjN LO::WIDE_1,           2, 4, 0, LN1::SPIKES
  LObj  LO::S_SOLID_BLOCK,    2, 5
  LObjN LO::WIDE_1,           0, 6, 9, LN1::SOLID_LEDGE
  LObj  LO::S_SIGNPOST,       3, 5
  LObjN LO::R_SOLID_BLOCK,    2, 6, 0, 4
  LObjN LO::WIDE_1,           0, 11, 11, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    4, 5
  LObjN LO::TALL_1,           6, 6, 4, LN1::LADDER
  LObjN LO::R_SOLID_BLOCK,    1, 6, 0, 4
  LObjN LO::R_SOLID_BLOCK,    1, 6, 4, 0
  LObjN LO::R_COIN,           1, 5, 1, 0
  LObjN LO::R_GROUND,         1, 7, 4, 7
  LObj  LO::S_GROUND_CLIMB_R, 5, 7
  LObjN LO::R_GROUND,         0, 8, 0, 6
  LObj  LO::S_GROUND_CLIMB_R, 1, 8
  LObj  LO::S_GROUND,         0, 9
  LObjN LO::R_GROUND,         0, 10, 1, 4
  LObj  LO::S_GROUND_CLIMB_R, 1, 9
  LObjN LO::R_GROUND,         1, 10, 6, 4
  LObjN LO::R_COIN,           2, 7, 0, 1
  LObjN LO::WIDE_1,           1, 7, 4, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         1, 7, 2, 2
  LObjN LO::WIDE_1,           3, 11, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 13, 14, 1
  LObjN LO::WIDE_1,           1, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         6, 11, 7, 1
  LObjN LO::WIDE_1,           10, 11, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         5, 11, 7, 3
  LObjN LO::WIDE_1,           9, 10, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         1, 8, 7, 6
  LObj  LO::S_GROUND_CLIMB_R, 8, 8
  LObjN LO::R_GROUND,         0, 9, 3, 5
  LObj  LO::S_GROUND_CLIMB_R, 4, 9
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObj  LO::S_GROUND_CLIMB_R, 5, 10
  LObjN LO::R_GROUND,         0, 11, 14, 3
  LFinished

introlevelSprite:
  LSpr Enemy::GOOMBA,              1,  28,  11
  LSpr Enemy::OWL,                 0,  39,   7
  LSpr Enemy::OWL,                 0,  53,   9
  LSpr Enemy::GOOMBA,              1,  62,   9
  LSpr Enemy::FIRE_WALK,           1,  87,   5
  LSpr Enemy::FIRE_JUMP,           0,  89,  10
  LSpr Enemy::GOOMBA,              1, 106,   9
  LSpr Enemy::GOOMBA,              1, 108,   9
  LSpr Enemy::OWL,                 0, 111,   6
  .byt 255 ; end
