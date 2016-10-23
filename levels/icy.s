icy:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_HANNAH
  .addr icyData
  .addr icySprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt 255 ; end
  .byt $00, $00 ; boundaries

icyData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 21
  LObjN LO::R_GROUND,         11, 11, 4, 1
  LObjN LO::WIDE_1,           1, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         3, 3, 4, 1
  LObj  LO::R_CUSTOM,         1, 5, Metatiles::ICE, (0<<4)|7
  LObj  LO::R_CUSTOM,         6, 4, Metatiles::WATER_FROZEN, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::WATER_FROZEN, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::WATER_FROZEN, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WATER_FROZEN, (4<<4)|0
  LObjN LO::R_GROUND,         0, 11, 4, 3
  LObj  LO::R_CUSTOM,         7, 4, Metatiles::WATER_FROZEN, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::WATER_FROZEN, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::WATER_FROZEN, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WATER_FROZEN, (4<<4)|0
  LObjN LO::R_WATER,          0, 11, 4, 3
  LFinished

icySprite:
  LSpr Enemy::FIRE_WALK,           0,  12,   8, 1
  .byt 255 ; end
