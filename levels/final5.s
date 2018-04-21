final5:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_RONALD
  .byt GraphicsUpload::SP_HANNAH
  .byt GraphicsUpload::SP_FACEBALL
  .addr final5Data
  .addr final5Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG_BLUE
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_SUBURBS
  .byt 255 ; end
  .byt $00, $00 ; boundaries

final5Data:
  LObjN LO::R_GROUND,         0, 13, 12, 1
  LObjN LO::WIDE_1,           1, 4, 3, LN1::SOLID_LEDGE
  LObjN LO::TALL_2,           1, 10, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 10, 2, LN2::PALM_TREE
  LObj  LO::S_M_BOMB,         1, 7
  LObj  LO::S_SIGNPOST,       1, 12
  LWriteCol <SignAboutRun, >SignAboutRun
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObj  LO::S_W_ARROW_LEFT,   0, 7
  LObjN LO::R_GROUND,         0, 10, 3, 2
  LObjN LO::R_GROUND,         1, 0, 2, 8
  LObj  LO::S_W_ARROW_RIGHT,  2, 9
  LObjN LO::RECT_1,           1, 0, 2, LN1::GROUND, 37
  LObj  LO::S_M_ARROW_RIGHT,  0, 4
  LObj  LO::S_M_ARROW_UP,     0, 9
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::FORK_ARROW_DOWN, (2<<4)|0
  LObjN LO::R_COIN,           0, 9, 2, 1
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::METAL_CRATE, (2<<4)|0
  LObj  LO::R_CUSTOM,         4, 4, Metatiles::FORK_ARROW_DOWN, (2<<4)|0
  LObjN LO::R_COIN,           0, 10, 2, 1
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::METAL_CRATE, (2<<4)|0
  LObj  LO::R_CUSTOM,         5, 4, Metatiles::FORK_ARROW_DOWN, (2<<4)|0
  LObjN LO::R_COIN,           0, 9, 2, 1
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::METAL_CRATE, (2<<4)|0
  LObj  LO::S_M_ARROW_RIGHT,  4, 4
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::FORK_ARROW_DOWN, (2<<4)|0
  LObjN LO::R_COIN,           0, 8, 2, 1
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::METAL_CRATE, (2<<4)|0
  LObjN LO::TALL_2,           1, 12, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 12, 2, LN2::PALM_TREE
  LObj  LO::R_CUSTOM,         2, 4, Metatiles::FORK_ARROW_DOWN, (2<<4)|0
  LObjN LO::R_COIN,           0, 7, 2, 1
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::METAL_CRATE, (2<<4)|0
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_RIGHT,  1, 4
  LObjN LO::TALL_2,           1, 12, 2, LN2::PALM_TREE
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::FORK_ARROW_DOWN, (2<<4)|0
  LObjN LO::R_COIN,           0, 8, 2, 1
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::METAL_CRATE, (2<<4)|0
  LObjN LO::TALL_2,           1, 12, 2, LN2::PALM_TREE
  LObj  LO::R_CUSTOM,         3, 4, Metatiles::FORK_ARROW_DOWN, (2<<4)|0
  LObjN LO::R_COIN,           0, 10, 2, 1
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::METAL_CRATE, (2<<4)|0
  LObj  LO::S_M_ARROW_DOWN,   3, 4
  LObj  LO::S_M_ARROW_RIGHT,  0, 11
  LObjN LO::R_GROUND,         1, 3, 4, 4
  LObjN LO::R_GROUND,         0, 12, 4, 2
  LObjN LO::R_SOLID_BLOCK,    1, 8, 0, 2
  LObj  LO::S_M_CRATE,        0, 11
  LObjN LO::R_ENEMY_BARRIER      ,  4, 1, 0, 5
  LObj  LO::S_PRIZE,          0, 9
  LWriteCol InventoryItem::ABILITY_BURGER | 128
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObj  LO::S_BIG_SPIKY_BUSH, 1, 12
  LObjN LO::R_COIN,           3, 7, 0, 3
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::R_GROUND,         1, 9, 4, 5
  LObj  LO::S_BIG_SPIKY_BUSH, 1, 8
  LObj  LO::S_BIG_SPIKY_BUSH, 2, 8
  LObjN LO::R_COIN,           2, 5, 8, 1
  LObjN LO::R_SAND,           0, 11, 8, 3
  LObjN LO::TALL_2,           1, 8, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           3, 8, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           3, 8, 2, LN2::PALM_TREE
  LObj  LO::S_CEILING_BARRIER,2, 0
  LObjN LO::R_ENEMY_BARRIER      ,  0, 1, 0, 5
  LObjN LO::R_GROUND,         0, 9, 4, 5
  LObjN LO::R_GROUND,         1, 0, 2, 7
  LObj  LO::S_W_ARROW_DOWN,   1, 8
  LObj  LO::S_M_ARROW_RIGHT,  0, 13
  LObj  LO::S_CEILING_BARRIER,2, 0
  LObj  LO::S_M_ARROW_RIGHT,  1, 9
  LObj  LO::S_M_ARROW_UP,     0, 13
  LObj  LO::R_CUSTOM,         1, 9, Metatiles::FORK_ARROW_DOWN, (8<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::METAL_CRATE, (8<<4)|0
  LObjN LO::R_COIN,           1, 7, 6, 0
  LObj  LO::S_M_ARROW_RIGHT,  8, 8
  LObj  LO::S_M_ARROW_UP,     0, 9
  LObj  LO::S_M_ARROW_RIGHT,  1, 7
  LObj  LO::S_M_ARROW_UP,     0, 8
  LObj  LO::S_M_ARROW_RIGHT,  1, 6
  LObj  LO::S_M_ARROW_UP,     0, 7
  LObj  LO::S_M_ARROW_RIGHT,  1, 5
  LObj  LO::S_M_ARROW_UP,     0, 6
  LObj  LO::S_M_ARROW_RIGHT,  1, 4
  LObj  LO::S_M_ARROW_UP,     0, 5
  LObjN LO::WIDE_1,           0, 6, 0, LN1::SPIKES
  LObjN LO::R_SOLID_BLOCK,    0, 7, 0, 7
  LObj  LO::R_CUSTOM,         1, 4, Metatiles::FORK_ARROW_DOWN, (8<<4)|0
  LObj  LO::R_CUSTOM,         0, 5, Metatiles::METAL_CRATE, (8<<4)|0
  LObj  LO::S_M_ARROW_DOWN,   0, 8
  LObj  LO::S_M_ARROW_RIGHT,  0, 11
  LObjN LO::R_COIN,           1, 2, 6, 0
  LObjN LO::R_COIN,           0, 6, 6, 0
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::METAL_ARROW_LEFT, (8<<4)|0
  LObjN LO::R_COIN,           0, 9, 6, 0
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::FORK_ARROW_DOWN, (13<<4)|0
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::METAL_CRATE, (14<<4)|0
  LObjN LO::R_CEILING_BARRIER,8, 0, 0, 3
  LObj  LO::S_M_ARROW_DOWN,   0, 4
  LObjN LO::R_GROUND,         1, 0, 3, 8
  LObj  LO::S_BIGHEART,       1, 10
  LObjN LO::RECT_1,           2, 0, 2, LN1::GROUND, 39
  LObjN LO::WIDE_1,           1, 9, 3, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 7, 2, 0
  LObj  LO::S_M_ARROW_DOWN,   0, 11
  LObjN LO::R_SAND,           4, 9, 2, 5
  LObj  LO::S_BIG_SPIKY_BUSH, 1, 8
  LObjN LO::R_SAND,           2, 8, 2, 6
  LObjN LO::TALL_2,           1, 5, 2, LN2::PALM_TREE
  LObjN LO::R_COIN,           2, 7, 4, 1
  LObjN LO::R_WATER,          0, 9, 4, 5
  LObjN LO::TALL_2,           5, 5, 2, LN2::PALM_TREE
  LObjN LO::R_SAND,           0, 8, 6, 6
  LObjN LO::R_WATER,          0, 11, 3, 1
  LObjN LO::R_WATER,          3, 8, 1, 3
  LObjN LO::WIDE_2,           2, 6, 11, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 7, 7, 0
  LObjN LO::R_COIN,           1, 5, 5, 0
  LObjN LO::R_SAND,           1, 8, 2, 5
  LObjN LO::R_SAND,           3, 8, 2, 2
  LObjN LO::TALL_2,           1, 13, 1, LN2::PALM_TREE
  LObjN LO::R_WOOD_PLATFORM,  2, 7, 3, 7
  LObjN LO::WIDE_2,           2, 10, 7, LN2::WOOD_PLATFORM_TOP
  LObj  LO::S_PRIZE,          2, 7
  LObjN LO::R_WOOD_PLATFORM,  0, 11, 5, 3
  LObjN LO::R_BRICK,          1, 7, 3, 0
  LObj  LO::S_BIGHEART,       1, 9
  LObj  LO::S_PRIZE,          2, 5
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_SOLID_ROCK,     1, 3, 0, 4
  LObjN LO::WIDE_1,           0, 8, 1, LN1::SOLID_LEDGE
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObjN LO::R_SOLID_ROCK,     0, 3, 2, 0
  LObjN LO::R_COIN,           0, 5, 2, 1
  LObj  LO::S_W_CRATE,        0, 10
  LObj  LO::S_STATUE,         1, 1
  LObjN LO::WIDE_2,           0, 8, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 9, 2, 5
  LObjN LO::R_SOLID_ROCK,     2, 3, 0, 3
  LObj  LO::S_W_ARROW_RIGHT,  0, 7
  LObj  LO::S_M_ARROW_DOWN,   1, 7
  LObjN LO::WIDE_1,           0, 8, 0, LN1::SOLID_LEDGE
  LObj  LO::S_M_ARROW_RIGHT,  0, 13
  LObj  LO::S_M_ARROW_RIGHT,  1, 8
  LObj  LO::S_M_ARROW_UP,     0, 13
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::FORK_ARROW_DOWN, (3<<4)|0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::METAL_CRATE, (3<<4)|0
  LObj  LO::S_M_ARROW_RIGHT,  4, 7
  LObj  LO::S_M_ARROW_UP,     0, 8
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_RIGHT,  1, 6
  LObj  LO::S_M_ARROW_UP,     0, 7
  LObj  LO::S_M_ARROW_RIGHT,  1, 5
  LObj  LO::S_M_ARROW_UP,     0, 6
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_RIGHT,  1, 4
  LObj  LO::S_M_ARROW_UP,     0, 5
  LObj  LO::S_M_ARROW_RIGHT,  1, 3
  LObj  LO::S_M_ARROW_UP,     0, 4
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_DOWN,   1, 3
  LObj  LO::S_M_ARROW_RIGHT,  0, 4
  LObj  LO::S_M_ARROW_DOWN,   1, 4
  LObj  LO::S_M_ARROW_RIGHT,  0, 5
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_DOWN,   1, 5
  LObj  LO::S_M_ARROW_RIGHT,  0, 6
  LObj  LO::S_M_ARROW_DOWN,   1, 6
  LObj  LO::S_M_ARROW_RIGHT,  0, 7
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_DOWN,   1, 7
  LObj  LO::S_M_ARROW_RIGHT,  0, 8
  LObj  LO::S_M_ARROW_DOWN,   1, 8
  LObj  LO::S_M_ARROW_RIGHT,  0, 9
  LObj  LO::S_M_ARROW_DOWN,   1, 9
  LObj  LO::S_M_ARROW_RIGHT,  0, 10
  LObj  LO::S_M_ARROW_DOWN,   1, 10
  LObj  LO::S_M_ARROW_RIGHT,  0, 11
  LObjN LO::R_COIN,           1, 8, 1, 2
  LObj  LO::S_M_ARROW_DOWN,   0, 11
  LObj  LO::S_M_ARROW_RIGHT,  0, 12
  LObj  LO::S_M_ARROW_RIGHT,  1, 11
  LObj  LO::S_M_ARROW_UP,     0, 12
  LObj  LO::S_M_ARROW_RIGHT,  1, 10
  LObj  LO::S_M_ARROW_UP,     0, 11
  LObj  LO::S_M_ARROW_RIGHT,  1, 9
  LObj  LO::S_M_ARROW_UP,     0, 10
  LObj  LO::S_SPRING,         1, 7
  LObj  LO::S_M_ARROW_RIGHT,  0, 8
  LObj  LO::S_M_ARROW_UP,     0, 9
  LObj  LO::S_M_ARROW_RIGHT,  1, 3
  LObjN LO::R_SOLID_BLOCK,    0, 4, 0, 3
  LObj  LO::S_M_ARROW_UP,     0, 8
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::WOOD_CRATE, (5<<4)|0
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 12, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 12, 2, LN2::PALM_TREE
  LObj  LO::S_SPRING,         1, 7
  LObj  LO::S_M_ARROW_DOWN,   1, 3
  LObjN LO::R_SOLID_BLOCK,    0, 4, 0, 3
  LObj  LO::S_M_ARROW_RIGHT,  0, 8
  LObj  LO::R_CUSTOM,         1, 8, Metatiles::FORK_ARROW_DOWN, (6<<4)|0
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::METAL_CRATE, (6<<4)|0
  LObj  LO::S_M_ARROW_DOWN,   5, 10
  LObj  LO::S_M_ARROW_RIGHT,  0, 12
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 3
  LObj  LO::R_CUSTOM,         1, 2, Metatiles::METAL_ARROW_RIGHT, (3<<4)|0
  LObjN LO::R_CEILING_BARRIER,0, 3, 2, 0
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::FORK_ARROW_UP
  LObj  LO::S_M_ARROW_DOWN,   1, 8
  LObj  LO::S_M_ARROW_LEFT,   0, 10
  LObj  LO::S_M_ARROW_RIGHT,  1, 9
  LObj  LO::S_M_ARROW_UP,     0, 12
  LObjN LO::R_CEILING_BARRIER,1, 3, 0, 1
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::FORK_ARROW_DOWN, (9<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::METAL_CRATE, (9<<4)|0
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 3
  LObjN LO::WIDE_2,           0, 4, 8, LN2::GRAY_BRICKS
  LObjN LO::R_COIN,           0, 7, 4, 1
  LObj  LO::S_CUSTOM,         2, 2, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 3
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 3
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 3
  LObj  LO::S_CUSTOM,         2, 2, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 3
  LObj  LO::S_SPRING,         0, 8
  LObj  LO::S_SPRING,         1, 3
  LObj  LO::S_CUSTOM,         1, 2, Metatiles::FORK_ARROW_DOWN
  LObj  LO::S_M_BOMB,         0, 3
  LObjN LO::R_SOLID_BLOCK,    1, 2, 0, 8
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 2
  LObj  LO::S_BIGHEART,       0, 3
  LObj  LO::R_CUSTOM,         0, 11, Metatiles::METAL_CRATE, (10<<4)|0
  LObj  LO::S_M_ARROW_UP,     0, 12
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 9
  LObj  LO::R_CUSTOM,         0, 8, Metatiles::METAL_ARROW_RIGHT, (7<<4)|0
  LObj  LO::S_W_ARROW_UP,     0, 10
  LObj  LO::R_CUSTOM,         0, 12, Metatiles::FORK_ARROW_UP, (9<<4)|0
  LObj  LO::S_M_ARROW_RIGHT,  2, 7
  LObj  LO::S_M_ARROW_UP,     0, 11
  LObjN LO::WIDE_1,           1, 14, 0, LN1::SPIKES
  LObj  LO::R_CUSTOM,         1, 6, Metatiles::METAL_CRATE, (5<<4)|0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORK_ARROW_UP, (5<<4)|0
  LObj  LO::S_SPRING,         5, 5
  LObj  LO::S_M_ARROW_RIGHT,  1, 7
  LObj  LO::S_M_ARROW_DOWN,   0, 8
  LObj  LO::S_M_ARROW_LEFT,   0, 12
  LObjN LO::TALL_2,           4, 12, 2, LN2::PALM_TREE
  LObjN LO::R_COIN,           2, 4, 4, 1
  LObj  LO::R_CUSTOM,         0, 6, Metatiles::METAL_CRATE, (5<<4)|0
  LObj  LO::R_CUSTOM,         0, 7, Metatiles::FORK_ARROW_UP, (5<<4)|0
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 12, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_DOWN,   2, 7
  LObj  LO::S_M_ARROW_RIGHT,  0, 10
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_GROUND,         1, 0, 5, 4
  LObj  LO::R_CUSTOM,         0, 9, Metatiles::METAL_CRATE, (5<<4)|0
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::FORK_ARROW_UP, (4<<4)|0
  LObjN LO::TALL_2,           0, 12, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 12, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 12, 2, LN2::PALM_TREE
  LObj  LO::S_M_ARROW_UP,     1, 10
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_SAND,           1, 9, 10, 5
  LObjN LO::TALL_2,           1, 6, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 6, 2, LN2::PALM_TREE
  LObjN LO::TALL_2,           2, 6, 2, LN2::PALM_TREE
  LObj  LO::S_BIG_SPIKY_BUSH, 2, 8
  LObj  LO::S_DOOR,           2, 7
  LWriteCol $21, LevelId::Final5B
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  .byt LSpecialCmd, LevelSpecialConfig::STARS
  LFinished

final5Sprite:
  LSpr Enemy::OWL,                 0,   2,   3
  LSpr Enemy::CHECKPOINT,          0,  48,  11
  LSpr Enemy::RONALD_BURGER,       0,  52,   2
  LSpr Enemy::RONALD_BURGER,       0,  55,   3
  LSpr Enemy::RONALD_BURGER,       0,  58,   5
  LSpr Enemy::SNEAKER,             1,  84,   8
  LSpr Enemy::SNEAKER,             1,  98,   3
  LSpr Enemy::RONALD,              1,  98,   7
  LSpr Enemy::RONALD,              1,  98,  10
  LSpr Enemy::SNEAKER,             1, 103,  10
  LSpr Enemy::CHECKPOINT,          0, 105,   8
  LSpr Enemy::OWL,                 1, 116,   5, 1
  LSpr Enemy::OWL,                 1, 120,   6, 1
  LSpr Enemy::OWL,                 1, 125,   5, 1
  LSpr Enemy::OWL,                 0, 138,   6
  LSpr Enemy::OWL,                 1, 138,   9
  LSpr Enemy::CHECKPOINT,          0, 143,   7
  LSpr Enemy::SPINNER,             0, 163,   5, 3
  LSpr Enemy::SPINNER,             0, 174,   6, 3
  LSpr Enemy::SNEAKER,             1, 187,   7
  LSpr Enemy::SNEAKER,             1, 188,   1
  LSpr Enemy::CHECKPOINT,          0, 200,  10
  LSpr Enemy::BOULDER,             0, 204,   7
  LSpr Enemy::SNEAKER,             1, 222,   5
  LSpr Enemy::SNEAKER,             1, 230,   8
  LSpr Enemy::CHECKPOINT,          0, 233,   8
  .byt 255 ; end
