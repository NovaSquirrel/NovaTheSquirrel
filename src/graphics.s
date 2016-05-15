; palettes:
; ssssnnnn
; ||||++++ number of 3 entry palettes
; ++++---- palette to start writing to, * 4

SPNova:     ChrFile "../chr/spnova.pb53",     1024, $1000 
SPCommon:   ChrFile "../chr/spcommon.pb53",   1024, $1400
BGCommon:   ChrFile "../chr/bgcommon.pb53",   1024, $0000
BGGrassy:   ChrFile "../chr/bggrassy.pb53",   768,  $0500
BGChip:     ChrFile "../chr/bgchip.pb53",     1024, $0800
BGGrassyBG: ChrFile "../chr/bggrassbg.pb53",  512,  $0c00
BGCutscene: ChrFile "../chr/bgcutscene.pb53", 512,  $0000
SPWalker:   ChrFile "../chr/spwalker.pb53",   512,  $1800
SPCannon:   ChrFile "../chr/spcannon.pb53",   512,  $1800
SPFire:     ChrFile "../chr/spfire.pb53",     512,  $1800
SPKing:     ChrFile "../chr/spking.pb53",     512,  $1800
SPGeorge:   ChrFile "../chr/spgeorge.pb53",   512,  $1800
SPExplode:  ChrFile "../chr/spexplode.pb53",  512,  $1800
TitleCHR:   ChrFile "../tools/title/title.pb53",    4096, $0000
TitleNAM:   ChrFile "../tools/title/titlenam.pb53", 1024, $2000
InventoryCHR: ChrFile "../chr/inventory.pb53", 512, $0000
NPCCHR:     ChrFile "../chr/spnpc.pb53",      2048, $1000
SPSun:      ChrFile "../chr/spsun.pb53",      512,  $1800
BGFrozenFG: ChrFile "../chr/bgfrozenfg.pb53", 768,  $0500
BGFrozenBG: ChrFile "../chr/bgfrozenbg.pb53", 512,  $0c00
BGBummer:   ChrFile "../chr/bgbummer.pb53",   768,  $0500
LevelSelCHR: ChrFile "../chr/levelselect.pb53",  1024,  $0000
SPRonald:   ChrFile "../chr/spronald.pb53",   512,  $1800
SPMines:    ChrFile "../chr/spmines.pb53",    512,  $1800

PalGrassy:  .byt $03
            .byt $1a, $2a, $37
            .byt $2d, $3d, $30
            .byt $17, $27, $37
            .byt $02, $12, $22
PalBummer:  .byt $03
            .byt $1a, $2a, $3a
            .byt $2d, $10, $30
            .byt $06, $16, $27
            .byt $02, $22, $32
PalFrozen:  .byt $03
            .byt $21, $31, $30
            .byt $0c, $1c, $10
            .byt $17, $27, $38
            .byt $06, $16, $27
PalTitle:   .byt $02
            .byt $0f, $2a, $12
            .byt $0f, $2a, $26
            .byt $12, $22, $32
PalEnemy1:  .byt $61
            .byt $06, $16, $36
            .byt $16, $27, $37
PalEnemy2:  .byt $61
            .byt $06, $16, $36
            .byt $02, $22, $32
PalLevelSel: .byt $07
             .byt $30, $30, $30
             .byt $15, $25, $35
             .byt $14, $24, $34
             .byt $1c, $2c, $3c
             .byt $12, $2a, $30
             .byt $15, $25, $35
             .byt $1a, $2a, $3a
             .byt $00, $10, $30

AbilityIcons: .incbin "chr/sppowericons.chr"
AbilityGfx:   .incbin "chr/sppowergfx.chr"
AbilityOffsets:
  .byt 0, $00, $01, $05, $09, $11, $17, $1b, $1e, $22, $28, $30
AbilityLengths:
  .byt 0,   1,   4,   4,   8,   6,   4,   3,   4,   6,   8,   4

