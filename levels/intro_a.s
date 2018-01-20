intro_a:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $4b
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_SUN
  .addr intro_aData
  .addr intro_aSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_JUNGLE
  .byt 255 ; end
  .byt $08, $00 ; boundaries

intro_aData:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <Intro, >Intro
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 79
  LObjN LO::R_SKWIRLBUSH,     1, 2, 6, 1
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 0
  LObjN LO::R_COIN,           0, 6, 1, 0
  LObjN LO::WIDE_2,           0, 7, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_WOOD_PLATFORM,  2, 4, 0, 8
  LObjN LO::R_COIN,           1, 8, 1, 0
  LObjN LO::WIDE_2,           0, 9, 1, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_COIN,           1, 11
  LObj  LO::S_COIN,           2, 10
  LObjN LO::R_SAND,           1, 11, 3, 1
  LObj  LO::S_COIN,           1, 9
  LObj  LO::S_FLOWER,         0, 10
  LObjN LO::R_SKWIRLBUSH,     1, 2, 6, 1
  LObj  LO::S_SIGNPOST,       0, 10
  LWriteCol <Tutorial1, >Tutorial1
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 0
  LObjN LO::R_WOOD_PLATFORM,  2, 4, 0, 8
  LObjN LO::R_BRICK,          1, 6, 3, 0
  LObj  LO::S_PRIZE,          1, 6
  LObjN LO::R_BRICK,          0, 9, 3, 0
  LObj  LO::S_PRIZE,          1, 9
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::TALL_2,           1, 6, 6, LN2::PALM_TREE
  LObjN LO::WIDE_1,           2, 12, 0, LN1::SPIKES
  LObjN LO::TALL_2,           3, 7, 5, LN2::PALM_TREE
  LObjN LO::R_BRICKWALL,      0, 11, 3, 1
  LObjN LO::TALL_2,           4, 7, 5, LN2::PALM_TREE
  LObjN LO::R_BRICKWALL,      0, 11, 1, 1
  LObjN LO::R_COIN,           4, 10, 2, 0
  LObjN LO::WIDE_2,           1, 12, 2, LN2::BUSH
  LObjN LO::TALL_2,           3, 9, 3, LN2::TRUNK_L
  LObjN LO::WIDE_2,           2, 12, 2, LN2::BUSH
  LObjN LO::R_COIN,           1, 10, 2, 0
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 3
  LObjN LO::R_WOOD_PLATFORM,  2, 5, 0, 7
  LObjN LO::WIDE_2,           1, 6, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_SIGNPOST,       0, 10
  LWriteCol <Tutorial2, >Tutorial2
  LObjN LO::R_GROUND,         0, 11, 10, 1
  LObj  LO::S_SPRING,         2, 10
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
  LObjN LO::WIDE_1,           1, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 9, 0, 2
  LObjN LO::TALL_1,           1, 8, 4, LN1::LADDER
  LObjN LO::R_GROUND,         1, 8, 7, 4
  LObj  LO::S_SIGNPOST,       2, 7
  LWriteCol <Tutorial5, >Tutorial5
  LObj  LO::S_DOOR,           2, 6
  LWriteCol $21, LevelId::Garden
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $04, LevelBackgroundId::CLOUDS
  LFinished

intro_aSprite:
  LSpr Enemy::OWL,                 1,  29,  10
  LSpr Enemy::FIRE_WALK,           1,  51,   7
  LSpr Enemy::OWL,                 0,  68,   3
  .byt 255 ; end
