final5b:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_RONALD
  .byt GraphicsUpload::SP_HANNAH
  .byt GraphicsUpload::SP_FACEBALL
  .addr final5bData
  .addr final5bSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG_BLUE
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_SUBURBS
  .byt 255 ; end
  .byt $00, $00 ; boundaries

final5bData:
  LObjN LO::R_GROUND,         0, 13, 12, 1
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  .byt LSpecialCmd, LevelSpecialConfig::STARS
  LFinished

final5bSprite:
  LSpr Enemy::OWL,                 0,  10,  12
  .byt 255 ; end
