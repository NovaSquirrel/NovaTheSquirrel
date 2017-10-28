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
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY_MOLSNO
  .byt GraphicsUpload::BG_SUBURBS
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt 255 ; end
  .byt $e0, $00 ; boundaries

boss3Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <MolSnoMeet, >MolSnoMeet
  LSetX 0
  LWriteCol 11, 33
  LObjN LO::R_SOLID_BLOCK,    0, 4, 0, 8
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 4
  LObjN LO::WIDE_1,           0, 10, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 12, 2, LN1::FENCE
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObjN LO::WIDE_1,           9, 12, 2, LN1::FENCE
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 4
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 8
  LXPlus16
  LObjN LO::R_GROUND,         1, 13, 15, 1
  LObj  LO::S_STORY_TRIGGER,         1, 4
  LWriteCol <AfterSmiloidAtBummerClub, >AfterSmiloidAtBummerClub
  LObj  LO::S_EXIT_DOOR,      12, 11
  LFinished

boss3Sprite:
  LSpr Enemy::MOLSNO,              0,  11,  11
  .byt 255 ; end
