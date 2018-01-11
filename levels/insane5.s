insane5:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fa
  .byt GraphicsUpload::SP_WIND
  .byt GraphicsUpload::SP_BOOMERANG
  .byt GraphicsUpload::SP_LIFE
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
  .byt $00, $00 ; boundaries

insane5Data:
  LObjN LO::RECT_1,           0, 12, 2, LN1::GROUND, 38
  LObjN LO::R_FG_GLASS_RED,   4, 8, 4, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 2
  LObjN LO::R_FG_GLASS_RED,   1, 7, 2, 0
  LObj  LO::S_FG_GLASS_RED,   1, 6
  LObj  LO::S_SOLID_ROCK,     2, 2
  LObjN LO::R_BG_GLASS_BLUE,  0, 9, 0, 2
  LObj  LO::S_SIGNPOST,       4, 8
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
  LObj  LO::S_SPRING,         3, 11
  LObjN LO::R_FG_GLASS_RED,   2, 8, 4, 0
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
  LObjN LO::R_FG_GLASS_RED,   1, 7, 2, 0
  LObj  LO::S_COIN,           0, 10
  LObj  LO::S_FG_GLASS_RED,   1, 6
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
  LObj  LO::S_FG_GLASS_RED,   2, 4
  LObj  LO::S_M_CRATE,        0, 7
  LObj  LO::S_M_ARROW_RIGHT,  0, 8
  LObj  LO::S_SOLID_BLOCK,    0, 13
  LObj  LO::S_BIGHEART,       2, 8
  LObjN LO::WIDE_1,           0, 9, 1, LN1::SOLID_LEDGE
  LObjN LO::R_SOLID_ROCK,     2, 7, 2, 0
  LObj  LO::S_M_CRATE,        0, 8
  LObjN LO::R_SOLID_ROCK,     0, 9, 2, 0
  LObj  LO::S_CEILING_BARRIER,1, 0
  LObj  LO::S_PRIZE,          0, 4
  LWriteCol InventoryItem::BLOCK
  LObj  LO::S_CUSTOM,         0, 8, Metatiles::TOGGLE_SWITCH
  LObjN LO::R_BG_GLASS_GRAY,  0, 10, 0, 4
  LObj  LO::R_CUSTOM,         1, 0, Metatiles::TOGGLE_BLOCK_ON, (0<<4)|6
  LObj  LO::S_SOLID_ROCK,     0, 8
  LObjN LO::R_FG_GLASS_RED,   3, 7, 6, 0
  LObjN LO::R_BG_GLASS_BLUE,  0, 8, 0, 2
  LObjN LO::R_FG_GLASS_BLUE,  0, 11, 6, 0
  LObjN LO::R_GROUND,         0, 12, 14, 2
  LObjN LO::R_FG_GLASS_RED,   1, 6, 4, 0
  LObjN LO::R_COIN,           0, 9, 4, 0
  LObjN LO::R_FG_GLASS_RED,   1, 5, 2, 0
  LObj  LO::S_FG_GLASS_RED,   1, 4
  LObjN LO::R_BG_GLASS_BLUE,  3, 8, 0, 2
  LObj  LO::S_SPRING,         2, 11
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::STARS
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
  LSpr Enemy::BEAM_EMITTER,        0,  56,   5, 2
  LSpr Enemy::CHECKPOINT,          0,  68,   3
  .byt 255 ; end
