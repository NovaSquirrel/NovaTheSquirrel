grassy_a:
  .byt MusicTracks::NONE|0
  .byt 133
  .byt $7b
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr grassy_aData
  .addr grassy_aSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ALTGRASS1
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_SUBURBS
  .byt 255 ; end
  .byt $01, $01 ; boundaries
  .byt $07, $08 ; link
  .byt $07, $80 ; link

grassy_aData:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $07, LevelBackgroundId::CLOUDS
  LObjN LO::R_GROUND,         7, 6, 7, 2
  LObjN LO::WIDE_2,           1, 5, 5, LN2::BUSH
  LObjN LO::R_GROUND,         0, 9, 9, 3
  LObjN LO::R_GROUND,         2, 13, 10, 1
  LObj  LO::S_SKWIRLBUSH,     8, 12
  LObj  LO::S_PRIZE,          1, 9
  LObjN LO::WIDE_2,           0, 12, 1, LN2::FLOWER
  LObjN LO::TALL_1,           2, 13, 1, LN1::LADDER
  LObj  LO::S_FLOWER,         1, 12
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 24
  LObjN LO::R_BRICKWALL,      1, 11, 7, 1
  LObjN LO::R_COIN,           4, 9, 1, 1
  LObjN LO::TALL_2,           6, 10, 2, LN2::TRUNK_L
  LObj  LO::S_FLOWER,         2, 12
  LObjN LO::TALL_2,           1, 10, 2, LN2::TRUNK_L
  LObjN LO::WIDE_3,           3, 12, 5, LN3::WHITEFENCE
  LObjN LO::TALL_1,           8, 13, 1, LN1::LADDER
  LObjN LO::WIDE_1,           1, 8, 9, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 13, 14, 1
  LObjN LO::TALL_2,           1, 11, 1, LN2::TRUNK_L
  LObjN LO::R_BRICK,          1, 5, 7, 0
  LObjN LO::TALL_1,           3, 8, 4, LN1::LADDER
  LObj  LO::S_BRICKPRIZE,     1, 5
  LObjN LO::R_BRICK,          1, 10, 7, 0
  LObjN LO::R_BRICK,          7, 8, 0, 1
  LObjN LO::R_GROUND,         1, 8, 10, 1
  LObjN LO::WIDE_1,           0, 13, 10, LN1::SPIKES
  LObjN LO::R_GROUND,         0, 14, 10, 0
  LObjN LO::WIDE_1,           1, 7, 8, LN1::FENCE
  LObjN LO::TALL_1,           10, 8, 4, LN1::LADDER
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 31
  LObjN LO::R_GROUND,         7, 3, 14, 5
  LObjN LO::RECT_2,           1, 9, 3, LN2::BLACK, 12
  LObj  LO::S_FLOWER,         1, 2
  LObj  LO::S_FLOWER,         4, 2
  LObjN LO::WIDE_1,           2, 2, 2, LN1::TALLGRASS
  LObj  LO::S_FLOWER,         4, 2
  LObjN LO::TALL_2,           5, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 10, 2, LN2::TRUNK_L
  LObjN LO::TALL_1,           2, 13, 1, LN1::LADDER
  LObjN LO::WIDE_1,           1, 13, 3, LN1::FALLTHROUGH_LEDGE
  LObjN LO::RECT_1,           4, 13, 1, LN1::GROUND, 16
  LObjN LO::R_GROUND,         3, 11, 13, 1
  LObjN LO::R_GROUND,         1, 3, 12, 7
  LObjN LO::RECT_1,           13, 13, 1, LN1::GROUND, 26
  LObjN LO::R_BRICK,          8, 9, 7, 0
  LObjN LO::WIDE_2,           0, 12, 8, LN2::BUSH
  LObjN LO::R_GROUND,         2, 0, 10, 0
  LObj  LO::S_SOLID_BLOCK,    0, 4
  LObjN LO::WIDE_1,           0, 5, 7, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 9
  LObj  LO::S_PRIZE,          2, 2
  LObj  LO::S_PRIZE,          1, 9
  LObjN LO::R_COIN,           1, 2, 3, 0
  LObjN LO::R_SOLID_BLOCK,    2, 4, 5, 0
  LObj  LO::S_SPRING,         3, 12
  LObjN LO::TALL_1,           1, 0, 3, LN1::LADDER
  LObjN LO::R_GROUND,         0, 10, 5, 2
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 3
  LObjN LO::WIDE_2,           0, 9, 1, LN2::FLOWER
  LObj  LO::S_SPRING,         3, 9
  LObjN LO::WIDE_1,           3, 7, 5, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 5, 3, 0
  LObjN LO::WIDE_1,           6, 6, 1, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 7, 15, 1
  LObjN LO::WIDE_2,           2, 6, 2, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 9, 11, 5
  LObjN LO::R_GROUND,         2, 0, 7, 3
  LObjN LO::RECT_2,           1, 4, 2, LN2::BLACK, 5
  LObjN LO::WIDE_1,           6, 6, 4, LN1::TALLGRASS
  LObjN LO::TALL_1,           1, 0, 4, LN1::LADDER
  LObjN LO::RECT_1,           1, 0, 3, LN1::GROUND, 48
  LObj  LO::S_SPRING,         5, 10
  LObjN LO::RECT_1,           0, 11, 3, LN1::GROUND, 45
  LObjN LO::R_COIN,           1, 7, 2, 2
  LObjN LO::RECT_1,           3, 4, 6, LN1::GROUND, 23
  LXPlus16
  LObj  LO::S_BIGHEART,       8, 7
  LObjN LO::R_GROUND,         0, 8, 0, 2
  LObjN LO::R_BRICKWALL,      2, 9, 5, 1
  LObjN LO::R_COIN,           1, 6, 2, 1
  LObjN LO::R_SOLID_BLOCK,    4, 4, 0, 2
  LObjN LO::WIDE_1,           0, 7, 4, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           1, 10, 6, LN1::TALLGRASS
  LObjN LO::R_GROUND,         4, 7, 7, 1
  LObjN LO::WIDE_1,           1, 6, 4, LN1::TALLGRASS
  LObjN LO::R_GROUND,         3, 0, 8, 0
  LObjN LO::WIDE_1,           2, 12, 4, LN1::TALLGRASS
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 22
  LObjN LO::WIDE_1,           2, 4, 4, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 5, 9, 0
  LObjN LO::R_GROUND,         0, 6, 9, 3
  LObjN LO::TALL_1,           5, 0, 4, LN1::LADDER
  LObjN LO::WIDE_2,           2, 4, 2, LN2::FLOWER
  LObjN LO::RECT_1,           3, 0, 5, LN1::GROUND, 16
  LObj  LO::S_DOOR,           7, 11
  LWriteCol $21, LevelId::GrassyB
  LFinished

grassy_aSprite:
  LSpr Enemy::OWL,                 0,  25,  10
  LSpr Enemy::FIRE_WALK,           0,  32,  12
  LSpr Enemy::SNEAKER,             0,  48,   7
  LSpr Enemy::SNEAKER,             1,  72,  12
  LSpr Enemy::THWOMP,              0,  85,   9
  LSpr Enemy::THWOMP,              0,  88,   9
  LSpr Enemy::THWOMP,              0,  91,   9
  LSpr Enemy::SNEAKER,             1, 114,  10
  LSpr Enemy::GOOMBA,              0, 139,   4
  LSpr Enemy::GOOMBA,              1, 152,   9
  LSpr Enemy::OWL,                 1, 173,   6
  LSpr Enemy::OWL,                 0, 219,  10
  LSpr Enemy::FIRE_JUMP,           0, 223,   6
  LSpr Enemy::OWL,                 0, 231,   4
  .byt 255 ; end
