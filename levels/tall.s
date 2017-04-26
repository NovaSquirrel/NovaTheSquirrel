tall:
  .byt MusicTracks::NONE|0
  .byt 258
  .byt $c
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr tallData
  .addr tallSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt 255 ; end
  .byt $80, $01 ; boundaries
  .byt $00, $01 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f1 ; link
  .byt $00, $f0 ; link
  .byt $0e, $00

tallData:
  LSetX 225
  LObjN LO::R_GROUND,         0, 13, 6, 0
  LObjN LO::WIDE_1,           7, 13, 4, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_GROUND,         5, 7, 2, 6
  LObjN LO::R_GROUND,         4, 3, 6, 11
  LObjN LO::R_AIR,            1, 5, 9, 2
  LObjN LO::R_AIR,            0, 11, 5, 2
  LObjN LO::WIDE_1,           6, 5, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 8, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 11, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 14, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         1, 3, 5, 6
  LObj  LO::S_SPRING,         1, 2
  LObjN LO::R_GROUND,         3, 10, 1, 4
  LObjN LO::R_GROUND,         3, 14, 15, 1
  LObjN LO::R_GROUND,         2, 0, 5, 6
  LObj  LO::S_SPRING,         3, 13
  LObjN LO::R_GROUND,         2, 10, 6, 0
  LObjN LO::R_BRICK,          1, 5, 4, 1
  LObjN LO::R_COIN,           0, 13, 4, 0
  LObjN LO::WIDE_1,           1, 4, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 9
  LObjN LO::WIDE_1,           1, 2, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         2, 0, 1, 6
  LObjN LO::R_GROUND,         1, 10, 1, 3
  LFinished

tallSprite:
  LSpr Enemy::GOOMBA,              1,  17,   7
  LSpr Enemy::GOOMBA,              0, 243,   7
  LSpr Enemy::SNEAKER,             0, 243,  13
  LSpr Enemy::GOOMBA,              0, 245,   7
  LSpr Enemy::GOOMBA,              1, 270,   9
  .byt 255 ; end
