final6:
  .byt MusicTracks::WORLD_5|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_KING
  .byt GraphicsUpload::SP_EXPLODE
  .byt GraphicsUpload::SP_FACEBALL
  .addr final6Data
  .addr final6Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_JUNGLE
  .byt 255 ; end
  .byt $00, $04 ; boundaries

final6Data:
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 35
  LObjN LO::R_SKWIRLBUSH,     1, 2, 6, 1
  LObj  LO::S_FLOWER,         0, 12
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 0
  LObjN LO::WIDE_2,           0, 7, 1, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_WOOD_PLATFORM,  2, 4, 0, 8
  LObj  LO::S_PRIZE,          1, 6
  LWriteCol InventoryItem::ABILITY_BLASTER | 128
  LObjN LO::WIDE_2,           0, 9, 1, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::R_SKWIRLBUSH,     1, 5, 4, 1
  LObj  LO::S_FLOWER,         1, 12
  LObjN LO::R_WOOD_PLATFORM,  1, 7, 0, 5
  LObj  LO::S_FLOWER,         1, 12
  LObjN LO::R_SKWIRLBUSH,     1, 2, 6, 1
  LObjN LO::R_WATER,          0, 13, 2, 1
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 0
  LObjN LO::R_WOOD_PLATFORM,  2, 4, 0, 8
  LObjN LO::R_BRICK,          1, 6, 3, 0
  LObjN LO::WIDE_2,           0, 12, 3, LN2::BUSH
  LObj  LO::S_PRIZE,          1, 6
  LObjN LO::R_BRICK,          0, 9, 3, 0
  LObj  LO::S_PRIZE,          1, 9
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_SKWIRLBUSH,     2, 3, 4, 1
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::R_WOOD_PLATFORM,  1, 5, 0, 7
  LObjN LO::WIDE_2,           1, 12, 3, LN2::BUSH
  LObjN LO::R_SKWIRLBUSH,     1, 6, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 8, 0, 4
  LObjN LO::R_SKWIRLBUSH,     1, 1, 4, 1
  LObjN LO::WIDE_2,           0, 12, 3, LN2::BUSH
  LObjN LO::R_WOOD_PLATFORM,  2, 3, 0, 9
  LObjN LO::R_SKWIRLBUSH,     4, 5, 4, 1
  LObjN LO::R_COIN,           0, 7, 0, 2
  LObjN LO::WIDE_2,           0, 10, 1, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_SPRING,         1, 9
  LObjN LO::R_WOOD_PLATFORM,  1, 7, 0, 5
  LObjN LO::R_SAND,           2, 8, 2, 6
  LObjN LO::R_SAND,           3, 6, 5, 8
  LObjN LO::TALL_2,           1, 2, 3, LN2::PALM_TREE
  LObjN LO::TALL_2,           3, 2, 3, LN2::PALM_TREE
  LObjN LO::R_SKWIRLBUSH,     2, 9, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 11, 0, 3
  LObjN LO::R_SKWIRLBUSH,     1, 12, 2, 1
  LObjN LO::R_SKWIRLBUSH,     1, 6, 4, 1
  LObj  LO::S_WOOD_PLATFORM,  0, 14
  LObjN LO::R_SKWIRLBUSH,     2, 3, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 0, 6
  LObj  LO::S_WOOD_PLATFORM,  2, 5
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 0, 6
  LObjN LO::R_SKWIRLBUSH,     1, 9, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 11, 0, 3
  LObjN LO::R_SAND,           4, 6, 5, 8
  LObjN LO::TALL_2,           1, 2, 3, LN2::PALM_TREE
  LObjN LO::TALL_2,           3, 2, 3, LN2::PALM_TREE
  LObjN LO::R_COIN,           2, 4, 4, 0
  LObjN LO::WIDE_2,           0, 6, 4, LN2::STONE_BRIDGE
  LObj  LO::S_PRIZE,          0, 9
  LWriteCol InventoryItem::BIG_HEALTH_RESTORE
  LObjN LO::WIDE_1,           0, 10, 1, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           0, 11, 1, 1
  LObjN LO::R_GROUND,         0, 13, 2, 1
  LObj  LO::S_BIGHEART,       1, 9
  LObjN LO::R_SKWIRLBUSH,     1, 7, 4, 1
  LObj  LO::S_TALL_GRASS,     0, 12
  LObjN LO::R_WOOD_PLATFORM,  2, 9, 0, 5
  LObjN LO::WIDE_2,           3, 12, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     1, 9, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 11, 0, 3
  LObjN LO::WIDE_1,           3, 2, 4, LN1::FENCE
  LObjN LO::R_GROUND,         0, 3, 4, 11
  LObjN LO::R_SKWIRLBUSH,     5, 0, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 2, 0, 12
  LObjN LO::WIDE_2,           1, 4, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_SPRING,         0, 7
  LObjN LO::WIDE_2,           0, 8, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     2, 9, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 11, 0, 3
  LObjN LO::R_SKWIRLBUSH,     2, 1, 4, 1
  LObjN LO::WIDE_2,           0, 7, 1, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_PRIZE,          1, 4
  LObjN LO::R_WOOD_PLATFORM,  1, 3, 0, 11
  LObjN LO::WIDE_2,           1, 9, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_SKWIRLBUSH,     2, 4, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 6, 0, 8
  LObjN LO::WIDE_2,           1, 7, 2, LN2::STRIPED_LOG_HORIZ
  LObj  LO::S_BIGHEART,       1, 6
  LObjN LO::RECT_1,           3, 0, 3, LN1::GROUND, 17
  LObjN LO::TALL_2,           0, 4, 2, LN2::TRUNK
  LObjN LO::R_GROUND,         0, 7, 4, 7
  LObjN LO::WIDE_1,           2, 6, 2, LN1::FENCE
  LObjN LO::WIDE_2,           3, 9, 5, LN2::BUSH
  LObjN LO::R_GROUND,         0, 10, 12, 4
  LObjN LO::TALL_2,           8, 7, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 7, 2, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 4, 5, LN2::TRUNK
  LObjN LO::WIDE_1,           1, 3, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SKWIRLBUSH,     1, 4, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 6, 0, 3
  LObjN LO::R_SAND,           0, 10, 4, 4
  LObjN LO::WIDE_1,           1, 9, 2, LN1::FENCE
  LObjN LO::WIDE_1,           1, 6, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SKWIRLBUSH,     2, 6, 4, 1
  LObj  LO::S_SPRING,         0, 9
  LObj  LO::S_HEART,          2, 4
  LObjN LO::WIDE_1,           0, 5, 1, LN1::SOLID_LEDGE
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 0, 6
  LObjN LO::WIDE_1,           3, 5, 3, LN1::FENCE
  LObjN LO::R_SAND,           0, 6, 3, 8
  LObjN LO::WIDE_2,           4, 6, 7, LN2::STONE_BRIDGE
  LObj  LO::S_PRIZE,          0, 10
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_WATER,          0, 12, 7, 2
  LObjN LO::R_COIN,           2, 8, 3, 1
  LObjN LO::WIDE_1,           2, 10, 3, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           4, 5, 3, LN1::TALLGRASS
  LObjN LO::R_SAND,           0, 6, 3, 6
  LSetX 147
  LWriteCol Metatiles::WATER_MAIN
  LObjN LO::R_WATER,          0, 13, 3, 1
  LObj  LO::R_CUSTOM,         0, 13, Metatiles::REPLACE_BRICK, (3<<4)|1
  LSetX 148
  LWriteCol Metatiles::WATER_MAIN
  LSetX 149
  LWriteCol Metatiles::WATER_MAIN
  LSetX 150
  LWriteCol Metatiles::WATER_MAIN
  LObjN LO::WIDE_2,           1, 6, 3, LN2::STONE_BRIDGE
  LObjN LO::R_WATER,          0, 12, 7, 2
  LObjN LO::R_CEILING_BARRIER,7, 0, 0, 2
  LObjN LO::R_SAND,           1, 0, 3, 12
  LObjN LO::R_WATER,          0, 13, 8, 1
  LObjN LO::R_SAND,           4, 0, 9, 0
  LObjN LO::R_GROUND,         0, 6, 1, 6
  LObjN LO::R_WATER,          2, 7, 2, 5
  LObjN LO::R_COIN,           3, 3, 2, 1
  LObjN LO::WIDE_1,           0, 6, 2, LN1::TALLGRASS
  LObjN LO::R_GROUND,         0, 7, 5, 7
  LObjN LO::TALL_2,           4, 1, 5, LN2::GRAY_BRICKS
  LObjN LO::R_SKWIRLBUSH,     2, 8, 4, 1
  LObjN LO::WIDE_2,           1, 6, 5, LN2::STONE_BRIDGE
  LObj  LO::S_WOOD_PLATFORM,  1, 10
  LObjN LO::R_SKWIRLBUSH,     0, 11, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  0, 13, 0, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 13, 0, 1
  LObjN LO::WIDE_2,           3, 8, 3, LN2::BUSH
  LObjN LO::R_GROUND,         0, 9, 6, 5
  LObjN LO::TALL_2,           5, 5, 3, LN2::TRUNK_L
  LObjN LO::WIDE_2,           2, 9, 3, LN2::STONE_BRIDGE
  LObj  LO::S_HEART,          2, 7
  LObjN LO::R_COIN,           2, 5, 2, 1
  LObjN LO::WIDE_2,           0, 7, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_GROUND,         0, 11, 7, 3
  LObjN LO::R_SKWIRLBUSH,     1, 0, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 2, 0, 8
  LObjN LO::R_COIN,           1, 2, 2, 1
  LObjN LO::WIDE_2,           0, 4, 2, LN2::STRIPED_LOG_HORIZ
  LObjN LO::R_BRICK,          0, 7, 3, 0
  LObj  LO::S_PRIZE,          1, 7
  LObjN LO::R_GROUND,         3, 4, 1, 10
  LObjN LO::WIDE_2,           2, 4, 15, LN2::STONE_BRIDGE
  LObjN LO::R_SKWIRLBUSH,     0, 6, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 8, 0, 6
  LObj  LO::S_BIGHEART,       1, 2
  LObjN LO::R_SKWIRLBUSH,     0, 10, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 12, 0, 2
  LObjN LO::R_SKWIRLBUSH,     1, 5, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 7, 0, 7
  LObjN LO::R_SKWIRLBUSH,     1, 8, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 10, 0, 4
  LObjN LO::R_SKWIRLBUSH,     2, 11, 2, 1
  LObjN LO::R_SKWIRLBUSH,     1, 6, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  0, 13, 0, 1
  LObjN LO::WIDE_2,           2, 4, 5, LN2::STONE_BRIDGE
  LObjN LO::R_WOOD_PLATFORM,  0, 8, 0, 6
  LObjN LO::R_SKWIRLBUSH,     1, 9, 4, 1
  LObjN LO::R_WOOD_PLATFORM,  2, 11, 0, 3
  LObj  LO::S_DOOR,           1, 2
  LWriteCol $21, LevelId::Final6B
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LFinished

final6Sprite:
  LSpr Enemy::TURKEY,              1,  17,   5
  LSpr Enemy::TURKEY,              1,  18,   8
  LSpr Enemy::BOUNCER,             1,  31,   9
  LSpr Enemy::BOUNCER,             1,  33,  12
  LSpr Enemy::GEORGE,              1,  37,   7
  LSpr Enemy::OWL,                 1,  42,   5
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  45,   6, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  47,   7, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  49,   5, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  51,   4, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  54,   6, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  56,   7, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  58,   5, 1
  LSpr Enemy::CHECKPOINT,          0,  68,  12
  LSpr Enemy::ROVER,               1,  70,   5
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  71,   6, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  73,   5, 1
  LSpr Enemy::TURKEY,              1,  74,  11
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  75,   4, 1
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  77,   3, 1
  LSpr Enemy::CHECKPOINT,          0,  80,   2
  LSpr Enemy::MOVING_PLATFORM_PUSH, 0,  91,   7, 1
  LSpr Enemy::ROCKET_LAUNCHER,     0,  92,  12
  LSpr Enemy::SNEAKER,             1,  94,   3
  LSpr Enemy::TURKEY,              1,  98,   8
  LSpr Enemy::BOUNCER,             1, 113,   9
  LSpr Enemy::BOUNCER,             1, 116,   9
  LSpr Enemy::SNEAKER,             0, 123,   2
  LSpr Enemy::CHECKPOINT,          0, 126,   9
  LSpr Enemy::SNEAKER,             1, 129,   5
  LSpr Enemy::ROCKET_LAUNCHER,     0, 133,  12
  LSpr Enemy::GOOMBA,              1, 143,   5
  LSpr Enemy::GEORGE,              1, 145,   9
  LSpr Enemy::SPINNER,             0, 155,   9, 3
  LSpr Enemy::ROCKET_LAUNCHER,     0, 164,   4
  LSpr Enemy::SPINNER,             0, 165,   9, 3
  LSpr Enemy::CHECKPOINT,          0, 177,   5
  LSpr Enemy::BOUNCER,             1, 191,   8
  LSpr Enemy::GEORGE,              1, 199,   6
  .byt 255 ; end
