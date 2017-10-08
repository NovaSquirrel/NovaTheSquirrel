funkunderground:
  .byt MusicTracks::NONE|0
  .byt 3
  .byt $fb
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr funkundergroundData
  .addr funkundergroundSprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY2
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_TROPICAL
  .byt 255 ; end
  .byt $00, $06 ; boundaries

funkundergroundData:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::CLOUDS
  LObjN LO::R_GROUND,         0, 13, 10, 1
  LObjN LO::R_SOLID_BLOCK,    10, 11, 0, 1
  LObjN LO::WIDE_1,           4, 12, 4, LN1::FENCE
  LObjN LO::R_GROUND,         0, 13, 9, 1
  LObjN LO::R_GROUND,         2, 1, 2, 9
  LObjN LO::R_COIN,           3, 8, 2, 0
  LObjN LO::R_GROUND,         0, 9, 0, 1
  LObjN LO::R_BRICK,          1, 9, 0, 1
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::R_SOLID_BLOCK,    1, 9, 0, 3
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::R_COIN,           1, 8, 2, 0
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_GROUND,         2, 13, 9, 1
  LObjN LO::WIDE_1,           1, 12, 4, LN1::TALLGRASS
  LObjN LO::R_BRICK,          1, 1, 2, 0
  LObjN LO::WIDE_1,           0, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_BLOCK,    5, 10, 0, 2
  LObjN LO::WIDE_1,           4, 9, 2, LN1::SOLID_LEDGE
  LObjN LO::R_BRICK,          1, 1, 6, 0
  LObj  LO::S_SOLID_BLOCK,    2, 9
  LObjN LO::WIDE_1,           1, 4, 2, LN1::SOLID_LEDGE
  LObj  LO::S_SPRING,         1, 3
  LObjN LO::R_GROUND,         1, 8, 3, 6
  LObj  LO::S_SPRING,         1, 7
  LObjN LO::R_GROUND,         1, 1, 1, 6
  LObjN LO::R_BRICK,          4, 4, 6, 0
  LObjN LO::R_COIN,           1, 3, 4, 0
  LObjN LO::R_BRICK,          4, 10, 2, 2
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObjN LO::R_BRICK,          1, 1, 15, 0
  LObj  LO::S_BRICKPRIZE,     0, 4
  LObjN LO::R_BRICK,          0, 7, 0, 2
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::R_BRICK,          2, 2, 4, 0
  LObjN LO::R_BRICK,          0, 9, 4, 0
  LObj  LO::S_FLOWER,         0, 12
  LObjN LO::R_COIN,           1, 7, 1, 1
  LObj  LO::S_SIGNPOST,       0, 12
  LWriteCol <AboutSpinnerEnemy, >AboutSpinnerEnemy
  LObjN LO::R_BRICK,          2, 3, 1, 6
  LObj  LO::S_FLOWER,         0, 12
  LObjN LO::TALL_2,           1, 3, 5, LN2::GRAY_BRICKS
  LObj  LO::S_BRICKPRIZE,     1, 9
  LObjN LO::WIDE_2,           2, 12, 2, LN2::BUSH
  LObj  LO::S_SOLID_BLOCK,    2, 10
  LObj  LO::S_SOLID_BLOCK,    2, 8
  LObj  LO::S_SOLID_BLOCK,    2, 6
  LObjN LO::R_BRICK,          1, 6, 1, 2
  LObjN LO::R_BRICK,          1, 1, 4, 0
  LObjN LO::WIDE_2,           1, 10, 2, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 11, 2, 1
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObj  LO::S_BRICKPRIZE,     1, 7
  LWriteCol InventoryItem::HEALTH_RESTORE
  LObjN LO::R_BRICK,          0, 7, 2, 0
  LObjN LO::R_COIN,           0, 8, 1, 1
  LObjN LO::R_BRICK,          2, 2, 0, 1
  LObjN LO::R_SOLID_BLOCK,    0, 10, 0, 1
  LObjN LO::R_BRICK,          6, 1, 7, 0
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 23
  LObjN LO::R_GROUND,         1, 11, 4, 1
  LObj  LO::S_SOLID_BLOCK,    1, 8
  LObjN LO::R_SOLID_BLOCK,    0, 9, 2, 1
  LObjN LO::WIDE_1,           4, 6, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_BRICK,          1, 2, 8, 0
  LObjN LO::R_BRICK,          0, 6, 8, 3
  LObjN LO::WIDE_1,           0, 12, 9, LN1::TALLGRASS
  LObjN LO::R_COIN,           1, 5, 5, 0
  LObjN LO::R_GRAYBRICKS,     0, 7, 6, 1
  LObj  LO::S_BRICKPRIZE,     3, 2
  LWriteCol InventoryItem::ABILITY_FIRE
  LObjN LO::RECT_1,           4, 1, 0, LN1::BRICKS, 23
  LObjN LO::R_COIN,           3, 8, 1, 0
  LObjN LO::R_SOLID_BLOCK,    0, 10, 1, 2
  LObjN LO::R_BRICK,          6, 2, 2, 3
  LObjN LO::R_BRICK,          0, 6, 8, 3
  LObjN LO::TALL_2,           1, 2, 4, LN2::GRAY_BRICKS
  LObjN LO::R_GRAYBRICKS,     0, 7, 6, 1
  LObjN LO::WIDE_2,           0, 13, 3, LN2::STONE_BRIDGE
  LObjN LO::R_COIN,           2, 3, 2, 1
  LObjN LO::R_GROUND,         3, 13, 12, 1
  LObjN LO::WIDE_1,           3, 8, 4, LN1::FENCE
  LObjN LO::R_SOLID_BLOCK,    0, 9, 5, 0
  LObjN LO::R_COIN,           1, 7, 3, 0
  LObj  LO::S_SPRING,         4, 8
  LObjN LO::WIDE_1,           1, 12, 1, LN1::TALLGRASS
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::R_SOLID_BLOCK,    1, 7, 0, 5
  LObj  LO::S_SPRING,         3, 9
  LObjN LO::WIDE_1,           0, 10, 2, LN1::SOLID_LEDGE
  LObjN LO::WIDE_1,           1, 12, 2, LN1::TALLGRASS
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 17
  LObjN LO::R_COIN,           1, 11, 1, 0
  LObjN LO::RECT_1,           1, 1, 3, LN1::BRICKS, 22
  LObj  LO::S_SPRING,         2, 12
  LObjN LO::R_BRICK,          1, 9, 8, 3
  LObjN LO::WIDE_2,           9, 12, 1, LN2::BUSH
  LObjN LO::WIDE_1,           1, 10, 0, LN1::SOLID_LEDGE
  LObjN LO::R_COIN,           1, 11, 1, 0
  LObjN LO::R_SOLID_BLOCK,    1, 9, 3, 0
  LObjN LO::R_SOLID_BLOCK,    3, 8, 4, 0
  LObjN LO::RECT_1,           1, 13, 1, LN1::GROUND, 24
  LObj  LO::S_BRICK,          1, 8
  LObj  LO::S_PRIZE,          0, 10
  LObj  LO::S_BIGHEART,       0, 12
  LObjN LO::R_SOLID_BLOCK,    2, 9, 0, 3
  LObjN LO::R_BRICK,          1, 1, 10, 0
  LObjN LO::R_BRICK,          0, 5, 7, 7
  LObjN LO::TALL_2,           1, 5, 2, LN2::GRAY_BRICKS
  LObjN LO::R_BRICK,          7, 9, 11, 3
  LObjN LO::R_BRICK,          3, 1, 0, 5
  LObj  LO::S_SPRING,         1, 5
  LObj  LO::S_SOLID_BLOCK,    0, 6
  LObjN LO::R_SOLID_BLOCK,    1, 3, 9, 0
  LObjN LO::TALL_2,           0, 4, 1, LN2::TRUNK
  LObjN LO::R_BRICK,          0, 6, 1, 0
  LObjN LO::TALL_2,           0, 7, 1, LN2::TRUNK
  LObjN LO::R_BRICK,          6, 7, 0, 1
  LObjN LO::TALL_2,           3, 4, 10, LN2::TRUNK
  LObj  LO::S_COIN,           2, 2
  LObj  LO::S_COIN,           2, 4
  LObj  LO::S_COIN,           2, 6
  LObjN LO::R_CEILING_BARRIER,1, 0, 0, 1
  LObjN LO::RECT_1,           0, 13, 1, LN1::GROUND, 16
  LObjN LO::R_SOLID_BLOCK,    1, 0, 0, 8
  LObj  LO::S_FLOWER,         0, 12
  LObjN LO::R_SOLID_BLOCK,    1, 0, 11, 0
  LObjN LO::R_BRICK,          0, 1, 11, 8
  LObjN LO::R_AIR,            3, 5, 1, 1
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::R_AIR,            1, 1, 2, 1
  LObj  LO::S_SPRING,         0, 6
  LObj  LO::S_DOOR,           1, 1
  LWriteCol 11, 243
  LObjN LO::R_BRICK,          7, 1, 11, 1
  LObj  LO::S_PRIZE,          0, 9
  LObj  LO::S_FLOWER,         1, 12
  LObjN LO::RECT_1,           5, 13, 1, LN1::GROUND, 20
  LObjN LO::R_SOLID_BLOCK,    1, 10, 1, 2
  LObjN LO::WIDE_1,           6, 12, 3, LN1::FENCE
  LObjN LO::TALL_2,           6, 11, 1, LN2::TRUNK_L
  LObjN LO::TALL_2,           2, 11, 1, LN2::TRUNK_L
  LObj  LO::S_DOOR,           3, 11
  LWriteCol $21, LevelId::Underground2
  LXPlus16
  LObjN LO::R_SOLID_BLOCK,    3, 1, 15, 1
  LObjN LO::R_SOLID_BLOCK,    0, 3, 1, 9
  LObjN LO::R_GROUND,         0, 13, 15, 1
  LObj  LO::S_DOOR,           3, 11
  LWriteCol 1, 190
  LObjN LO::R_COIN,           2, 7, 5, 3
  LObj  LO::S_SPRING,         1, 12
  LObj  LO::S_SPRING,         3, 12
  LObjN LO::R_SOLID_BLOCK,    5, 3, 1, 9
  LFinished

funkundergroundSprite:
  LSpr Enemy::GOOMBA,              1,  20,  12
  LSpr Enemy::THWOMP,              0,  28,   2
  LSpr Enemy::THWOMP,              0,  38,   2
  LSpr Enemy::SPINNER,             1,  55,   2
  LSpr Enemy::GEORGE,              1,  63,  12
  LSpr Enemy::CHECKPOINT,          0,  71,   5
  LSpr Enemy::GOOMBA,              1,  73,   5
  LSpr Enemy::GOOMBA,              1,  77,   6
  LSpr Enemy::GOOMBA,              1,  95,  12
  LSpr Enemy::FIRE_JUMP,           1,  98,   5
  LSpr Enemy::SNEAKER,             0, 111,   5
  LSpr Enemy::OWL,                 1, 140,   8
  LSpr Enemy::SNEAKER,             1, 161,   4
  LSpr Enemy::SNEAKER,             1, 172,   2
  LSpr Enemy::GOOMBA,              1, 173,   6
  LSpr Enemy::GOOMBA,              1, 195,  12
  LSpr Enemy::GOOMBA,              1, 197,  12
  LSpr Enemy::GEORGE,              1, 208,  12
  LSpr Enemy::COLLECTIBLE,         0, 252,  11
  .byt 255 ; end
