woodcrates:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $f6
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_RONALD
  .byt GraphicsUpload::SP_HANNAH
  .addr woodcratesData
  .addr woodcratesSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY1
  .byt 255 ; end
  .byt $00, $00 ; boundaries

woodcratesData:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <MeetLia, >MeetLia
  .byt LSpecialCmd, LevelSpecialConfig::PUZZLE_MODE, AbilityType::NONE, $00
  LObjN LO::R_GROUND,         0, 8, 4, 4
  LObjN LO::R_GROUND,         0, 13, 11, 1
  LObj  LO::S_BG_GLASS_BLUE,  4, 5
  LObjN LO::WIDE_1,           1, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 8, 5, LN1::SOLID_LEDGE
  LObj  LO::S_BG_GLASS_BLUE,  2, 3
  LObj  LO::S_SIGNPOST,       0, 7
  LWriteCol <AboutAutoItem, >AboutAutoItem
  LObj  LO::S_PRIZE,          2, 5
  LWriteCol InventoryItem::ABILITY_BURGER | 128
  LObjN LO::TALL_1,           0, 8, 4, LN1::LADDER
  LObj  LO::S_BG_GLASS_BLUE,  2, 2
  LObj  LO::S_BG_GLASS_BLUE,  3, 4
  LObjN LO::R_SOLID_ROCK,     0, 8, 0, 6
  LObjN LO::R_SOLID_ROCK,     1, 8, 2, 0
  LObj  LO::S_BG_GLASS_BLUE,  2, 6
  LObjN LO::R_SOLID_ROCK,     1, 8, 0, 6
  LObj  LO::S_BG_GLASS_BLUE,  1, 9
  LObj  LO::S_BG_GLASS_BLUE,  1, 12
  LObjN LO::R_GROUND,         2, 9, 4, 5
  LObjN LO::R_FG_GLASS_RED,   1, 7, 1, 0
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::LOCK_GREEN
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::KEY_RED
  LObjN LO::R_FG_GLASS_RED,   1, 7, 0, 1
  LObjN LO::R_CEILING_BARRIER,3, 0, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 15, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 1, 0, 13
  LObjN LO::R_ENEMY_BARRIER      ,  1, 1, 0, 4
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::WOOD_CRATE, (7<<4)|0
  LObjN LO::R_COIN,           2, 7, 2, 2
  LObj  LO::R_CUSTOM,         8, 10, Metatiles::WOOD_CRATE, (5<<4)|0
  LObjN LO::R_FG_GLASS_BLUE,  5, 0, 15, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 1, 0, 13
  LObj  LO::R_CUSTOM,         4, 11, Metatiles::WOOD_CRATE, (8<<4)|0
  LObjN LO::R_COIN,           4, 5, 2, 2
  LObjN LO::R_ENEMY_BARRIER      ,  5, 1, 0, 4
  LObjN LO::R_BG_GLASS_BLUE,  1, 1, 0, 13
  LObjN LO::R_GROUND,         1, 8, 4, 6
  LObj  LO::S_BIGHEART,       1, 7
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObjN LO::R_CEILING_BARRIER,0, 0, 0, 1
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::KEY_GREEN
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 6
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::LOCK_RED
  LObjN LO::R_ENEMY_BARRIER      ,  1, 0, 0, 4
  LObjN LO::R_GROUND,         1, 11, 5, 3
  LObjN LO::R_FG_GLASS_BLUE,  5, 8, 6, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  3, 9, 0, 5
  LObjN LO::R_FG_GLASS_BLUE,  3, 9, 0, 5
  LObjN LO::WIDE_1,           2, 12, 5, LN1::SOLID_LEDGE
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 9
  LObjN LO::WIDE_1,           4, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           2, 7, 2, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  5, 5, 0, 9
  LFinished

woodcratesSprite:
  LSpr Enemy::RONALD_BURGER,       0,  38,   2
  LSpr Enemy::RONALD_BURGER,       1,  52,   1
  LSpr Enemy::RONALD_BURGER,       0,  76,   1, 0
  .byt 255 ; end
