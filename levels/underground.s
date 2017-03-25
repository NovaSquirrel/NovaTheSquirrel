underground:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $f8
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr undergroundData
  .addr undergroundSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $00, $0c ; boundaries

undergroundData:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LObjN LO::RECT_1,           0, 10, 4, LN1::GROUND, 19
  LObjN LO::R_BRICK,          5, 1, 9, 5
  LObjN LO::WIDE_1,           0, 9, 9, LN1::TALLGRASS
  LObjN LO::R_AIR,            1, 2, 3, 2
  LObj  LO::S_PRIZE,          1, 3
  LObjN LO::R_AIR,            1, 4, 2, 1
  LObjN LO::WIDE_1,           1, 7, 0, LN1::SOLID_LEDGE
  LObjN LO::R_CEILING_BARRIER,5, 0, 0, 6
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 4
  LObjN LO::R_BRICK,          0, 4, 15, 1
  LObj  LO::S_BIGHEART,       1, 3
  LObjN LO::R_AIR,            1, 4, 2, 0
  LObj  LO::S_PRIZE,          1, 2
  LObjN LO::WIDE_1,           1, 9, 0, LN1::SPIKES
  LObjN LO::WIDE_1,           2, 13, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 4
  LObjN LO::R_BRICK,          0, 9, 3, 0
  LObjN LO::R_COIN,           2, 7, 1, 0
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 19
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::R_GROUND,         1, 10, 13, 2
  LObjN LO::TALL_2,           2, 8, 1, LN2::TRUNK_L
  LObjN LO::R_BRICK,          1, 2, 1, 1
  LObjN LO::TALL_2,           1, 8, 1, LN2::TRUNK_L
  LObjN LO::RECT_1,           1, 2, 0, LN1::BRICKS, 16
  LObj  LO::S_PRIZE,          2, 6
  LObjN LO::RECT_1,           3, 7, 0, LN1::SOLID_BLOCK, 25
  LObjN LO::R_SOLID_BLOCK,    0, 8, 3, 1
  LObj  LO::S_DOOR,           4, 11
  LWriteCol 11, 212
  LObjN LO::R_SOLID_BLOCK,    1, 6, 6, 0
  LObjN LO::WIDE_2,           0, 12, 2, LN2::FLOWER
  LObjN LO::R_BRICK,          2, 8, 5, 1
  LObjN LO::R_COIN,           1, 1, 3, 0
  LObjN LO::WIDE_1,           1, 13, 1, LN1::SOLID_LEDGE
  LObjN LO::R_BRICK,          3, 13, 12, 1
  LObjN LO::WIDE_1,           1, 6, 0, LN1::SPIKES
  LObjN LO::R_BRICK,          0, 8, 12, 0
  LObjN LO::R_COIN,           2, 10, 2, 0
  LObjN LO::R_BRICK,          0, 12, 2, 0
  LObjN LO::R_BRICK,          1, 3, 5, 0
  LObj  LO::S_PRIZE,          1, 3
  LObjN LO::R_BRICK,          2, 9, 4, 0
  LObjN LO::R_COIN,           1, 11, 2, 0
  LObjN LO::WIDE_1,           2, 3, 5, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 4, 5, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           1, 6, 2, LN1::FENCE
  LObjN LO::R_COIN,           2, 10, 2, 0
  LObjN LO::RECT_1,           0, 12, 1, LN1::BRICKS, 24
  LObjN LO::R_GROUND,         0, 14, 15, 0
  LObjN LO::WIDE_1,           1, 7, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_BRICK,          2, 3, 5, 0
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::R_COIN,           1, 1, 3, 0
  LObjN LO::R_BRICK,          0, 7, 8, 4
  LObjN LO::R_GROUND,         2, 9, 4, 4
  LObjN LO::R_BRICK,          4, 0, 5, 0
  LObj  LO::S_SPRING,         3, 11
  LObjN LO::R_BRICK,          3, 0, 13, 7
  LObjN LO::R_GROUND,         0, 14, 8, 0
  LObjN LO::R_BRICK,          4, 8, 12, 0
  LObjN LO::R_COIN,           3, 10, 4, 0
  LObjN LO::R_GROUND,         2, 12, 15, 2
  LObj  LO::S_CEILING_BARRIER,5, 0
  LObjN LO::R_BRICK,          0, 4, 10, 0
  LObjN LO::WIDE_2,           0, 11, 2, LN2::BUSH
  LObj  LO::S_SPRING,         1, 7
  LObjN LO::TALL_1,           2, 8, 3, LN1::LADDER
  LObjN LO::R_GROUND,         1, 5, 6, 6
  LObjN LO::WIDE_1,           3, 3, 0, LN1::SPIKES
  LObjN LO::R_COIN,           6, 3, 0, 3
  LObjN LO::WIDE_1,           0, 8, 6, LN1::SOLID_LEDGE
  LObjN LO::R_BRICK,          1, 4, 8, 0
  LObj  LO::S_SOLID_BLOCK,    2, 11
  LObjN LO::WIDE_1,           0, 12, 10, LN1::SOLID_LEDGE
  LObjN LO::R_BRICK,          1, 1, 3, 0
  LObj  LO::S_PRIZE,          2, 1
  LObjN LO::WIDE_1,           0, 10, 4, LN1::SOLID_LEDGE
  LObjN LO::R_CEILING_BARRIER,3, 0, 0, 1
  LObjN LO::R_GROUND,         1, 0, 2, 9
  LObjN LO::WIDE_1,           3, 8, 11, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 11
  LObj  LO::S_SPRING,         3, 7
  LObjN LO::WIDE_1,           2, 5, 1, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    0, 6, 1, 1
  LObjN LO::R_BRICK,          7, 7, 11, 1
  LObjN LO::R_GROUND,         0, 9, 11, 5
  LObjN LO::WIDE_1,           1, 6, 0, LN1::SPIKES
  LObjN LO::R_GROUND,         2, 0, 6, 1
  LObj  LO::S_PRIZE,          1, 4
  LObj  LO::S_PRIZE,          3, 4
  LObjN LO::R_GROUND,         3, 0, 1, 4
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::HEART, (1<<4)|0
  LObjN LO::RECT_1,           2, 0, 1, LN1::GROUND, 18
  LObjN LO::RECT_1,           0, 2, 2, LN1::BRICKS, 18
  LObjN LO::RECT_1,           0, 11, 3, LN1::GROUND, 18
  LObjN LO::R_BRICK,          3, 5, 1, 3
  LObjN LO::WIDE_1,           0, 9, 10, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           11, 10, 2, LN2::BUSH
  LObjN LO::R_SOLID_BLOCK,    3, 7, 1, 3
  LObjN LO::R_GROUND,         1, 0, 13, 1
  LObjN LO::R_BRICK,          1, 2, 10, 1
  LObjN LO::WIDE_1,           0, 7, 9, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         10, 10, 5, 4
  LObjN LO::R_GROUND,         2, 2, 0, 3
  LObjN LO::WIDE_1,           1, 6, 1, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 9
  LObj  LO::S_DOOR,           1, 4
  LWriteCol 11, 206
  LObjN LO::R_GROUND,         2, 2, 2, 12
  LObjN LO::R_GROUND,         3, 10, 13, 4
  LObj  LO::S_EXIT_DOOR,      1, 8
  LObjN LO::R_COIN,           6, 5, 2, 0
  LObjN LO::R_GROUND,         0, 6, 2, 3
  LObj  LO::S_SPRING,         3, 9
  LObj  LO::S_SPRING,         4, 12
  LObjN LO::R_GROUND,         0, 13, 14, 1
  LObjN LO::WIDE_1,           4, 12, 0, LN1::SPIKES
  LObjN LO::WIDE_1,           4, 12, 0, LN1::SPIKES
  LObj  LO::S_DOOR,           5, 11
  LWriteCol 4, 174
  LObjN LO::R_GROUND,         2, 6, 15, 1
  LObjN LO::R_GROUND,         0, 8, 1, 4
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::S_DOOR,           4, 11
  LWriteCol 11, 40
  LObjN LO::R_COIN,           2, 8, 3, 1
  LObj  LO::S_SPRING,         1, 12
  LObj  LO::S_PRIZE,          3, 10
  LObj  LO::S_PRIZE,          2, 10
  LObjN LO::R_GROUND,         2, 8, 1, 4
  LFinished

undergroundSprite:
  LSpr Enemy::GOOMBA,              1,  17,   9
  LSpr Enemy::FIRE_JUMP,           0,  20,   3
  LSpr Enemy::GOOMBA,              1,  34,   9
  LSpr Enemy::THWOMP,              0,  37,   3
  LSpr Enemy::THWOMP,              0,  41,   3
  LSpr Enemy::FIRE_JUMP,           0,  52,  11
  LSpr Enemy::FIRE_JUMP,           1,  54,   2
  LSpr Enemy::FIRE_JUMP,           0,  55,  12
  LSpr Enemy::FIRE_JUMP,           1,  59,  12
  LSpr Enemy::GEORGE,              1,  70,   6
  LSpr Enemy::THWOMP,              0,  79,   8
  LSpr Enemy::OWL,                 0,  96,   3
  LSpr Enemy::SNEAKER,             1, 106,   3
  LSpr Enemy::OWL,                 1, 108,   7
  LSpr Enemy::CHECKPOINT,          0, 111,   3
  LSpr Enemy::CANNON_1,            0, 117,   2
  LSpr Enemy::THWOMP,              0, 134,   2
  LSpr Enemy::THWOMP,              0, 135,   2
  LSpr Enemy::SNEAKER,             0, 146,   8
  LSpr Enemy::SNEAKER,             0, 148,   8
  LSpr Enemy::SNEAKER,             0, 150,   8
  LSpr Enemy::FIRE_WALK,           1, 168,   6
  LSpr Enemy::FIRE_JUMP,           0, 179,   9
  LSpr Enemy::GOOMBA,              0, 186,   5
  LSpr Enemy::GOOMBA,              0, 188,   5
  .byt 255 ; end
