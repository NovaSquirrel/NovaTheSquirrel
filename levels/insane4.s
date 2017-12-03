insane4:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_SUN
  .addr insane4Data
  .addr insane4Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $60, $01 ; boundaries
  .byt $00, $00 ; link
  .byt $00, $10 ; link
  .byt $00, $1f ; link
  .byt $00, $0f ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link

insane4Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <Intro, >Intro
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 31
  LXPlus16
  LObjN LO::TALL_1,           13, 0, 12, LN1::LADDER
  LObjN LO::R_GROUND,         1, 0, 1, 12
  LObjN LO::R_GROUND,         2, 8, 11, 6
  LObjN LO::TALL_1,           1, 0, 7, LN1::LADDER
  LObjN LO::R_GROUND,         1, 0, 12, 1
  LObjN LO::TALL_1,           11, 7, 7, LN1::LADDER
  LObjN LO::R_GROUND,         1, 0, 1, 14
  LObjN LO::TALL_1,           3, 13, 1, LN1::LADDER
  LObjN LO::R_GROUND,         1, 13, 12, 1
  LObjN LO::R_GROUND,         13, 13, 15, 1
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

insane4Sprite:
  LSpr Enemy::SNEAKER,             0,   6,  12
  .byt 255 ; end
