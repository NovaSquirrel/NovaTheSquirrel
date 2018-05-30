boss4a:
  .byt MusicTracks::MAJOR_BOSS|0
  .byt 5
  .byt $2b
  .byt GraphicsUpload::SP_FREAK
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr boss4aData
  .addr boss4aSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_FREAK
  .byt GraphicsUpload::BG_JUNGLE
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt 255 ; end
  .byt $e0, $00 ; boundaries

boss4aData:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <BeforeFighterMaker, >BeforeFighterMaker
  LObjN LO::R_SOLID_BLOCK,    0, 0, 0, 12
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 4
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::WIDE_1,           1, 12, 2, LN1::FENCE
  LObjN LO::R_SKWIRLBUSH,     3, 2, 4, 3
  LObjN LO::R_WOOD_PLATFORM,  2, 6, 0, 6
  LObj  LO::S_HEART,          1, 7
  LObjN LO::WIDE_2,           0, 8, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::WIDE_2,           0, 12, 2, LN2::BUSH
  LObj  LO::S_BIGHEART,       1, 7
  LObjN LO::TALL_2,           3, 9, 3, LN2::TRUNK_L
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 4
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 12
  LSetX 16
  LWriteCol 9, 33
  LXPlus16
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::S_STORY_TRIGGER,         1, 4
  LWriteCol <AfterFighterMaker, >AfterFighterMaker
  LObj  LO::S_PRIZE,          2, 10
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObjN LO::R_COIN,           1, 8, 6, 0
  LObjN LO::WIDE_1,           0, 9, 6, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 5, 6, 0
  LObjN LO::WIDE_1,           0, 6, 6, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::S_EXIT_DOOR,      7, 11
  LFinished

boss4aSprite:
  LSpr Enemy::FIGHTER_MAKER,       1,  11,   1
  LSpr Enemy::COLLECTIBLE,         0,  41,   3
  .byt 255 ; end
