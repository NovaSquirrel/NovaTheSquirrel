boss5b:
  .byt MusicTracks::FINAL_BOSS|0
  .byt 10
  .byt $f9
  .byt GraphicsUpload::SP_FINALBOSS
  .byt GraphicsUpload::SP_FINALPROJECTILE
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_MINES
  .addr boss5bData
  .addr boss5bSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $e0, $00 ; boundaries

boss5bData:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <BeforeBill, >BeforeBill
  LObjN LO::R_GROUND,         0, 11, 15, 3
  LObj  LO::S_BIGHEART,       2, 10
  LObjN LO::TALL_2,           1, 8, 2, LN2::TRUNK_L
  LObjN LO::WIDE_1,           2, 10, 2, LN1::FENCE
  LObjN LO::TALL_2,           6, 8, 2, LN2::TRUNK_L
  LObj  LO::S_BUSH,           2, 10
  LObj  LO::S_BIGHEART,       1, 10
  LSetX 16
  LWriteCol 8, 33
  LXPlus16
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::S_STORY_TRIGGER,         1, 4
  LWriteCol <AfterBill, >AfterBill
  LObjN LO::R_COIN,           3, 8, 6, 0
  LObjN LO::WIDE_1,           0, 9, 6, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    0, 11, 1, 1
  LObjN LO::R_COIN,           2, 5, 6, 0
  LObjN LO::WIDE_1,           0, 6, 6, LN1::SOLID_LEDGE
  LObj  LO::S_SIGNPOST,       1, 12
  LWriteCol <SignAboutEpilogue, >SignAboutEpilogue
  LObj  LO::S_EXIT_DOOR,      6, 11
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  .byt LSpecialCmd, LevelSpecialConfig::FORCE_MIRROR
  LFinished

boss5bSprite:
  LSpr Enemy::FINAL_BOSS,          0,   1,   4
  LSpr Enemy::COLLECTIBLE,         0,  41,   3
  .byt 255 ; end
