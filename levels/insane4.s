insane4:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_SUN
  .addr insane4Data
  .addr insane4Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_CHIP
  .byt 255 ; end
  .byt $69, $15 ; boundaries
  .byt $00, $00 ; link
  .byt $00, $10 ; link
  .byt $00, $1f ; link
  .byt $00, $0f ; link
  .byt $00, $03 ; link
  .byt $00, $03 ; link
  .byt $00, $00 ; link
  .byt $00, $d0 ; link
  .byt $00, $d0 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $00 ; link
  .byt $00, $02 ; link
  .byt $00, $02 ; link
  .byt $00, $e0 ; link
  .byt $00, $e0 ; link

insane4Data:
  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <Intro, >Intro
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 31
  LObjN LO::WIDE_1,           8, 10, 4, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 12, 6, LN1::FENCE
  LObjN LO::R_COIN,           1, 9, 2, 0
  LObjN LO::WIDE_1,           3, 7, 4, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    4, 0, 11, 0
  LObj  LO::S_FLOWER,         0, 12
  LObj  LO::S_SOLID_BLOCK,    1, 7
  LObjN LO::TALL_2,           0, 8, 4, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 7, 4, LN1::SOLID_LEDGE
  LObj  LO::S_FLOWER,         0, 12
  LObjN LO::TALL_2,           3, 10, 2, LN2::TRUNK_L
  LObj  LO::S_HEART,          2, 5
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_SOLID_BLOCK,    0, 7
  LObjN LO::TALL_2,           0, 8, 4, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 12, 4, LN1::TALLGRASS
  LObjN LO::TALL_1,           5, 0, 12, LN1::LADDER
  LObjN LO::R_GROUND,         1, 0, 1, 12
  LObj  LO::R_CUSTOM,         2, 4, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LObjN LO::R_COIN,           0, 5, 0, 2
  LObj  LO::S_SPRING,         0, 8
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 13, 11, 1
  LObjN LO::TALL_1,           1, 0, 3, LN1::LADDER
  LObjN LO::R_GROUND,         1, 0, 12, 1
  LObj  LO::R_CUSTOM,         0, 2, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|1
  LObjN LO::TALL_2,           0, 10, 2, LN2::TRUNK_L
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::CAMPFIRE
  LObjN LO::WIDE_1,           0, 7, 2, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::PICKUP_BLOCK
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObjN LO::TALL_2,           0, 11, 1, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 10, 4, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 9, Metatiles::CAMPFIRE
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|4
  LObjN LO::WIDE_1,           0, 7, 2, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::CAMPFIRE
  LObjN LO::R_COIN,           1, 3, 2, 0
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::PICKUP_BLOCK
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         1, 5, Metatiles::PICKUP_BLOCK, (1<<4)|1
  LObj  LO::S_HEART,          1, 4
  LObj  LO::S_SOLID_BLOCK,    0, 7
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|1
  LObj  LO::S_SOLID_BLOCK,    0, 10
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|1
  LObjN LO::TALL_1,           3, 12, 2, LN1::LADDER
  LObjN LO::R_GROUND,         1, 0, 1, 14
  LObjN LO::WIDE_1,           3, 6, 1, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           0, 13, 1, LN1::LADDER
  LObjN LO::RECT_1,           1, 13, 1, LN1::GROUND, 27
  LObj  LO::S_CUSTOM,         2, 12, Metatiles::CAMPFIRE
  LObj  LO::S_SOLID_BLOCK,    2, 9
  LObjN LO::TALL_2,           0, 10, 2, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 9, 4, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    1, 5
  LObjN LO::TALL_2,           0, 6, 2, LN2::TRUNK
  LObjN LO::R_COIN,           0, 11, 2, 0
  LObjN LO::R_COIN,           1, 3, 2, 0
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          0, 9
  LWriteCol InventoryItem::BLOCK
  LObj  LO::S_HEART,          1, 6
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::CAMPFIRE
  LObj  LO::S_SOLID_BLOCK,    1, 5
  LObjN LO::TALL_2,           0, 6, 2, LN2::TRUNK
  LObj  LO::S_SOLID_BLOCK,    0, 9
  LObjN LO::TALL_2,           0, 10, 2, LN2::TRUNK
  LObj  LO::R_CUSTOM,         1, 9, Metatiles::PICKUP_BLOCK, (0<<4)|3
  LObjN LO::WIDE_1,           1, 11, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_2,           0, 12, 1, LN2::FLOWER
  LObjN LO::TALL_2,           2, 9, 3, LN2::TRUNK_L
  LObj  LO::S_FLOWER,         2, 12
  LObjN LO::TALL_2,           1, 9, 3, LN2::TRUNK_L
  LObj  LO::S_FLOWER,         2, 12
  LObjN LO::WIDE_1,           1, 3, 0, LN1::SPIKES
  LObj  LO::S_SOLID_BLOCK,    0, 4
  LObjN LO::TALL_2,           0, 5, 7, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 2, 4, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    0, 3, 4, 0
  LObjN LO::R_CEILING_BARRIER,0, 4, 1, 2
  LObjN LO::WIDE_2,           0, 12, 4, LN2::FLOWER
  LObj  LO::S_CUSTOM,         2, 6, Metatiles::KEY_GREEN
  LObjN LO::WIDE_1,           0, 7, 0, LN1::SOLID_LEDGE
  LObj  LO::S_HEART,          0, 9
  LObjN LO::R_CEILING_BARRIER,1, 4, 1, 2
  LObjN LO::WIDE_1,           2, 3, 0, LN1::SPIKES
  LObj  LO::S_SOLID_BLOCK,    0, 4
  LObjN LO::TALL_2,           0, 5, 7, LN2::TRUNK
  LObjN LO::WIDE_2,           1, 12, 1, LN2::FLOWER
  LObjN LO::TALL_1,           1, 13, 1, LN1::LADDER
  LObjN LO::R_ENEMY_BARRIER      ,  2, 0, 0, 4
  LObjN LO::TALL_1,           1, 13, 1, LN1::LADDER
  LObjN LO::R_COIN,           1, 10, 4, 0
  LObjN LO::WIDE_2,           1, 12, 3, LN2::BUSH
  LObjN LO::R_GROUND,         0, 13, 8, 1
  LObjN LO::R_COIN,           1, 8, 3, 0
  LObjN LO::R_COIN,           2, 6, 2, 0
  LObjN LO::WIDE_1,           2, 11, 3, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 7, 1, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         2, 7, 6, 7
  LObjN LO::R_SOLID_BLOCK,    1, 5, 2, 0
  LObjN LO::R_ENEMY_BARRIER      ,  1, 0, 0, 4
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 15, 0
  LObjN LO::R_SOLID_BLOCK,    0, 1, 0, 4
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::CHERRY_BOMB
  LObjN LO::R_ROCK,           1, 1, 9, 3
  LObjN LO::R_GROUND,         2, 9, 1, 5
  LObjN LO::R_COIN,           1, 7, 2, 0
  LObjN LO::R_GROUND,         2, 10, 1, 4
  LObj  LO::S_PRIZE,          2, 10
  LWriteCol InventoryItem::BLOCK | 128
  LObjN LO::R_ROCK,           3, 1, 9, 2
  LObjN LO::WIDE_1,           1, 8, 5, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 13, 3, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::CLONER
  LWriteCol Enemy::NONE
  LObjN LO::R_SOLID_BLOCK,    3, 0, 13, 0
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::CLONER
  LWriteCol Enemy::NONE | 1
  LObjN LO::R_ROCK,           0, 13, 0, 1
  LObjN LO::R_COIN,           1, 5, 2, 0
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::CLONE_SWITCH
  LWriteCol 109
  LObjN LO::R_ROCK,           0, 11, 3, 3
  LObj  LO::S_CUSTOM,         2, 10, Metatiles::CLONE_SWITCH
  LWriteCol 112
  LObjN LO::WIDE_1,           1, 8, 5, LN1::SOLID_LEDGE
  LObjN LO::R_ROCK,           1, 1, 3, 5
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::CHERRY_BOMB
  LObjN LO::R_ROCK,           0, 8, 3, 6
  LObj  LO::S_CUSTOM,         3, 7, Metatiles::PUSHABLE_BLOCK
  LObjN LO::TALL_2,           3, 5, 6, LN2::PATH_LINE
  LObjN LO::R_SOLID_BLOCK,    2, 1, 0, 2
  LObj  LO::S_CUSTOM,         0, 4, Metatiles::LOCK_GREEN
  LObjN LO::WIDE_1,           0, 5, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 1, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           1, 0, 4, LN1::LADDER
  LObjN LO::WIDE_1,           2, 4, 0, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           1, 0, 3, LN1::LADDER
  LObj  LO::S_SOLID_BLOCK,    0, 4
  LObjN LO::TALL_2,           0, 5, 9, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 3, 2, LN1::FENCE
  LObjN LO::WIDE_1,           0, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    1, 0, 12, 0
  LObj  LO::S_BIGHEART,       0, 5
  LObj  LO::S_SPRING,         0, 7
  LObj  LO::S_SOLID_BLOCK,    0, 8
  LObjN LO::TALL_2,           0, 9, 5, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 8, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 4
  LWriteCol InventoryItem::BLOCK
  LObjN LO::TALL_2,           0, 5, 2, LN2::TRUNK
  LObj  LO::S_SOLID_BLOCK,    2, 8
  LObjN LO::TALL_2,           0, 9, 5, LN2::TRUNK
  LObj  LO::S_SPRING,         2, 10
  LObj  LO::S_SOLID_BLOCK,    0, 11
  LObjN LO::TALL_2,           0, 12, 2, LN2::TRUNK
  LObj  LO::S_SOLID_BLOCK,    1, 5
  LObjN LO::TALL_2,           0, 6, 4, LN2::TRUNK
  LObjN LO::WIDE_1,           0, 11, 5, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 5, 0, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_BLOCK,    1, 5
  LObjN LO::TALL_2,           0, 6, 4, LN2::TRUNK
  LObj  LO::S_CEILING_BARRIER,4, 0
  LObj  LO::S_FLOWER,         0, 10
  LObj  LO::S_SOLID_BLOCK,    0, 11
  LObjN LO::TALL_2,           0, 12, 2, LN2::TRUNK
  LObjN LO::WIDE_1,           3, 8, 6, LN1::FENCE
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 10, 2, 1
  LObjN LO::R_COIN,           1, 2, 3, 0
  LObj  LO::S_PRIZE,          0, 3
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_BRICK,          0, 6, 1, 0
  LObjN LO::R_BRICK,          1, 3, 2, 0
  LObj  LO::S_PRIZE,          1, 6
  LObj  LO::S_SOLID_BLOCK,    0, 9
  LObjN LO::TALL_2,           0, 10, 4, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           0, 10, 0, 1
  LObj  LO::R_CUSTOM,         1, 3, Metatiles::PICKUP_BLOCK, (1<<4)|0
  LObjN LO::TALL_1,           0, 9, 2, LN1::LADDER
  LObj  LO::S_SPRING,         4, 8
  LObjN LO::R_GROUND,         0, 9, 6, 5
  LObjN LO::TALL_2,           1, 6, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 6, 2, LN2::TRUNK_L
  LObjN LO::WIDE_2,           2, 8, 2, LN2::FLOWER
  LObjN LO::R_GROUND,         1, 9, 1, 2
  LObjN LO::TALL_2,           3, 12, 2, LN2::TRUNK_L
  LObjN LO::R_COIN,           3, 2, 3, 0
  LObjN LO::WIDE_1,           0, 3, 7, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           0, 12, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           3, 12, 2, LN2::TRUNK_L
  LObj  LO::S_BIGHEART,       2, 2
  LObjN LO::TALL_2,           1, 12, 2, LN2::TRUNK_L
  LObjN LO::R_GROUND,         2, 3, 4, 11
  LObjN LO::R_GROUND,         5, 11, 5, 3
  LObjN LO::WIDE_1,           4, 7, 4, LN1::USED_PRIZE
  LObjN LO::TALL_2,           0, 8, 2, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 6, 2, LN1::USED_PRIZE
  LObjN LO::WIDE_1,           1, 5, 0, LN1::USED_PRIZE
  LObj  LO::S_DOOR,           0, 9
  LWriteCol 2, 200
  LObjN LO::R_ROCK,           0, 11, 3, 3
  LObjN LO::TALL_2,           2, 8, 2, LN2::TRUNK
  LObjN LO::WIDE_1,           2, 13, 15, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    0, 14, 15, 0
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::FORCE_RIGHT, (5<<4)|0
  LObj  LO::R_CUSTOM,         1, 5, Metatiles::GLIDER_BLOCK, (3<<4)|0
  LObjN LO::WIDE_1,           5, 4, 2, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORCE_UP, (0<<4)|1
  LObj  LO::S_DOOR,           1, 2
  LWriteCol 9, 188
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::GLIDER_BLOCK, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::GLIDER_BLOCK, (0<<4)|1
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::GLIDER_BLOCK, (2<<4)|0
  LObj  LO::S_CUSTOM,         1, 3, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_COIN,           0, 6, 2, 0
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::KEY_GREEN
  LObj  LO::R_CUSTOM,         2, 4, Metatiles::TOGGLE_BLOCK_OFF, (4<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::GLIDER_BLOCK, (0<<4)|4
  LObj  LO::R_CUSTOM,         1, 9, Metatiles::TOGGLE_BLOCK_ON, (6<<4)|0
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::GLIDER_BLOCK, (6<<4)|0
  LObj  LO::R_CUSTOM,         2, 10, Metatiles::GLIDER_BLOCK, (2<<4)|0
  LObjN LO::WIDE_1,           2, 13, 4, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    0, 14, 4, 0
  LObjN LO::WIDE_1,           1, 6, 3, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 3
  LWriteCol InventoryItem::ABILITY_GLIDER | 128
  LObj  LO::S_BIGHEART,       0, 11
  LObj  LO::R_CUSTOM,         1, 9, Metatiles::GLIDER_BLOCK, (2<<4)|0
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|3
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         1, 9, Metatiles::TOGGLE_BLOCK_ON, (1<<4)|0
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           0, 12, 2, LN1::LADDER
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::GLIDER_BLOCK, (6<<4)|0
  LObj  LO::S_GLIDER_BLOCK,   0, 9
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::GLIDER_BLOCK, (6<<4)|0
  LObjN LO::R_COIN,           1, 9, 4, 0
  LObjN LO::R_COIN,           2, 2, 3, 0
  LObjN LO::WIDE_1,           0, 3, 3, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         0, 6
  LObj  LO::S_BIGHEART,       0, 7
  LObj  LO::S_GLIDER_BLOCK,   3, 9
  LObjN LO::R_ENEMY_BARRIER      ,  2, 1, 0, 3
  LObjN LO::R_SOLID_BLOCK,    1, 0, 14, 0
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::FORCE_RIGHT, (5<<4)|0
  LObjN LO::R_SOLID_BLOCK,    0, 8, 0, 2
  LObjN LO::R_SOLID_BLOCK,    0, 11, 4, 0
  LObj  LO::S_SOLID_BLOCK,    1, 8
  LObj  LO::S_EXIT_DOOR,      0, 9
  LObjN LO::R_SOLID_BLOCK,    1, 8, 0, 1
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::LOCK_GREEN
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::TOGGLE_BLOCK_ON, (1<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::TOGGLE_BLOCK_OFF, (1<<4)|0
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::TOGGLE_SWITCH, (5<<4)|0
  LObjN LO::R_SOLID_BLOCK,    0, 13, 5, 0
  LObjN LO::R_SOLID_BLOCK,    1, 8, 0, 3
  LObj  LO::R_CUSTOM,         1, 5, Metatiles::GLIDER_BLOCK, (5<<4)|0
  LObjN LO::R_COIN,           0, 8, 2, 0
  LObj  LO::S_GLIDER_BLOCK,   0, 9
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::GLIDER_BLOCK, (2<<4)|0
  LObj  LO::S_CUSTOM,         1, 9, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_BIGHEART,       1, 4
  LObjN LO::R_COIN,           1, 4, 2, 0
  LObj  LO::R_CUSTOM,         3, 8, Metatiles::GLIDER_BLOCK, (2<<4)|0
  LObjN LO::R_COIN,           1, 3, 0, 2
  LObjN LO::R_SOLID_BLOCK,    2, 0, 4, 0
  LObjN LO::R_COIN,           1, 9, 2, 0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::GLIDER_BLOCK, (2<<4)|0
  LObj  LO::S_SPRING,         3, 6
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::GLIDER_BLOCK, (2<<4)|0
  LObjN LO::WIDE_1,           2, 4, 2, LN1::SOLID_LEDGE
  LObjN LO::TALL_1,           1, 0, 3, LN1::LADDER
  LObj  LO::R_CUSTOM,         2, 11, Metatiles::GLIDER_BLOCK, (2<<4)|0
  LObjN LO::TALL_1,           1, 7, 3, LN1::LADDER
  LObjN LO::R_COIN,           1, 5, 2, 1
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::GLIDER_BLOCK, (2<<4)|0
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

insane4Sprite:
  LSpr Enemy::CANNON_1,            0,   4,   6, 1
  LSpr Enemy::GEORGE,              0,  17,   6
  LSpr Enemy::GEORGE,              0,  21,   6
  LSpr Enemy::OWL,                 0,  33,  12, 1
  LSpr Enemy::THWOMP,              0,  36,   2, 1
  LSpr Enemy::GEORGE,              0,  50,   5
  LSpr Enemy::SPINNER,             0,  52,   3, 2
  LSpr Enemy::CHECKPOINT,          0,  57,   7
  LSpr Enemy::GOOMBA,              1,  58,   4, 1
  LSpr Enemy::GOOMBA,              1,  60,   8, 1
  LSpr Enemy::SPINNER,             0,  65,   5, 3
  LSpr Enemy::THWOMP,              0,  70,   5
  LSpr Enemy::CANNON_1,            1,  78,   9, 1
  LSpr Enemy::CANNON_1,            1,  79,   6, 1
  LSpr Enemy::CANNON_1,            0,  81,   6, 1
  LSpr Enemy::KING,                0,  83,   2
  LSpr Enemy::CHECKPOINT,          0,  93,   4
  LSpr Enemy::SPINNER,             0, 121,  12, 2
  LSpr Enemy::MOVING_PLATFORM_LINE, 0, 123,   5, 1
  LSpr Enemy::CHECKPOINT,          0, 125,   8
  LSpr Enemy::OWL,                 0, 133,   7
  LSpr Enemy::GEORGE,              0, 139,   4
  LSpr Enemy::GEORGE,              0, 140,  10
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 147,  12, 5
  LSpr Enemy::GEORGE,              0, 149,   5
  LSpr Enemy::OWL,                 0, 161,   8
  LSpr Enemy::SPINNER,             0, 172,   6, 1
  LSpr Enemy::CHECKPOINT,          0, 176,   2
  LSpr Enemy::SPINNER,             1, 200,   8, 3
  LSpr Enemy::OWL,                 0, 204,  11
  LSpr Enemy::SPINNER,             0, 210,   7, 3
  LSpr Enemy::SNEAKER,             1, 216,   3
  LSpr Enemy::SNEAKER,             1, 217,   7
  LSpr Enemy::SPINNER,             1, 221,   7, 2
  LSpr Enemy::KING,                0, 226,   1
  LSpr Enemy::OWL,                 0, 232,   4
  LSpr Enemy::OWL,                 0, 238,   7
  LSpr Enemy::OWL,                 0, 245,   6
  LSpr Enemy::SPINNER,             1, 252,   5, 3
  .byt 255 ; end
