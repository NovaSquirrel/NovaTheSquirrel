toggletall:
  .byt MusicTracks::NONE|0
  .byt 23
  .byt $78
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_HANNAH
  .addr toggletallData
  .addr toggletallSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY3
  .byt 255 ; end
  .byt $01, $01 ; boundaries
  .byt $07, $08 ; link
  .byt $07, $80 ; link

toggletallData:
  LXPlus16
  LObj  LO::R_CUSTOM,         4, 7, Metatiles::TOGGLE_BLOCK_ON, (7<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_ON, (7<<4)|0
  LObjN LO::WIDE_1,           2, 10, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           3, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         2, 8, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObjN LO::WIDE_1,           2, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     0, 11, 2, 0
  LObj  LO::S_SPRING,         1, 10
  LFinished

toggletallSprite:
  .byt 255 ; end
