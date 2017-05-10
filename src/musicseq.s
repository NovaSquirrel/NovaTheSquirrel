pently_sfx_table:
  .addr playerjump_snd
  .byt 0, 10
  .addr snare2_snd
  .byt 8, 2
  .addr kick2_snd
  .byt 8, 4
  .addr hihat_snd
  .byt 12, 2
  .addr youshoot_snd
  .byt 0, 6
  .addr enemyhurt_snd
  .byt 0, 10
  .addr youhurt_snd
  .byt 0, 10

  .addr collect_snd
  .byt 0, 10
  .addr spring_snd
  .byt 0, 20
  .addr snare_snd
  .byt 12, 7

  .addr kick_snd
  .byt 12, 3

  .addr boom1_snd ; explosion sounds taken from Thwaite
  .byt 16+0, 15
  .addr boom2_snd
  .byt 48+12, 16

  .addr enemyhurt2_snd
  .byt 0, 10
  .addr money_snd
  .byt 0, 10

  .addr youdead_snd
  .byt 0, 20
  .addr teleport_snd
  .byt 0, 10
  .addr bump_snd
  .byt 0, 5
  .addr tailattack_snd
  .byt 13, 5
  .addr smash_snd
  .byt $2c, 6
  .addr newability_snd
  .byt $20, 8
  .addr itemget_snd
  .byte $30,$07
  .addr unlock_snd
  .byte $1c,$05
  .addr arrowshoot_snd
  .byte $3c,$05
  .addr placeblock_snd
  .byte $20,$03

; alternating duty/volume and pitch bytes
itemget_snd:
  .byte $4b,$18+12,$4b,$15+12,$4b,$18+12,$4b,$1a+12,$4b,$1c+12,$48,$1c+12,$44,$1c+12
unlock_snd:
  .byte $0f,$0b,$08,$0b,$00,$00,$0f,$0d,$08,$0d
arrowshoot_snd:
  .byte $0f,$02,$0b,$01,$09,$00,$06,$00,$03,$00
placeblock_snd:
  .byte $4f,$00,$00,$00,$4f,$0c

tailattack_snd:
  .dbyt $0f00,$0f02,$0f04,$0c06,$0908,$0609,$030a

smash_snd:
  .byte $0f,$00,$0c,$07,$0b,$0c,$09,$0e,$08,$0f,$05,$0e

newability_snd:
  .dbyt $4f18,$4818,$0f1b,$081b,$0f20,$0820,$0f24,$0824

playerjump_snd:
  .dbyt $4f20, $4f21
  .dbyt $4f22, $4f23
  .dbyt $4f24, $4f25
  .dbyt $4f26, $4f27
  .dbyt $4f28, $4f29

spring_snd:
  .dbyt $4f20, $4f21
  .dbyt $4f20, $4f21
  .dbyt $4f22, $4f23
  .dbyt $4f22, $4f23
  .dbyt $4f24, $4f25
  .dbyt $4f24, $4f25
  .dbyt $4f26, $4f27
  .dbyt $4f26, $4f27
  .dbyt $4f28, $4f29
  .dbyt $4f28, $4f29

youshoot_snd:
  .dbyt $8f20, $8f21
  .dbyt $8f22, $8f23
  .dbyt $8f22, $8f21

enemyhurt_snd:
  .dbyt $4f20, $4f21
  .dbyt $4022, $4023
  .dbyt $4f24, $4f2f
  .dbyt $4f26, $4f2f
  .dbyt $4f28, $4f2f

youhurt_snd:
  .dbyt $4f10, $4f11
  .dbyt $4012, $4013
  .dbyt $4f14, $4f1f
  .dbyt $4f16, $4f1f
  .dbyt $4f18, $4f1f

youdead_snd:
  .dbyt $4f10, $4f11
  .dbyt $4f10, $4f11
  .dbyt $4012, $4013
  .dbyt $4012, $4013
  .dbyt $4f14, $4f1f
  .dbyt $4f14, $4f24
  .dbyt $4f16, $4f1f
  .dbyt $4f16, $4f25
  .dbyt $4f18, $4f1f
  .dbyt $4f18, $4f26

teleport_snd:
  .dbyt $8f20, $8020
  .dbyt $8f20, $8020
  .dbyt $8f20, $8820
  .dbyt $8620, $8420
  .dbyt $8220, $8120

collect_snd:
  .dbyt $4f20, $4f21
  .dbyt $4022, $4023
  .dbyt $4f24, $4f2f
  .dbyt $4026, $402f
  .dbyt $4f28, $4f2f

enemyhurt2_snd:
  .dbyt $4f20, $4f18
  .dbyt $4f10, $4f16
  .dbyt $4f20, $4f14
  .dbyt $4f10, $4f12
  .dbyt $4f20, $4f10

money_snd:
  .dbyt $4f20, $4f20
  .dbyt $4020, $4020
  .dbyt $4f23, $4f23
  .dbyt $4026, $4026
  .dbyt $4f26, $4f27

bump_snd:
  .byt $0f, $24, $0f, $23
  .byt $0f, $22, $0f, $21
  .byt $0f, $20

snare2_snd:
  .byt $8F, $26, $8F, $25
kick2_snd:
  .byt $8F, $1F, $8F, $1B, $8F, $18, $82, $15
hihat_snd:
  .byt $06, $03, $04, $83
snare_snd:
  .byt $0A, 085, $08, $84, $06, $04
  .byt $04, $84, $03, $04, $02, $04, $01, $04
kick_snd:
  .byt $08,$04,$08,$0E,$04,$0E
  .byt $05,$0E,$04,$0E,$03,$0E,$02,$0E,$01,$0E

boom1_snd:
  .byt $8F, $12, $4F, $0F, $8E, $0C
  .byt $0E, $0E, $8D, $0C, $4C, $0A
  .byt $8B, $0B, $0A, $09, $89, $06
  .byt $48, $08, $87, $07, $06, $05
  .byt $84, $06, $42, $04, $81, $03
boom2_snd:
  .byt $0F, $0E, $0E, $0D
  .byt $0D, $0E, $0C, $0E
  .byt $0B, $0E, $0A, $0F
  .byt $09, $0E, $08, $0E
  .byt $07, $0F, $06, $0E
  .byt $05, $0F, $04, $0E
  .byt $03, $0F, $02, $0E
  .byt $01, $0F, $01, $0F

;custom_attack:
;  .dbyt $4200, $4600, $4a00, $4c00
custom_attack:
  .dbyt $4700, $4b00, $4c00

; Each drum consists of one or two sound effects.
pently_drums:
drumSFX:
  .byt 10, 2
  .byt 1,  9
  .byt 3, <-1
KICK  = 0*8
SNARE = 1*8
CLHAT = 2*8

pently_instruments:
  ; first byte: initial duty (0/4/8/c) and volume (1-F)
  ; second byte: volume decrease every 16 frames
  ; third byte: bit 7: cut note if half a row remains
  ; (as well as an attack sound effect length)
  ; after that, an address to an attack sound effect
  .byt $88, 0, $00  ; bass
  .addr 0
  .byt $47, 4, $03  ; piano
  .addr custom_attack
  .byt $86, 1, $00  ; bell between rounds
  .addr 0
  .byt $87, 2, $00  ; xylo long
  .addr 0
  .byt $87, 6, $00  ; xylo short
  .addr 0
  .byt $05, 0, $00  ; distant horn blat
  .addr 0
  .byt $88, 4, $00  ; xylo medium
  .addr 0

pently_songs:
  .addr morning_mood

.enum
  PATT_MORNING_DRUMS
  PATT_MORNING_SQA1
  PATT_MORNING_SQA2
  PATT_MORNING_SQA3
  PATT_MORNING_SQA4
  PATT_MORNING_SQB
  PATT_NOTHING
.endenum

pently_patterns:
mornw_pats = (* - pently_patterns) >> 1
  .addr morning_drums, morning_sqA1, morning_sqA2, morning_sqA3, morning_sqA4, morning_sqB, morning_nothing

morning_mood:
  setTempo 540
  playPatSq2 mornw_pats+PATT_NOTHING, 27, 1
  playPatTri mornw_pats+PATT_NOTHING, 27, 0
  playPatNoise mornw_pats+PATT_MORNING_DRUMS, 0, 0

  playPatSq1 mornw_pats+PATT_MORNING_SQA1, 27, 1
  waitRows 32
  playPatSq1 mornw_pats+PATT_MORNING_SQA2, 27, 1
  waitRows 32
  playPatSq1 mornw_pats+PATT_MORNING_SQA3, 27, 1
  waitRows 32
  playPatSq1 mornw_pats+PATT_MORNING_SQA4, 27, 1
  waitRows 32
  segno
  playPatNoise mornw_pats+PATT_MORNING_DRUMS, 0, 0
  playPatSq1 mornw_pats+PATT_MORNING_SQA1, 27, 1
  playPatSq2 mornw_pats+PATT_MORNING_SQB, 27, 1
  waitRows 32
  playPatSq1 mornw_pats+PATT_MORNING_SQA2, 27, 1
  waitRows 32
  playPatSq1 mornw_pats+PATT_MORNING_SQA3, 27, 1
  playPatSq2 mornw_pats+PATT_NOTHING, 27, 1
  waitRows 32
  playPatNoise mornw_pats+PATT_NOTHING, 0, 0
  playPatSq1 mornw_pats+PATT_MORNING_SQA4, 27, 1
  waitRows 32
  dalSegno

morning_sqA1:
  .byt N_DSH|D_8, REST, N_GS|D_8, REST
  .byt N_AS, N_B, N_CSH|D_8, REST
  .byt N_GS|D_8, REST
  .byt N_FS|D_8, N_GS|D_8, REST
  .byt N_AS, REST, N_AS, N_CSH|D_8, N_DSH|D_4, N_GS|D_4
morning_sqA2:
  .byt N_DSH|D_8, REST, N_GS|D_8, REST
  .byt N_AS, N_B, N_CSH|D_8, REST
  .byt N_GS|D_8, REST
  .byt N_FS|D_8, N_GS|D_8, REST
  .byt N_AS, REST, N_AS, N_CSH|D_8, N_FS|D_4, N_GS|D_4
morning_sqA3:
  .byt N_B|D_8, N_DSH, N_GS|D_8
  .byt N_A, N_AS, N_B, N_CSH|D_8
  .byt N_B, N_GS, REST, N_GS, N_CSH|D_8
  .byt N_GS|D_8, N_FS, N_GS|D_8, N_FS, N_AS|D_8
  .byt N_CSH|D_8, N_GS, REST, N_GS, N_AS, N_CSH|D_8  
morning_sqA4:
  .byt N_B|D_8, N_DSH, N_GS, N_GS, N_A, N_AS, N_B, N_CSH|D_8
  .byt N_B, N_GS, REST, N_GS, N_GS, REST, N_GS|D_8, N_FS, N_GS|D_8
  .byt N_FS, N_CSH|D_8, N_DSH|D_8, N_GS, REST, N_GS, N_AS, N_CSH|D_8
morning_sqB:
  .byt REST|D_8, REST, N_DS|D_8, REST, N_FS|D_8, N_GS|D_8, REST, N_CSH|D_8, REST|D_8, REST
  .byt N_DS|D_8, REST, N_FS|D_8, REST|D_8, REST, N_AS|D_8, REST|D_8, N_CSH|D_8, REST|D_8
  .byt PATEND
morning_nothing:
  .byt REST|D_2
  .byt PATEND

morning_drums:
  .byt KICK, KICK, KICK|D_8, SNARE|D_8
  .byt KICK, KICK, KICK|D_8, SNARE|D_8, SNARE|D_8, KICK|D_8
  .byt PATEND
