BGTropical:    ChrFile "../chr/bgtropical.pb53",  1024,  $0800
BGSuburbs:     ChrFile "../chr/bgsuburbs.pb53",   1024,  $0800
BGHannah:      ChrFile "../chr/bghannah.pb53",    512,   $0c00
SPHannah:      ChrFile "../chr/sphannah.pb53",    512,   $1800
SPSchemeTeam:  ChrFile "../chr/spscheme1.pb53",   512,   $1800
SPLife:        ChrFile "../chr/splife.pb53",      512,   $1800
BGMines:       ChrFile "../chr/bgmines.pb53",     512,   $0e00
BGShopIcons:   ChrFile "../chr/shopicons.pb53",   768,   $0b00
SPWind:        ChrFile "../chr/spwind.pb53",      512,   $1800
SPBoomerang:   ChrFile "../chr/spboomerang.pb53", 512,   $1800
BGExposition:  ChrFile "../chr/bgexposition.pb53",2048,  $0800
SPMolSno:      ChrFile "../chr/spmolsno.pb53",    512,   $1800
BGJungle:      ChrFile "../chr/bgjungle.pb53",    1024,  $0800
BGCloudsGfx:   ChrFile "../chr/bgclouds.pb53",    768,   $0500
BGJack:        ChrFile "../chr/bgjack.pb53",      1024,  $0800
BGDABG:        ChrFile "../chr/bgdabg.pb53",      768,   $0500
BGDABGCommon:  ChrFile "../chr/bgdabgcommon.pb53",1024,  $0000
SPFaceball:    ChrFile "../chr/spfaceball.pb53",  512,   $1800
SPFHBG:        ChrFile "../chr/spfhbg.pb53",      512,   $1800
SPFreak:       ChrFile "../chr/spfreak.pb53",     512,   $1800
BGChipDABG:    ChrFile "../chr/bgchipdabg.pb53",  1024,  $0800
CHRMiniFont:   ChrFile "../chr/minifont.pb53",    512,   $0e00
SPCastle:      ChrFile "../chr/spcastle.pb53",    512,   $1800
SPFinalBoss:   ChrFile "../chr/spfinalboss.pb53", 512,   $1800
SPFinalProjectile: ChrFile "../chr/spfinalprojectile.pb53",    512,   $1800
CHRLevelEditIcons: ChrFile "../chr/leveleditmenu.pb53", 768, $0800
CHREnemyEdit:  ChrFile "../chr/enemyedit.pb53",   512,   $0800

CHREarlyTiles: ChrFile "../chr/earlytiles.pb53",  2048,  $0800

AnimWaterGfx:
  .incbin "../chr/animwater.chr"

; Keep these two together
ToggleBlockGFX:
  .incbin "../chr/toggleblock.chr"
  .incbin "../chr/toggleblockdabg.chr"
