insane2:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fb
  .byt GraphicsUpload::SP_WIND
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_LIFE
  .byt GraphicsUpload::SP_CANNON
  .addr insane2Data
  .addr insane2Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY5
  .byt 255 ; end
  .byt $02, $0e ; boundaries

insane2Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <AfterFirstBattle, >AfterFirstBattle
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 39
  LObjN LO::WIDE_1,           4, 12, 2, LN1::TALLGRASS
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::ABILITY_NICE | 128
  LObjN LO::R_FG_GLASS_BLUE,  1, 2, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 4, 9, 0
  LObjN LO::R_COIN,           1, 3, 2, 0
  LObjN LO::TALL_2,           0, 5, 7, LN2::TRUNK
  LObj  LO::S_FLOWER,         1, 12
  LSetX 9
  LWriteCol Metatiles::SPRING
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::REPLACE_BRICK
  LObjN LO::R_FG_GLASS_BLUE,  2, 5, 4, 1
  LObjN LO::R_BG_GLASS_BLUE,  0, 7, 4, 2
  LObjN LO::R_GROUND,         0, 10, 4, 2
  LObjN LO::R_COIN,           2, 3, 2, 0
  LObj  LO::R_CUSTOM,         3, 6, Metatiles::PICKUP_BLOCK, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::PICKUP_BLOCK, (2<<4)|2
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::KEY_GREEN
  LObj  LO::S_BIGHEART,       1, 4
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 11
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::LOCK_GREEN
  LObj  LO::R_CUSTOM,         3, 3, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LSetX 24
  LWriteCol Enemy::ELECTRIC_FAN
  LObjN LO::R_AIR,            0, 13, 0, 1
  LObjN LO::R_CEILING_BARRIER,5, 0, 0, 2
  LObjN LO::R_CEILING_BARRIER,0, 4, 6, 0
  LObjN LO::WIDE_1,           0, 11, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 7, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 5, 0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObjN LO::R_BG_GLASS_BLUE,  1, 1, 5, 0
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_BIGHEART,       1, 7
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::PICKUP_BLOCK, (2<<4)|1
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         1, 10, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObj  LO::S_CEILING_BARRIER,1, 5
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::KEY_RED
  LObjN LO::R_GROUND,         1, 4, 3, 8
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::LOCK_RED
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::WIDE_1,           1, 3, 0, LN1::FENCE
  LObjN LO::R_BG_GLASS_RED,   2, 7, 0, 5
  LObjN LO::R_COIN,           2, 3, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 7, 0, 5
  LObjN LO::R_BG_GLASS_BLUE,  2, 7, 0, 5
  LObjN LO::R_BG_GLASS_RED,   2, 7, 0, 5
  LObjN LO::R_BG_GLASS_GREEN, 2, 7, 0, 5
  LObjN LO::R_COIN,           1, 3, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 7, 0, 5
  LObjN LO::R_SOLID_ROCK,     4, 6, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 7, 0, 7
  LObj  LO::S_DOOR,           1, 8
  LWriteCol 6, 247
  LObjN LO::R_SOLID_ROCK,     0, 10, 1, 0
  LObjN LO::WIDE_1,           1, 6, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_BG_GLASS_GREEN, 1, 7, 0, 7
  LObjN LO::R_GROUND,         1, 5, 2, 9
  LObjN LO::R_SOLID_BLOCK,    2, 3, 0, 1
  LObjN LO::TALL_2,           2, 3, 7, LN2::PATH_LINE
  LObjN LO::R_COIN,           2, 5, 0, 4
  LObjN LO::R_SOLID_ROCK,     0, 11, 4, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 12, 0, 2
  LObj  LO::S_SIGNPOST,       1, 10
  LWriteCol <AboutFireWind, >AboutFireWind
  LObjN LO::WIDE_2,           1, 10, 1, LN2::FLOWER
  LObj  LO::R_CUSTOM,         1, 1, Metatiles::FORCE_LEFT, (11<<4)|0
  LObjN LO::WIDE_1,           0, 8, 0, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_GRAY,  1, 3, 2, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 4, 0, 6
  LObjN LO::R_BG_GLASS_GRAY,  0, 12, 0, 2
  LObjN LO::WIDE_1,           2, 11, 5, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     1, 2, 3, 0
  LObjN LO::R_SOLID_ROCK,     0, 3, 0, 5
  LObjN LO::R_SOLID_ROCK,     0, 9, 3, 0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::CAMPFIRE, (4<<4)|0
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 1, 5
  LObjN LO::R_SOLID_ROCK,     2, 3, 0, 5
  LObjN LO::R_BG_GLASS_GRAY,  1, 3, 15, 0
  LObjN LO::R_SOLID_ROCK,     2, 11, 4, 0
  LObjN LO::R_BG_GLASS_GRAY,  0, 12, 0, 2
  LObjN LO::TALL_1,           1, 6, 4, LN1::LADDER
  LObj  LO::R_CUSTOM,         1, 1, Metatiles::FORCE_LEFT, (15<<4)|0
  LObjN LO::WIDE_1,           0, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           0, 10, 1, LN2::FLOWER
  LObjN LO::R_COIN,           2, 7, 0, 2
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_BG_GLASS_GRAY,  0, 12, 0, 2
  LObjN LO::WIDE_1,           1, 11, 0, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     1, 8, 6, 0
  LObj  LO::S_SOLID_ROCK,     0, 9
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::LOCK_BLUE
  LObjN LO::WIDE_1,           0, 11, 3, LN1::SOLID_LEDGE
  LObj  LO::S_DOOR,           2, 9
  LWriteCol 5, 114
  LObjN LO::R_SOLID_ROCK,     1, 9, 0, 1
  LObjN LO::R_BG_GLASS_GREEN, 2, 11, 7, 0
  LObjN LO::R_BG_GLASS_GRAY,  1, 9, 0, 5
  LObj  LO::S_BG_GLASS_GRAY,  2, 3
  LObjN LO::R_SOLID_ROCK,     1, 2, 3, 0
  LObjN LO::R_SOLID_ROCK,     0, 3, 0, 3
  LObjN LO::R_COIN,           0, 7, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 1, 2
  LObjN LO::R_SOLID_ROCK,     0, 6, 1, 0
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GREEN, 0, 13
  LObjN LO::R_BG_GLASS_GREEN, 1, 10, 0, 2
  LObjN LO::R_SOLID_ROCK,     1, 3, 0, 3
  LObjN LO::WIDE_1,           1, 2, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::KEY_BLUE
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 5
  LObj  LO::S_BIGHEART,       1, 7
  LObj  LO::S_SPRING,         1, 5
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 0, 1
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 5
  LObjN LO::R_BG_GLASS_RED,   2, 4, 3, 3
  LObjN LO::R_COIN,           1, 2, 3, 0
  LObjN LO::WIDE_1,           0, 3, 3, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_GREEN, 1, 6, 3, 3
  LObjN LO::R_BG_GLASS_BLUE,  2, 8, 3, 3
  LObjN LO::R_SOLID_ROCK,     7, 5, 0, 1
  LObjN LO::R_GROUND,         0, 7, 5, 7
  LObj  LO::S_DOOR,           1, 5
  LWriteCol 9, 86
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::R_CUSTOM,         1, 0, Metatiles::FORCE_DOWN, (0<<4)|2
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::FORCE_RIGHT, (7<<4)|0
  LObjN LO::WIDE_1,           1, 1, 2, LN1::TALLGRASS
  LObjN LO::WIDE_1,           0, 2, 3, LN1::SOLID_LEDGE
  LObj  LO::S_DOOR,           1, 0
  LWriteCol 6, 227
  LObj  LO::S_SPRING,         0, 6
  LObj  LO::S_CUSTOM,         2, 1, Metatiles::KEY_RED
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::TOGGLE_SWITCH
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           1, 0, 2, LN2::TRUNK
  LObjN LO::TALL_2,           0, 4, 7, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 4, 1, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::FORCE_LEFT, (2<<4)|0
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::TOGGLE_BLOCK_OFF, (4<<4)|0
  LObj  LO::R_CUSTOM,         1, 0, Metatiles::FORCE_DOWN, (0<<4)|8
  LObj  LO::S_SIGNPOST,       0, 11
  LWriteCol <AboutGliderToggle, >AboutGliderToggle
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::WIDE_1,           0, 6, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 9
  LWriteCol InventoryItem::ABILITY_GLIDER | 128
  LObjN LO::R_BG_GLASS_GREEN, 1, 4, 2, 2
  LObjN LO::WIDE_1,           1, 12, 1, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|3
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::TOGGLE_BLOCK_ON, (6<<4)|0
  LObjN LO::R_COIN,           1, 5, 2, 1
  LObjN LO::R_BG_GLASS_GREEN, 1, 10, 2, 2
  LObjN LO::R_FG_GLASS_RED,   3, 1, 0, 2
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::CLONER
  LWriteCol Enemy::BUDDY * 2
  LObjN LO::R_FG_GLASS_RED,   1, 3, 5, 0
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::GLIDER_BLOCK, (0<<4)|3
  LObjN LO::R_GROUND,         0, 8, 3, 6
  LObjN LO::R_COIN,           1, 2, 2, 0
  LObj  LO::S_SIGNPOST,       0, 7
  LWriteCol <AboutCloner, >AboutCloner
  LObj  LO::S_CUSTOM,         2, 7, Metatiles::CLONE_SWITCH
  LWriteCol 136
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::KEY_RED
  LObjN LO::R_FG_GLASS_RED,   0, 8, 1, 0
  LObjN LO::R_FG_GLASS_RED,   1, 4, 0, 2
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::LOCK_RED
  LObjN LO::TALL_2,           0, 9, 5, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 3, 1, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORCE_RIGHT, (3<<4)|0
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::CAMPFIRE
  LObjN LO::R_FG_GLASS_BLUE,  2, 8, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 5
  LObj  LO::S_SOLID_BLOCK,    1, 5
  LObjN LO::R_BG_GLASS_BLUE,  3, 9, 0, 2
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::CLONER
  LWriteCol Enemy::BUDDY * 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 13, 0, 1
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::CLONE_SWITCH
  LWriteCol 150
  LObjN LO::WIDE_1,           0, 8, 8, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 12, 1, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           1, 4, 3, LN1::LADDER
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::R_COIN,           1, 3, 3, 0
  LObjN LO::R_FG_GLASS_RED,   0, 4, 5, 0
  LObj  LO::R_CUSTOM,         1, 5, Metatiles::FORCE_LEFT, (0<<4)|2
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::CAMPFIRE
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::KEY_RED
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::FORCE_RIGHT, (0<<4)|2
  LObjN LO::R_SOLID_ROCK,     0, 8, 0, 1
  LObj  LO::S_BG_GLASS_GRAY,  0, 10
  LObjN LO::WIDE_1,           0, 11, 3, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 1, 0, 1
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::LOCK_RED
  LObj  LO::S_DOOR,           0, 9
  LWriteCol 5, 216
  LObjN LO::WIDE_1,           1, 4, 1, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::CAMPFIRE
  LObj  LO::S_HEART,          1, 2
  LObjN LO::R_COIN,           0, 3, 3, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 4, 0, 10
  LObjN LO::R_FG_GLASS_RED,   1, 4, 1, 0
  LObjN LO::TALL_1,           0, 7, 3, LN1::LADDER
  LObjN LO::R_FG_GLASS_RED,   0, 11, 5, 3
  LObj  LO::S_FG_GLASS_RED,   1, 5
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::LOCK_RED
  LObjN LO::R_FG_GLASS_RED,   0, 7, 1, 0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::PICKUP_BLOCK, (2<<4)|0
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::CAMPFIRE
  LObjN LO::TALL_1,           1, 4, 2, LN1::LADDER
  LObj  LO::S_BIGHEART,       0, 12
  LObjN LO::R_AIR,            0, 12, 2, 0
  LObjN LO::R_SOLID_ROCK,     1, 3, 3, 0
  LObjN LO::R_SOLID_ROCK,     0, 4, 0, 3
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::KEY_RED
  LObjN LO::R_BG_GLASS_GREEN, 1, 4, 2, 2
  LObjN LO::R_SOLID_ROCK,     0, 7, 3, 0
  LObj  LO::S_CUSTOM,         1, 12, Metatiles::FORCE_RIGHT
  LObjN LO::R_CEILING_BARRIER,1, 0, 2, 0
  LObj  LO::S_CUSTOM,         0, 2, Metatiles::CLONE_SWITCH
  LWriteCol 169
  LObjN LO::R_FG_GLASS_BLUE,  0, 13, 8, 1
  LObj  LO::R_CUSTOM,         1, 1, Metatiles::FORCE_LEFT, (0<<4)|1
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::CLONER
  LWriteCol Enemy::BUDDY * 2
  LObjN LO::R_SOLID_ROCK,     0, 4, 0, 2
  LObjN LO::TALL_2,           0, 8, 4, LN2::TRUNK
  LObj  LO::S_CUSTOM,         4, 2, Metatiles::KEY_RED
  LObjN LO::WIDE_1,           0, 3, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 12, Metatiles::CAMPFIRE
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::CAMPFIRE
  LObjN LO::R_FG_GLASS_BLUE,  1, 1, 0, 10
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::LOCK_RED
  LObjN LO::R_FG_GLASS_BLUE,  1, 1, 14, 1
  LObj  LO::S_CUSTOM,         0, 4, Metatiles::GREEN_BOOTS
  LObjN LO::R_SOLID_BLOCK,    0, 5, 1, 0
  LObjN LO::WIDE_1,           0, 10, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 13, 14, 1
  LObj  LO::R_CUSTOM,         1, 3, Metatiles::FORCE_RIGHT, (0<<4)|1
  LObj  LO::S_CUSTOM,         2, 12, Metatiles::CLONE_SWITCH
  LWriteCol 181
  LObjN LO::R_COIN,           1, 5, 1, 0
  LObjN LO::WIDE_1,           0, 6, 2, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         0, 13, Metatiles::CLONER
  LWriteCol Enemy::BUDDY * 2
  LObj  LO::S_SPRING,         1, 9
  LObjN LO::WIDE_1,           0, 10, 6, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           2, 9, 3, 0
  LObjN LO::R_FG_GLASS_BLUE,  2, 3, 2, 0
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::FORCE_LEFT, (0<<4)|1
  LObjN LO::R_SOLID_ROCK,     0, 6, 2, 0
  LObj  LO::S_CUSTOM,         1, 5, Metatiles::KEY_RED
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::FORCE_RIGHT, (0<<4)|1
  LObjN LO::R_GROUND,         1, 9, 2, 3
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::CAMPFIRE
  LObjN LO::TALL_2,           1, 3, 5, LN2::TRUNK
  LObj  LO::R_CUSTOM,         1, 10, Metatiles::PICKUP_BLOCK, (3<<4)|1
  LObjN LO::WIDE_1,           0, 12, 3, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   4, 1, 6, 1
  LObjN LO::R_BG_GLASS_RED,   0, 3, 0, 5
  LObjN LO::R_FG_GLASS_RED,   0, 9, 6, 0
  LObjN LO::TALL_2,           0, 10, 4, LN2::TRUNK
  LObjN LO::R_COIN,           1, 6, 1, 2
  LObjN LO::R_FG_GLASS_RED,   2, 3, 0, 1
  LObj  LO::S_CUSTOM,         0, 5, Metatiles::LOCK_RED
  LObjN LO::R_FG_GLASS_RED,   0, 6, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 6, 3, 2
  LObjN LO::R_BG_GLASS_RED,   2, 3, 0, 2
  LObjN LO::TALL_2,           0, 10, 4, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 9, 2, LN1::SOLID_LEDGE
  LObj  LO::S_EXIT_DOOR,      1, 4
  LObjN LO::R_FG_GLASS_RED,   0, 6, 0, 1
  LObj  LO::S_FG_GLASS_RED,   1, 6
  LObjN LO::TALL_2,           0, 7, 1, LN2::TRUNK
  LObjN LO::R_COIN,           5, 7, 2, 2
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::SPRING, (12<<4)|0
  LObjN LO::R_SOLID_ROCK,     0, 11, 12, 3
  LObjN LO::R_FG_GLASS_RED,   3, 3, 6, 0
  LObjN LO::TALL_2,           0, 4, 2, LN2::TRUNK
  LObjN LO::R_FG_GLASS_RED,   0, 7, 6, 0
  LObjN LO::R_BG_GLASS_GREEN, 1, 2, 4, 0
  LObj  LO::S_PRIZE,          0, 5
  LObjN LO::R_BG_GLASS_GREEN, 1, 1, 2, 0
  LObj  LO::S_BG_GLASS_GREEN, 1, 0
  LObj  LO::S_DOOR,           0, 5
  LWriteCol 9, 158
  LObj  LO::S_PRIZE,          2, 5
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObjN LO::TALL_2,           1, 4, 2, LN2::TRUNK
  LObjN LO::R_COIN,           1, 7, 2, 2
  LObjN LO::R_BG_GLASS_GREEN, 6, 2, 11, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 3, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 11, 0
  LObjN LO::R_SOLID_ROCK,     0, 9, 11, 0
  LObjN LO::R_FG_GLASS_BLUE,  0, 10, 11, 0
  LObjN LO::R_SOLID_ROCK,     0, 11, 11, 0
  LObj  LO::S_DOOR,           1, 6
  LWriteCol 0, 118
  LObjN LO::R_COIN,           2, 4, 4, 1
  LObj  LO::S_SNOWMAN,         0, 6
  LObj  LO::S_SNOWMAN,         2, 6
  LObj  LO::S_SNOWMAN,         2, 6
  LObj  LO::S_PRIZE,          2, 5
  LWriteCol InventoryItem::ABILITY_NICE
  LObj  LO::S_EXIT_DOOR,      1, 6
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 0, 4
  LObjN LO::TALL_2,           4, 2, 10, LN2::PATH_LINE
  LObjN LO::R_COIN,           1, 1, 10, 0
  LObjN LO::WIDE_2,           0, 2, 10, LN2::PATH_LINE
  LObjN LO::R_COIN,           0, 11, 10, 0
  LObjN LO::WIDE_2,           0, 12, 10, LN2::PATH_LINE
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObj  LO::S_BG_GLASS_GRAY,  0, 4
  LObjN LO::R_FG_GLASS_BLUE,  0, 5, 9, 0
  LObjN LO::R_COIN,           0, 6, 2, 1
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 9, 0
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GRAY,  0, 10
  LObjN LO::R_BG_GLASS_GRAY,  1, 3, 8, 1
  LObj  LO::S_BG_GLASS_GREEN, 0, 4
  LObjN LO::R_BG_GLASS_GRAY,  0, 9, 8, 1
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObj  LO::S_DOOR,           0, 6
  LWriteCol 8, 56
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObjN LO::R_COIN,           0, 6, 2, 1
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObj  LO::S_BG_GLASS_GREEN, 0, 9
  LObj  LO::S_BG_GLASS_GREEN, 1, 4
  LObj  LO::S_BG_GLASS_GREEN, 0, 10
  LObjN LO::TALL_2,           1, 2, 10, LN2::PATH_LINE
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::STARS
  LFinished

insane2Sprite:
  LSpr Enemy::BIG_LWSS,            0,   3,   7, 1
  LSpr Enemy::BOOMERANG_GUY,       0,  11,   3, 1
  LSpr Enemy::CANNON_2,            0,  24,   0, 2
  LSpr Enemy::ELECTRIC_FAN,        0,  24,   2
  LSpr Enemy::BIG_GLIDER,          1,  33,   5
  LSpr Enemy::CHECKPOINT,          0,  60,   3
  LSpr Enemy::MOVING_PLATFORM_LINE, 0,  63,   3
  LSpr Enemy::ELECTRIC_FAN,        0,  68,   7
  LSpr Enemy::CLOUD,               0,  77,   7
  LSpr Enemy::ELECTRIC_FAN,        1,  81,   5
  LSpr Enemy::CLOUD,               1,  89,   5
  LSpr Enemy::BIG_LWSS,            0, 108,   1
  LSpr Enemy::CHECKPOINT,          0, 116,   6
  LSpr Enemy::CLOUD,               1, 123,   5
  LSpr Enemy::BIG_GLIDER,          0, 126,   2
  LSpr Enemy::BIG_LWSS,            0, 131,   9, 1
  LSpr Enemy::BIG_GLIDER,          0, 147,   1
  LSpr Enemy::ELECTRIC_FAN,        1, 147,   4
  LSpr Enemy::CHECKPOINT,          0, 148,   7
  LSpr Enemy::BIG_GLIDER,          0, 150,   3
  LSpr Enemy::CLOUD,               0, 172,  10
  LSpr Enemy::ELECTRIC_FAN,        1, 178,   9
  LSpr Enemy::CHECKPOINT,          0, 178,  12
  LSpr Enemy::COLLECTIBLE,         0, 234,   6
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 241,   7
  .byt 255 ; end
