boss5a:
  .byt MusicTracks::MAJOR_BOSS|0
  .byt 7
  .byt $fb
  .byt GraphicsUpload::SP_FHBG
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_MINES
  .addr boss5aData
  .addr boss5aSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::PAL_ENEMY_MOLSNO
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt 255 ; end
  .byt $e0, $00 ; boundaries

boss5aData:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <JohnMeet, >JohnMeet
  LObj  LO::R_CUSTOM,         0, 0, Metatiles::CAMPFIRE, (1<<4)|12
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::R_CUSTOM,         2, 0, Metatiles::CAMPFIRE, (11<<4)|1
  LObjN LO::R_CEILING_BARRIER,0, 2, 11, 2
  LObj  LO::S_SPRING,         0, 8
  LObj  LO::S_SPRING,         0, 11
  LObj  LO::S_BIGHEART,       0, 12
  LObj  LO::S_PRIZE,          3, 10
  LWriteCol InventoryItem::ABILITY_FIRE | 128
  LObjN LO::R_ICE2,            1, 10, 3, 0
  LObj  LO::S_PRIZE,          4, 10
  LWriteCol InventoryItem::ABILITY_FIRE | 128
  LObj  LO::S_SPRING,         3, 8
  LObj  LO::S_SPRING,         0, 11
  LObj  LO::S_BIGHEART,       0, 12
  LObj  LO::R_CUSTOM,         1, 0, Metatiles::CAMPFIRE, (1<<4)|12
  LSetX 16
  LWriteCol 8, 33
  LXPlus16
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::S_STORY_TRIGGER,         1, 4
  LWriteCol <JohnAfterFight, >JohnAfterFight
  LObj  LO::S_SNOWMAN,         2, 11
  LObjN LO::R_COIN,           1, 8, 6, 0
  LObjN LO::WIDE_1,           0, 9, 6, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 5, 6, 0
  LObjN LO::WIDE_1,           0, 6, 6, LN1::SOLID_LEDGE
  LObj  LO::S_SNOWMAN,         0, 11
  LObj  LO::S_SNOWMAN,         3, 11
  LObj  LO::S_EXIT_DOOR,      4, 11
  LFinished

boss5aSprite:
  LSpr Enemy::JOHN,                0,   7,   9
  LSpr Enemy::COLLECTIBLE,         0,  41,   3
  .byt 255 ; end
