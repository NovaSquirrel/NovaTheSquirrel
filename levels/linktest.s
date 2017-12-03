linktest:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr linktestData
  .addr linktestSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt 255 ; end
  .byt $c0, $01 ; boundaries
  .byt $00, $11 ; link
  .byt $00, $ff ; link
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
  .byt $00, $00 ; link
  .byt $00, $00 ; link

linktestData:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 31
  LObjN LO::R_SOLID_BLOCK,    6, 1, 0, 4
  LObjN LO::TALL_1,           7, 0, 14, LN1::LADDER
  LObjN LO::R_SOLID_BLOCK,    10, 1, 2, 0
  LObjN LO::R_SOLID_BLOCK,    0, 3, 2, 0
  LObj  LO::S_SOLID_BLOCK,    0, 4
  LObjN LO::R_SOLID_BLOCK,    0, 5, 2, 0
  LObj  LO::S_SOLID_BLOCK,    2, 2
  LObjN LO::TALL_1,           4, 0, 14, LN1::LADDER
  LFinished

linktestSprite:
  LSpr Enemy::GOOMBA,              1,  44,  10
  .byt 255 ; end
