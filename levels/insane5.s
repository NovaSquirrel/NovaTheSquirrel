insane5:
  .byt MusicTracks::WORLD_2|0
  .byt 2
  .byt $fa
  .byt GraphicsUpload::SP_WIND
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_HANNAH
  .addr insane5Data
  .addr insane5Sprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_BUMMER
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_BUMMER
  .byt GraphicsUpload::BG_CHIP
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::PAL_ENEMY5
  .byt 255 ; end
  .byt $00, $08 ; boundaries

insane5Data:
  LObjN LO::RECT_1,           0, 12, 2, LN1::GROUND, 38
  LObjN LO::R_BG_GLASS_GREEN, 1, 1, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 2, 0, 1
  LObjN LO::R_BG_GLASS_GREEN, 0, 4, 3, 0
  LObjN LO::R_BG_GLASS_GREEN, 3, 2, 0, 1
  LObjN LO::R_FG_GLASS_RED,   0, 8, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 7, 2, 0
  LObj  LO::S_FG_GLASS_RED,   1, 6
  LObj  LO::S_SOLID_ROCK,     2, 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 2
  LObjN LO::R_BG_GLASS_GREEN, 3, 3, 1, 1
  LObj  LO::S_SIGNPOST,       1, 8
  LWriteCol <AboutLaser, >AboutLaser
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObj  LO::S_CUSTOM,         1, 8, Metatiles::PUSHABLE_BLOCK
  LObjN LO::R_GROUND,         0, 9, 9, 2
  LObjN LO::WIDE_1,           2, 9, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           0, 10, 2, 0
  LObj  LO::S_SOLID_ROCK,     1, 5
  LObjN LO::R_FG_GLASS_RED,   1, 5, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 6, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 4, 2, 0
  LObj  LO::S_COIN,           0, 7
  LObj  LO::S_FG_GLASS_RED,   1, 3
  LObj  LO::S_COIN,           0, 6
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::KEY_GREEN
  LObj  LO::S_COIN,           0, 8
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObj  LO::S_COIN,           0, 7
  LObjN LO::WIDE_1,           0, 9, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::TELEPORTER
  LWriteCol 7, 14
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 4
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::LOCK_GREEN
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 0, 2
  LObjN LO::WIDE_1,           2, 9, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           0, 10, 2, 1
  LObjN LO::WIDE_1,           2, 6, 3, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_W_ARROW_RIGHT,  0, 8
  LObj  LO::S_FG_GLASS_RED,   2, 4
  LObj  LO::S_M_ARROW_RIGHT,  0, 5
  LObj  LO::S_M_CRATE,        0, 8
  LObj  LO::S_FG_GLASS_RED,   0, 10
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 4
  LObj  LO::S_M_CRATE,        0, 5
  LObjN LO::R_FG_GLASS_BLUE,  0, 6, 0, 5
  LObjN LO::R_BG_GLASS_GREEN, 2, 1, 0, 3
  LObj  LO::S_SOLID_ROCK,     0, 11
  LObjN LO::R_BG_GLASS_GREEN, 1, 1, 1, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 4, 1, 0
  LObj  LO::S_SPRING,         0, 11
  LObjN LO::R_BG_GLASS_GREEN, 2, 1, 0, 3
  LObjN LO::R_FG_GLASS_RED,   0, 8, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 7, 2, 0
  LObj  LO::S_COIN,           0, 10
  LObj  LO::S_FG_GLASS_RED,   1, 6
  LObj  LO::S_COIN,           0, 9
  LObj  LO::S_COIN,           0, 11
  LObj  LO::S_COIN,           1, 10
  LObjN LO::R_BG_GLASS_BLUE,  1, 9, 0, 2
  LObjN LO::WIDE_1,           1, 8, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 4, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 5, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 4, 0
  LObjN LO::R_FG_GLASS_RED,   1, 3, 2, 0
  LObj  LO::S_COIN,           0, 6
  LObj  LO::S_FG_GLASS_RED,   1, 2
  LObj  LO::S_COIN,           0, 5
  LObj  LO::S_HEART,          0, 6
  LObj  LO::S_COIN,           0, 7
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 5
  LObj  LO::S_COIN,           1, 6
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_BLUE,  1, 5, 0, 2
  LObjN LO::WIDE_1,           1, 8, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 8, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 2
  LObjN LO::R_GROUND,         0, 12, 4, 2
  LObjN LO::R_BG_GLASS_GREEN, 1, 2, 2, 0
  LObjN LO::R_FG_GLASS_RED,   0, 7, 2, 0
  LObj  LO::S_COIN,           0, 10
  LObjN LO::R_BG_GLASS_GREEN, 1, 1, 0, 2
  LObj  LO::S_FG_GLASS_RED,   0, 6
  LObj  LO::S_COIN,           0, 9
  LObj  LO::S_W_ARROW_RIGHT,  0, 10
  LObj  LO::S_COIN,           0, 11
  LObj  LO::S_COIN,           1, 10
  LObj  LO::R_CUSTOM,         2, 8, Metatiles::FORCE_UP, (0<<4)|4
  LObj  LO::S_M_ARROW_RIGHT,  1, 7
  LObj  LO::S_M_ARROW_UP,     0, 10
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::FORCE_LEFT, (7<<4)|0
  LObj  LO::S_M_ARROW_RIGHT,  2, 7
  LObjN LO::WIDE_1,           0, 11, 4, LN1::SOLID_LEDGE
  LObj  LO::S_FG_GLASS_RED,   2, 1
  LObj  LO::S_M_CRATE,        0, 7
  LObj  LO::S_M_ARROW_RIGHT,  0, 8
  LObj  LO::S_SOLID_BLOCK,    0, 13
  LObjN LO::R_BG_GLASS_GREEN, 2, 4, 2, 0
  LObj  LO::S_BIGHEART,       0, 8
  LObjN LO::WIDE_1,           0, 9, 1, LN1::SOLID_LEDGE
  LObj  LO::S_SOLID_ROCK,     0, 10
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 0, 2
  LObjN LO::R_SOLID_ROCK,     1, 7, 2, 0
  LObj  LO::S_M_CRATE,        0, 8
  LObjN LO::R_SOLID_ROCK,     0, 9, 2, 0
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObj  LO::S_PRIZE,          0, 4
  LWriteCol InventoryItem::BLOCK
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_BG_GLASS_GRAY,  0, 10, 0, 4
  LObj  LO::R_CUSTOM,         1, 0, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|6
  LObj  LO::S_SOLID_ROCK,     0, 8
  LObj  LO::S_CUSTOM,         2, 10, Metatiles::FORCE_RIGHT
  LObjN LO::R_FG_GLASS_RED,   1, 7, 8, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 8, 0
  LObjN LO::RECT_1,           0, 12, 2, LN1::GROUND, 19
  LObj  LO::S_BG_GLASS_RED,   1, 6
  LObjN LO::R_COIN,           0, 9, 6, 0
  LObjN LO::R_BG_GLASS_RED,   1, 5, 0, 1
  LObjN LO::R_BG_GLASS_GREEN, 1, 2, 2, 0
  LObjN LO::R_BG_GLASS_RED,   0, 4, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 3, 0, 3
  LObjN LO::R_BG_GLASS_RED,   1, 4, 0, 2
  LObjN LO::R_BG_GLASS_RED,   1, 5, 0, 1
  LObj  LO::S_BG_GLASS_RED,   1, 6
  LObjN LO::R_BG_GLASS_GREEN, 1, 2, 2, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 2
  LObjN LO::R_BG_GLASS_GREEN, 1, 1, 0, 2
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_OFF
  LObjN LO::R_AIR,            0, 12, 2, 0
  LObjN LO::WIDE_1,           1, 8, 0, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::TOGGLE_BLOCK_OFF, (1<<4)|0
  LObj  LO::S_GROUND_CLIMB_L, 1, 12
  LObj  LO::S_CUSTOM,         1, 1, Metatiles::TOGGLE_BLOCK_ON
  LObjN LO::TALL_1,           0, 4, 2, LN1::LADDER
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::PUSHABLE_BLOCK
  LObjN LO::R_FG_GLASS_RED,   0, 8, 6, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 4, 5, 0
  LObjN LO::R_COIN,           0, 10, 4, 0
  LObj  LO::S_CUSTOM,         1, 11, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_BG_GLASS_BLUE,  1, 5, 0, 2
  LObj  LO::S_HEART,          0, 11
  LObjN LO::R_COIN,           2, 5, 1, 2
  LObjN LO::R_BG_GLASS_BLUE,  1, 9, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 3, 0, 5
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORCE_LEFT, (2<<4)|0
  LObjN LO::R_FG_GLASS_RED,   1, 3, 1, 0
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::FORCE_DOWN, (0<<4)|3
  LObjN LO::R_GROUND,         1, 7, 2, 7
  LObj  LO::S_BG_GLASS_GREEN, 1, 3
  LObj  LO::S_BG_GLASS_GREEN, 2, 3
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::FORCE_UP, (0<<4)|2
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::CLONER
  LWriteCol Enemy::BUDDY*2
  LObjN LO::WIDE_1,           0, 13, 4, LN1::SOLID_LEDGE
  LObj  LO::S_BG_GLASS_GREEN, 2, 3
  LObj  LO::S_SOLID_ROCK,     1, 8
  LObj  LO::S_FG_GLASS_RED,   0, 14
  LObjN LO::R_FG_GLASS_RED,   1, 3, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 3
  LObjN LO::R_FG_GLASS_BLUE,  0, 8, 4, 0
  LObjN LO::R_FG_GLASS_RED,   1, 2, 2, 0
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObj  LO::S_FG_GLASS_RED,   1, 1
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::CLONE_SWITCH
  LWriteCol 91
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 3
  LObj  LO::S_BG_GLASS_BLUE,  0, 14
  LObj  LO::S_CUSTOM,         1, 9, Metatiles::CAMPFIRE
  LObjN LO::WIDE_1,           0, 10, 6, LN1::SOLID_LEDGE
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 0, 3
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::TOGGLE_BLOCK_ON
  LObjN LO::WIDE_1,           0, 13, 2, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 5
  LWriteCol InventoryItem::SPRING
  LObjN LO::R_SOLID_ROCK,     0, 8, 4, 0
  LObj  LO::S_BIGHEART,       0, 12
  LObj  LO::S_FG_GLASS_RED,   0, 14
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 1, 0
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_COIN,           0, 12, 2, 0
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LObjN LO::R_FG_GLASS_RED,   2, 3, 9, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 3
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_RED,   0, 2, 4, 0
  LObj  LO::S_M_CRATE,        0, 5
  LObjN LO::R_SOLID_ROCK,     0, 10, 4, 0
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::KEY_GREEN
  LObjN LO::WIDE_1,           0, 13, 2, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 1, 2, 0
  LObj  LO::S_FG_GLASS_RED,   1, 0
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::CAMPFIRE
  LObj  LO::S_M_ARROW_LEFT,   1, 5
  LObj  LO::S_W_ARROW_UP,     0, 9
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::CAMPFIRE
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 0, 10
  LObjN LO::WIDE_1,           2, 9, 3, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 4, 0, 3
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::LOCK_GREEN
  LObjN LO::R_BG_GLASS_GREEN, 2, 2, 2, 0
  LObjN LO::R_BG_GLASS_GREEN, 1, 1, 0, 2
  LObj  LO::S_BG_GLASS_GRAY,  1, 7
  LObj  LO::S_BG_GLASS_GRAY,  0, 10
  LObj  LO::S_SOLID_ROCK,     2, 4
  LObj  LO::S_SOLID_ROCK,     0, 12
  LObjN LO::R_BG_GLASS_GREEN, 2, 4, 2, 0
  LObj  LO::S_BG_GLASS_GRAY,  0, 7
  LObj  LO::S_BG_GLASS_GRAY,  0, 10
  LObjN LO::R_BG_GLASS_GREEN, 1, 3, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 7, 4, 0
  LObjN LO::R_SOLID_ROCK,     0, 8, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 4, 0
  LObjN LO::R_FG_GLASS_RED,   1, 6, 2, 0
  LObj  LO::S_COIN,           0, 9
  LObj  LO::S_FG_GLASS_RED,   1, 5
  LObj  LO::S_COIN,           0, 8
  LObj  LO::S_COIN,           0, 10
  LObjN LO::R_BG_GLASS_BLUE,  0, 12, 0, 2
  LObj  LO::S_M_ARROW_DOWN,   1, 4
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::METAL_CRATE, (5<<4)|0
  LObj  LO::S_COIN,           0, 9
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::FORK_ARROW_DOWN, (4<<4)|0
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 2
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::METAL_CRATE, (3<<4)|0
  LObj  LO::S_M_ARROW_UP,     0, 9
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_OFF, (5<<4)|0
  LObj  LO::R_CUSTOM,         1, 9, Metatiles::FORK_ARROW_UP, (2<<4)|0
  LObj  LO::S_W_ARROW_LEFT,   3, 4
  LObjN LO::R_FG_GLASS_RED,   0, 5, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 6, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 9, 4, 0
  LObjN LO::R_FG_GLASS_RED,   1, 4, 2, 0
  LObj  LO::S_COIN,           0, 7
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::LOCK_RED
  LObj  LO::S_FG_GLASS_RED,   1, 3
  LObj  LO::S_COIN,           0, 6
  LObj  LO::S_COIN,           0, 8
  LObjN LO::R_BG_GLASS_BLUE,  0, 10, 0, 4
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::TOGGLE_BLOCK_OFF, (2<<4)|0
  LObj  LO::S_COIN,           1, 7
  LObj  LO::S_BIGHEART,       0, 12
  LObjN LO::R_BG_GLASS_BLUE,  1, 6, 0, 2
  LObj  LO::S_PRIZE,          0, 11
  LWriteCol InventoryItem::BLOCK
  LObj  LO::S_W_ARROW_DOWN,   1, 5
  LObj  LO::S_M_ARROW_LEFT,   0, 9
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::FORCE_RIGHT, (1<<4)|0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORCE_UP, (0<<4)|3
  LObj  LO::S_CUSTOM,         2, 7, Metatiles::TOGGLE_BLOCK_ON
  LObjN LO::WIDE_1,           0, 11, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_RED,   1, 5, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 6, 0, 4
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 4, 0
  LObjN LO::R_FG_GLASS_RED,   1, 4, 2, 0
  LObj  LO::S_FG_GLASS_RED,   1, 3
  LObj  LO::S_CUSTOM,         0, 10, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_BG_GLASS_BLUE,  0, 12, 0, 2
  LObjN LO::R_BG_GLASS_BLUE,  2, 6, 0, 4
  LObjN LO::R_BG_GLASS_RED,   3, 2, 0, 1
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::WOOD_CRATE, (6<<4)|0
  LObjN LO::R_BG_GLASS_RED,   0, 12, 0, 1
  LObj  LO::S_M_ARROW_DOWN,   1, 10
  LObj  LO::S_M_ARROW_RIGHT,  0, 11
  LObjN LO::R_BG_GLASS_GREEN, 1, 2, 0, 1
  LObj  LO::S_HEART,          0, 9
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::FORK_ARROW_DOWN, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::METAL_CRATE, (4<<4)|0
  LObjN LO::R_BG_GLASS_GREEN, 0, 12, 0, 1
  LObjN LO::R_BG_GLASS_BLUE,  2, 2, 0, 1
  LObj  LO::S_HEART,          0, 9
  LObjN LO::R_BG_GLASS_BLUE,  0, 12, 0, 1
  LObjN LO::R_BG_GLASS_RED,   2, 2, 0, 1
  LObj  LO::S_CUSTOM,         0, 9, Metatiles::KEY_RED
  LObj  LO::S_W_ARROW_LEFT,   0, 10
  LObjN LO::R_BG_GLASS_RED,   0, 12, 0, 1
  LObjN LO::R_BG_GLASS_GREEN, 2, 2, 0, 1
  LObj  LO::S_HEART,          0, 8
  LObj  LO::S_W_CRATE,        0, 9
  LObj  LO::S_W_CRATE,        0, 11
  LObjN LO::R_BG_GLASS_GREEN, 0, 12, 0, 1
  LObjN LO::R_BG_GLASS_BLUE,  2, 2, 0, 1
  LObj  LO::S_HEART,          0, 6
  LObj  LO::S_W_CRATE,        0, 7
  LObj  LO::S_SPRING,         0, 9
  LObjN LO::R_BG_GLASS_BLUE,  0, 12, 0, 1
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_RED,   2, 3, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 7, 4, 0
  LObjN LO::R_GROUND,         0, 8, 4, 6
  LObjN LO::R_FG_GLASS_RED,   1, 2, 2, 0
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_FG_GLASS_RED,   1, 1
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 0, 2
  LObjN LO::R_BG_GLASS_GRAY,  1, 7, 4, 0
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_GROUND,         0, 11, 4, 3
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObj  LO::S_PRIZE,          3, 9
  LWriteCol InventoryItem::BLOCK
  LObjN LO::R_SOLID_ROCK,     1, 7, 4, 0
  LObjN LO::R_SOLID_ROCK,     0, 8, 0, 2
  LObjN LO::WIDE_1,           0, 11, 3, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 4
  LWriteCol InventoryItem::BLOCK
  LObjN LO::R_COIN,           0, 6, 2, 0
  LObjN LO::WIDE_1,           1, 4, 1, LN1::PRIZE
  LObjN LO::TALL_1,           2, 8, 2, LN1::LADDER
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORCE_UP, (0<<4)|3
  LObjN LO::R_BG_GLASS_GRAY,  1, 7, 3, 0
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::WIDE_1,           0, 11, 4, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 14, Metatiles::FORCE_LEFT, (15<<4)|0
  LObj  LO::S_DOOR,           1, 9
  LWriteCol 1, 179
  LObj  LO::S_DOOR,           3, 1
  LWriteCol 9, 176
  LObjN LO::WIDE_1,           0, 3, 0, LN1::SOLID_LEDGE
  LObjN LO::R_FG_GLASS_BLUE,  0, 7, 7, 0
  LObj  LO::S_SOLID_BLOCK,    1, 6
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::FORCE_LEFT, (0<<4)|1
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORCE_LEFT, (0<<4)|2
  LObj  LO::S_CUSTOM,         0, 14, Metatiles::FORCE_LEFT
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 3
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::FORCE_LEFT, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORCE_LEFT, (2<<4)|0
  LObjN LO::R_COIN,           0, 13, 2, 0
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::R_FG_GLASS_RED,   0, 3, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 2
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_FG_GLASS_RED,   0, 2, 2, 0
  LObj  LO::S_COIN,           0, 5
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObj  LO::S_FG_GLASS_RED,   0, 1
  LObjN LO::R_SOLID_ROCK,     0, 4, 0, 1
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::LOCK_GREEN
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 6
  LObj  LO::S_CUSTOM,         0, 14, Metatiles::FORCE_LEFT
  LObj  LO::S_COIN,           1, 5
  LObjN LO::R_BG_GLASS_GREEN, 0, 9, 5, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 11, 5, 0
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::KEY_GREEN
  LObjN LO::R_COIN,           0, 13, 5, 0
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 0, 2
  LObj  LO::S_M_CRATE,        1, 2
  LObjN LO::WIDE_1,           0, 4, 0, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         0, 7, 4, 1
  LObj  LO::S_M_ARROW_LEFT,   1, 2
  LObj  LO::S_W_ARROW_UP,     0, 12
  LObj  LO::R_CUSTOM,         3, 11, Metatiles::BIG_HEART, (0<<4)|2
  LObj  LO::R_CUSTOM,         0, 14, Metatiles::FORCE_LEFT, (2<<4)|0
  LObjN LO::R_FG_GLASS_RED,   1, 3, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 4, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 7, 4, 0
  LObjN LO::R_SOLID_ROCK,     0, 8, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 2, 2, 0
  LObj  LO::S_COIN,           0, 5
  LObj  LO::S_FG_GLASS_RED,   1, 1
  LObj  LO::S_COIN,           0, 4
  LObj  LO::S_COIN,           0, 6
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 6
  LObj  LO::S_COIN,           1, 5
  LObjN LO::R_BG_GLASS_BLUE,  1, 4, 0, 2
  LObjN LO::R_SOLID_ROCK,     0, 8, 0, 2
  LObjN LO::R_GROUND,         1, 8, 2, 6
  LObjN LO::R_FG_GLASS_RED,   3, 10, 3, 0
  LObjN LO::R_BG_GLASS_RED,   0, 11, 2, 0
  LObjN LO::R_BG_GLASS_RED,   0, 12, 1, 0
  LObj  LO::S_BG_GLASS_RED,   0, 13
  LObj  LO::S_SPRING,         2, 9
  LObjN LO::R_COIN,           2, 3, 2, 0
  LObjN LO::WIDE_1,           0, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObj  LO::S_DOOR,           1, 4
  LWriteCol 10, 209
  LObj  LO::S_EXIT_DOOR,      0, 10
  LObjN LO::R_BG_GLASS_GREEN, 3, 8, 4, 0
  LObjN LO::R_BG_GLASS_GREEN, 0, 9, 0, 3
  LObjN LO::R_BG_GLASS_GREEN, 0, 13, 4, 0
  LObj  LO::S_DOOR,           1, 10
  LWriteCol 4, 205
  LObjN LO::WIDE_1,           0, 12, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 4, 1, 0
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_OFF, (1<<4)|0
  LObj  LO::S_W_CRATE,        1, 3
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         1, 3, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObjN LO::R_BG_GLASS_GREEN, 0, 9, 0, 3
  LObjN LO::R_COIN,           1, 1, 2, 0
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::TOGGLE_BLOCK_OFF, (4<<4)|0
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_SPRING,         0, 6
  LObjN LO::R_COIN,           0, 8, 1, 0
  LObj  LO::S_CUSTOM,         1, 5, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 4
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObjN LO::R_COIN,           0, 10, 1, 0
  LObjN LO::R_COIN,           1, 5, 1, 1
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObj  LO::S_M_CRATE,        2, 2
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_W_CRATE,        0, 11
  LObj  LO::R_CUSTOM,         1, 6, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObj  LO::S_CUSTOM,         1, 1, Metatiles::KEY_RED
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObj  LO::S_PRIZE,          0, 2
  LWriteCol InventoryItem::ARROW_UP
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObjN LO::R_COIN,           0, 9, 1, 0
  LObjN LO::R_FG_GLASS_BLUE,  1, 0, 0, 3
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_M_ARROW_LEFT,   1, 2
  LObj  LO::S_FG_GLASS_BLUE,  0, 6
  LObj  LO::S_CUSTOM,         0, 7, Metatiles::TOGGLE_BLOCK_OFF
  LObj  LO::S_W_ARROW_UP,     0, 11
  LObj  LO::S_CUSTOM,         0, 12, Metatiles::TOGGLE_BLOCK_OFF
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_SPRING,         0, 7
  LObjN LO::R_COIN,           0, 9, 1, 0
  LObj  LO::S_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_OFF
  LObj  LO::S_CUSTOM,         1, 10, Metatiles::TOGGLE_BLOCK_OFF
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 3
  LObjN LO::R_FG_GLASS_RED,   0, 5, 1, 0
  LObj  LO::S_CUSTOM,         0, 6, Metatiles::FORCE_DOWN
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORCE_LEFT, (0<<4)|3
  LObjN LO::R_FG_GLASS_RED,   1, 0, 0, 3
  LObj  LO::S_CUSTOM,         0, 4, Metatiles::LOCK_RED
  LObjN LO::R_FG_GLASS_RED,   0, 6, 0, 6
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObj  LO::S_M_ARROW_RIGHT,  1, 3
  LObj  LO::R_CUSTOM,         0, 4, Metatiles::FORCE_RIGHT, (2<<4)|0
  LObj  LO::S_M_ARROW_UP,     0, 5
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObjN LO::R_BG_GLASS_RED,   0, 11, 5, 0
  LObj  LO::S_CUSTOM,         1, 6, Metatiles::TOGGLE_SWITCH
  LObj  LO::S_SPRING,         0, 7
  LObj  LO::R_CUSTOM,         1, 9, Metatiles::FORCE_LEFT, (1<<4)|0
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::FORCE_DOWN, (0<<4)|4
  LObjN LO::R_FG_GLASS_RED,   0, 13, 3, 0
  LObj  LO::S_M_CRATE,        1, 3
  LObj  LO::S_M_ARROW_LEFT,   0, 5
  LObj  LO::R_CUSTOM,         2, 3, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|3
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObjN LO::R_FG_GLASS_RED,   0, 10, 0, 2
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::TOGGLE_BLOCK_ON, (2<<4)|0
  LObj  LO::S_CUSTOM,         1, 7, Metatiles::TOGGLE_SWITCH
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObj  LO::R_CUSTOM,         1, 6, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::TOGGLE_BLOCK_OFF, (0<<4)|2
  LObj  LO::R_CUSTOM,         1, 7, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::TOGGLE_BLOCK_ON, (1<<4)|0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObjN LO::R_FG_GLASS_RED,   0, 11, 0, 2
  LObjN LO::R_COIN,           1, 6, 0, 2
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::TOGGLE_BLOCK_OFF, (3<<4)|0
  LObj  LO::R_CUSTOM,         2, 6, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|2
  LObjN LO::R_GROUND,         2, 12, 6, 2
  LObj  LO::S_EXIT_DOOR,      5, 10
  .byt LSpecialCmd, LevelSpecialConfig::STARS
  LFinished

insane5Sprite:
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0,   7,   6, 7
  LSpr Enemy::GRABBY_HAND,         0,   8,   2
  LSpr Enemy::BEAM_EMITTER,        0,  16,   6, 2
  LSpr Enemy::CHECKPOINT,          0,  22,   3
  LSpr Enemy::BEAM_EMITTER,        0,  27,   9, 3
  LSpr Enemy::BOOMERANG_GUY,       0,  36,   5, 1
  LSpr Enemy::BOOMERANG_GUY,       0,  42,   1, 1
  LSpr Enemy::CLOUD,               1,  43,  10
  LSpr Enemy::BEAM_EMITTER,        0,  56,   2, 2
  LSpr Enemy::CHECKPOINT,          0,  65,   6
  LSpr Enemy::BEAM_EMITTER,        0,  70,   3, 0
  LSpr Enemy::SNEAKER,             1,  78,   0
  LSpr Enemy::BEAM_EMITTER,        0,  78,   1, 2
  LSpr Enemy::OWL,                 0,  79,   7
  LSpr Enemy::SNEAKER,             1,  81,   3
  LSpr Enemy::SNEAKER,             1,  82,  11
  LSpr Enemy::CHECKPOINT,          0,  89,   5
  LSpr Enemy::BEAM_EMITTER,        0,  94,   9, 2
  LSpr Enemy::CLOUD,               1,  97,   6
  LSpr Enemy::BOULDER,             0, 105,   4
  LSpr Enemy::BEAM_EMITTER,        0, 105,   9, 3
  LSpr Enemy::SPINNER,             0, 106,   6, 3
  LSpr Enemy::CHECKPOINT,          0, 115,   8
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 0, 116,  10, 5
  LSpr Enemy::BEAM_EMITTER,        0, 119,   5, 2
  LSpr Enemy::MOVING_PLATFORM_HORIZ, 1, 121,   7, 5
  LSpr Enemy::GRABBY_HAND,         0, 125,   5
  LSpr Enemy::OWL,                 0, 125,  10
  LSpr Enemy::BEAM_EMITTER,        0, 126,   5, 3
  LSpr Enemy::GRABBY_HAND,         0, 134,   3
  LSpr Enemy::BEAM_EMITTER,        0, 136,   4, 3
  LSpr Enemy::SPINNER,             0, 142,   1, 1
  LSpr Enemy::SPINNER,             0, 142,   6, 1
  LSpr Enemy::GOOMBA,              0, 147,   4
  LSpr Enemy::OWL,                 1, 150,   9
  LSpr Enemy::BEAM_EMITTER,        0, 159,   7, 3
  LSpr Enemy::CHECKPOINT,          0, 163,   5
  LSpr Enemy::SPINNER,             0, 167,   5, 1
  LSpr Enemy::SNEAKER,             0, 171,   3
  LSpr Enemy::ELECTRIC_FAN,        1, 173,   3
  LSpr Enemy::SNEAKER,             1, 180,   5
  LSpr Enemy::BOULDER,             0, 187,   1
  LSpr Enemy::BEAM_EMITTER,        0, 187,   3, 2
  LSpr Enemy::CHECKPOINT,          0, 189,   5
  LSpr Enemy::SPINNER,             0, 198,   6, 2
  LSpr Enemy::SPINNER,             0, 201,   8, 3
  LSpr Enemy::BEAM_EMITTER,        0, 219,   3, 0
  LSpr Enemy::BEAM_EMITTER,        0, 220,  10, 3
  LSpr Enemy::BOULDER,             0, 221,   1
  LSpr Enemy::BEAM_EMITTER,        0, 235,  10
  LSpr Enemy::BOULDER,             0, 236,   2
  LSpr Enemy::COLLECTIBLE,         0, 252,  10
  .byt 255 ; end
