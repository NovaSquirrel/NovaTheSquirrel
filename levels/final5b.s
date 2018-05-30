final5b:
  .byt MusicTracks::WORLD_5|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_RONALD
  .byt GraphicsUpload::SP_HANNAH
  .byt GraphicsUpload::SP_FACEBALL
  .addr final5bData
  .addr final5bSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG_BLUE
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_SUBURBS
  .byt 255 ; end
  .byt $02, $00 ; boundaries

final5bData:
  LObjN LO::R_GROUND,         0, 13, 12, 1
  LObj  LO::S_PRIZE,          2, 9
  LWriteCol InventoryItem::ARROW_UP_METAL
  LObj  LO::S_EXIT_DOOR,      2, 4
  LObjN LO::WIDE_1,           0, 6, 5, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          0, 10
  LWriteCol InventoryItem::ARROW_DOWN_METAL
  LObjN LO::R_COIN,           1, 4, 3, 1
  LObj  LO::S_PRIZE,          1, 9
  LWriteCol InventoryItem::ARROW_DOWN_METAL
  LObj  LO::S_PRIZE,          2, 10
  LWriteCol InventoryItem::ARROW_DOWN_METAL
  LObjN LO::TALL_1,           2, 3, 9, LN1::LADDER
  LObjN LO::WIDE_2,           1, 6, 1, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 7, 1, 5
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::R_GROUND,         1, 0, 2, 4
  LObjN LO::R_GROUND,         0, 6, 2, 8
  LObj  LO::S_W_ARROW_RIGHT,  2, 5
  LObjN LO::WIDE_1,           1, 6, 2, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 4, 2, 0
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_DOWN,   1, 1
  LObj  LO::S_M_ARROW_UP,     0, 5
  LObj  LO::S_M_ARROW_RIGHT,  0, 7
  LObj  LO::S_M_ARROW_DOWN,   1, 7
  LObj  LO::S_M_ARROW_RIGHT,  0, 8
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_DOWN,   1, 8
  LObj  LO::S_M_ARROW_RIGHT,  0, 9
  LObj  LO::S_COIN,           1, 7
  LObj  LO::S_M_ARROW_DOWN,   0, 9
  LObj  LO::S_M_ARROW_RIGHT,  0, 10
  LObj  LO::S_M_ARROW_DOWN,   1, 10
  LObj  LO::S_M_ARROW_RIGHT,  0, 11
  LObj  LO::S_COIN,           1, 9
  LObj  LO::S_M_ARROW_DOWN,   0, 11
  LObj  LO::S_M_ARROW_RIGHT,  0, 12
  LObj  LO::R_CUSTOM,         1, 12, Metatiles::FORK_ARROW_DOWN, (6<<4)|0
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::METAL_CRATE, (6<<4)|0
  LObj  LO::S_COIN,           1, 11
  LObj  LO::S_M_ARROW_RIGHT,  3, 5
  LObj  LO::S_M_ARROW_UP,     0, 6
  LObj  LO::S_M_ARROW_RIGHT,  0, 7
  LObj  LO::S_M_ARROW_UP,     0, 8
  LObjN LO::WIDE_1,           1, 5, 1, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           0, 9, 1, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 6, 0, 1
  LObj  LO::S_SPRING,         0, 8
  LObj  LO::S_SPRING,         0, 11
  LObj  LO::S_M_ARROW_RIGHT,  1, 3
  LObj  LO::S_M_ARROW_UP,     0, 5
  LObj  LO::S_M_ARROW_LEFT,   0, 6
  LObj  LO::S_M_ARROW_UP,     0, 7
  LObj  LO::S_M_ARROW_LEFT,   0, 8
  LObjN LO::WIDE_2,           2, 4, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 5, 2, 9
  LObj  LO::S_COIN,           1, 2
  LObjN LO::WIDE_2,           1, 8, 2, LN2::WOOD_PLATFORM_TOP
  LObj  LO::S_COIN,           1, 6
  LObj  LO::S_M_ARROW_RIGHT,  0, 7
  LObjN LO::R_WOOD_PLATFORM,  0, 9, 1, 5
  LObj  LO::S_M_ARROW_LEFT,   2, 12
  LObj  LO::S_M_ARROW_RIGHT,  2, 9
  LObjN LO::WIDE_2,           0, 10, 4, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 11, 4, 3
  LObjN LO::R_COIN,           1, 8, 1, 0
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 2
  LObjN LO::R_GROUND,         1, 0, 2, 8
  LObj  LO::S_M_CRATE,        0, 9
  LObjN LO::R_SAND,           1, 10, 2, 4
  LObj  LO::S_M_ARROW_RIGHT,  2, 3
  LObjN LO::R_SOLID_BLOCK,    0, 4, 0, 1
  LObjN LO::R_SOLID_BLOCK,    0, 6, 1, 0
  LObj  LO::S_M_ARROW_UP,     0, 7
  LObj  LO::S_W_ARROW_RIGHT,  0, 9
  LObj  LO::S_M_ARROW_DOWN,   1, 4
  LObj  LO::S_SPRING,         0, 5
  LObj  LO::S_M_ARROW_UP,     0, 9
  LObj  LO::S_M_ARROW_RIGHT,  0, 10
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::METAL_CRATE, (10<<4)|0
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::FORK_ARROW_UP, (10<<4)|0
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::METAL_CRATE, (10<<4)|0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORK_ARROW_UP, (10<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::FORK_ARROW_DOWN, (10<<4)|0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::METAL_CRATE, (10<<4)|0
  LObjN LO::R_COIN,           1, 1, 8, 0
  LObjN LO::R_COIN,           0, 5, 8, 0
  LObjN LO::R_COIN,           0, 9, 8, 0
  LObjN LO::R_SOLID_BLOCK,    10, 3, 3, 0
  LObj  LO::S_M_ARROW_LEFT,   0, 7
  LObj  LO::S_M_ARROW_UP,     0, 10
  LObj  LO::S_SPRING,         1, 9
  LObj  LO::S_M_ARROW_RIGHT,  1, 4
  LObj  LO::S_M_ARROW_UP,     0, 7
  LObjN LO::R_SAND,           0, 8, 2, 6
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObj  LO::S_M_ARROW_DOWN,   0, 4
  LObj  LO::S_M_ARROW_LEFT,   0, 7
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 1
  LObj  LO::S_M_CRATE,        0, 2
  LObj  LO::S_CUSTOM,         0, 3, Metatiles::FORK_ARROW_UP
  LObjN LO::R_SOLID_BLOCK,    0, 4, 0, 3
  LObj  LO::S_M_ARROW_DOWN,   1, 3
  LObj  LO::S_M_ARROW_LEFT,   0, 4
  LObjN LO::RECT_2,           0, 8, 0, LN2::GRAY_BRICKS, 16
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 5
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_GROUND,         1, 0
  LObjN LO::RECT_1,           0, 0, 3, LN1::GROUND, 19
  LObj  LO::S_CUSTOM,         0, 4, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 5
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_CUSTOM,         2, 4, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 5
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_CUSTOM,         2, 4, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 5
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_RIGHT,  1, 4
  LObj  LO::S_CUSTOM,         1, 4, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 5
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_CUSTOM,         2, 4, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 5
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_CUSTOM,         2, 4, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 5
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_CUSTOM,         2, 4, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 5
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObjN LO::WIDE_2,           2, 8, 5, LN2::GRAY_BRICKS
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_BOMB,         4, 4
  LObjN LO::TALL_2,           1, 4, 3, LN2::GRAY_BRICKS
  LObjN LO::WIDE_2,           7, 3, 3, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 4, 3, 10
  LObjN LO::WIDE_2,           6, 8, 6, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 9, 6, 5
  LObj  LO::S_EXIT_DOOR,      4, 6
  LObjN LO::TALL_2,           4, 5, 9, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 5, 9, LN2::PALM_TREE
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  .byt LSpecialCmd, LevelSpecialConfig::STARS
  LFinished

final5bSprite:
  LSpr Enemy::CHECKPOINT,          0,  14,   5
  LSpr Enemy::OWL,                 0,  26,  11
  LSpr Enemy::OWL,                 0,  34,   3
  LSpr Enemy::CHECKPOINT,          0,  46,   9
  LSpr Enemy::SNEAKER,             1,  80,   7
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  85,  11
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  92,   9, 3
  LSpr Enemy::CHECKPOINT,          0,  95,   2
  LSpr Enemy::COLLECTIBLE,         0, 102,   6
  .byt 255 ; end
