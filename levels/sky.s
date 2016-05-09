sky:
  .byt MusicTracks::NONE|0
  .byt 5
  .byt $f5
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr skyData
  .addr skySprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $00, $00 ; boundaries

skyData:
  LObjN LO::R_GROUND,         4, 7, 3, 7
  LObjN LO::WIDE_1,           6, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 10, 2, LN1::FENCE
  LObjN LO::R_GROUND,         0, 11, 6, 3
  LObj  LO::S_PRIZE,          3, 7
  LObj  LO::S_SPRING,         3, 10
  LObjN LO::WIDE_1,           4, 8, 1, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    2, 8
  LObjN LO::TALL_2,           0, 9, 5, LN2::TRUNK
  LObjN LO::R_COIN,           3, 5, 2, 0
  LObj  LO::S_SOLID_BLOCK,    0, 6
  LObjN LO::TALL_2,           0, 7, 7, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    5, 6
  LObjN LO::TALL_2,           0, 7, 7, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 6, 3, LN1::FALLTHROUGH_LEDGE
  LObj  LO::R_CUSTOM,         2, 12, Metatiles::SPRING, (1<<4)|0
  LObjN LO::R_GROUND,         0, 13, 1, 1
  LObjN LO::WIDE_1,           2, 13, 0, LN1::SPIKES
  LObj  LO::S_GROUND,         0, 14
  LObjN LO::R_SOLID_BLOCK,    1, 1, 0, 4
  LObjN LO::TALL_2,           0, 6, 8, LN2::TRUNK
  LObjN LO::WIDE_1,           2, 10, 6, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           7, 4, 6, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 10, 3, 4
  LObjN LO::TALL_1,           3, 4, 5, LN1::LADDER
  LObjN LO::R_GROUND,         8, 4, 3, 10
  LObjN LO::WIDE_2,           1, 3, 1, LN2::FLOWER
  LObj  LO::S_COIN,           5, 3
  LObjN LO::R_COIN,           1, 5, 0, 1
  LObjN LO::R_COIN,           0, 8, 0, 2
  LObjN LO::WIDE_1,           0, 13, 6, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         2, 0, 3, 10
  LObjN LO::WIDE_1,           4, 6, 2, LN1::SPIKES
  LObjN LO::WIDE_1,           0, 7, 3, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         3, 5
  LObj  LO::S_SOLID_BLOCK,    0, 6
  LObjN LO::WIDE_1,           0, 11, 3, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         3, 9
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObjN LO::R_GROUND,         1, 2, 0, 1
  LObjN LO::R_GROUND,         0, 4, 3, 10
  LObjN LO::WIDE_1,           1, 3, 1, LN1::FENCE
  LObjN LO::TALL_1,           3, 4, 4, LN1::LADDER
  LObjN LO::R_GROUND,         0, 9, 8, 5
  LObjN LO::WIDE_1,           1, 4, 5, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_GROUND,         12, 9, 6, 5
  LFinished

skySprite:
  LSpr Enemy::OWL,                 0,  13,  10
  LSpr Enemy::FIRE_JUMP,           0,  37,   5
  LSpr Enemy::GEORGE,              1,  50,   9
  LSpr Enemy::FIRE_JUMP,           1,  53,   3
  LSpr Enemy::GOOMBA,              0,  73,   5
  LSpr Enemy::KING,                0,  86,   1
  .byt 255 ; end
