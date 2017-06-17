boss2:
  .byt MusicTracks::NONE|0
  .byt 12
  .byt $2b
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_SCHEME_TEAM
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr boss2Data
  .addr boss2Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt 255 ; end
  .byt $60, $00 ; boundaries

boss2Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <SmiloidAtBummerClub, >SmiloidAtBummerClub
  LSetX 0
  LWriteCol 11, 33
  LObjN LO::R_SOLID_BLOCK,    2, 4, 0, 8
  LObjN LO::R_GROUND,         0, 13, 7, 1
  LObj  LO::S_SPRING,         7, 12
  LObjN LO::R_GROUND,         3, 13, 4, 1
  LObjN LO::R_GROUND,         3, 11, 1, 1
  LObjN LO::WIDE_1,           2, 11, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         3, 13, 9, 1
  LObjN LO::R_SOLID_BLOCK,    9, 4, 0, 8
  LObjN LO::R_GROUND,         3, 13, 15, 1
  LObj  LO::S_STORY_TRIGGER,         1, 4
  LWriteCol <AfterSmiloidAtBummerClub, >AfterSmiloidAtBummerClub
  LObjN LO::WIDE_1,           3, 4, 2, LN1::SOLID_LEDGE
  LObj  LO::S_EXIT_DOOR,      1, 2
  LObjN LO::WIDE_1,           5, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 9
  LFinished

boss2Sprite:
  LSpr Enemy::BOSS_FIGHT,          0,   0,   0, 0
  LSpr Enemy::CANNON_1,            0,   4,  10
  .byt 255 ; end
