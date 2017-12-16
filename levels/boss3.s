boss3:
  .byt MusicTracks::NONE|0
  .byt 7
  .byt $2b
  .byt GraphicsUpload::SP_MOLSNO
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr boss3Data
  .addr boss3Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::PAL_ENEMY_MOLSNO
  .byt GraphicsUpload::BG_SUBURBS
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt 255 ; end
  .byt $e0, $00 ; boundaries

boss3Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <MolSnoMeet, >MolSnoMeet
  LObjN LO::R_SOLID_BLOCK,    0, 0, 0, 12
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 4
  LObj  LO::S_PRIZE,          0, 10
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObjN LO::WIDE_1,           1, 12, 2, LN1::FENCE
  LObjN LO::TALL_2,           3, 0, 12, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 7, 3, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 10, 3, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 3, Metatiles::HEART, (1<<4)|0
  LObjN LO::TALL_2,           3, 0, 12, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 12, 2, LN1::FENCE
  LObjN LO::R_CEILING_BARRIER,3, 0, 0, 4
  LObj  LO::S_PRIZE,          0, 10
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 12
  LSetX 16
  LWriteCol 9, 33
  LXPlus16
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::S_STORY_TRIGGER,         1, 4
  LWriteCol <AfterSmiloidAtBummerClub, >AfterSmiloidAtBummerClub
  LObj  LO::S_SNOWMAN,         2, 11
  LObjN LO::R_COIN,           1, 8, 6, 0
  LObjN LO::WIDE_1,           0, 9, 6, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 5, 6, 0
  LObjN LO::WIDE_1,           0, 6, 6, LN1::SOLID_LEDGE
  LObj  LO::S_SNOWMAN,         0, 11
  LObj  LO::S_SNOWMAN,         3, 11
  LObj  LO::S_EXIT_DOOR,      4, 11
  LFinished

boss3Sprite:
  LSpr Enemy::MOLSNO,              0,   7,   5
  LSpr Enemy::COLLECTIBLE,         0,  41,   3
  .byt 255 ; end
