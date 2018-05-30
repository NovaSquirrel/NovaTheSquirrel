insane1b:
  .byt MusicTracks::WORLD_1B|0
  .byt 1
  .byt $f8
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_MINES
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_HANNAH
  .addr insane1bData
  .addr insane1bSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_MINES
  .byt GraphicsUpload::BG_TROPICAL
  .byt 255 ; end
  .byt $02, $00 ; boundaries

insane1bData:
  LObjN LO::R_GROUND,         0, 10, 8, 4
  LObjN LO::TALL_2,           2, 7, 2, LN2::PALM_TREE
  LObj  LO::S_SIGNPOST,       2, 9
  LWriteCol <SignAboutInsane2b, >SignAboutInsane2b
  LObjN LO::TALL_2,           2, 7, 2, LN2::PALM_TREE
  LObjN LO::R_GROUND,         1, 0, 7, 3
  LSetX 8
  LWriteCol Enemy::MINECART
  LObjN LO::R_GROUND,         4, 4, 1, 3
  LObjN LO::R_GROUND,         1, 7, 1, 3
  LObjN LO::R_ROCK,           2, 0, 3, 2
  LObjN LO::R_SOLID_BLOCK,    0, 3, 3, 0
  LObjN LO::R_COIN,           1, 6, 1, 0
  LObjN LO::R_COIN,           0, 8, 1, 0
  LObjN LO::R_COIN,           0, 10, 1, 0
  LObjN LO::WIDE_1,           2, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 0, 13, 1
  LObjN LO::R_SAND,           1, 10, 2, 4
  LObjN LO::R_SAND,           3, 5, 2, 9
  LObjN LO::WIDE_1,           3, 6, 5, LN1::SOLID_LEDGE
  LObjN LO::R_WATER,          0, 9, 5, 5
  LObjN LO::R_AIR,            2, 1, 4, 0
  LObjN LO::R_SAND,           4, 5, 2, 9
  LObjN LO::R_COIN,           4, 12, 4, 0
  LObjN LO::R_GROUND,         2, 5, 5, 3
  LObjN LO::R_COIN,           1, 3, 4, 0
  LObj  LO::S_BIGHEART,       2, 11
  LObjN LO::R_COIN,           1, 11, 4, 0
  LObjN LO::R_GROUND,         2, 6, 5, 3
  LObj  LO::S_PRIZE,          1, 3
  LWriteCol InventoryItem::ABILITY_FIRE | 128
  LObj  LO::S_BIG_SPIKY_BUSH, 0, 5
  LObjN LO::R_COIN,           0, 12, 4, 0
  LObj  LO::S_BIGHEART,       2, 3
  LObj  LO::S_BIG_SPIKY_BUSH, 0, 5
  LObjN LO::WIDE_1,           3, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         3, 6, 2, 8
  LObjN LO::R_SOLID_BLOCK,    2, 4, 0, 1
  LObjN LO::WIDE_1,           1, 6, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 8, 2, 6
  LObj  LO::S_BIG_SPIKY_BUSH, 1, 7
  LObjN LO::R_COIN,           2, 2, 4, 0
  LObjN LO::TALL_2,           1, 12, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 12, 2, LN2::PALM_TREE
  LObjN LO::R_GROUND,         2, 8, 4, 6
  LObjN LO::WIDE_1,           5, 8, 3, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 11, 3, 3
  LSetX 70
  LWriteCol Enemy::MINECART
  LObj  LO::S_BIG_SPIKY_BUSH, 0, 10
  LObjN LO::R_GROUND,         8, 13, 3, 1
  LObjN LO::R_GROUND,         1, 5, 1, 4
  LObjN LO::TALL_2,           0, 10, 2, LN2::PALM_TREE
  LObjN LO::WIDE_1,           2, 5, 7, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 8
  LObjN LO::R_SOLID_BLOCK,    0, 9, 4, 0
  LObj  LO::S_PRIZE,          2, 5
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObjN LO::R_COIN,           0, 7, 1, 0
  LObjN LO::R_GROUND,         6, 5, 1, 9
  LObjN LO::R_SOLID_BLOCK,    1, 3, 0, 1
  LObjN LO::R_COIN,           2, 3, 3, 0
  LObjN LO::R_CEILING_BARRIER,9, 0, 0, 2
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 5
  LObjN LO::WIDE_1,           0, 6, 3, LN1::SOLID_LEDGE
  LObj  LO::S_EXIT_DOOR,      2, 4
  LObjN LO::R_GROUND,         5, 0, 2, 14
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

insane1bSprite:
  LSpr Enemy::CANNON_2,            0,   8,   5, 2
  LSpr Enemy::CANNON_1,            1,  11,   6
  LSpr Enemy::THWOMP,              0,  18,   4, 1
  LSpr Enemy::OWL,                 0,  21,   9, 1
  LSpr Enemy::FALLING_SPIKE,       0,  30,   1, 2
  LSpr Enemy::FALLING_SPIKE,       0,  32,   1, 2
  LSpr Enemy::SPINNER,             0,  36,   2, 2
  LSpr Enemy::SPINNER,             0,  37,  10, 1
  LSpr Enemy::SPINNER,             0,  44,   2, 2
  LSpr Enemy::SPINNER,             0,  50,   3, 3
  LSpr Enemy::SPINNER,             0,  60,   5, 3
  LSpr Enemy::CHECKPOINT,          0,  66,   6
  LSpr Enemy::CANNON_2,            0,  70,   4, 2
  LSpr Enemy::OWL,                 0,  93,  12, 1
  LSpr Enemy::OWL,                 0,  99,  10, 1
  .byt 255 ; end
