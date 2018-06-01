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
CHRFont:    ChrFile "../chr/font.pb53",       1536, $0200
PalGrassy:  .byt $03
            .byt $1a, $2a, $37
            .byt $2d, $3d, $30
            .byt $17, $27, $37
            .byt $06, $16, $26 ;.byt $02, $12, $22
PalFrozen:  .byt $03
            .byt $21, $31, $30
            .byt $0c, $1c, $10
            .byt $17, $27, $38
            .byt $06, $16, $27
PalDABG:    .byt $03
            .byt $0f, $29, $17
            .byt $0f, $16, $30
            .byt $0f, $27, $37
            .byt $0f, $16, $26
PalDABGGray: .byt $03
             .byt $0f, $29, $17
             .byt $0f, $00, $30
             .byt $0f, $27, $37
             .byt $0f, $01, $12
PalDABGBlue: .byt $03
             .byt $0f, $29, $17
             .byt $0f, $12, $30
             .byt $0f, $27, $37
             .byt $0f, $01, $12
PalDABGGray2:.byt $03
             .byt $0f, $29, $17
             .byt $0f, $00, $30
             .byt $0f, $27, $37
             .byt $0f, $16, $26 ; lava

AltGrassy1: .byt $00
            .byt $1b, $2b, $37
AltGrassy2: .byt $00
            .byt $19, $29, $37
PalBummer:  .byt $03
            .byt $1a, $2a, $3a
            .byt $2d, $10, $30
            .byt $06, $16, $26
            .byt $02, $22, $32
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
PalEnemy3:  .byt $61
            .byt $05, $15, $35
            .byt $0b, $2b, $3b
PalEnemy4:  .byt $61
            .byt $04, $14, $24
            .byt $11, $21, $31
PalEnemy5:  .byt $61
            .byt $15, $25, $35
            .byt $03, $13, $23
PalEnemy6:  .byt $61
            .byt $0f, $16, $30
            .byt $0f, $12, $30
PalEnemy7:  .byt $61
            .byt $0f, $16, $30
            .byt $02, $16, $30

PalEnemyMolSno:
            .byt $61
            .byt $0f, $16, $30 ; MolSno
            .byt $0f, $21, $30 ; John
PalFighterMaker:
            .byt $60
            .byt $0a, $2a, $2c

PalLevelSel: .byt $07
             .byt $30, $30, $30
             .byt $15, $25, $35
             .byt $14, $24, $34
             .byt $1c, $2c, $3c
             .byt $12, $2a, $30
             .byt $15, $25, $35
             .byt $1a, $2a, $3a
             .byt $00, $10, $30
PalJack:
			.byt $21
            .byt $17, $38, $30
            .byt $01, $12, $30

; Unused because the exposition uses grayscale
PalExpositionForum:
             .byt $21

PalExpositionSchemeTeam:
             .byt $21

PalExpositionSherwins:
             .byt $21
             .byt $17, $27, $37 ;sherwin
             .byt $0f, $27, $30 ;blaster guy

PALEarlyTiles:
             .byt $03
             .byt $1a, $2a, $28
             .byt $12, $10, $30
             .byt $17, $27, $37
             .byt $12, $16, $30

AbilityIcons: .incbin "chr/sppowericons.chr"
AbilityGfx:   .incbin "chr/sppowergfx.chr"
AbilityOffsets:
  .byt 0, $00, $01, $05, $09, $11, $17, $1b, $1e, $22, $28, $30
AbilityLengths:
  .byt 0,   1,   4,   4,   8,   6,   4,   3,   4,   6,   8,   4

