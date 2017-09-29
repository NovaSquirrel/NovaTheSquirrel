garden:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $7b
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr gardenData
  .addr gardenSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_SUBURBS
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $01, $00 ; boundaries

gardenData:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <Nice_Announcement, >Nice_Announcement
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $07, LevelBackgroundId::CLOUDS
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 19
  LObjN LO::WIDE_3,           11, 12, 3, LN3::WHITEFENCE
  LObjN LO::WIDE_2,           4, 10, 2, LN2::BUSH
  LObjN LO::R_GROUND,         0, 11, 4, 1
  LObjN LO::TALL_2,           3, 8, 2, LN2::TRUNK_L
  LObjN LO::WIDE_2,           2, 11, 3, LN2::STONE_BRIDGE
  LObjN LO::R_WATER,          0, 13, 3, 1
  LObjN LO::R_COIN,           1, 8, 1, 1
  LObjN LO::R_GROUND,         3, 11, 9, 3
  LObjN LO::R_BRICKWALL,      1, 9, 4, 1
  LObjN LO::R_BRICK,          1, 6, 3, 0
  LObjN LO::R_COIN,           1, 4, 2, 0
  LObj  LO::S_PRIZE,          0, 6
  LObjN LO::WIDE_1,           5, 10, 1, LN1::FENCE
  LObjN LO::R_COIN,           5, 8, 1, 0
  LObjN LO::WIDE_1,           0, 10, 1, LN1::FENCE
  LObjN LO::R_GROUND,         0, 11, 9, 3
  LObjN LO::R_COIN,           2, 7, 2, 0
  LObjN LO::WIDE_2,           0, 10, 4, LN2::FLOWER
  LObjN LO::WIDE_1,           6, 8, 3, LN1::SOLID_LEDGE
  LObj  LO::S_GROUND_CLIMB_R, 2, 11
  LObjN LO::R_GROUND,         0, 12, 9, 2
  LObjN LO::TALL_2,           3, 9, 2, LN2::TRUNK_L
  LObjN LO::WIDE_1,           1, 6, 3, LN1::SOLID_LEDGE
  LObj  LO::S_HEART,          1, 5
  LObjN LO::TALL_2,           0, 9, 2, LN2::TRUNK_L
  LObjN LO::R_COIN,           1, 4, 1, 1
  LObjN LO::TALL_2,           1, 9, 2, LN2::TRUNK_L
  LObjN LO::WIDE_2,           3, 9, 2, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 10, 4, 4
  LObj  LO::S_FLOWER,         7, 9
  LObjN LO::R_GROUND,         0, 10, 1, 4
  LObjN LO::TALL_1,           1, 8, 1, LN1::LADDER
  LObjN LO::R_COIN,           1, 4, 2, 0
  LObjN LO::R_BRICK,          0, 5, 2, 0
  LObjN LO::R_GROUND,         0, 8, 2, 6
  LObj  LO::S_PRIZE,          1, 5
  LObjN LO::WIDE_1,           2, 8, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 11, 8, 3
  LObjN LO::WIDE_1,           2, 5, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 7
  LObjN LO::WIDE_1,           0, 10, 2, LN1::TALLGRASS
  LObjN LO::R_SOLID_BLOCK,    3, 10, 3, 0
  LObjN LO::R_SOLID_BLOCK,    1, 9, 2, 0
  LObjN LO::R_SOLID_BLOCK,    1, 8, 1, 0
  LObj  LO::S_SOLID_BLOCK,    1, 7
  LObjN LO::R_COIN,           3, 5, 1, 1
  LObjN LO::R_GROUND,         0, 7, 3, 7
  LObj  LO::S_GROUND_CLIMB_L, 3, 6
  LObjN LO::R_GROUND,         1, 6, 4, 8
  LObjN LO::WIDE_3,           1, 5, 2, LN3::WHITEFENCE
  LObjN LO::WIDE_1,           4, 6, 7, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           0, 10, 4, LN2::FLOWER
  LObjN LO::RECT_1,           0, 11, 3, LN1::GROUND, 18
  LObjN LO::R_COIN,           1, 7, 2, 1
  LObj  LO::S_STATUE,         0, 9
  LObj  LO::S_STATUE,         2, 9
  LObjN LO::TALL_1,           3, 6, 4, LN1::LADDER
  LObjN LO::WIDE_3,           2, 10, 2, LN3::WHITEFENCE
  LObjN LO::R_BRICKWALL,      4, 9, 5, 1
  LObjN LO::R_COIN,           1, 8, 3, 0
  LObj  LO::S_PRIZE,          1, 6
  LObjN LO::R_GROUND,         5, 9, 4, 5
  LObjN LO::WIDE_2,           2, 8, 2, LN2::BUSH
  LObjN LO::WIDE_2,           5, 8, 2, LN2::BUSH
  LObjN LO::R_GROUND,         0, 9, 4, 5
  LObjN LO::R_COIN,           1, 6, 2, 0
  LObj  LO::S_FLOWER,         2, 8
  LObjN LO::R_GROUND,         2, 11, 7, 3
  LObjN LO::TALL_2,           1, 8, 2, LN2::TRUNK_L
  LObjN LO::WIDE_2,           3, 10, 1, LN2::FLOWER
  LObj  LO::S_DOOR,           2, 9
  LWriteCol $21, LevelId::IntroB
  LFinished

gardenSprite:
  LSpr Enemy::GOOMBA,              1,  17,  10
  LSpr Enemy::FIRE_JUMP,           1,  57,   9
  LSpr Enemy::OWL,                 0,  58,   9
  LSpr Enemy::GOOMBA,              1,  77,   6
  LSpr Enemy::GOOMBA,              1,  94,   5
  LSpr Enemy::GOOMBA,              1,  96,   5
  .byt 255 ; end
