final4b:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_MINES
  .byt GraphicsUpload::SP_HANNAH
  .addr final4bData
  .addr final4bSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_DABG_GRAY
  .byt GraphicsUpload::PAL_ENEMY6
  .byt GraphicsUpload::BG_DABGCOMMON
  .byt GraphicsUpload::BG_DABG
  .byt GraphicsUpload::BG_HANNAH
  .byt GraphicsUpload::BG_JUNGLE
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $00, $80 ; boundaries

final4bData:
  LObjN LO::R_ENEMY_BARRIER      ,  0, 0, 0, 6
  LObjN LO::R_GROUND,         0, 13, 10, 1
  LObjN LO::R_SKWIRLBUSH,     2, 6, 4, 1
  LObjN LO::R_SKWIRLBUSH,     2, 1, 6, 3
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 0, 4
  LObj  LO::S_PRIZE,          1, 10
  LWriteCol InventoryItem::ABILITY_BOMB | 128
  LObjN LO::R_WOOD_PLATFORM,  2, 5, 0, 7
  LObjN LO::R_SKWIRLBUSH,     1, 7, 4, 1
  LObj  LO::S_MOAI_LEFT,      1, 12
  LObjN LO::R_WOOD_PLATFORM,  1, 9, 0, 3
  LObjN LO::R_COIN,           1, 9, 1, 3
  LObjN LO::R_BRICK,          0, 13, 1, 1
  LObjN LO::R_BRICK,          2, 12, 1, 2
  LObjN LO::R_COIN,           2, 7, 1, 3
  LObjN LO::R_BRICK,          0, 11, 1, 3
  LObjN LO::R_BRICK,          2, 10, 1, 4
  LObjN LO::R_COIN,           2, 5, 1, 3
  LObjN LO::R_BRICK,          0, 9, 1, 5
  LObjN LO::R_BRICK,          2, 8, 1, 6
  LObjN LO::R_COIN,           2, 3, 1, 3
  LObjN LO::R_BRICK,          0, 7, 1, 7
  LObjN LO::R_BRICK,          2, 6, 1, 8
  LObjN LO::R_GROUND,         2, 6, 8, 8
  LObjN LO::R_ENEMY_BARRIER      ,  1, 0, 0, 5
  LObj  LO::S_MOAI_LEFT,      2, 5
  LObj  LO::S_MOAI_LEFT,      4, 5
  LObjN LO::R_BRICK,          2, 6, 15, 0
  LObjN LO::R_SKWIRLBUSH,     0, 9, 4, 1
  LObjN LO::R_COIN,           2, 7, 3, 1
  LObj  LO::S_WOOD_PLATFORM,  0, 11
  LObjN LO::R_SKWIRLBUSH,     0, 12, 4, 1
  LObj  LO::S_WOOD_PLATFORM,  0, 14
  LObj  LO::S_SPRING,         2, 11
  LObj  LO::S_WOOD_PLATFORM,  0, 14
  LObjN LO::R_SKWIRLBUSH,     2, 7, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 9, 0, 1
  LObjN LO::R_SKWIRLBUSH,     0, 11, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  0, 13, 0, 1
  LObj  LO::S_W_ARROW_RIGHT,  2, 9
  LObj  LO::S_SPRING,         0, 10
  LObjN LO::R_WOOD_PLATFORM,  0, 13, 0, 1
  LObjN LO::R_SKWIRLBUSH,     2, 8, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 10, 0, 4
  LObjN LO::R_BRICK,          2, 6, 15, 0
  LObjN LO::R_SKWIRLBUSH,     0, 12, 4, 1
  LObj  LO::S_M_ARROW_DOWN,   1, 9
  LObj  LO::S_M_ARROW_RIGHT,  0, 11
  LObjN LO::R_COIN,           1, 7, 3, 1
  LObj  LO::S_WOOD_PLATFORM,  0, 14
  LObjN LO::R_SKWIRLBUSH,     1, 9, 4, 1
  LObj  LO::S_SPRING,         1, 11
  LObjN LO::R_WOOD_PLATFORM,  1, 11, 0, 3
  LObj  LO::S_SPRING,         1, 8
  LObj  LO::S_M_ARROW_RIGHT,  2, 3
  LObj  LO::S_M_ARROW_UP,     0, 11
  LObj  LO::R_CUSTOM,         1, 3, Metatiles::FORK_ARROW_DOWN, (1<<4)|0
  LObj  LO::S_M_ARROW_RIGHT,  0, 4
  LObjN LO::R_SKWIRLBUSH,     0, 11, 4, 1
  LObj  LO::S_M_ARROW_RIGHT,  1, 5
  LObjN LO::R_SKWIRLBUSH,     1, 8, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  0, 13, 0, 1
  LObj  LO::S_WOOD_PLATFORM,  2, 10
  LObjN LO::R_WOOD_PLATFORM,  0, 13, 0, 1
  LObjN LO::R_CEILING_BARRIER,2, 0, 0, 1
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 2
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::METAL_CRATE, (0<<4)|2
  LObjN LO::R_GROUND,         0, 6, 2, 8
  LObjN LO::R_ENEMY_BARRIER      ,  1, 0, 0, 5
  LObjN LO::RECT_1,           2, 6, 3, LN1::BRICKS, 22
  LObjN LO::R_GROUND,         0, 10, 6, 4
  LObj  LO::S_M_ARROW_RIGHT,  6, 1
  LObj  LO::S_M_ARROW_UP,     0, 8
  LObj  LO::S_M_ARROW_RIGHT,  1, 3
  LObj  LO::S_W_ARROW_UP,     0, 10
  LObjN LO::R_BRICK,          0, 13, 15, 1
  LObjN LO::R_BRICK,          1, 10, 6, 1
  LObj  LO::S_SPRING,         0, 12
  LObj  LO::S_M_ARROW_RIGHT,  1, 4
  LObj  LO::S_M_ARROW_UP,     0, 7
  LObj  LO::S_M_ARROW_DOWN,   1, 1
  LObj  LO::S_M_ARROW_RIGHT,  0, 5
  LObj  LO::S_M_ARROW_LEFT,   3, 8
  LObj  LO::S_W_ARROW_UP,     0, 12
  LObj  LO::S_BIGHEART,       2, 11
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 3
  LObjN LO::R_WOOD_PLATFORM,  2, 5, 0, 9
  LObj  LO::S_M_ARROW_LEFT,   2, 7
  LObj  LO::S_W_ARROW_UP,     0, 11
  LObj  LO::S_MOAI_LEFT,      2, 12
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::R_ENEMY_BARRIER      ,  0, 2, 0, 2
  LObjN LO::R_GROUND,         0, 6, 9, 8
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 3
  LObjN LO::R_ENEMY_BARRIER      ,  1, 0, 0, 2
  LObj  LO::R_CUSTOM,         0, 3, Metatiles::METAL_CRATE, (0<<4)|2
  LObjN LO::R_SOLID_BLOCK,    1, 3, 0, 2
  LObj  LO::S_BIGHEART,       1, 2
  LObjN LO::R_BRICK,          6, 6, 5, 0
  LObjN LO::R_SKWIRLBUSH,     0, 7, 4, 1
  LObjN LO::R_SKWIRLBUSH,     1, 11, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  1, 9, 0, 1
  LObjN LO::R_WOOD_PLATFORM,  0, 13, 1, 1
  LObjN LO::R_BRICK,          3, 7, 0, 3
  LObjN LO::R_BRICK,          1, 10, 3, 0
  LObjN LO::R_SKWIRLBUSH,     1, 12, 4, 1
  LObjN LO::R_BRICK,          2, 5, 0, 4
  LObj  LO::S_WOOD_PLATFORM,  0, 14
  LObjN LO::R_BRICK,          1, 9, 2, 0
  LObjN LO::R_BRICK,          1, 2, 0, 5
  LObjN LO::R_BRICK,          2, 5, 0, 5
  LObjN LO::R_SKWIRLBUSH,     0, 11, 4, 1
  LObjN LO::R_BRICK,          1, 5, 2, 0
  LObjN LO::R_BRICK,          0, 7, 4, 0
  LObjN LO::R_BRICK,          0, 10, 4, 0
  LObjN LO::R_WOOD_PLATFORM,  1, 13, 0, 1
  LObj  LO::S_BRICK,          1, 4
  LObjN LO::R_GROUND,         1, 5, 8, 1
  LObj  LO::S_PRIZE,          1, 3
  LWriteCol InventoryItem::BLOCK | 128
  LObjN LO::R_BRICK,          0, 9, 5, 0
  LObjN LO::R_BRICK,          0, 11, 4, 0
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::BLOCK | 128
  LObj  LO::S_PRIZE,          1, 3
  LWriteCol InventoryItem::BLOCK | 128
  LObjN LO::R_BRICK,          0, 8, 5, 0
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::BLOCK | 128
  LObj  LO::S_PRIZE,          1, 3
  LWriteCol InventoryItem::BLOCK | 128
  LObjN LO::WIDE_1,           0, 13, 3, LN1::SOLID_LEDGE
  LObj  LO::S_PRIZE,          1, 2
  LWriteCol InventoryItem::BLOCK | 128
  LObj  LO::S_PRIZE,          1, 3
  LWriteCol InventoryItem::BLOCK | 128
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 3
  LObjN LO::R_GROUND,         1, 0, 3, 14
  LObjN LO::RECT_2,           0, 10, 2, LN2::BLACK, 3
  LObjN LO::R_CEILING_BARRIER,4, 0, 0, 3
  LObjN LO::R_GROUND,         0, 13, 9, 1
  LObjN LO::R_SKWIRLBUSH,     1, 7, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 9, 0, 3
  LObjN LO::R_SKWIRLBUSH,     1, 3, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 5, 0, 7
  LObj  LO::S_EXIT_DOOR,      1, 11
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

final4bSprite:
  LSpr Enemy::KING,                0,   4,   3, 1
  LSpr Enemy::KING,                1,  17,   2, 1
  LSpr Enemy::KING,                1,  39,   2, 1
  LSpr Enemy::KING,                1,  44,   1, 1
  LSpr Enemy::COLLECTIBLE,         0,  56,   9
  LSpr Enemy::CHECKPOINT,          0,  70,   5
  LSpr Enemy::KING,                1,  72,   1, 1
  LSpr Enemy::KING,                1,  84,   2, 1
  LSpr Enemy::CHECKPOINT,          0,  97,   2
  LSpr Enemy::ROCKET_LAUNCHER,     0, 106,  12
  LSpr Enemy::ROCKET_LAUNCHER,     0, 110,  13
  LSpr Enemy::ROCKET_LAUNCHER,     0, 115,  11
  LSpr Enemy::ROCKET_LAUNCHER,     0, 117,  13
  LSpr Enemy::ROCKET_LAUNCHER,     0, 118,   4
  LSpr Enemy::ROCKET_LAUNCHER,     0, 120,  12
  LSpr Enemy::ROCKET_LAUNCHER,     0, 125,  13
  LSpr Enemy::ROCKET_LAUNCHER,     0, 127,  11
  .byt 255 ; end
