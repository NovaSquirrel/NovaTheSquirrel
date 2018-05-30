extra4:
  .byt MusicTracks::WORLD_1B|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_SUN
  .addr extra4Data
  .addr extra4Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_JUNGLE
  .byt 255 ; end
  .byt $04, $00 ; boundaries

extra4Data:
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObjN LO::R_COIN,           5, 4, 0, 2
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WOOD_CRATE, (15<<4)|0
  LObjN LO::R_COIN,           1, 7, 0, 2
  LObjN LO::R_COIN,           1, 4, 0, 2
  LObjN LO::R_COIN,           2, 5, 0, 3
  LObj  LO::S_COIN,           1, 4
  LObj  LO::S_COIN,           0, 9
  LObjN LO::R_COIN,           1, 5, 0, 3
  LObjN LO::R_COIN,           2, 4, 0, 4
  LObj  LO::S_COIN,           1, 9
  LObjN LO::R_COIN,           1, 4, 0, 4
  LObjN LO::R_COIN,           6, 5, 0, 4
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WOOD_CRATE, (15<<4)|0
  LObj  LO::S_COIN,           1, 4
  LObj  LO::S_COIN,           0, 7
  LObjN LO::R_COIN,           1, 5, 0, 4
  LObjN LO::R_COIN,           2, 4, 0, 5
  LObj  LO::S_COIN,           1, 4
  LObj  LO::S_COIN,           0, 7
  LObjN LO::R_COIN,           1, 5, 0, 1
  LObjN LO::R_COIN,           0, 8, 0, 1
  LObjN LO::R_COIN,           2, 4, 0, 5
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObjN LO::R_COIN,           0, 6, 1, 0
  LObjN LO::R_COIN,           0, 9, 1, 0
  LObjN LO::R_COIN,           7, 5, 0, 4
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WOOD_CRATE, (15<<4)|0
  LObj  LO::S_W_CRATE,        1, 4
  LObj  LO::S_COIN,           0, 7
  LObjN LO::R_COIN,           1, 5, 0, 4
  LObj  LO::S_COIN,           5, 5
  LObjN LO::R_COIN,           0, 6, 1, 0
  LObjN LO::R_COIN,           0, 9, 2, 0
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObjN LO::R_COIN,           1, 7, 0, 1
  LObjN LO::R_COIN,           2, 4, 0, 4
  LObj  LO::S_COIN,           1, 9
  LObjN LO::R_COIN,           1, 4, 0, 4
  LObjN LO::R_COIN,           2, 4, 0, 5
  LObj  LO::S_COIN,           1, 4
  LObj  LO::S_COIN,           0, 7
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WOOD_CRATE, (15<<4)|0
  LObjN LO::R_COIN,           1, 5, 0, 2
  LObjN LO::R_COIN,           2, 4, 0, 5
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObjN LO::R_COIN,           0, 6, 1, 0
  LObjN LO::R_COIN,           0, 9, 1, 0
  LObjN LO::R_COIN,           3, 4, 0, 5
  LObj  LO::S_COIN,           1, 4
  LObj  LO::S_COIN,           0, 7
  LObjN LO::R_COIN,           1, 5, 0, 1
  LObjN LO::R_COIN,           0, 8, 0, 1
  LObjN LO::R_COIN,           5, 4, 0, 5
  LObjN LO::R_COIN,           0, 7, 1, 0
  LObj  LO::S_COIN,           1, 4
  LObjN LO::R_COIN,           1, 5, 0, 2
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::WOOD_CRATE, (15<<4)|0
  LObjN LO::R_COIN,           2, 4, 0, 5
  LObjN LO::R_COIN,           1, 9, 1, 0
  LObjN LO::R_COIN,           3, 5, 0, 4
  LObj  LO::S_COIN,           1, 4
  LObj  LO::S_COIN,           0, 7
  LObjN LO::R_COIN,           1, 5, 0, 4
  LObjN LO::R_COIN,           2, 4, 0, 2
  LObjN LO::R_COIN,           1, 7, 0, 2
  LObjN LO::R_COIN,           1, 4, 0, 2
  LObjN LO::R_COIN,           2, 4, 0, 5
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObjN LO::R_COIN,           0, 6, 1, 0
  LObjN LO::R_COIN,           0, 9, 1, 0
  LObj  LO::R_CUSTOM,         1, 10, Metatiles::WOOD_CRATE, (9<<4)|0
  LObjN LO::R_COIN,           2, 4, 0, 5
  LObj  LO::S_COIN,           1, 4
  LObj  LO::S_COIN,           0, 7
  LObjN LO::R_COIN,           1, 5, 0, 1
  LObjN LO::R_COIN,           0, 8, 0, 1
  LObjN LO::R_GROUND,         0, 13, 6, 1
  LObjN LO::R_COIN,           3, 4, 0, 3
  LObj  LO::S_COIN,           0, 9
  LObjN LO::R_COIN,           2, 4, 0, 3
  LObj  LO::S_COIN,           0, 9
  LObj  LO::S_EXIT_DOOR,      0, 11
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

extra4Sprite:
  LSpr Enemy::COLLECTIBLE,         0,  40,   1
  .byt 255 ; end
