boss2:
  .byt MusicTracks::MINOR_BOSS|0
  .byt 7
  .byt $28
  .byt GraphicsUpload::SP_FHBG
  .byt GraphicsUpload::SP_SCHEME_TEAM
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr boss2Data
  .addr boss2Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG_GRAY
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_GRASSYBG
  .byt 255 ; end
  .byt $60, $00 ; boundaries

boss2Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <FHBGAtBummerClub, >FHBGAtBummerClub
  LObjN LO::R_ROCK,           0, 0, 2, 14
  LObjN LO::RECT_3,           3, 0, 1, LN3::ROCK, 25
  LObjN LO::R_ROCK,           0, 10, 3, 4
  LObj  LO::S_PRIZE,          1, 7
  LWriteCol InventoryItem::ABILITY_FIRE | 128
  LObjN LO::WIDE_1,           1, 5, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 10, 14, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::LAVA_MAIN, (11<<4)|3
  LSetX 16
  LWriteCol 10, 34
  LObjN LO::WIDE_1,           3, 6, 6, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::LAVA_MAIN, (2<<4)|3
  LObj  LO::S_SPRING,         3, 9
  LObjN LO::R_ROCK,           0, 10, 6, 4
  LObjN LO::R_ROCK,           4, 6, 2, 1
  LObjN LO::TALL_2,           0, 8, 1, LN2::TRUNK
  LObj  LO::S_BIGHEART,       1, 4
  LObjN LO::R_ROCK,           2, 0, 2, 14
  LObjN LO::R_ROCK,           3, 12, 15, 2
  LObj  LO::S_STORY_TRIGGER,         2, 4
  LWriteCol <AfterFHBGAtBummerClub, >AfterFHBGAtBummerClub
  LObjN LO::R_COIN,           2, 8, 1, 1
  LObjN LO::R_ROCK,           0, 10, 3, 1
  LObjN LO::R_COIN,           2, 6, 1, 1
  LObjN LO::R_ROCK,           0, 8, 1, 1
  LObjN LO::R_COIN,           2, 4, 1, 1
  LObjN LO::R_ROCK,           0, 6, 1, 5
  LObjN LO::TALL_1,           2, 6, 5, LN1::LADDER
  LObj  LO::S_EXIT_DOOR,      3, 10
  LFinished

boss2Sprite:
  LSpr Enemy::FOREHEAD_BLOCK,      0,  10,  11, 3
  LSpr Enemy::FOREHEAD_BLOCK,      0,  10,  12, 1
  LSpr Enemy::FOREHEAD_BLOCK_GUY,  0,  13,   8
  LSpr Enemy::FOREHEAD_BLOCK,      0,  13,  12, 2
  LSpr Enemy::FOREHEAD_BLOCK,      0,  16,  11, 2
  LSpr Enemy::FOREHEAD_BLOCK,      0,  19,  12, 3
  LSpr Enemy::COLLECTIBLE,         0,  36,   6
  .byt 255 ; end
