boss2:
  .byt MusicTracks::NONE|0
  .byt 7
  .byt $2b
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_SCHEME_TEAM
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr boss2Data
  .addr boss2Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt 255 ; end
  .byt $60, $00 ; boundaries

boss2Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <SmiloidAtBummerClub, >SmiloidAtBummerClub
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $02, LevelBackgroundId::STARS
  LSetX 0
  LWriteCol 11, 33
  LObjN LO::R_SOLID_BLOCK,    2, 4, 0, 8
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 4
  LObjN LO::R_GROUND,         0, 11, 0, 1
  LObj  LO::S_GROUND_CLIMB_R, 1, 11
  LObj  LO::S_GROUND,         0, 12
  LObj  LO::S_GROUND_CLIMB_R, 1, 12
  LObjN LO::R_BG_GLASS_RED,   2, 7, 3, 0
  LObjN LO::R_BG_GLASS_RED,   0, 8, 0, 1
  LObjN LO::WIDE_1,           0, 10, 3, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          2, 10
  LWriteCol InventoryItem::ABILITY_FIRE | 128
  LObjN LO::R_BG_GLASS_RED,   1, 8, 0, 1
  LObjN LO::R_BG_GLASS_BLUE,  2, 9, 0, 3
  LObjN LO::R_BG_GLASS_BLUE,  1, 9, 2, 0
  LObj  LO::S_GROUND_CLIMB_L, 0, 12
  LObj  LO::S_SPRING,         1, 11
  LObj  LO::S_GROUND,         0, 12
  LObj  LO::S_GROUND_CLIMB_R, 1, 12
  LObjN LO::R_BG_GLASS_BLUE,  1, 9, 0, 3
  LObjN LO::WIDE_1,           2, 13, 1, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_RED,   1, 8, 3, 0
  LObjN LO::R_BG_GLASS_RED,   0, 9, 0, 3
  LObj  LO::S_GROUND_CLIMB_L, 1, 12
  LObjN LO::R_GROUND,         0, 13, 8, 1
  LObj  LO::S_GROUND_CLIMB_L, 1, 11
  LObj  LO::S_GROUND,         0, 12
  LObj  LO::S_GROUND_CLIMB_L, 1, 10
  LObjN LO::R_GROUND,         0, 11, 0, 1
  LObjN LO::R_BG_GLASS_BLUE,  1, 3, 3, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 2
  LObjN LO::WIDE_1,           0, 7, 3, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_RED,   0, 8, 0, 1
  LObjN LO::R_GROUND,         0, 10, 5, 2
  LObj  LO::S_BIGHEART,       1, 4
  LObj  LO::S_BIGHEART,       1, 6
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 0, 2
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 4
  LObjN LO::R_SOLID_BLOCK,    1, 4, 0, 8
  LObjN LO::R_GROUND,         3, 13, 15, 1
  LObj  LO::S_STORY_TRIGGER,         1, 4
  LWriteCol <AfterSmiloidAtBummerClub, >AfterSmiloidAtBummerClub
  LObjN LO::R_SOLID_BLOCK,    4, 0, 1, 1
  LObjN LO::R_BG_GLASS_RED,   0, 2, 0, 10
  LObjN LO::R_SOLID_BLOCK,    2, 0, 1, 4
  LObjN LO::R_BG_GLASS_RED,   0, 5, 0, 7
  LObjN LO::R_SOLID_BLOCK,    2, 0, 1, 7
  LObjN LO::R_BG_GLASS_RED,   0, 8, 0, 4
  LObjN LO::R_SOLID_BLOCK,    2, 0, 4, 9
  LObjN LO::R_BG_GLASS_RED,   0, 10, 0, 2
  LObj  LO::S_EXIT_DOOR,      2, 11
  LFinished

boss2Sprite:
  LSpr Enemy::BOSS_FIGHT,          0,   0,   0, 1
  .byt 255 ; end
