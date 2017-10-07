boss3:
  .byt MusicTracks::NONE|0
  .byt 7
  .byt $2b
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_SCHEME_TEAM
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr boss3Data
  .addr boss3Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt GraphicsUpload::BG_CHIP
  .byt 255 ; end
  .byt $60, $00 ; boundaries

boss3Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <MolSnoMeet, >MolSnoMeet
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $02, LevelBackgroundId::FROZEN_CAVE
  LSetX 0
  LWriteCol 11, 33
  LObjN LO::R_SOLID_BLOCK,    2, 4, 0, 8
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 4
  LObjN LO::WIDE_1,           4, 10, 3, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          2, 10
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObjN LO::WIDE_1,           9, 13, 1, LN1::SOLID_LEDGE
  LObj  LO::S_GROUND_CLIMB_L, 2, 12
  LObjN LO::R_GROUND,         0, 13, 8, 1
  LObj  LO::S_GROUND_CLIMB_L, 1, 11
  LObj  LO::S_GROUND,         0, 12
  LObj  LO::S_GROUND_CLIMB_L, 1, 10
  LObjN LO::R_GROUND,         0, 11, 0, 1
  LObjN LO::WIDE_1,           1, 7, 3, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 10, 5, 2
  LObjN LO::R_CEILING_BARRIER,5, 0, 0, 4
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 8
  LObjN LO::R_GROUND,         3, 13, 15, 1
  LObj  LO::S_STORY_TRIGGER,         1, 4
  LWriteCol <AfterSmiloidAtBummerClub, >AfterSmiloidAtBummerClub
  LObj  LO::S_EXIT_DOOR,      12, 11
  LFinished

boss3Sprite:
  LSpr Enemy::BOSS_FIGHT,          0,   0,   0, 1
  .byt 255 ; end
