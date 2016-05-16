emptylevel:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr emptylevelData
  .addr emptylevelSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt 255 ; end
  .byt $00, $00 ; boundaries

emptylevelData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 19
  LFinished

emptylevelSprite:
  LSpr Enemy::GOOMBA,              1,  17,  12
  .byt 255 ; end
