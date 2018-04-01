boss4b:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $26
  .byt GraphicsUpload::SP_FREAK
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr boss4bData
  .addr boss4bSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_JACK
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_JACK
  .byt GraphicsUpload::BG_GRASSY
  .byt 255 ; end
  .byt $e0, $00 ; boundaries

boss4bData:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <BeforeFighterMaker, >BeforeFighterMaker
  LObjN LO::WIDE_2,           4, 9, 6, LN2::PATH_LINE
  LSetX 16
  LWriteCol 9, 33
  LXPlus16
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::S_STORY_TRIGGER,         1, 4
  LWriteCol <AfterFighterMaker, >AfterFighterMaker
  LObjN LO::R_COIN,           3, 8, 6, 0
  LObjN LO::WIDE_1,           0, 9, 6, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 5, 6, 0
  LObjN LO::WIDE_1,           0, 6, 6, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::S_EXIT_DOOR,      7, 11
  .byt LSpecialCmd, LevelSpecialConfig::JACK_STONE
  LFinished

boss4bSprite:
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,   2,   8, 4
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,   4,   9
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,   6,   4, 4
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,   8,   5, 4
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  10,   6, 4
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  12,   7, 4
  LSpr Enemy::COLLECTIBLE,         0,  41,   3
  .byt 255 ; end
