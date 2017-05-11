chiptall:
  .byt MusicTracks::NONE|0
  .byt 133
  .byt $7b
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_SUN
  .byt GraphicsUpload::SP_FIRE
  .addr chiptallData
  .addr chiptallSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY1
  .byt 255 ; end
  .byt $01, $01 ; boundaries
  .byt $07, $08 ; link
  .byt $07, $80 ; link

chiptallData:
  .byt LSpecialCmd, LevelSpecialConfig::PUZZLE_MODE, AbilityType::NONE, InventoryItem::BLOCK, 128|98, InventoryItem::SPRING, 128|98, InventoryItem::HEALTH_RESTORE, 128|9, $00
  LObjN LO::R_SOLID_ROCK,     0, 0, 1, 14
  LObjN LO::R_SOLID_ROCK,     2, 0, 13, 1
  LObjN LO::WIDE_1,           1, 9, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_ROCK,     2, 8
  LObj  LO::S_PRIZE,          3, 11
  LWriteCol InventoryItem::ABILITY_WATER
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::CHIP, (2<<4)|0
  LObjN LO::WIDE_1,           0, 14, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           4, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          2, 3
  LWriteCol InventoryItem::ABILITY_WATER
  LObj  LO::S_CUSTOM,         2, 8, Metatiles::CHIP
  LObjN LO::WIDE_1,           0, 13, 15, LN1::SPIKES
  LObjN LO::R_SOLID_ROCK,     0, 14, 15, 0
  LObj  LO::S_HEART,          3, 6
  LObj  LO::S_CUSTOM,         2, 4, Metatiles::CHIP
  LObj  LO::R_CUSTOM,         2, 7, Metatiles::TOGGLE_BLOCK_ON, (4<<4)|4
  LObjN LO::R_SOLID_ROCK,     1, 2, 2, 0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::CHIP, (2<<4)|1
  LObjN LO::WIDE_1,           0, 10, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         5, 5, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|2
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::CHIP
  LObj  LO::S_PRIZE,          0, 9
  LWriteCol InventoryItem::ABILITY_BURGER
  LObj  LO::S_CUSTOM,         5, 2, Metatiles::CHIP
  LObjN LO::WIDE_1,           1, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::CHIP
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_SOLID_ROCK,     2, 0, 1, 6
  LObjN LO::R_COIN,           0, 11, 1, 0
  LObjN LO::R_SOLID_ROCK,     0, 12, 1, 2
  LObj  LO::S_CUSTOM,         2, 2, Metatiles::CHIP
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::CHIP
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::CHIP
  LObjN LO::R_SOLID_ROCK,     1, 2, 1, 4
  LObjN LO::WIDE_1,           2, 12, 0, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         3, 13, Metatiles::CHIP
  LObj  LO::S_CUSTOM,         2, 3, Metatiles::CHIP
  LObjN LO::TALL_1,           2, 3, 6, LN1::LADDER
  LObj  LO::S_SOLID_ROCK,     4, 2
  LObj  LO::S_SOLID_ROCK,     0, 11
  LObj  LO::S_CUSTOM,         2, 7, Metatiles::CHIP
  LObjN LO::TALL_1,           1, 11, 3, LN1::LADDER
  LObjN LO::WIDE_1,           3, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     2, 0, 1, 5
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::CHIP_SOCKET
  LObjN LO::R_SOLID_ROCK,     0, 7, 1, 7
  LSetX 63
  LWriteCol 28
  LObj  LO::R_CUSTOM,         2, 2, Metatiles::FORCE_RIGHT, (0<<4)|4
  LObjN LO::WIDE_1,           0, 7, 3, LN1::SOLID_LEDGE
  LSetX 126
  LObjN LO::R_SOLID_ROCK,     0, 0, 1, 14
  LObjN LO::R_SOLID_ROCK,     2, 0, 1, 12
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::S_BG_GLASS_GRAY,  7, 4
  LObj  LO::S_SIGNPOST,       0, 12
  LWriteCol <AboutChipTall, >AboutChipTall
  LObj  LO::S_BG_GLASS_GRAY,  1, 3
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 1
  LObjN LO::R_BG_GLASS_GRAY,  0, 2, 0, 6
  LObjN LO::R_GROUND,         0, 12, 6, 0
  LObj  LO::S_BG_GLASS_GRAY,  1, 3
  LObj  LO::S_BG_GLASS_GRAY,  1, 4
  LObjN LO::R_SOLID_ROCK,     5, 0, 15, 1
  LObjN LO::WIDE_1,           0, 14, 13, LN1::SPIKES
  LObj  LO::R_CUSTOM,         2, 7, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|2
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::CHIP
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|2
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::CHIP
  LObj  LO::S_HEART,          1, 6
  LObj  LO::S_PRIZE,          0, 10
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObjN LO::WIDE_1,           2, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 11, Metatiles::CHIP
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 3, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|2
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::CHIP
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_PRIZE,          1, 9
  LWriteCol InventoryItem::ABILITY_WATER
  LObjN LO::R_SOLID_ROCK,     2, 2, 1, 12
  LObj  LO::S_CUSTOM,         2, 8, Metatiles::CHIP
  LObjN LO::WIDE_1,           0, 14, 15, LN1::SPIKES
  LObj  LO::R_CUSTOM,         2, 2, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|7
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::TOGGLE_BLOCK_ON, (10<<4)|0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_BLOCK_OFF, (6<<4)|0
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::CHIP
  LObjN LO::WIDE_1,           0, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         3, 10, Metatiles::CHIP
  LObjN LO::WIDE_1,           2, 4, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|3
  LObj  LO::S_CUSTOM,         2, 6, Metatiles::CHIP
  LObjN LO::WIDE_1,           0, 11, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         4, 8, Metatiles::TOGGLE_BLOCK_OFF, (6<<4)|0
  LObjN LO::WIDE_1,           1, 14, 15, LN1::SPIKES
  LObjN LO::WIDE_1,           1, 7, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         3, 4, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|3
  LObj  LO::S_CUSTOM,         1, 10, Metatiles::CHIP
  LObjN LO::TALL_1,           4, 0, 2, LN1::LADDER
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::CHIP
  LObjN LO::WIDE_1,           2, 5, 0, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     2, 0, 1, 14
  LSetX 254
  LObjN LO::R_SOLID_ROCK,     0, 0, 1, 14
  LFinished

chiptallSprite:
  LSpr Enemy::SUN,                 0,  13,   1
  LSpr Enemy::SPINNER,             0,  18,   9, 3
  LSpr Enemy::THWOMP,              0,  24,   3
  LSpr Enemy::FIRE_JUMP,           0,  44,  11, 1
  LSpr Enemy::THWOMP,              0,  55,   4
  LSpr Enemy::FIRE_JUMP,           0,  61,   6, 1
  LSpr Enemy::CHECKPOINT,          0,  68,   6
  LSpr Enemy::SUN,                 0, 131,   1
  LSpr Enemy::CANNON_1,            1, 142,   7
  LSpr Enemy::OWL,                 0, 152,   7
  LSpr Enemy::OWL,                 0, 165,   6
  LSpr Enemy::OWL,                 0, 170,   3
  LSpr Enemy::OWL,                 0, 172,  10
  LSpr Enemy::FIRE_JUMP,           1, 189,   4, 1
  .byt 255 ; end
