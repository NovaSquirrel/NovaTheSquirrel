arrows:
  .byt MusicTracks::NONE|0
  .byt 4
  .byt $f4
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_HANNAH
  .addr arrowsData
  .addr arrowsSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt 255 ; end
  .byt $00, $00 ; boundaries

arrowsData:
  LObjN LO::R_GROUND,         2, 6, 4, 0
  LFinished

arrowsSprite:
  .byt 255 ; end
