intro:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $4b
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr introData
  .addr introSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $08, $00 ; boundaries

introData:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <Intro, >Intro
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 79
  LObj  LO::S_COIN,           6, 11
  LObj  LO::S_COIN,           2, 10
  LObj  LO::S_GROUND_CLIMB_L, 0, 12
  LObj  LO::S_GROUND_CLIMB_L, 1, 11
  LObjN LO::R_GROUND,         0, 12, 3, 0
  LObj  LO::S_COIN,           1, 9
  LObj  LO::S_FLOWER,         0, 10
  LObjN LO::R_GROUND,         0, 11, 1, 0
  LObj  LO::S_SIGNPOST,       1, 10
  LWriteCol <Tutorial1, >Tutorial1
  LObj  LO::S_GROUND_CLIMB_R, 1, 11
  LObj  LO::S_GROUND_CLIMB_R, 1, 12
  LObjN LO::R_BRICK,          2, 6, 3, 0
  LObjN LO::R_BRICK,          1, 9, 3, 0
  LObj  LO::S_PRIZE,          1, 6
  LObj  LO::S_PRIZE,          1, 9
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::WIDE_1,           3, 12, 0, LN1::SPIKES
  LObjN LO::WIDE_1,           3, 11, 5, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           7, 10, 8, 0
  LObjN LO::WIDE_2,           1, 12, 2, LN2::BUSH
  LObj  LO::S_SIGNPOST,       3, 12
  LWriteCol <Tutorial2, >Tutorial2
  LObjN LO::WIDE_2,           1, 12, 2, LN2::BUSH
  LObjN LO::R_GROUND,         6, 11, 10, 1
  LObjN LO::WIDE_1,           2, 6, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 10
  LObj  LO::S_SOLID_BLOCK,    1, 7
  LObjN LO::R_GROUND,         0, 8, 7, 2
  LObj  LO::S_SOLID_BLOCK,    7, 7
  LObjN LO::WIDE_1,           1, 8, 5, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           1, 9, 0, 2
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::WIDE_1,           2, 12, 5, LN1::TALLGRASS
  LObj  LO::S_SIGNPOST,       1, 7
  LWriteCol <Tutorial3, >Tutorial3
  LObjN LO::R_GROUND,         2, 0, 6, 7
  LObj  LO::S_SIGNPOST,       4, 12
  LWriteCol <Tutorial4, >Tutorial4
  LObjN LO::WIDE_2,           2, 12, 2, LN2::BUSH
  LObjN LO::TALL_1,           4, 8, 4, LN1::LADDER
  LObjN LO::R_GROUND,         1, 8, 7, 4
  LObj  LO::S_SIGNPOST,       1, 7
  LWriteCol <Tutorial5, >Tutorial5
  LObj  LO::S_EXIT_DOOR,      3, 6
  LFinished

introSprite:
  LSpr Enemy::OWL,                 1,  29,  10
  LSpr Enemy::FIRE_WALK,           1,  51,   7
  .byt 255 ; end
