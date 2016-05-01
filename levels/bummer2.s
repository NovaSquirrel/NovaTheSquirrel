bummer2:
  .byt MusicTracks::NONE|0
  .byt 4
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr bummer2Data
  .addr bummer2Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt 255 ; end
  .byt $00, $00 ; boundaries

bummer2Data:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 37
  LObj  LO::S_SPRING,         8, 12
  LObjN LO::R_GROUND,         1, 9, 3, 3
  LObjN LO::R_GROUND,         4, 11, 2, 1
  LObj  LO::S_SIGNPOST,       1, 10
  LObjN LO::R_BRICK,          4, 10, 3, 0
  LObj  LO::S_PRIZE,          1, 7
  LObj  LO::S_PRIZE,          1, 10
  LObj  LO::S_PRIZE,          4, 9
  LObjN LO::R_GROUND,         2, 11, 2, 1
  LObjN LO::R_GROUND,         3, 9, 8, 3
  LObj  LO::R_CUSTOM,         2, 8, Metatiles::CAMPFIRE, (5<<4)|0
  LFinished

bummer2Sprite:
  LSpr Enemy::GEORGE,              1,  24,   8
  LSpr Enemy::GEORGE,              1,  27,  10
  .byt 255 ; end
