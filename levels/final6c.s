final6c:
  .byt MusicTracks::NONE|0
  .byt 1
  .byt $f5
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_MINES
  .addr final6cData
  .addr final6cSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $00, $00 ; boundaries

final6cData:
  LObjN LO::RECT_3,           0, 12, 2, LN3::ROCK, 18
  LXPlus16
  LObj  LO::S_DOOR,           1, 10
  LWriteCol $21, LevelId::Final6D
  .byt LSpecialCmd, LevelSpecialConfig::FROZEN_CAVE
  LFinished

final6cSprite:
  LSpr Enemy::ICE_1,               1,  15,   8
  .byt 255 ; end
