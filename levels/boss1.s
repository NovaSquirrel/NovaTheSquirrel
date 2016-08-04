boss1:
  .byt MusicTracks::NONE|0
  .byt 12
  .byt $1b
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_SCHEME_TEAM
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_KING
  .addr boss1Data
  .addr boss1Sprite
  .byt $31 ; background
  .byt GraphicsUpload::PAL_GRASSY
  .byt GraphicsUpload::PAL_ENEMY1
  .byt GraphicsUpload::BG_SUBURBS
  .byt GraphicsUpload::BG_GRASSYBG
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_GRASSY
  .byt 255 ; end
  .byt $40, $00 ; boundaries

boss1Data:
  LObjN LO::WIDE_1,           2, 10, 2, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_SOLID_BLOCK,    1, 4
  LObjN LO::WIDE_1,           0, 5, 2, LN1::FALLTHROUGH_LEDGE
  LObj  LO::S_SPRING,         0, 12
  LObjN LO::R_GROUND,         0, 13, 4, 1
  LObjN LO::WIDE_1,           4, 8, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_SOLID_BLOCK,    2, 5, 0, 2
  LObjN LO::WIDE_1,           1, 5, 1, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_2,           0, 12, 1, LN2::FLOWER
  LObjN LO::R_GROUND,         0, 13, 7, 1
  LObjN LO::WIDE_1,           1, 9, 0, LN1::SPIKES
  LObjN LO::WIDE_1,           0, 10, 3, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_COIN,           1, 9, 2, 0
  LObj  LO::S_SPRING,         1, 12
  LObjN LO::WIDE_1,           1, 7, 6, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           1, 4, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           1, 7, 1, LN1::SPIKES
  LObjN LO::WIDE_2,           0, 8, 1, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 9, 1, 3
  LObjN LO::WIDE_1,           3, 9, 0, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_1,           0, 10, 1, LN1::SOLID_LEDGE
  LObj  LO::S_FLOWER,         1, 12
  LObjN LO::R_GROUND,         0, 13, 9, 1
  LObjN LO::WIDE_1,           1, 3, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::WIDE_2,           0, 9, 2, LN2::WOOD_PLATFORM_TOP
  LObjN LO::R_WOOD_PLATFORM,  0, 10, 2, 2
  LObjN LO::WIDE_1,           3, 8, 0, LN1::SPIKES
  LObjN LO::WIDE_1,           0, 9, 0, LN1::SOLID_LEDGE
  LObjN LO::WIDE_3,           1, 12, 2, LN3::WHITEFENCE
  LObjN LO::WIDE_1,           1, 5, 2, LN1::FALLTHROUGH_LEDGE
  LObjN LO::R_SOLID_BLOCK,    2, 4, 3, 0
  LObj  LO::S_BIGHEART,       2, 3
  LObj  LO::S_SOLID_BLOCK,    1, 3
  LFinished

boss1Sprite:
  LSpr Enemy::BOSS_FIGHT,          0,   0,   0
  LSpr Enemy::SCHEME_TEAM,         1,   2,   9
  LSpr Enemy::SCHEME_TEAM,         0,   3,   3
  LSpr Enemy::SCHEME_TEAM,         0,   9,   4, 1
  LSpr Enemy::SCHEME_TEAM,         1,  16,   3
  LSpr Enemy::SCHEME_TEAM,         1,  18,   6, 2
  LSpr Enemy::SCHEME_TEAM,         1,  20,   9, 1
  LSpr Enemy::FIRE_WALK,           0,  22,   8, 1
  LSpr Enemy::SCHEME_TEAM,         1,  27,   4, 2
  LSpr Enemy::SCHEME_TEAM,         1,  29,  12
  .byt 255 ; end
