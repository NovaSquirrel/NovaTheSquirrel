water:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr waterData
  .addr waterSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $00, $00 ; boundaries

waterData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 19
  LObjN LO::WIDE_1,           6, 12, 6, LN1::TALLGRASS
  LObjN LO::R_GROUND,         9, 11, 4, 1
  LObj  LO::S_SIGNPOST,       1, 10
  LWriteCol <WaterAbout, >WaterAbout
  LObj  LO::S_GROUND,         3, 10
  LObjN LO::R_WATER,          1, 10, 9, 3
  LObjN LO::R_GROUND,         0, 14, 9, 0
  LObj  LO::S_GROUND,         10, 10
  LObjN LO::R_GROUND,         0, 11, 11, 3
  LObjN LO::TALL_2,           1, 7, 3, LN2::TRUNK_L
  LObj  LO::S_SPRING,         2, 10
  LObjN LO::TALL_2,           1, 7, 3, LN2::TRUNK_L
  LObjN LO::R_GROUND,         2, 7, 5, 3
  LObjN LO::WIDE_2,           1, 6, 3, LN2::FLOWER
  LObjN LO::R_WATER,          5, 7, 4, 7
  LObjN LO::R_GROUND,         5, 0, 4, 9
  LObjN LO::R_WATER,          0, 10, 4, 4
  LObjN LO::R_WATER,          5, 7, 4, 7
  LObjN LO::R_SOLID_BLOCK,    3, 13, 1, 0
  LObjN LO::R_GROUND,         2, 7, 3, 7
  LObj  LO::S_PRIZE,          2, 3
  LObjN LO::WIDE_1,           2, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 10, 0, 1
  LObjN LO::RECT_1,           0, 12, 2, LN1::GROUND, 23
  LObjN LO::R_GROUND,         1, 0, 2, 4
  LObjN LO::R_WATER,          0, 5, 4, 1
  LObjN LO::WIDE_1,           1, 11, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         2, 0, 7, 1
  LObjN LO::R_WATER,          0, 2, 7, 1
  LObjN LO::R_WATER,          0, 4, 1, 0
  LObjN LO::WIDE_1,           2, 11, 2, LN1::SPIKES
  LObjN LO::R_WATER,          4, 4, 1, 0
  LObjN LO::R_WATER,          0, 5, 4, 1
  LObj  LO::S_BIGHEART,       0, 11
  LObjN LO::R_SOLID_BLOCK,    2, 7, 0, 4
  LObjN LO::R_COIN,           1, 2, 1, 1
  LObjN LO::R_WATER,          0, 7, 4, 1
  LObjN LO::R_GROUND,         0, 9, 10, 2
  LObjN LO::R_GROUND,         15, 9, 10, 5
  LFinished

waterSprite:
  LSpr Enemy::GOOMBA,              1,  18,  10
  LSpr Enemy::CANNON_1,            1,  50,  10
  LSpr Enemy::GEORGE,              1,  56,  12
  .byt 255 ; end
