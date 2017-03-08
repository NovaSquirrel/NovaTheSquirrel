frozen:
  .byt MusicTracks::NONE|0
  .byt 2
  .byt $fa
  .byt GraphicsUpload::SP_WALKER
  .byt GraphicsUpload::SP_CANNON
  .byt GraphicsUpload::SP_FIRE
  .byt GraphicsUpload::SP_MINES
  .addr frozenData
  .addr frozenSprite
  .byt $f ; background
  .byt GraphicsUpload::PAL_FROZEN
  .byt GraphicsUpload::BG_COMMON
  .byt GraphicsUpload::BG_FROZEN_FG
  .byt GraphicsUpload::BG_FROZEN_BG
  .byt GraphicsUpload::PAL_ENEMY4
  .byt GraphicsUpload::BG_MINES
  .byt 255 ; end
  .byt $00, $00 ; boundaries

frozenData:
  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $0f, LevelBackgroundId::FROZEN_CAVE
  LObjN LO::RECT_3,           0, 12, 2, LN3::ROCK, 30
  LObj  LO::S_MTRACK_BUMP,     3, 2
  LObjN LO::WIDE_3,           1, 2, 2, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_BUMP,     0, 11
  LObj  LO::S_MTRACK_SUPPORTS, 1, 11
  LObjN LO::WIDE_3,           1, 11, 3, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SGR,      1, 3
  LObj  LO::S_MTRACK_SGR,      2, 4
  LObj  LO::S_MTRACK_SSL,      1, 11
  LObj  LO::S_MTRACK_SGR,      1, 5
  LObj  LO::S_MTRACK_SSL,      0, 10
  LObjN LO::WIDE_3,           1, 5, 4, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSL,      0, 9
  LObj  LO::S_MTRACK_SSL,      1, 8
  LObjN LO::WIDE_3,           1, 7, 4, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_UPLEFT,   2, 7
  LObj  LO::S_MTRACK_SGL,      1, 5
  LObj  LO::S_MTRACK_SGL,      2, 4
  LObj  LO::S_MTRACK_BUMP,     0, 7
  LObjN LO::R_MTRACK_SUPPORTSONLY,  0, 8, 0, 3
  LObj  LO::S_MTRACK_SGL,      2, 3
  LObjN LO::WIDE_3,           1, 2, 4, LN3::MINE_TRACKS
  LObj  LO::S_MTRACK_SSR,      5, 3
  LObj  LO::S_MTRACK_SSR,      1, 4
  LObj  LO::S_MTRACK,         1, 4
  LObj  LO::S_MTRACK_BUMP,     1, 4
  LObjN LO::RECT_3,           2, 0, 2, LN3::ROCK, 41
  LObjN LO::R_ROCK,           0, 12, 11, 2
  LObjN LO::R_ROCK,           1, 3, 6, 0
  LObj  LO::S_TALL_GRASS,     3, 11
  LObjN LO::WIDE_1,           2, 11, 0, LN1::FENCE
  LObj  LO::S_PRIZE,          1, 9
  LObjN LO::RECT_3,           1, 3, 1, LN3::ROCK, 22
  LObjN LO::R_BRICK,          0, 9, 1, 0
  LObjN LO::WIDE_1,           0, 11, 0, LN1::FENCE
  LObjN LO::WIDE_1,           2, 11, 0, LN1::FENCE
  LObj  LO::S_FLOWER,         1, 11
  LObj  LO::S_FLOWER,         1, 10
  LObjN LO::R_ROCK,           0, 11, 2, 3
  LObjN LO::R_ROCK,           1, 10, 1, 0
  LObj  LO::S_COIN,           1, 7
  LObjN LO::WIDE_1,           1, 8, 3, LN1::SOLID_LEDGE
  LObj  LO::R_CUSTOM,         0, 10, Metatiles::LAVA_MAIN, (3<<4)|4
  LObj  LO::S_COIN,           1, 5
  LObj  LO::S_COIN,           2, 6
  LObjN LO::R_ROCK,           1, 10, 1, 0
  LObjN LO::R_ROCK,           0, 11, 2, 3
  LObj  LO::S_COIN,           1, 6
  LObjN LO::RECT_3,           2, 12, 2, LN3::ROCK, 19
  LObjN LO::R_GROUND,         1, 8, 3, 3
  LObjN LO::R_GROUND,         4, 10, 3, 1
  LObjN LO::R_GROUND,         4, 9, 3, 2
  LFinished

frozenSprite:
  LSpr Enemy::MINECART,            0,   5,   9
  LSpr Enemy::MINECART,            1,  14,   5
  LSpr Enemy::GOOMBA,              1,  28,  11
  .byt 255 ; end
