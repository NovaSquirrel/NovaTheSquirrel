final6d:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_FACEBALL
  .addr final6dData
  .addr final6dSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $00, $00 ; boundaries

final6dData:
  LObjN LO::R_GROUND,         0, 13, 13, 1
  LObj  LO::S_EXIT_DOOR,      12, 11
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

final6dSprite:
  .byt 255 ; end
