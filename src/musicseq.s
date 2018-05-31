; Generated using Pently music assembler
; Music from src/musicseq.pently
;.include "../../src/pentlyseq.inc"
;.segment "RODATA"
NUM_SONGS=13
NUM_SOUNDS=26
.exportzp NUM_SONGS, NUM_SOUNDS
pently_sfx_table:  ; 26 entries, 636 bytes
sfxdef PE_autotriangle1, PEDAT_autotriangle1, 8, 1, 2
sfxdef PE_autotriangle2, PEDAT_autotriangle2, 3, 1, 2
sfxdef PE_autotriangle3, PEDAT_autotriangle3, 3, 1, 2
sfxdef PE_autotriangle4, PEDAT_autotriangle4, 8, 1, 2
sfxdef PE_autonoise5, PEDAT_autonoise5, 6, 1, 3
sfxdef PE_autonoise6, PEDAT_autonoise6, 6, 1, 3
sfxdef PE_autonoise7, PEDAT_autonoise7, 4, 1, 3
sfxdef PE_autotriangleb, PEDAT_autotriangleb, 8, 1, 2
sfxdef PE_autonoisec, PEDAT_autonoisec, 8, 1, 3
sfxdef PE_autotriangle10, PEDAT_autotriangle10, 4, 1, 2
sfxdef PE_autonoise11, PEDAT_autonoise11, 4, 1, 3
sfxdef PE_autonoise13, PEDAT_autonoise13, 4, 1, 3
sfxdef PE_autonoise14, PEDAT_autonoise14, 13, 1, 3
sfxdef PE_autotriangle15, PEDAT_autotriangle15, 5, 1, 2
sfxdef PE_autonoise16, PEDAT_autonoise16, 10, 1, 3
sfxdef PE_autonoise19, PEDAT_autonoise19, 32, 1, 3
sfxdef PE_autonoise1d, PEDAT_autonoise1d, 20, 1, 3
sfxdef PE_autonoise1e, PEDAT_autonoise1e, 20, 1, 3
sfxdef PE_autonoise1f, PEDAT_autonoise1f, 20, 1, 3
sfxdef PE_autonoise24, PEDAT_autonoise24, 7, 1, 3
sfxdef PE_autonoise25, PEDAT_autonoise25, 7, 1, 3
sfxdef PE_autonoise2b, PEDAT_autonoise2b, 9, 1, 3
sfxdef PE_autonoise2c, PEDAT_autonoise2c, 15, 1, 3
sfxdef PE_autonoise2d, PEDAT_autonoise2d, 9, 1, 3
sfxdef PE_autonoise36, PEDAT_autonoise36, 32, 1, 3
sfxdef PE_autotriangle37, PEDAT_autotriangle37, 1, 1, 2
; first sound effect is 26
  .addr playerjump_snd
  .byt 0, 10
  .addr enemyhurt_snd
  .byt 0, 10
  .addr youhurt_snd
  .byt 0, 10
  .addr spring_snd
  .byt 0, 20
  .addr boom1_snd ; explosion sounds taken from Thwaite
  .byt 16+0, 15
  .addr boom2_snd
  .byt 48+12, 16
  .addr enemyhurt2_snd
  .byt 0, 10
  .addr money_snd
  .byt 0, 10
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
  .addr player_bump_snd ; player bump sound
  .byte $00,$04

PEDAT_autotriangle1:
.byte 143,32,143,30,143,29,143,28,143,27,143,26,143,24,143,19
PEDAT_autotriangle2:
.byte 143,56,143,34,143,55
PEDAT_autotriangle3:
.byte 143,80,143,51,143,39
PEDAT_autotriangle4:
.byte 143,39,143,37,143,36,143,35,143,34,143,33,143,31,143,28
PEDAT_autonoise5:
.byte 15,13,10,11,5,12,2,8,1,8,1,8
PEDAT_autonoise6:
.byte 2,10,5,5,6,3,3,3,2,3,1,3
PEDAT_autonoise7:
.byte 10,7,5,12,2,12,1,12
PEDAT_autotriangleb = PEDAT_autotriangle1 + 0
PEDAT_autonoisec:
.byte 15,14,9,8,7,7,6,8,4,8,3,8,3,8,1,8
PEDAT_autotriangle10:
.byte 143,31,143,27,143,24,143,22
PEDAT_autonoise11 = PEDAT_autonoise2b + 0
PEDAT_autonoise13 = PEDAT_autonoise2d + 0
PEDAT_autonoise14:
.byte 9,3,6,2,5,3,5,3,5,3,4,3,4,3,4,3,3,3,3,3,2,3,2,3,1,3
PEDAT_autotriangle15:
.byte 143,39,143,27,143,34,143,33,143,32
PEDAT_autonoise16:
.byte 15,11,15,15,10,8,6,7,4,7,3,8,2,8,2,8,1,8,1,8
PEDAT_autonoise19 = PEDAT_autonoise36 + 0
PEDAT_autonoise1d:
.byte 9,135,6,139,3,140,2,141,4,141,7,142,6,142,4,142,2,142,3,142,4,142,5,142,4
.byte 142,3,142,2,142,1,142,2,142,3,142,2,142,1,142
PEDAT_autonoise1e:
.byte 9,15,6,14,3,14,2,13,4,13,7,13,6,12,4,12,2,12,3,12,4,12,5,12,4,12,3,12,2
.byte 12,1,12,2,12,3,12,2,12,1,12
PEDAT_autonoise1f:
.byte 9,10,6,13,3,14,2,15,4,9,7,9,6,9,4,9,2,9,3,9,4,9,5,9,4,9,3,9,2,9,1,9,2,9,3
.byte 9,2,9,1,9
PEDAT_autonoise24:
.byte 10,129,5,129,2,129,0,129,3,129,2,129,1,129
PEDAT_autonoise25:
.byte 10,130,5,130,2,130,0,130,3,130,2,130,1,130
PEDAT_autonoise2b:
.byte 10,10,4,14,2,3,1,2,0,15,5,10,2,14,1,3,1,2
PEDAT_autonoise2c:
.byte 15,11,15,15,10,8,6,7,4,7,6,11,6,15,4,8,3,7,2,7,2,8,1,8,1,8,1,8,1,8
PEDAT_autonoise2d:
.byte 9,3,5,2,2,3,1,3,0,3,3,3,2,2,1,3,1,3
PEDAT_autonoise36:
.byte 12,5,7,3,7,6,7,6,7,6,6,6,6,6,6,6,6,6,6,6,5,6,5,6,5,6,5,6,4,6,4,6,4,6,4,6
.byte 4,6,3,6,3,6,3,6,3,6,3,6,2,6,2,6,2,6,2,6,1,6,1,6,1,6,1,6
PEDAT_autotriangle37 = PEDAT_autotriangle2 + 0
pently_instruments:  ; 30 entries, 560 bytes
instdef PI_Blank, 2, 15, 0, 0, 0, 0
instdef PI_Tribal_Noise_1_26_4, 2, 0, 0, 0, PIDAT_Tribal_Noise_1_26_4, 6
instdef PI_Tribal_Background, 2, 0, 0, 0, PIDAT_Tribal_Background, 19
instdef PI_Tribal_Bass, 3, 0, 0, 0, PIDAT_Tribal_Bass, 20
instdef PI_Tribal_Hit, 0, 0, 0, 0, PIDAT_Tribal_Hit, 11
instdef PI_Horn, 3, 7, 0, 0, PIDAT_Horn, 2
instdef PI_Distant_Square_Echo, 2, 2, 0, 0, 0, 0
instdef PI_Puzzle_Effects, 1, 3, 0, 0, PIDAT_Puzzle_Effects, 6
instdef PI_Short_Kick, 2, 8, 0, 0, 0, 0
instdef PI_Puzzle_Mellow_Crazy, 3, 0, 0, 0, PIDAT_Puzzle_Mellow_Crazy, 23
instdef PI_Puzzle_Pulsate, 1, 0, 0, 0, PIDAT_Puzzle_Pulsate, 16
instdef PI_Puzzle_Fill, 0, 0, 0, 0, PIDAT_Puzzle_Fill, 11
instdef PI_Cave_Bass, 2, 0, 0, 0, PIDAT_Cave_Bass, 25
instdef PI_Cave_Lead, 0, 0, 0, 0, PIDAT_Cave_Lead, 15
instdef PI_Boss_Bass, 2, 15, 0, 0, PIDAT_Boss_Bass, 1
instdef PI_Boss_Arp_Hit, 0, 0, 0, 0, PIDAT_Boss_Arp_Hit, 20
instdef PI_Pizzicato_Strings, 1, 0, 0, 0, PIDAT_Pizzicato_Strings, 11
instdef PI_Cave_Triangle, 2, 0, 0, 0, PIDAT_Cave_Triangle, 4
instdef PI_Select_Lead_1, 1, 9, 0, 0, PIDAT_Select_Lead_1, 5
instdef PI_Select_Lead_2, 1, 0, 0, 0, PIDAT_Select_Lead_2, 16
instdef PI_Select_Orc_Hit, 1, 0, 0, 0, PIDAT_Select_Orc_Hit, 23
instdef PI_Boss2Echo, 2, 10, 0, 0, PIDAT_Boss2Echo, 5
instdef PI_Boss_2_Lead, 1, 1, 0, 0, PIDAT_Boss_2_Lead, 24
instdef PI_Banjo, 0, 0, 0, 0, PIDAT_Banjo, 11
instdef PI_Minor_Boss_Rhythm_Guitar, 0, 1, 0, 0, PIDAT_Minor_Boss_Rhythm_Guitar, 11
instdef PI_Miniboss_Flute, 2, 0, 0, 0, PIDAT_Miniboss_Flute, 20
instdef PI_Harp, 3, 0, 0, 0, PIDAT_Harp, 20
instdef PI_Triangle_Choir, 2, 15, 0, 0, PIDAT_Triangle_Choir, 7
instdef PI_Triangle_Short, 2, 0, 0, 0, PIDAT_Triangle_Short, 3
instdef PI_Super_Major_Arp, 0, 6, 0, 0, PIDAT_Super_Major_Arp, 7
PIDAT_Tribal_Noise_1_26_4:
.byte 143,2,138,4,133,3,130,7,129,7,129,7
PIDAT_Tribal_Background:
.byte 88,135,19,134,1,148,148,148,148,147,147,147,147,146,146,146,146,145,145
.byte 145,145
PIDAT_Tribal_Bass:
.byte 143,12,141,12,157,221,221,220,219,218,217,216,215,214,213,212,211,210,209
.byte 208,208,208
PIDAT_Tribal_Hit:
.byte 143,12,78,12,156,90,8,12,70,12,21,84,3,12,2,12,17
PIDAT_Horn:
.byte 148,216
PIDAT_Puzzle_Effects:
.byte 138,19,152,134,19,148,132,12,83
PIDAT_Puzzle_Mellow_Crazy:
.byte 154,151,147,149,151,214,214,214,213,213,213,212,212,212,211,211,211,210
.byte 210,210,209,209,209
PIDAT_Puzzle_Pulsate:
.byte 90,87,83,85,87,85,83,84,86,83,81,82,84,82,81,81
PIDAT_Puzzle_Fill:
.byte 28,22,20,18,17,16,16,19,18,17,17
PIDAT_Cave_Bass:
.byte 143,12,141,12,221,221,156,154,154,153,153,152,152,151,151,150,150,149,149
.byte 148,148,147,147,146,146,145,145
PIDAT_Cave_Lead:
.byte 141,251,25,24,23,22,21,21,22,23,22,21,20,19,18,17
PIDAT_Boss_Bass = PEDAT_autotriangle1 + 14
PIDAT_Boss_Arp_Hit:
.byte 156,154,88,87,22,21,21,21,20,20,20,19,19,19,18,18,18,17,17,17
PIDAT_Pizzicato_Strings:
.byte 137,12,86,84,82,80,81,83,82,81,81,81
PIDAT_Cave_Triangle:
.byte 143,12,159,159,159
PIDAT_Select_Lead_1:
.byte 2,12,3,12,5,12,71,12,72,12
PIDAT_Select_Lead_2:
.byte 137,19,150,132,19,147,130,19,145,130,19,147,133,19,148,131,19,146,130,19
.byte 145,129,12,81
PIDAT_Select_Orc_Hit:
.byte 143,24,76,12,26,89,152,200,24,135,12,87,22,86,134,24,197,12,149,85,20,132
.byte 24,195,12,147,83,18,130,24,193,12,145
PIDAT_Boss2Echo:
.byte 159,154,86,147,150
PIDAT_Boss_2_Lead:
.byte 79,12,77,1,91,88,68,12,17,19,23,6,12,21,84,84,67,12,83,83,18,2,12,18,18
.byte 17,209,209,209,209
PIDAT_Banjo:
.byte 92,25,25,24,23,22,21,20,19,18,17
PIDAT_Minor_Boss_Rhythm_Guitar:
.byte 159,77,12,155,218,152,151,150,85,82,82,17
PIDAT_Miniboss_Flute:
.byte 5,24,6,12,151,151,152,152,151,151,150,150,149,149,148,148,147,147,146,146
.byte 145,145
PIDAT_Harp:
.byte 157,154,218,217,216,216,215,215,214,214,213,213,212,212,211,211,210,210
.byte 209,209
PIDAT_Triangle_Choir:
.byte 159,159,143,4,143,4,143,7,143,7,143,12
PIDAT_Triangle_Short = PIDAT_Cave_Triangle + 2
PIDAT_Super_Major_Arp:
.byte 150,134,12,134,24,70,4,70,16,70,28,6,7
pently_drums:  ; 22 entries, 44 bytes
drumdef DR_autodrum0, PE_autonoise5, PE_autotriangle1
drumdef DR_autodrum1, PE_autonoise6
drumdef DR_autodrum2, PE_autonoise7, PE_autotriangle2
drumdef DR_autodrum3, PE_autonoise7, PE_autotriangle3
drumdef DR_autodrum4, PE_autonoise5, PE_autotriangle4
drumdef DR_autodrum5, PE_autonoisec, PE_autotriangleb
drumdef DR_autodrum6, PE_autonoise11, PE_autotriangle10
drumdef DR_autodrum7, PE_autonoise13
drumdef DR_autodrum8, PE_autonoise7, PE_autotriangle37
drumdef DR_autodrum9, PE_autonoise16, PE_autotriangle15
drumdef DR_autodrum10, PE_autonoise14
drumdef DR_autodrum11, PE_autonoise1d
drumdef DR_autodrum12, PE_autonoise1e
drumdef DR_autodrum13, PE_autonoise1f
drumdef DR_autodrum14, PE_autonoise36
drumdef DR_autodrum15, PE_autonoise25
drumdef DR_autodrum16, PE_autonoise24
drumdef DR_autodrum17, PE_autonoise19, PE_autotriangle10
drumdef DR_autodrum19, PE_autonoise2c, PE_autotriangle15
drumdef DR_autodrum20, PE_autonoise2d
drumdef DR_autodrum21, PE_autonoise2b, PE_autotriangle10
drumdef DR_autodrum22, PE_autonoise19
pently_patterns:  ; 229 entries, 11248 bytes
patdef PP_World_1A_pat_2_0_0, PPDAT_World_1A_pat_2_0_0
patdef PP_World_1A_pat_2_0_1, PPDAT_World_1A_pat_2_0_1
patdef PP_World_1A_pat_2_0_4, PPDAT_World_1A_pat_2_0_4
patdef PP_World_1A_pat_2_0_5, PPDAT_World_1A_pat_2_0_5
patdef PP_World_1A_pat_2_0_6, PPDAT_World_1A_pat_2_0_6
patdef PP_World_1A_pat_2_0_7, PPDAT_World_1A_pat_2_0_7
patdef PP_World_1A_pat_2_1_0, PPDAT_World_1A_pat_2_1_0
patdef PP_World_1A_pat_2_1_1, PPDAT_World_1A_pat_2_1_1
patdef PP_World_1A_pat_2_1_2, PPDAT_World_1A_pat_2_1_2
patdef PP_World_1A_pat_2_1_3, PPDAT_World_1A_pat_2_1_3
patdef PP_World_1A_pat_2_1_4, PPDAT_World_1A_pat_2_1_4
patdef PP_World_1A_pat_2_1_7, PPDAT_World_1A_pat_2_1_7
patdef PP_World_1A_pat_2_1_8, PPDAT_World_1A_pat_2_1_8
patdef PP_World_1A_pat_2_1_9, PPDAT_World_1A_pat_2_1_9
patdef PP_World_1A_pat_2_3_0, PPDAT_World_1A_pat_2_3_0
patdef PP_World_1A_pat_2_3_1, PPDAT_World_1A_pat_2_3_1
patdef PP_World_1A_pat_2_3_2, PPDAT_World_1A_pat_2_3_2
patdef PP_World_1A_pat_2_3_3, PPDAT_World_1A_pat_2_3_3
patdef PP_World_1A_pat_2_3_4, PPDAT_World_1A_pat_2_3_4
patdef PP_World_1B_pat_3_0_0, PPDAT_World_1B_pat_3_0_0
patdef PP_World_1B_pat_3_0_1, PPDAT_World_1B_pat_3_0_1
patdef PP_World_1B_pat_3_0_2, PPDAT_World_1B_pat_3_0_2
patdef PP_World_1B_pat_3_0_3, PPDAT_World_1B_pat_3_0_3
patdef PP_World_1B_pat_3_0_4, PPDAT_World_1B_pat_3_0_4
patdef PP_World_1B_pat_3_0_5, PPDAT_World_1B_pat_3_0_5
patdef PP_World_1B_pat_3_0_6, PPDAT_World_1B_pat_3_0_6
patdef PP_World_1B_pat_3_1_0, PPDAT_World_1B_pat_3_1_0
patdef PP_World_1B_pat_3_1_1, PPDAT_World_1B_pat_3_1_1
patdef PP_World_1B_pat_3_1_2, PPDAT_World_1B_pat_3_1_2
patdef PP_World_1B_pat_3_1_4, PPDAT_World_1B_pat_3_1_4
patdef PP_World_1B_pat_3_1_5, PPDAT_World_1B_pat_3_1_5
patdef PP_World_1B_pat_3_1_6, PPDAT_World_1B_pat_3_1_6
patdef PP_World_1B_pat_3_2_0, PPDAT_World_1B_pat_3_2_0
patdef PP_World_1B_pat_3_2_1, PPDAT_World_1B_pat_3_2_1
patdef PP_World_1B_pat_3_2_2, PPDAT_World_1B_pat_3_2_2
patdef PP_World_1B_pat_3_2_3, PPDAT_World_1B_pat_3_2_3
patdef PP_World_1B_pat_3_2_4, PPDAT_World_1B_pat_3_2_4
patdef PP_World_1B_pat_3_2_5, PPDAT_World_1B_pat_3_2_5
patdef PP_World_1B_pat_3_2_6, PPDAT_World_1B_pat_3_2_6
patdef PP_World_1B_pat_3_2_7, PPDAT_World_1B_pat_3_2_7
patdef PP_World_1B_pat_3_3_0, PPDAT_World_1B_pat_3_3_0
patdef PP_World_1B_pat_3_3_1, PPDAT_World_1B_pat_3_3_1
patdef PP_World_1B_pat_3_3_2, PPDAT_World_1B_pat_3_3_2
patdef PP_World_1B_pat_3_3_5, PPDAT_World_1B_pat_3_3_5
patdef PP_World_3_pat_4_0_0, PPDAT_World_3_pat_4_0_0
patdef PP_World_3_pat_4_0_1, PPDAT_World_3_pat_4_0_1
patdef PP_World_3_pat_4_0_2, PPDAT_World_3_pat_4_0_2
patdef PP_World_3_pat_4_0_3, PPDAT_World_3_pat_4_0_3
patdef PP_World_3_pat_4_0_4, PPDAT_World_3_pat_4_0_4
patdef PP_World_3_pat_4_1_1, PPDAT_World_3_pat_4_1_1
patdef PP_World_3_pat_4_1_2, PPDAT_World_3_pat_4_1_2
patdef PP_World_3_pat_4_1_3, PPDAT_World_3_pat_4_1_3
patdef PP_World_3_pat_4_1_4, PPDAT_World_3_pat_4_1_4
patdef PP_World_3_pat_4_1_5, PPDAT_World_3_pat_4_1_5
patdef PP_World_3_pat_4_1_6, PPDAT_World_3_pat_4_1_6
patdef PP_World_3_pat_4_2_1, PPDAT_World_3_pat_4_2_1
patdef PP_World_3_pat_4_2_2, PPDAT_World_3_pat_4_2_2
patdef PP_World_3_pat_4_2_3, PPDAT_World_3_pat_4_2_3
patdef PP_World_3_pat_4_2_4, PPDAT_World_3_pat_4_2_4
patdef PP_World_3_pat_4_2_5, PPDAT_World_3_pat_4_2_5
patdef PP_World_3_pat_4_2_6, PPDAT_World_3_pat_4_2_6
patdef PP_World_3_pat_4_3_0, PPDAT_World_3_pat_4_3_0
patdef PP_World_3_pat_4_3_3, PPDAT_World_3_pat_4_3_3
patdef PP_World_3_pat_4_3_5, PPDAT_World_3_pat_4_3_5
patdef PP_World_3_pat_4_3_6, PPDAT_World_3_pat_4_3_6
patdef PP_World_2_pat_5_0_1, PPDAT_World_2_pat_5_0_1
patdef PP_World_2_pat_5_0_2, PPDAT_World_2_pat_5_0_2
patdef PP_World_2_pat_5_0_4, PPDAT_World_2_pat_5_0_4
patdef PP_World_2_pat_5_0_6, PPDAT_World_2_pat_5_0_6
patdef PP_World_2_pat_5_0_7, PPDAT_World_2_pat_5_0_7
patdef PP_World_2_pat_5_1_0, PPDAT_World_2_pat_5_1_0
patdef PP_World_2_pat_5_1_3, PPDAT_World_2_pat_5_1_3
patdef PP_World_2_pat_5_1_5, PPDAT_World_2_pat_5_1_5
patdef PP_World_2_pat_5_1_6, PPDAT_World_2_pat_5_1_6
patdef PP_World_2_pat_5_1_7, PPDAT_World_2_pat_5_1_7
patdef PP_World_2_pat_5_1_8, PPDAT_World_2_pat_5_1_8
patdef PP_World_2_pat_5_1_9, PPDAT_World_2_pat_5_1_9
patdef PP_World_2_pat_5_1_10, PPDAT_World_2_pat_5_1_10
patdef PP_World_2_pat_5_2_0, PPDAT_World_2_pat_5_2_0
patdef PP_World_2_pat_5_2_1, PPDAT_World_2_pat_5_2_1
patdef PP_World_2_pat_5_2_3, PPDAT_World_2_pat_5_2_3
patdef PP_World_2_pat_5_2_4, PPDAT_World_2_pat_5_2_4
patdef PP_World_2_pat_5_2_6, PPDAT_World_2_pat_5_2_6
patdef PP_World_2_pat_5_2_7, PPDAT_World_2_pat_5_2_7
patdef PP_World_2_pat_5_2_8, PPDAT_World_2_pat_5_2_8
patdef PP_World_2_pat_5_3_0, PPDAT_World_2_pat_5_3_0
patdef PP_World_2_pat_5_3_1, PPDAT_World_2_pat_5_3_1
patdef PP_World_2_pat_5_3_2, PPDAT_World_2_pat_5_3_2
patdef PP_World_2_pat_5_3_3, PPDAT_World_2_pat_5_3_3
patdef PP_World_2_pat_5_3_4, PPDAT_World_2_pat_5_3_4
patdef PP_World_2_pat_5_3_6, PPDAT_World_2_pat_5_3_6
patdef PP_World_5_pat_6_0_0, PPDAT_World_5_pat_6_0_0
patdef PP_World_5_pat_6_0_1, PPDAT_World_5_pat_6_0_1
patdef PP_World_5_pat_6_0_2, PPDAT_World_5_pat_6_0_2
patdef PP_World_5_pat_6_0_3, PPDAT_World_5_pat_6_0_3
patdef PP_World_5_pat_6_0_10, PPDAT_World_5_pat_6_0_10
patdef PP_World_5_pat_6_0_11, PPDAT_World_5_pat_6_0_11
patdef PP_World_5_pat_6_0_12, PPDAT_World_5_pat_6_0_12
patdef PP_World_5_pat_6_0_13, PPDAT_World_5_pat_6_0_13
patdef PP_World_5_pat_6_0_14, PPDAT_World_5_pat_6_0_14
patdef PP_World_5_pat_6_0_15, PPDAT_World_5_pat_6_0_15
patdef PP_World_5_pat_6_0_16, PPDAT_World_5_pat_6_0_16
patdef PP_World_5_pat_6_1_0, PPDAT_World_5_pat_6_1_0
patdef PP_World_5_pat_6_1_1, PPDAT_World_5_pat_6_1_1
patdef PP_World_5_pat_6_1_2, PPDAT_World_5_pat_6_1_2
patdef PP_World_5_pat_6_1_3, PPDAT_World_5_pat_6_1_3
patdef PP_World_5_pat_6_1_10, PPDAT_World_5_pat_6_1_10
patdef PP_World_5_pat_6_1_11, PPDAT_World_5_pat_6_1_11
patdef PP_World_5_pat_6_1_12, PPDAT_World_5_pat_6_1_12
patdef PP_World_5_pat_6_1_13, PPDAT_World_5_pat_6_1_13
patdef PP_World_5_pat_6_1_14, PPDAT_World_5_pat_6_1_14
patdef PP_World_5_pat_6_1_15, PPDAT_World_5_pat_6_1_15
patdef PP_World_5_pat_6_1_16, PPDAT_World_5_pat_6_1_16
patdef PP_World_5_pat_6_1_17, PPDAT_World_5_pat_6_1_17
patdef PP_World_5_pat_6_2_1, PPDAT_World_5_pat_6_2_1
patdef PP_World_5_pat_6_2_2, PPDAT_World_5_pat_6_2_2
patdef PP_World_5_pat_6_2_3, PPDAT_World_5_pat_6_2_3
patdef PP_World_5_pat_6_2_4, PPDAT_World_5_pat_6_2_4
patdef PP_World_5_pat_6_2_5, PPDAT_World_5_pat_6_2_5
patdef PP_World_5_pat_6_2_7, PPDAT_World_5_pat_6_2_7
patdef PP_World_5_pat_6_2_8, PPDAT_World_5_pat_6_2_8
patdef PP_World_5_pat_6_2_9, PPDAT_World_5_pat_6_2_9
patdef PP_World_5_pat_6_2_12, PPDAT_World_5_pat_6_2_12
patdef PP_World_5_pat_6_2_13, PPDAT_World_5_pat_6_2_13
patdef PP_World_5_pat_6_2_14, PPDAT_World_5_pat_6_2_14
patdef PP_World_5_pat_6_2_15, PPDAT_World_5_pat_6_2_15
patdef PP_World_5_pat_6_2_16, PPDAT_World_5_pat_6_2_16
patdef PP_World_5_pat_6_3_1, PPDAT_World_5_pat_6_3_1
patdef PP_World_5_pat_6_3_5, PPDAT_World_5_pat_6_3_5
patdef PP_World_5_pat_6_3_9, PPDAT_World_5_pat_6_3_9
patdef PP_World_5_pat_6_3_11, PPDAT_World_5_pat_6_3_11
patdef PP_World_5_pat_6_3_15, PPDAT_World_5_pat_6_3_15
patdef PP_Minor_Boss_pat_7_0_0, PPDAT_Minor_Boss_pat_7_0_0
patdef PP_Minor_Boss_pat_7_0_1, PPDAT_Minor_Boss_pat_7_0_1
patdef PP_Minor_Boss_pat_7_0_2, PPDAT_Minor_Boss_pat_7_0_2
patdef PP_Minor_Boss_pat_7_0_3, PPDAT_Minor_Boss_pat_7_0_3
patdef PP_Minor_Boss_pat_7_0_4, PPDAT_Minor_Boss_pat_7_0_4
patdef PP_Minor_Boss_pat_7_0_5, PPDAT_Minor_Boss_pat_7_0_5
patdef PP_Minor_Boss_pat_7_0_6, PPDAT_Minor_Boss_pat_7_0_6
patdef PP_Minor_Boss_pat_7_0_7, PPDAT_Minor_Boss_pat_7_0_7
patdef PP_Minor_Boss_pat_7_0_8, PPDAT_Minor_Boss_pat_7_0_8
patdef PP_Minor_Boss_pat_7_0_9, PPDAT_Minor_Boss_pat_7_0_9
patdef PP_Minor_Boss_pat_7_0_10, PPDAT_Minor_Boss_pat_7_0_10
patdef PP_Minor_Boss_pat_7_1_0, PPDAT_Minor_Boss_pat_7_1_0
patdef PP_Minor_Boss_pat_7_1_1, PPDAT_Minor_Boss_pat_7_1_1
patdef PP_Minor_Boss_pat_7_1_2, PPDAT_Minor_Boss_pat_7_1_2
patdef PP_Minor_Boss_pat_7_1_3, PPDAT_Minor_Boss_pat_7_1_3
patdef PP_Minor_Boss_pat_7_1_6, PPDAT_Minor_Boss_pat_7_1_6
patdef PP_Minor_Boss_pat_7_1_7, PPDAT_Minor_Boss_pat_7_1_7
patdef PP_Minor_Boss_pat_7_1_9, PPDAT_Minor_Boss_pat_7_1_9
patdef PP_Minor_Boss_pat_7_1_10, PPDAT_Minor_Boss_pat_7_1_10
patdef PP_Minor_Boss_pat_7_2_0, PPDAT_Minor_Boss_pat_7_2_0
patdef PP_Minor_Boss_pat_7_2_1, PPDAT_Minor_Boss_pat_7_2_1
patdef PP_Minor_Boss_pat_7_2_2, PPDAT_Minor_Boss_pat_7_2_2
patdef PP_Minor_Boss_pat_7_2_3, PPDAT_Minor_Boss_pat_7_2_3
patdef PP_Minor_Boss_pat_7_2_6, PPDAT_Minor_Boss_pat_7_2_6
patdef PP_Minor_Boss_pat_7_2_7, PPDAT_Minor_Boss_pat_7_2_7
patdef PP_Minor_Boss_pat_7_2_9, PPDAT_Minor_Boss_pat_7_2_9
patdef PP_Minor_Boss_pat_7_2_10, PPDAT_Minor_Boss_pat_7_2_10
patdef PP_Minor_Boss_pat_7_3_0, PPDAT_Minor_Boss_pat_7_3_0
patdef PP_Minor_Boss_pat_7_3_1, PPDAT_Minor_Boss_pat_7_3_1
patdef PP_Minor_Boss_pat_7_3_2, PPDAT_Minor_Boss_pat_7_3_2
patdef PP_Minor_Boss_pat_7_3_4, PPDAT_Minor_Boss_pat_7_3_4
patdef PP_Minor_Boss_pat_7_3_6, PPDAT_Minor_Boss_pat_7_3_6
patdef PP_Minor_Boss_pat_7_3_7, PPDAT_Minor_Boss_pat_7_3_7
patdef PP_Minor_Boss_pat_7_3_10, PPDAT_Minor_Boss_pat_7_3_10
patdef PP_Major_Boss_pat_8_0_0, PPDAT_Major_Boss_pat_8_0_0
patdef PP_Major_Boss_pat_8_0_1, PPDAT_Major_Boss_pat_8_0_1
patdef PP_Major_Boss_pat_8_0_2, PPDAT_Major_Boss_pat_8_0_2
patdef PP_Major_Boss_pat_8_0_3, PPDAT_Major_Boss_pat_8_0_3
patdef PP_Major_Boss_pat_8_0_4, PPDAT_Major_Boss_pat_8_0_4
patdef PP_Major_Boss_pat_8_0_5, PPDAT_Major_Boss_pat_8_0_5
patdef PP_Major_Boss_pat_8_0_6, PPDAT_Major_Boss_pat_8_0_6
patdef PP_Major_Boss_pat_8_0_7, PPDAT_Major_Boss_pat_8_0_7
patdef PP_Major_Boss_pat_8_0_8, PPDAT_Major_Boss_pat_8_0_8
patdef PP_Major_Boss_pat_8_1_0, PPDAT_Major_Boss_pat_8_1_0
patdef PP_Major_Boss_pat_8_1_2, PPDAT_Major_Boss_pat_8_1_2
patdef PP_Major_Boss_pat_8_1_4, PPDAT_Major_Boss_pat_8_1_4
patdef PP_Major_Boss_pat_8_1_5, PPDAT_Major_Boss_pat_8_1_5
patdef PP_Major_Boss_pat_8_1_6, PPDAT_Major_Boss_pat_8_1_6
patdef PP_Major_Boss_pat_8_1_7, PPDAT_Major_Boss_pat_8_1_7
patdef PP_Major_Boss_pat_8_1_8, PPDAT_Major_Boss_pat_8_1_8
patdef PP_Major_Boss_pat_8_2_0, PPDAT_Major_Boss_pat_8_2_0
patdef PP_Major_Boss_pat_8_2_1, PPDAT_Major_Boss_pat_8_2_1
patdef PP_Major_Boss_pat_8_2_3, PPDAT_Major_Boss_pat_8_2_3
patdef PP_Major_Boss_pat_8_2_5, PPDAT_Major_Boss_pat_8_2_5
patdef PP_Major_Boss_pat_8_2_7, PPDAT_Major_Boss_pat_8_2_7
patdef PP_Major_Boss_pat_8_3_0, PPDAT_Major_Boss_pat_8_3_0
patdef PP_Major_Boss_pat_8_3_1, PPDAT_Major_Boss_pat_8_3_1
patdef PP_Major_Boss_pat_8_3_2, PPDAT_Major_Boss_pat_8_3_2
patdef PP_Major_Boss_pat_8_3_5, PPDAT_Major_Boss_pat_8_3_5
patdef PP_Major_Boss_pat_8_3_6, PPDAT_Major_Boss_pat_8_3_6
patdef PP_Final_Boss_pat_9_0_0, PPDAT_Final_Boss_pat_9_0_0
patdef PP_Final_Boss_pat_9_0_1, PPDAT_Final_Boss_pat_9_0_1
patdef PP_Final_Boss_pat_9_0_2, PPDAT_Final_Boss_pat_9_0_2
patdef PP_Final_Boss_pat_9_0_3, PPDAT_Final_Boss_pat_9_0_3
patdef PP_Final_Boss_pat_9_1_0, PPDAT_Final_Boss_pat_9_1_0
patdef PP_Final_Boss_pat_9_1_1, PPDAT_Final_Boss_pat_9_1_1
patdef PP_Final_Boss_pat_9_1_2, PPDAT_Final_Boss_pat_9_1_2
patdef PP_Final_Boss_pat_9_1_3, PPDAT_Final_Boss_pat_9_1_3
patdef PP_Final_Boss_pat_9_2_0, PPDAT_Final_Boss_pat_9_2_0
patdef PP_Final_Boss_pat_9_2_1, PPDAT_Final_Boss_pat_9_2_1
patdef PP_Final_Boss_pat_9_2_2, PPDAT_Final_Boss_pat_9_2_2
patdef PP_Final_Boss_pat_9_2_3, PPDAT_Final_Boss_pat_9_2_3
patdef PP_Final_Boss_pat_9_2_4, PPDAT_Final_Boss_pat_9_2_4
patdef PP_Final_Boss_pat_9_3_0, PPDAT_Final_Boss_pat_9_3_0
patdef PP_Final_Boss_pat_9_3_1, PPDAT_Final_Boss_pat_9_3_1
patdef PP_Final_Boss_pat_9_3_2, PPDAT_Final_Boss_pat_9_3_2
patdef PP_Final_Boss_pat_9_3_3, PPDAT_Final_Boss_pat_9_3_3
patdef PP_World_Select_1_pat_10_0_0, PPDAT_World_Select_1_pat_10_0_0
patdef PP_World_Select_1_pat_10_1_0, PPDAT_World_Select_1_pat_10_1_0
patdef PP_World_Select_1_pat_10_2_0, PPDAT_World_Select_1_pat_10_2_0
patdef PP_World_Select_1_pat_10_3_0, PPDAT_World_Select_1_pat_10_3_0
patdef PP_World_Select_2_pat_11_0_0, PPDAT_World_Select_2_pat_11_0_0
patdef PP_World_Select_2_pat_11_1_0, PPDAT_World_Select_2_pat_11_1_0
patdef PP_World_Select_2_pat_11_2_0, PPDAT_World_Select_2_pat_11_2_0
patdef PP_World_Select_2_pat_11_3_0, PPDAT_World_Select_2_pat_11_3_0
patdef PP_World_Select_3_pat_12_0_0, PPDAT_World_Select_3_pat_12_0_0
patdef PP_World_Select_3_pat_12_1_0, PPDAT_World_Select_3_pat_12_1_0
patdef PP_World_Select_3_pat_12_2_0, PPDAT_World_Select_3_pat_12_2_0
patdef PP_World_Select_3_pat_12_3_0, PPDAT_World_Select_3_pat_12_3_0
patdef PP_World_Select_4_pat_13_0_0, PPDAT_World_Select_4_pat_13_0_0
patdef PP_World_Select_4_pat_13_1_0, PPDAT_World_Select_4_pat_13_1_0
patdef PP_World_Select_4_pat_13_2_0, PPDAT_World_Select_4_pat_13_2_0
patdef PP_World_Select_4_pat_13_3_0, PPDAT_World_Select_4_pat_13_3_0
patdef PP_World_Select_5_pat_13_0_0, PPDAT_World_Select_5_pat_13_0_0
patdef PP_World_Select_5_pat_13_1_0, PPDAT_World_Select_5_pat_13_1_0
patdef PP_World_Select_5_pat_13_2_0, PPDAT_World_Select_5_pat_13_2_0
patdef PP_World_Select_5_pat_13_3_0, PPDAT_World_Select_5_pat_13_3_0
PPDAT_World_1A_pat_2_0_0:
.byte N_DS|D_8,N_AS|D_8,N_DSH|D_8,N_DS,N_AS|D_8,N_DSH|D_8,N_DS,N_AS|D_8
.byte N_DSH|D_8,N_C|D_8,N_GS|D_8,N_CH|D_8,N_C,N_GS|D_8,N_CH|D_8,N_C,N_GS|D_8
.byte N_F|D_8,N_DS|D_8,N_AS|D_8,N_DSH|D_8,N_DS,N_AS|D_8,N_DSH|D_8,N_DS,N_AS|D_8
.byte N_DSH|D_8,N_F|D_8,N_AS|D_8,N_FH|D_8,N_F,N_AS|D_8,N_FH|D_8,N_F,N_FH|D_8
.byte N_DSH|D_8,PATEND
PPDAT_World_1A_pat_2_0_1:
.byte N_C|D_8,N_G|D_8,N_CH|D_D8,N_C,N_G|D_8,N_CH,N_C,N_G|D_8,N_E|D_8,N_D|D_8
.byte N_G|D_8,N_DH|D_D8,N_G,N_DH|D_8,N_G,N_D,N_DH|D_8,N_G|D_8,N_C|D_8,N_G|D_8
.byte N_CH|D_8,N_C,N_G|D_8,N_CH|D_8,N_C,N_G|D_8,N_CH|D_8,N_E|D_8,N_A|D_8
.byte N_CH|D_8,N_A,N_E|D_8,N_A|D_8,N_E,N_G|D_8,N_A|D_8,PATEND
PPDAT_World_1A_pat_2_0_4:
.byte CHVOLUME,1,VIBRATO,3,N_C|D_4,CHVOLUME,2,N_TIE|D_4,CHVOLUME,3,N_TIE|D_4
.byte CHVOLUME,4,N_TIE|D_4,CHVOLUME,1,N_D|D_4,CHVOLUME,2,N_TIE|D_4,CHVOLUME,3
.byte N_TIE|D_4,CHVOLUME,4,N_TIE|D_4,N_F|D_2,CHVOLUME,3,N_TIE|D_4,CHVOLUME,2
.byte N_TIE|D_4,CHVOLUME,1,N_E|D_4,CHVOLUME,2,N_TIE|D_4,CHVOLUME,3,N_D|D_4
.byte CHVOLUME,4,N_TIE|D_4,PATEND
PPDAT_World_1A_pat_2_0_5:
.byte CHVOLUME,1,VIBRATO,3,N_C|D_4,CHVOLUME,2,N_TIE|D_4,CHVOLUME,3,N_TIE|D_4
.byte CHVOLUME,4,N_TIE|D_4,CHVOLUME,1,N_D|D_4,CHVOLUME,2,N_TIE|D_4,CHVOLUME,3
.byte N_TIE|D_4,CHVOLUME,4,N_TIE|D_4,N_F|D_2,CHVOLUME,3,N_TIE|D_4,CHVOLUME,2
.byte N_TIE|D_4,CHVOLUME,1,N_G|D_4,CHVOLUME,2,N_TIE|D_4,CHVOLUME,3,N_A|D_4
.byte CHVOLUME,2,N_G|D_4,PATEND
PPDAT_World_1A_pat_2_0_6:
.byte CHVOLUME,1,VIBRATO,3,N_C|D_4,CHVOLUME,2,N_TIE|D_4,CHVOLUME,3,N_TIE|D_4
.byte CHVOLUME,4,N_TIE|D_4,CHVOLUME,1,N_D|D_4,CHVOLUME,2,N_TIE|D_4,CHVOLUME,3
.byte N_TIE|D_4,CHVOLUME,4,N_TIE|D_4,N_F|D_2,CHVOLUME,3,N_TIE|D_8,N_G|D_8
.byte CHVOLUME,2,N_TIE|D_8,N_F|D_8,CHVOLUME,1,N_G|D_4,CHVOLUME,2,N_A|D_4
.byte CHVOLUME,3,N_CH|D_4,CHVOLUME,2,N_B|D_4,PATEND
PPDAT_World_1A_pat_2_0_7:
.byte CHVOLUME,4,VIBRATO,0,N_DSH|D_8,INSTRUMENT,PI_Tribal_Background,N_AS|D_8
.byte N_DSH|D_8,N_DS,N_AS|D_8,N_DSH|D_8,N_DS,N_AS|D_8,N_DSH|D_8,N_C|D_8
.byte N_GS|D_8,N_CH|D_8,N_C,N_GS|D_8,N_CH|D_8,N_C,N_GS|D_8,N_F|D_8,N_DS|D_8
.byte N_AS|D_8,N_DSH|D_8,N_DS,N_AS|D_8,N_DSH|D_8,N_DS,N_AS|D_8,N_DSH|D_8
.byte N_F|D_8,N_AS|D_8,N_FH|D_8,N_F,N_AS|D_8,N_FH|D_8,N_F,N_FH|D_8,N_DSH|D_8
.byte PATEND
PPDAT_World_1A_pat_2_1_0:
.byte N_F|D_2,N_TIE|D_8,N_F|D_4,N_D|D_8,N_F|D_D2,N_D|D_8,N_D|D_8,N_F|D_2
.byte N_TIE|D_8,N_F|D_4,N_D|D_8,N_F|D_D2,N_C|D_8,N_D|D_8,PATEND
PPDAT_World_1A_pat_2_1_1:
.byte N_C|D_D8,INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<31,N_F|D_D8,N_C|D_4
.byte INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-34,N_DS|D_4,N_C|D_8,N_DS|D_D8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<31,N_DS|D_D8,N_DS|D_4,N_C|D_8
.byte INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-33,N_C|D_8,N_D|D_8,N_F|D_D8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<33,N_GS|D_D8,N_DS|D_4,N_DS|D_8
.byte N_C|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-28,N_C|D_8,N_D|D_4
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<24,N_D|D_D8,N_D|D_D8,N_D|D_8,N_C|D_8
.byte INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-25,N_C|D_8,TRANSPOSE,<1,PATEND
PPDAT_World_1A_pat_2_1_2:
.byte N_C|D_D8,INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<24,N_CH|D_D8,N_G|D_8,N_D|D_8
.byte N_E|D_8,N_D|D_8,N_C|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-22,N_C|D_D8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<34,N_D|D_D8,N_C|D_8,N_D|D_8,N_C|D_8
.byte N_D|D_8,N_E|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-36,N_C|D_D8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<24,N_CH|D_D8,N_G|D_8,N_D|D_8,N_E|D_8
.byte N_D|D_8,N_C|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-20,N_C|D_D8
.byte INSTRUMENT,PI_Tribal_Hit,N_CHH|D_D8,N_ASH|D_8,TRANSPOSE,<20,N_F|D_8
.byte N_E|D_8,N_D|D_8,N_C|D_8,TRANSPOSE,<-24,PATEND
PPDAT_World_1A_pat_2_1_3:
.byte N_C|D_D8,INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<24,N_CH|D_D8,N_G|D_8,N_D|D_8
.byte N_E|D_8,N_D|D_8,N_C|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-22,N_C|D_D8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<34,N_D|D_D8,N_C|D_8,N_D|D_8,N_C|D_8
.byte N_F|D_8,N_G|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-36,N_C|D_D8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<40,N_DS|D_D8,N_CS|D_8,N_DS|D_8
.byte N_CS|D_8,N_F|D_8,N_C|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-36
.byte N_C|D_D8,INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<37,N_E|D_D8,N_C|D_8,N_E|D_8
.byte N_C|D_8,N_E|D_8,N_G|D_8,TRANSPOSE,<-41,PATEND
PPDAT_World_1A_pat_2_1_4:
.byte N_DS|D_D8,N_C,N_D|D_8,N_DS|D_4,N_C|D_8,N_G|D_8,N_DS|D_8,N_F|D_D8,N_F
.byte N_DS|D_8,N_F|D_8,N_F|D_4,N_G|D_4,N_GS|D_D8,N_GS|D_D8,N_GS|D_4,N_GS|D_8
.byte N_GSH|D_8,N_GS|D_8,N_G|D_8,N_G|D_8,N_GH|D_8,N_G|D_8,N_F|D_8,N_D|D_8
.byte N_FH|D_8,N_F|D_8,PATEND
PPDAT_World_1A_pat_2_1_7:
.byte N_C|D_8,INSTRUMENT,PI_Tribal_Hit,N_CHH,INSTRUMENT,PI_Tribal_Bass
.byte TRANSPOSE,<-3,N_C,N_D|D_8,N_DS|D_8,INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<27
.byte N_C|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-27,N_C|D_8,N_G|D_8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<5,N_ASH|D_8,INSTRUMENT,PI_Tribal_Bass
.byte N_C|D_8,INSTRUMENT,PI_Tribal_Hit,N_CHH,INSTRUMENT,PI_Tribal_Bass,N_C
.byte TRANSPOSE,<-2,N_C|D_8,N_D|D_8,INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<2,N_CHH
.byte INSTRUMENT,PI_Tribal_Bass,N_C|D_D8,N_D|D_8,INSTRUMENT,PI_Tribal_Hit
.byte TRANSPOSE,<3,N_CHH|D_8,INSTRUMENT,PI_Tribal_Bass,N_C|D_8
.byte INSTRUMENT,PI_Tribal_Hit,N_BH,INSTRUMENT,PI_Tribal_Bass,N_C|D_D8,N_C|D_8
.byte INSTRUMENT,PI_Tribal_Hit,N_BH|D_8,INSTRUMENT,PI_Tribal_Bass,N_C|D_8
.byte N_CH|D_8,INSTRUMENT,PI_Tribal_Hit,N_BH|D_8,INSTRUMENT,PI_Tribal_Bass
.byte TRANSPOSE,<-1,N_C|D_8,INSTRUMENT,PI_Tribal_Hit,N_CHH|D_8
.byte INSTRUMENT,PI_Tribal_Bass,N_CH|D_8,INSTRUMENT,PI_Tribal_Hit,N_CHH|D_8
.byte INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-2,N_C|D_8,INSTRUMENT,PI_Tribal_Hit
.byte N_ASH|D_8,N_CHH|D_8,INSTRUMENT,PI_Tribal_Bass,N_C|D_8,TRANSPOSE,<-2
.byte PATEND
PPDAT_World_1A_pat_2_1_8:
.byte N_C|D_8,INSTRUMENT,PI_Tribal_Hit,N_CHH,INSTRUMENT,PI_Tribal_Bass
.byte TRANSPOSE,<-3,N_C,N_D|D_8,N_DS|D_8,INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<27
.byte N_C|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-27,N_C|D_8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<27,N_E|D_8,N_C|D_8
.byte INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-22,N_C|D_8,INSTRUMENT,PI_Tribal_Hit
.byte N_CHH,INSTRUMENT,PI_Tribal_Bass,N_C,TRANSPOSE,<-2,N_C|D_8,N_D|D_8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<2,N_CHH,INSTRUMENT,PI_Tribal_Bass
.byte N_C|D_8,INSTRUMENT,PI_Tribal_Hit,N_CHH,INSTRUMENT,PI_Tribal_Bass,N_D|D_8
.byte INSTRUMENT,PI_Tribal_Hit,N_CHH|D_8,INSTRUMENT,PI_Tribal_Bass,N_DS|D_8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<3,N_CHH,INSTRUMENT,PI_Tribal_Bass
.byte N_C|D_D8,N_C|D_8,INSTRUMENT,PI_Tribal_Hit,N_CHH|D_8
.byte INSTRUMENT,PI_Tribal_Bass,N_C|D_8,INSTRUMENT,PI_Tribal_Hit,N_CHH|D_8
.byte N_BH|D_8,INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-1,N_C|D_8
.byte INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<3,N_CHH|D_8,INSTRUMENT,PI_Tribal_Bass
.byte N_A|D_8,INSTRUMENT,PI_Tribal_Hit,N_CHH|D_8,INSTRUMENT,PI_Tribal_Bass
.byte N_C|D_8,INSTRUMENT,PI_Tribal_Hit,TRANSPOSE,<29,N_C|D_8
.byte INSTRUMENT,PI_Tribal_Bass,TRANSPOSE,<-31,N_C|D_8,INSTRUMENT,PI_Tribal_Hit
.byte TRANSPOSE,<30,N_C|D_8,TRANSPOSE,<-35,PATEND
PPDAT_World_1A_pat_2_1_9:
.byte CHVOLUME,3,VIBRATO,3,N_C|D_D8,CHVOLUME,2,N_TIE|D_D8,CHVOLUME,1,N_TIE|D_4
.byte INSTRUMENT,PI_Tribal_Bass,CHVOLUME,4,VIBRATO,0,TRANSPOSE,<-41,N_F|D_4
.byte N_D|D_8,N_F|D_D2,N_D|D_8,N_D|D_8,N_F|D_2,N_TIE|D_8,N_F|D_4,N_D|D_8
.byte N_F|D_D2,N_C|D_8,N_D|D_8,TRANSPOSE,<41,PATEND
PPDAT_World_1A_pat_2_3_0:
.byte DR_autodrum0,DR_autodrum1,DR_autodrum2,DR_autodrum2,DR_autodrum0
.byte DR_autodrum1,DR_autodrum2,DR_autodrum1,DR_autodrum0,DR_autodrum3
.byte DR_autodrum2,DR_autodrum2,DR_autodrum0,DR_autodrum2,DR_autodrum1
.byte DR_autodrum2,DR_autodrum0,DR_autodrum1,DR_autodrum2,DR_autodrum2
.byte DR_autodrum0,DR_autodrum1,DR_autodrum2,DR_autodrum1,DR_autodrum0
.byte DR_autodrum3,DR_autodrum2,DR_autodrum2,DR_autodrum4,DR_autodrum4
.byte DR_autodrum0,DR_autodrum2,DR_autodrum0,DR_autodrum1,DR_autodrum2
.byte DR_autodrum2,DR_autodrum0,DR_autodrum1,DR_autodrum2,DR_autodrum1
.byte DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2,DR_autodrum0
.byte DR_autodrum2,DR_autodrum1,DR_autodrum2,DR_autodrum0,DR_autodrum1
.byte DR_autodrum2,DR_autodrum2,DR_autodrum0,DR_autodrum1,DR_autodrum2
.byte DR_autodrum1,DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2
.byte DR_autodrum4,DR_autodrum4,DR_autodrum0,DR_autodrum2,PATEND
PPDAT_World_1A_pat_2_3_1:
.byte DR_autodrum0,DR_autodrum1,DR_autodrum2,DR_autodrum2,DR_autodrum5
.byte DR_autodrum1,DR_autodrum2,DR_autodrum5,DR_autodrum0,DR_autodrum3
.byte DR_autodrum2,DR_autodrum2,DR_autodrum0,DR_autodrum2,DR_autodrum5
.byte DR_autodrum2,DR_autodrum0,DR_autodrum1,DR_autodrum2,DR_autodrum2
.byte DR_autodrum5,DR_autodrum1,DR_autodrum2,DR_autodrum5,DR_autodrum0
.byte DR_autodrum3,DR_autodrum2,DR_autodrum2,DR_autodrum4,DR_autodrum4
.byte DR_autodrum5,DR_autodrum2,DR_autodrum0,DR_autodrum1,DR_autodrum2
.byte DR_autodrum2,DR_autodrum5,DR_autodrum1,DR_autodrum2,DR_autodrum5
.byte DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2,DR_autodrum0
.byte DR_autodrum2,DR_autodrum5,DR_autodrum2,DR_autodrum0,DR_autodrum1
.byte DR_autodrum2,DR_autodrum2,DR_autodrum5,DR_autodrum1,DR_autodrum2
.byte DR_autodrum5,DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2
.byte DR_autodrum4,DR_autodrum4,DR_autodrum5,DR_autodrum2,PATEND
PPDAT_World_1A_pat_2_3_2:
.byte DR_autodrum0,DR_autodrum1,DR_autodrum2,DR_autodrum2,DR_autodrum4
.byte DR_autodrum0,DR_autodrum0,DR_autodrum1,DR_autodrum0,DR_autodrum3
.byte DR_autodrum2,DR_autodrum2,DR_autodrum0,DR_autodrum2,DR_autodrum4
.byte DR_autodrum0,DR_autodrum0,DR_autodrum1,DR_autodrum2,DR_autodrum2
.byte DR_autodrum4,DR_autodrum0,DR_autodrum0,DR_autodrum1,DR_autodrum0
.byte DR_autodrum3,DR_autodrum2,DR_autodrum2,DR_autodrum0,DR_autodrum2
.byte DR_autodrum4,DR_autodrum0,DR_autodrum0,DR_autodrum1,DR_autodrum2
.byte DR_autodrum2,DR_autodrum4,DR_autodrum0,DR_autodrum0,DR_autodrum1
.byte DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2,DR_autodrum0
.byte DR_autodrum2,DR_autodrum4,DR_autodrum0,DR_autodrum0,DR_autodrum1
.byte DR_autodrum2,DR_autodrum2,DR_autodrum4,DR_autodrum0,DR_autodrum0
.byte DR_autodrum1,DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2
.byte DR_autodrum0,DR_autodrum2,DR_autodrum4,DR_autodrum0,PATEND
PPDAT_World_1A_pat_2_3_3:
.byte DR_autodrum0|D_8,DR_autodrum2|D_8,DR_autodrum4,DR_autodrum2|D_8
.byte DR_autodrum1,DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2
.byte DR_autodrum4|D_8,DR_autodrum3|D_8,DR_autodrum0|D_8,DR_autodrum2|D_8
.byte DR_autodrum4,DR_autodrum2|D_8,DR_autodrum1,DR_autodrum0,DR_autodrum3
.byte DR_autodrum2,DR_autodrum2,DR_autodrum4|D_8,DR_autodrum3|D_8
.byte DR_autodrum0|D_8,DR_autodrum2|D_8,DR_autodrum4,DR_autodrum2|D_8
.byte DR_autodrum1,DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2
.byte DR_autodrum4|D_8,DR_autodrum3|D_8,DR_autodrum0|D_8,DR_autodrum2|D_8
.byte DR_autodrum4,DR_autodrum2|D_8,DR_autodrum1,DR_autodrum0,DR_autodrum3
.byte DR_autodrum2,DR_autodrum2,DR_autodrum4|D_8,DR_autodrum3|D_8,PATEND
PPDAT_World_1A_pat_2_3_4:
.byte DR_autodrum0|D_8,DR_autodrum2,DR_autodrum2,DR_autodrum0|D_8
.byte DR_autodrum2|D_8,DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2
.byte DR_autodrum0,DR_autodrum2|D_8,DR_autodrum2,DR_autodrum0|D_8,DR_autodrum2
.byte DR_autodrum2,DR_autodrum0|D_8,DR_autodrum2|D_8,DR_autodrum0,DR_autodrum3
.byte DR_autodrum2,DR_autodrum2,DR_autodrum4,DR_autodrum4,DR_autodrum0
.byte DR_autodrum2,DR_autodrum0|D_8,DR_autodrum2,DR_autodrum2,DR_autodrum0|D_8
.byte DR_autodrum2|D_8,DR_autodrum0,DR_autodrum3,DR_autodrum2,DR_autodrum2
.byte DR_autodrum0,DR_autodrum2|D_8,DR_autodrum2,DR_autodrum0|D_8,DR_autodrum2
.byte DR_autodrum2,DR_autodrum0|D_8,DR_autodrum2|D_8,DR_autodrum0,DR_autodrum3
.byte DR_autodrum2,DR_autodrum2,DR_autodrum4,DR_autodrum4,DR_autodrum0
.byte DR_autodrum2,PATEND
PPDAT_World_1B_pat_3_0_0:
.byte ARPEGGIO,$00,N_DS|D_8,N_F|D_D8,N_G,N_AS|D_8,N_AS,N_GS|D_D8,N_G|D_8
.byte N_D|D_D8,N_C|D_D8,N_D,N_F|D_D8,N_DS|D_8,N_F|D_D8,N_G,N_AS|D_8,N_AS
.byte N_GS|D_8,N_G,N_DH|D_8,N_AS|D_D8,N_AS|D_D8,N_AS,N_CH|D_D8,PATEND
PPDAT_World_1B_pat_3_0_1:
.byte N_DS|D_8,N_F|D_D8,N_G,N_AS|D_8,N_AS,N_GS,N_F,N_GS,N_G|D_8,N_D|D_D8
.byte N_C|D_D8,N_D,N_F|D_8,N_D,N_DS|D_8,N_F|D_D8,N_G,N_AS|D_8,N_AS,N_GS|D_8,N_G
.byte N_DSH|D_8,N_FH|D_D8,N_FH|D_D8,N_DH,N_DSH|D_D8,PATEND
PPDAT_World_1B_pat_3_0_2:
.byte N_AS|D_D4,N_CH|D_D8,N_G|D_D8,INSTRUMENT,PI_Miniboss_Flute,N_CH|D_8,N_AS
.byte N_A|D_8,N_G,N_F|D_D8,N_C|D_D8,INSTRUMENT,PI_Select_Orc_Hit,N_AS|D_D4
.byte N_CH|D_D8,N_G|D_D8,INSTRUMENT,PI_Miniboss_Flute,N_FH|D_8,N_FH,N_FH|D_8
.byte N_DSH|D_D8,N_CH|D_D8,N_AS,PATEND
PPDAT_World_1B_pat_3_0_3:
.byte CHVOLUME,4,N_CH,CHVOLUME,1,N_TIE,CHVOLUME,4,N_CH,CHVOLUME,1,N_TIE
.byte CHVOLUME,4,N_CH|D_8,N_DH|D_8,CHVOLUME,1,N_TIE,CHVOLUME,4,N_FH|D_8
.byte CHVOLUME,1,N_TIE,INSTRUMENT,PI_Miniboss_Flute,CHVOLUME,4,N_DH|D_8,N_CH
.byte N_DH|D_8,N_EH|D_D8,N_FH,N_A|D_D8,INSTRUMENT,PI_Select_Orc_Hit,N_CH
.byte CHVOLUME,1,N_TIE,CHVOLUME,4,N_B,CHVOLUME,1,N_TIE,CHVOLUME,4,N_G
.byte CHVOLUME,1,N_TIE,CHVOLUME,4,N_F|D_8,CHVOLUME,1,N_TIE,CHVOLUME,4,N_C|D_8
.byte CHVOLUME,1,N_TIE,INSTRUMENT,PI_Miniboss_Flute,CHVOLUME,4,N_DH|D_8,N_EH
.byte N_FH|D_8,N_GH|D_D8,TRANSPOSE,<24,N_D,N_C|D_D8,TRANSPOSE,<-24,PATEND
PPDAT_World_1B_pat_3_0_4:
.byte ARPEGGIO,$cc,N_CS|D_8,N_DS|D_D8,N_F,N_GS|D_8,N_GS,N_FS|D_D8,N_C|D_8
.byte N_CS|D_D8,N_CS,N_CS|D_8,N_DS,N_CS|D_D8,N_DS|D_8,N_F|D_D8,N_FS,N_GS|D_8
.byte N_GS,N_FS|D_8,N_CH,N_CSH|D_8,N_CSH,N_CH|D_8,N_AS,N_GS,N_FS|D_8,N_F|D_8
.byte N_DS,PATEND
PPDAT_World_1B_pat_3_0_5:
.byte ARPEGGIO,$cc,N_CS|D_8,N_DS|D_D8,N_F,N_GS|D_8,N_GS,N_FS|D_D8,N_C|D_8
.byte N_CS|D_D8,N_CS,N_CS|D_8,N_DS,N_CS|D_D8,N_CS|D_8,N_DS|D_D8,N_F,N_GS|D_8
.byte N_GS,N_FS|D_8,N_DS,N_C|D_8,N_C,N_C|D_8,N_C|D_D8,N_C,N_CS|D_D8,PATEND
PPDAT_World_1B_pat_3_0_6:
.byte ARPEGGIO,$cc,N_CS|D_8,N_DS|D_D8,N_F,N_GS|D_8,N_GS,N_FS|D_D8,N_C|D_8
.byte N_CS|D_D8,N_CS,N_CS|D_8,N_DS,N_CS|D_D8,N_DS|D_8,N_F|D_D8,N_FS,N_GS|D_8
.byte N_GS,N_FS|D_8,N_CH,N_CSH|D_8,N_CSH,N_CSH|D_8,N_CSH,N_CSH|D_8,N_CSH
.byte N_CSH|D_D8,PATEND
PPDAT_World_1B_pat_3_1_0:
.byte CHVOLUME,3,ARPEGGIO,$00,N_C|D_D8,ARPEGGIO,$47,TRANSPOSE,<-29,N_C|D_D8
.byte ARPEGGIO,$00,TRANSPOSE,<31,N_C|D_D8,ARPEGGIO,$47,TRANSPOSE,<-33,N_C|D_D8
.byte ARPEGGIO,$00,TRANSPOSE,<31,N_C|D_8,TRANSPOSE,<-43,N_D|D_D8,N_C|D_D8,N_D
.byte N_FS|D_D8,TRANSPOSE,<43,N_C|D_D8,ARPEGGIO,$47,TRANSPOSE,<-29,N_C|D_D8
.byte ARPEGGIO,$00,TRANSPOSE,<31,N_C|D_D8,ARPEGGIO,$47,TRANSPOSE,<-33,N_C|D_D8
.byte ARPEGGIO,$00,TRANSPOSE,<35,N_C|D_8,TRANSPOSE,<-36,N_C|D_D8,N_C|D_D8,N_C
.byte N_CS|D_D8,TRANSPOSE,<32,PATEND
PPDAT_World_1B_pat_3_1_1:
.byte ARPEGGIO,$00,N_C|D_D8,ARPEGGIO,$47,TRANSPOSE,<-29,N_C|D_D8,ARPEGGIO,$00
.byte TRANSPOSE,<31,N_C|D_D8,ARPEGGIO,$47,TRANSPOSE,<-33,N_C|D_D8,ARPEGGIO,$00
.byte TRANSPOSE,<30,N_C|D_8,TRANSPOSE,<-42,N_D|D_D8,N_C|D_D8,N_D,N_FS|D_D8
.byte TRANSPOSE,<43,N_C|D_D8,ARPEGGIO,$47,TRANSPOSE,<-29,N_C|D_D8,ARPEGGIO,$00
.byte TRANSPOSE,<28,N_C|D_D8,ARPEGGIO,$47,TRANSPOSE,<-30,N_C|D_D8,ARPEGGIO,$00
.byte TRANSPOSE,<31,N_C|D_8,TRANSPOSE,<-29,N_E|D_D8,N_E|D_D8,N_C,N_D|D_D8
.byte TRANSPOSE,<29,PATEND
PPDAT_World_1B_pat_3_1_2:
.byte ARPEGGIO,$00,N_CS|D_D8,ARPEGGIO,$47,N_GSH|D_D8,ARPEGGIO,$00,N_FS|D_D8
.byte ARPEGGIO,$47,N_FSH|D_D8,ARPEGGIO,$00,N_C|D_8,ARPEGGIO,$37,N_FH
.byte ARPEGGIO,$00,N_C|D_8,ARPEGGIO,$37,N_FH,ARPEGGIO,$00,N_C|D_D8,ARPEGGIO,$47
.byte N_FSH|D_D8,ARPEGGIO,$00,N_CS|D_D8,ARPEGGIO,$47,N_GSH|D_D8,ARPEGGIO,$00
.byte N_FS|D_D8,ARPEGGIO,$47,N_FSH|D_D8,ARPEGGIO,$00,N_DS|D_8,ARPEGGIO,$47
.byte N_GSH,ARPEGGIO,$00,N_DS|D_8,ARPEGGIO,$47,N_GSH,ARPEGGIO,$00,N_DS|D_D8
.byte ARPEGGIO,$37,N_ASH|D_D8,PATEND
PPDAT_World_1B_pat_3_1_4:
.byte N_C|D_8,N_CH,N_CHH|D_8,N_CH,TRANSPOSE,<-5,N_C|D_8,N_CH,N_CHH|D_8,N_CH
.byte TRANSPOSE,<-8,N_C|D_8,N_CSH,TRANSPOSE,<1,N_CHH|D_8,N_CH,N_C|D_8,N_CH
.byte N_CHH|D_8,N_CH,TRANSPOSE,<19,N_G|D_8,N_E,N_C|D_8,N_F,N_G|D_8,N_F,N_G|D_8
.byte N_B,N_CH|D_8,N_AS,N_A|D_8,N_G,N_F,N_E|D_8,N_D|D_8,N_C,TRANSPOSE,<-7
.byte PATEND
PPDAT_World_1B_pat_3_1_5:
.byte CHVOLUME,3,ARPEGGIO,$00,N_C|D_8,N_CH,N_CHH|D_8,N_CH,TRANSPOSE,<-5,N_C|D_8
.byte N_CH,N_CHH|D_8,N_CH,TRANSPOSE,<-8,N_C|D_8,N_CSH,TRANSPOSE,<1,N_CHH|D_8
.byte N_CH,N_C|D_8,N_CH,N_CHH|D_8,N_CH,N_CH|D_8,N_CHH,TRANSPOSE,<24,N_CH|D_8
.byte N_C,TRANSPOSE,<-17,N_C|D_8,N_CH,N_CHH|D_8,N_CH,N_E|D_8,N_EH,TRANSPOSE,<4
.byte N_CHH|D_8,N_CH,N_C|D_8,N_CH,TRANSPOSE,<20,N_F|D_8,N_C,TRANSPOSE,<-19
.byte PATEND
PPDAT_World_1B_pat_3_1_6:
.byte N_C|D_8,N_CH,N_CHH|D_8,N_CH,TRANSPOSE,<-5,N_C|D_8,N_CH,N_CHH|D_8,N_CH
.byte TRANSPOSE,<-8,N_C|D_8,N_CSH,TRANSPOSE,<1,N_CHH|D_8,N_CH,N_C|D_8,N_CH
.byte N_CHH|D_8,N_CH,TRANSPOSE,<19,N_G|D_8,N_E,N_C|D_8,N_F,N_G|D_8,N_F,N_G|D_8
.byte N_B,N_F|D_8,N_F,N_F|D_8,N_F,N_F|D_8,N_F,N_F|D_D8,TRANSPOSE,<-7,PATEND
PPDAT_World_1B_pat_3_2_0:
.byte N_CS|D_8,REST|D_4,N_DS|D_8,REST|D_4,N_CS|D_8,REST|D_4,N_CSH,REST,N_CH
.byte N_GS|D_8,N_FS,N_CS|D_8,REST|D_4,N_DS|D_8,REST|D_4,N_C|D_8,REST,N_FH
.byte REST|D_8,N_FH,REST,N_F,N_CSH|D_8,N_AS,PATEND
PPDAT_World_1B_pat_3_2_1:
.byte N_C|D_8,REST|D_4,N_D|D_8,REST|D_4,N_C|D_8,REST|D_4,N_CH,REST,N_B,N_G|D_8
.byte N_F,N_C|D_8,REST|D_4,N_D|D_8,REST|D_4,N_CH|D_8,REST,N_DH,REST|D_8,N_DH
.byte REST,N_DH,N_CH|D_8,REST,PATEND
PPDAT_World_1B_pat_3_2_2:
.byte N_CS|D_D8,N_CSH,REST|D_8,N_DS|D_8,REST,N_FS|D_8,REST,N_C|D_D8,N_CH
.byte REST|D_8,N_GS,REST|D_8,N_DS|D_D8,N_CS|D_D8,N_CSH,REST|D_8,N_DS|D_8,REST
.byte N_FS|D_8,REST,N_DS|D_D8,N_DSH,REST|D_8,N_FS,REST|D_8,N_DS|D_D8,PATEND
PPDAT_World_1B_pat_3_2_3:
.byte N_CS|D_D8,N_CSH,REST|D_8,N_DS|D_8,REST,N_FS|D_8,REST,N_C|D_D8,N_CH
.byte REST|D_8,N_GS,REST|D_8,N_DS|D_D8,N_CS|D_D8,N_CSH,REST|D_8,N_DS|D_8,REST
.byte N_FS|D_8,REST|D_D2,N_TIE,PATEND
PPDAT_World_1B_pat_3_2_4:
.byte N_GS|D_D8,REST|D_2,N_C,N_G|D_8,N_GS,REST|D_D4,N_DS|D_D8,N_AS|D_D8
.byte REST|D_2,N_DH,N_DSH|D_8,REST,N_DSH|D_8,REST,N_DSH,REST|D_8,N_CH|D_8,N_AS
.byte PATEND
PPDAT_World_1B_pat_3_2_5:
.byte N_GS|D_D8,REST|D_2,N_C,N_G|D_8,N_GS,REST|D_D4,N_DS|D_D8,N_GS|D_D8
.byte REST|D_2,N_C,N_G|D_8,N_DS,REST|D_2,N_TIE,PATEND
PPDAT_World_1B_pat_3_2_6:
.byte N_F|D_D2,N_E|D_8,N_F|D_D4,N_TIE,N_CH|D_D8,N_F|D_D2,N_C|D_D2,PATEND
PPDAT_World_1B_pat_3_2_7:
.byte N_CS|D_D4,N_CS|D_D4,N_C|D_8,N_CS|D_4,N_CS|D_D8,N_GS|D_D8,N_DS|D_D4
.byte N_DS|D_D4,N_CSH|D_8,N_CS,N_CSH|D_8,N_CS,N_CSH|D_8,N_CS,N_CSH|D_8,N_CS
.byte PATEND
PPDAT_World_1B_pat_3_3_0:
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum9|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum9|D_8,DR_autodrum7,DR_autodrum8,DR_autodrum7,DR_autodrum7
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum9|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum9|D_8,DR_autodrum7,DR_autodrum8,DR_autodrum7,DR_autodrum7
.byte PATEND
PPDAT_World_1B_pat_3_3_1:
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum9|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum9|D_8,DR_autodrum7,DR_autodrum8,DR_autodrum7,DR_autodrum7
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum9|D_8,DR_autodrum7,DR_autodrum8|D_8,DR_autodrum7
.byte DR_autodrum4|D_D8,DR_autodrum4|D_D8,DR_autodrum0|D_D8,DR_autodrum0|D_D8
.byte PATEND
PPDAT_World_1B_pat_3_3_2:
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum8|D_D8,DR_autodrum8,DR_autodrum7
.byte DR_autodrum7,DR_autodrum8|D_D8,DR_autodrum6|D_8,DR_autodrum7
.byte DR_autodrum8|D_D8,DR_autodrum8,DR_autodrum7,DR_autodrum7
.byte DR_autodrum8|D_D8,DR_autodrum6|D_8,DR_autodrum7,DR_autodrum8|D_D8
.byte DR_autodrum8,DR_autodrum7,DR_autodrum7,DR_autodrum8|D_D8,DR_autodrum6|D_8
.byte DR_autodrum7,DR_autodrum8|D_D8,DR_autodrum9|D_8,DR_autodrum7
.byte DR_autodrum8|D_D8,PATEND
PPDAT_World_1B_pat_3_3_5:
.byte DR_autodrum6|D_D8,DR_autodrum10|D_D8,DR_autodrum9|D_D8,DR_autodrum10|D_D8
.byte DR_autodrum6|D_D8,DR_autodrum10|D_D8,DR_autodrum9|D_D8,DR_autodrum10|D_8
.byte DR_autodrum9,DR_autodrum6|D_D8,DR_autodrum10|D_D8,DR_autodrum9|D_D8
.byte DR_autodrum10|D_D8,DR_autodrum6|D_D8,DR_autodrum10|D_D8,DR_autodrum9|D_8
.byte DR_autodrum9,DR_autodrum6|D_8,DR_autodrum6,PATEND
PPDAT_World_3_pat_4_0_0:
.byte VIBRATO,1,N_C|D_4,N_C|D_8,N_CH|D_8,N_C|D_4,N_C|D_4,N_C|D_4,N_C|D_8
.byte N_CH|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_G|D_8,N_C|D_4,N_C|D_8,N_CH|D_8
.byte N_C|D_4,N_C|D_4,N_C|D_4,N_C|D_8,N_CH|D_8,N_C|D_8,N_CH|D_8,N_F|D_8,N_G|D_8
.byte PATEND
PPDAT_World_3_pat_4_0_1:
.byte N_C|D_4,N_C|D_8,N_CH|D_8,N_C|D_4,N_C|D_4,N_C|D_4,N_C|D_8,N_CH|D_8,N_C|D_8
.byte N_CH|D_8,N_F|D_8,N_G|D_8,N_C|D_4,N_C|D_8,N_CH|D_8,N_C|D_4,N_C|D_4,N_F|D_4
.byte N_F|D_8,N_FH|D_8,N_F|D_8,N_FH|D_8,N_F|D_8,N_DS|D_8,PATEND
PPDAT_World_3_pat_4_0_2:
.byte N_D|D_4,N_D|D_8,N_DH|D_8,N_D|D_4,N_D|D_4,N_C|D_4,N_C|D_8,N_CH|D_8,N_D|D_8
.byte N_DH|D_8,N_G|D_8,N_A|D_8,N_D|D_4,N_D|D_8,N_DH|D_8,N_D|D_4,N_D|D_4,N_C|D_4
.byte N_C|D_8,N_CH|D_8,N_D|D_8,N_DH|D_8,N_G|D_8,N_A|D_8,PATEND
PPDAT_World_3_pat_4_0_3:
.byte N_F|D_4,N_F|D_8,N_FH|D_8,N_F|D_4,N_F|D_4,N_DS|D_4,N_DS|D_8,N_DSH|D_8
.byte N_F|D_8,N_FH|D_8,N_AS|D_8,N_CH|D_8,N_C|D_4,N_C|D_8,N_CH|D_8,N_C|D_4
.byte N_C|D_4,N_CS|D_4,N_F|D_8,N_GS|D_8,N_AS|D_8,N_GSH|D_8,N_F|D_8,N_GS|D_8
.byte PATEND
PPDAT_World_3_pat_4_0_4:
.byte N_D|D_4,N_DH|D_4,N_D|D_8,N_DH|D_8,N_A|D_8,N_CH|D_8,N_C|D_4,N_CH|D_4
.byte N_A|D_8,N_GH|D_8,N_A|D_8,N_G|D_8,N_D|D_4,N_DH|D_4,N_D|D_8,N_DH|D_8
.byte N_A|D_8,N_CH|D_8,N_A|D_8,N_G|D_8,N_A|D_8,N_G|D_8,N_F|D_8,N_D|D_8,N_F|D_8
.byte N_D|D_8,PATEND
PPDAT_World_3_pat_4_1_1:
.byte REST|D_8,CHVOLUME,4,N_D,REST,N_A,REST,N_F,REST,N_G,REST,N_D,REST,N_F,REST
.byte N_D,REST,N_C,REST,N_D,REST|D_D2,N_TIE|D_D8,N_D,REST,N_A,REST,N_F,REST,N_G
.byte REST,N_D,REST,N_C,REST,N_D,REST,N_F,REST,N_G,REST|D_D2,N_TIE,PATEND
PPDAT_World_3_pat_4_1_2:
.byte REST|D_8,CHVOLUME,4,N_D,REST,N_A,REST,N_F,REST,N_G,REST,N_D,REST,N_F,REST
.byte N_D,REST,N_C,REST,N_D,REST|D_D2,N_TIE|D_D8,N_D,REST,N_A,REST,N_F,REST,N_D
.byte REST,N_F,REST,N_G,REST,N_A,REST,N_F,REST,N_DH,REST,N_F,REST,N_AS,REST,N_F
.byte REST,N_G,REST,N_D,REST,N_F,REST,PATEND
PPDAT_World_3_pat_4_1_3:
.byte CHVOLUME,4,N_G|D_8,CHVOLUME,1,N_G,CHVOLUME,4,N_F|D_8,CHVOLUME,1,N_F
.byte CHVOLUME,4,N_G|D_8,CHVOLUME,1,N_G|D_8,CHVOLUME,4,N_F|D_8,N_G,CHVOLUME,1
.byte N_G,CHVOLUME,4,N_F,CHVOLUME,1,N_F,CHVOLUME,4,N_C|D_8,CHVOLUME,1,N_C
.byte CHVOLUME,4,N_C|D_8,CHVOLUME,1,N_C,CHVOLUME,4,N_D|D_8,CHVOLUME,1,N_D|D_8
.byte CHVOLUME,4,N_F|D_8,CHVOLUME,1,N_F|D_4,CHVOLUME,4,N_G|D_8,CHVOLUME,1,N_G
.byte CHVOLUME,4,N_F|D_8,CHVOLUME,1,N_F,CHVOLUME,4,N_G|D_8,CHVOLUME,1,N_G|D_8
.byte CHVOLUME,4,N_F|D_8,N_G,CHVOLUME,1,N_G,CHVOLUME,4,N_F,CHVOLUME,1,N_F
.byte CHVOLUME,4,N_G,CHVOLUME,1,N_G,CHVOLUME,4,N_F,CHVOLUME,1,N_F,CHVOLUME,4
.byte N_G,CHVOLUME,1,N_G,CHVOLUME,4,N_F,CHVOLUME,1,N_F,CHVOLUME,4,N_D
.byte CHVOLUME,1,N_D,CHVOLUME,4,N_C,CHVOLUME,1,N_C,CHVOLUME,4,N_D,CHVOLUME,1
.byte N_D,CHVOLUME,4,N_F,CHVOLUME,1,N_F,PATEND
PPDAT_World_3_pat_4_1_4:
.byte CHVOLUME,4,N_CH|D_8,CHVOLUME,1,N_CH,CHVOLUME,4,N_AS|D_8,CHVOLUME,1,N_AS
.byte CHVOLUME,4,N_CH|D_8,CHVOLUME,1,N_CH|D_8,CHVOLUME,4,N_AS|D_8,N_CH
.byte CHVOLUME,1,N_CH,CHVOLUME,4,N_AS,CHVOLUME,1,N_AS,CHVOLUME,4,N_F|D_8
.byte CHVOLUME,1,N_F,CHVOLUME,4,N_F|D_8,CHVOLUME,1,N_F,CHVOLUME,4,N_G|D_8
.byte CHVOLUME,1,N_G|D_8,CHVOLUME,4,N_AS|D_8,CHVOLUME,1,N_AS|D_4,CHVOLUME,4
.byte N_AS|D_8,CHVOLUME,1,N_AS,CHVOLUME,4,N_G|D_8,CHVOLUME,1,N_G,CHVOLUME,4
.byte N_AS|D_8,CHVOLUME,1,N_AS|D_8,CHVOLUME,4,N_G|D_8,N_AS,CHVOLUME,1,N_AS
.byte CHVOLUME,4,N_G,CHVOLUME,1,N_G,CHVOLUME,4,N_F|D_8,CHVOLUME,1,N_F
.byte CHVOLUME,4,N_F|D_8,CHVOLUME,1,N_F,CHVOLUME,4,N_DS|D_8,CHVOLUME,1,N_DS|D_8
.byte CHVOLUME,4,N_C|D_8,CHVOLUME,1,N_C|D_4,PATEND
PPDAT_World_3_pat_4_1_5:
.byte CHVOLUME,4,N_AH|D_8,N_GH|D_8,N_EH|D_8,N_GH|D_4,INSTRUMENT,PI_Horn
.byte CHVOLUME,3,N_D|D_8,N_E|D_8,N_G,CHVOLUME,1,N_TIE
.byte INSTRUMENT,PI_Pizzicato_Strings,CHVOLUME,4,N_AH|D_8,N_GH|D_8,N_EH|D_8
.byte N_GH|D_4,INSTRUMENT,PI_Horn,CHVOLUME,3,N_D|D_8,N_E|D_8,N_C,CHVOLUME,1
.byte N_TIE,INSTRUMENT,PI_Pizzicato_Strings,CHVOLUME,4,N_AH|D_8,N_GH|D_8
.byte N_EH|D_8,N_DH|D_4,INSTRUMENT,PI_Horn,CHVOLUME,3,N_D|D_8,N_E|D_8,N_G
.byte CHVOLUME,1,N_TIE,INSTRUMENT,PI_Pizzicato_Strings,CHVOLUME,4,N_AH|D_8
.byte N_GH|D_8,N_EH|D_8,N_A|D_8,N_A|D_8,N_CH|D_8,N_DH|D_8,N_EH|D_8,PATEND
PPDAT_World_3_pat_4_1_6:
.byte CHVOLUME,4,N_GH|D_8,N_FH|D_8,N_DH|D_8,N_FH|D_4,INSTRUMENT,PI_Horn
.byte CHVOLUME,3,N_C|D_8,N_D|D_8,N_F,CHVOLUME,1,N_F
.byte INSTRUMENT,PI_Pizzicato_Strings,CHVOLUME,4,N_GH|D_8,N_FH|D_8,N_DH|D_8
.byte N_FH|D_4,INSTRUMENT,PI_Horn,CHVOLUME,3,N_C|D_8,N_F|D_8,N_D,CHVOLUME,1
.byte N_TIE,INSTRUMENT,PI_Pizzicato_Strings,CHVOLUME,4,N_GH|D_8,N_FH|D_8
.byte N_DH|D_8,N_GH|D_4,INSTRUMENT,PI_Horn,CHVOLUME,3,N_G|D_8,N_F|D_8,N_D
.byte CHVOLUME,1,N_TIE,INSTRUMENT,PI_Pizzicato_Strings,CHVOLUME,4,N_GH|D_8
.byte N_FH|D_8,N_GH|D_8,N_FH|D_8,N_AS|D_8,N_DH|D_8,N_FH|D_8,N_GH|D_8,PATEND
PPDAT_World_3_pat_4_2_1:
.byte N_D,REST,N_A,REST,N_F,REST,N_G,REST,N_D,REST,N_F,REST,N_D,REST,N_C,REST
.byte N_D,REST|D_D2,N_TIE|D_D8,N_D,REST,N_A,REST,N_F,REST,N_G,REST,N_D,REST,N_C
.byte REST,INSTRUMENT,PI_Distant_Square_Echo,N_D,REST,N_F,REST
.byte INSTRUMENT,PI_Blank,N_G,REST|D_D2,N_TIE|D_D8,PATEND
PPDAT_World_3_pat_4_2_2:
.byte N_D,REST,N_A,REST,N_F,REST,N_G,REST,N_D,REST,N_F,REST,N_D,REST,N_C,REST
.byte N_D,REST|D_D2,N_TIE|D_D8,N_D,REST,N_A,REST,N_F,REST,N_D,REST,N_F,REST,N_G
.byte REST,N_A,REST,N_F,REST,N_DH,REST,N_F,REST,N_A,REST,N_F,REST,N_G,REST,N_D
.byte REST,N_F,REST,N_G,REST,PATEND
PPDAT_World_3_pat_4_2_3:
.byte VIBRATO,1,N_CH|D_2,N_CH|D_4,N_CH|D_4,N_AS|D_D8,REST,N_AS,REST,N_CH|D_8
.byte N_CH|D_4,N_CH|D_8,REST|D_8,N_CH|D_2,N_CH|D_4,N_CH|D_8,REST|D_8,N_AS|D_D8
.byte REST,N_AS,REST,N_G|D_8,N_G|D_8,N_F|D_8,N_F|D_8,N_C|D_8,PATEND
PPDAT_World_3_pat_4_2_4:
.byte N_CH|D_1,N_AS|D_D8,REST,N_AS,REST,N_CH|D_2,REST|D_8,N_AS|D_D2,N_TIE|D_8
.byte REST|D_8,N_GS|D_D8,REST,N_GS,REST,N_F|D_4,N_DS|D_4,N_C|D_8,PATEND
PPDAT_World_3_pat_4_2_5:
.byte VIBRATO,0,N_C|D_8,N_CH|D_8,N_CHH|D_8,N_CH|D_8,N_C|D_8,N_CH|D_8,N_CHH|D_8
.byte N_CH|D_8,TRANSPOSE,<-2,N_C|D_8,N_CH|D_8,N_CHH|D_8,N_CH|D_8,TRANSPOSE,<-3
.byte N_C|D_8,N_AS|D_8,N_CHH|D_8,N_ASH|D_8,N_FH|D_D8,N_FH|D_D8,TRANSPOSE,<10
.byte N_GH|D_8,N_G|D_8,N_G|D_8,N_GH|D_8,N_G|D_8,N_D|D_D8,N_D|D_D8,N_DH|D_8
.byte N_C|D_8,N_CH|D_8,N_AS|D_8,N_DH|D_8,TRANSPOSE,<-5,PATEND
PPDAT_World_3_pat_4_2_6:
.byte N_C|D_8,N_CH|D_8,N_CHH|D_8,N_CH|D_8,N_C|D_8,N_CH|D_8,N_CHH|D_8,N_CH|D_8
.byte TRANSPOSE,<-2,N_C|D_8,N_CH|D_8,N_CHH|D_8,N_CH|D_8,TRANSPOSE,<-3,N_C|D_8
.byte N_AS|D_8,N_CHH|D_8,N_ASH|D_8,N_FH|D_D8,N_FH|D_D8,TRANSPOSE,<8,N_AH|D_8
.byte N_A|D_8,N_A|D_8,N_AH|D_8,N_A|D_8,N_E|D_D8,N_E|D_D8,N_EH|D_8,N_C,N_E,N_A
.byte N_CH,N_EH,N_GH,N_EH,N_AH,TRANSPOSE,<-3,PATEND
PPDAT_World_3_pat_4_3_0:
.byte DR_autodrum11|D_8,DR_autodrum10|D_8,DR_autodrum11|D_8,DR_autodrum11|D_8
.byte DR_autodrum10|D_8,DR_autodrum11|D_8,DR_autodrum12|D_4,DR_autodrum11|D_8
.byte DR_autodrum10|D_8,DR_autodrum11|D_8,DR_autodrum11|D_8,DR_autodrum10|D_8
.byte DR_autodrum11|D_8,DR_autodrum12|D_8,DR_autodrum11|D_8,DR_autodrum11|D_8
.byte DR_autodrum10|D_8,DR_autodrum11|D_8,DR_autodrum11|D_8,DR_autodrum10|D_8
.byte DR_autodrum11|D_8,DR_autodrum12|D_4,DR_autodrum11|D_8,DR_autodrum10|D_8
.byte DR_autodrum11|D_8,DR_autodrum11|D_8,DR_autodrum10|D_8,DR_autodrum11|D_8
.byte DR_autodrum12|D_8,DR_autodrum13|D_8,PATEND
PPDAT_World_3_pat_4_3_3:
.byte DR_autodrum6|D_8,DR_autodrum10|D_8,DR_autodrum7,DR_autodrum7
.byte DR_autodrum10|D_8,DR_autodrum6|D_8,DR_autodrum7,DR_autodrum7
.byte DR_autodrum9|D_8,DR_autodrum13|D_8,DR_autodrum6|D_8,DR_autodrum10|D_8
.byte DR_autodrum7,DR_autodrum7,DR_autodrum10|D_8,DR_autodrum6|D_8
.byte DR_autodrum12|D_8,DR_autodrum9|D_8,DR_autodrum9|D_8,DR_autodrum6|D_8
.byte DR_autodrum10|D_8,DR_autodrum7,DR_autodrum7,DR_autodrum10|D_8
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum7,DR_autodrum9|D_8
.byte DR_autodrum11|D_8,DR_autodrum6|D_8,DR_autodrum10|D_8,DR_autodrum7
.byte DR_autodrum7,DR_autodrum10|D_8,DR_autodrum6|D_8,DR_autodrum12|D_8
.byte DR_autodrum9|D_8,DR_autodrum9|D_8,PATEND
PPDAT_World_3_pat_4_3_5:
.byte DR_autodrum14|D_4,DR_autodrum15,DR_autodrum16,DR_autodrum16|D_8
.byte DR_autodrum15,DR_autodrum16,DR_autodrum15,DR_autodrum16,DR_autodrum15|D_8
.byte DR_autodrum16|D_8,DR_autodrum14|D_4,DR_autodrum15,DR_autodrum16
.byte DR_autodrum16|D_8,DR_autodrum15,DR_autodrum16,DR_autodrum15,DR_autodrum16
.byte DR_autodrum15|D_8,DR_autodrum16|D_8,DR_autodrum14|D_4,DR_autodrum15
.byte DR_autodrum16,DR_autodrum16|D_8,DR_autodrum15,DR_autodrum16,DR_autodrum15
.byte DR_autodrum16,DR_autodrum15|D_8,DR_autodrum16|D_8,DR_autodrum14|D_4
.byte DR_autodrum15,DR_autodrum16,DR_autodrum16|D_8,DR_autodrum15,DR_autodrum16
.byte DR_autodrum15,DR_autodrum16,DR_autodrum15|D_8,DR_autodrum16|D_8,PATEND
PPDAT_World_3_pat_4_3_6:
.byte DR_autodrum14|D_4,DR_autodrum15,DR_autodrum16,DR_autodrum16|D_8
.byte DR_autodrum15,DR_autodrum16,DR_autodrum15,DR_autodrum16,DR_autodrum15|D_8
.byte DR_autodrum16|D_8,DR_autodrum14|D_4,DR_autodrum15,DR_autodrum16
.byte DR_autodrum16|D_8,DR_autodrum15,DR_autodrum16,DR_autodrum15,DR_autodrum16
.byte DR_autodrum15|D_8,DR_autodrum16|D_8,DR_autodrum14|D_4,DR_autodrum15
.byte DR_autodrum16,DR_autodrum16|D_8,DR_autodrum15,DR_autodrum16,DR_autodrum15
.byte DR_autodrum16,DR_autodrum15|D_8,DR_autodrum16|D_8,DR_autodrum14|D_4
.byte DR_autodrum15,DR_autodrum16,DR_autodrum16|D_8,DR_autodrum12,DR_autodrum12
.byte DR_autodrum12,DR_autodrum12,DR_autodrum11,DR_autodrum11,DR_autodrum13
.byte DR_autodrum13,PATEND
PPDAT_World_2_pat_5_0_1:
.byte CHVOLUME,1,ARPEGGIO,$00,N_DSH|D_8,N_CH|D_8
.byte INSTRUMENT,PI_Distant_Square_Echo,CHVOLUME,4,N_DSH|D_8,N_CH|D_8
.byte INSTRUMENT,PI_Blank,CHVOLUME,1,N_G|D_8,N_DS|D_8
.byte INSTRUMENT,PI_Distant_Square_Echo,CHVOLUME,4,N_G|D_8,N_DS|D_8
.byte INSTRUMENT,PI_Blank,CHVOLUME,1,N_FS|D_8,N_DS|D_8
.byte INSTRUMENT,PI_Distant_Square_Echo,CHVOLUME,4,N_FS|D_8,N_DS|D_8
.byte INSTRUMENT,PI_Blank,CHVOLUME,1,N_DS|D_8,N_C|D_8
.byte INSTRUMENT,PI_Distant_Square_Echo,CHVOLUME,4,N_DS|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,CHVOLUME,1,N_DSH|D_8,N_CH|D_8
.byte INSTRUMENT,PI_Distant_Square_Echo,CHVOLUME,4,N_DSH|D_8,N_CH|D_8
.byte INSTRUMENT,PI_Blank,CHVOLUME,1,N_F|D_8,N_C|D_8
.byte INSTRUMENT,PI_Distant_Square_Echo,CHVOLUME,4,N_F|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,CHVOLUME,1,N_FS|D_8,N_C|D_8
.byte INSTRUMENT,PI_Distant_Square_Echo,CHVOLUME,4,N_FS|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,CHVOLUME,1,N_G|D_8,N_AS|D_8
.byte INSTRUMENT,PI_Distant_Square_Echo,CHVOLUME,4,N_CH|D_8,N_AS|D_8,PATEND
PPDAT_World_2_pat_5_0_2:
.byte CHVOLUME,4,VIBRATO,2,N_F|D_4,N_D|D_4,N_C|D_4,N_CS|D_D8,N_D,N_F|D_8
.byte N_D|D_8,N_F|D_8,N_D|D_8,N_C|D_4,N_D|D_4,N_F|D_4,N_D|D_4,N_C|D_4,N_CS|D_8
.byte N_D|D_8,N_F|D_8,N_D|D_8,N_F|D_8,N_D|D_8,N_GS|D_4,N_G|D_4,PATEND
PPDAT_World_2_pat_5_0_4:
.byte N_GS|D_4,N_F|D_4,N_DS|D_4,N_C|D_D8,N_DS,N_GS|D_8,N_F|D_8,N_GS|D_8,N_F
.byte CHVOLUME,2,N_F,INSTRUMENT,PI_Puzzle_Pulsate,CHVOLUME,4,VIBRATO,0
.byte TRANSPOSE,<8,N_CHH|D_8,N_AH|D_8,N_GH|D_8,N_AH,CHVOLUME,2,N_AH
.byte INSTRUMENT,PI_Puzzle_Mellow_Crazy,CHVOLUME,4,VIBRATO,2,N_C|D_4
.byte TRANSPOSE,<-5,N_D|D_4,N_C|D_4,N_CS|D_8,N_D,CHVOLUME,2,N_D
.byte INSTRUMENT,PI_Puzzle_Pulsate,CHVOLUME,4,VIBRATO,0,TRANSPOSE,<26,N_DS|D_8
.byte N_C|D_8,N_DS|D_8,N_C|D_8,N_FS|D_8,N_F|D_8,N_DS|D_8,N_C,CHVOLUME,2,N_C
.byte TRANSPOSE,<-29,PATEND
PPDAT_World_2_pat_5_0_6:
.byte CHVOLUME,4,ARPEGGIO,$00,N_F|D_8,CHVOLUME,1,N_F|D_8,CHVOLUME,4,N_C|D_8
.byte CHVOLUME,1,N_C|D_8,CHVOLUME,4,N_D|D_8,CHVOLUME,1,N_D|D_8,CHVOLUME,4,N_F
.byte CHVOLUME,1,N_F,CHVOLUME,4,N_D|D_8,CHVOLUME,1,N_D|D_8,REST|D_8
.byte INSTRUMENT,PI_Puzzle_Pulsate,CHVOLUME,4,ARPEGGIO,$cc,N_GSH|D_4,N_GH|D_4
.byte N_FH|D_4,INSTRUMENT,PI_Horn,ARPEGGIO,$00,N_F|D_8,CHVOLUME,1,N_F|D_8
.byte CHVOLUME,4,N_C|D_8,CHVOLUME,1,N_C|D_8,CHVOLUME,4,N_D|D_8,CHVOLUME,1
.byte N_D|D_8,CHVOLUME,4,N_F,CHVOLUME,1,N_F,CHVOLUME,4,N_D|D_8,CHVOLUME,1
.byte N_D|D_8,REST|D_8,INSTRUMENT,PI_Puzzle_Pulsate,CHVOLUME,4,ARPEGGIO,$cc
.byte N_CH|D_4,N_CH|D_4,N_DH|D_4,PATEND
PPDAT_World_2_pat_5_0_7:
.byte CHVOLUME,4,ARPEGGIO,$00,N_F|D_8,CHVOLUME,1,N_F|D_8,CHVOLUME,4,N_C|D_8
.byte CHVOLUME,1,N_C|D_8,CHVOLUME,4,N_D|D_8,CHVOLUME,1,N_D|D_8,CHVOLUME,4,N_F
.byte CHVOLUME,1,N_F,CHVOLUME,4,N_D|D_8,CHVOLUME,1,N_D|D_8,REST|D_8
.byte INSTRUMENT,PI_Puzzle_Pulsate,CHVOLUME,4,ARPEGGIO,$cc,N_GSH|D_4,N_GH|D_4
.byte N_FH|D_4,INSTRUMENT,PI_Horn,ARPEGGIO,$00,N_F|D_8,CHVOLUME,1,N_F|D_8
.byte CHVOLUME,4,N_C|D_8,CHVOLUME,1,N_C|D_8,CHVOLUME,4,N_D|D_8,CHVOLUME,1
.byte N_D|D_8,CHVOLUME,4,N_CH,CHVOLUME,1,N_CH,CHVOLUME,4,N_DH|D_8,CHVOLUME,1
.byte N_DH|D_8,REST|D_8,INSTRUMENT,PI_Puzzle_Pulsate,CHVOLUME,4,ARPEGGIO,$cc
.byte N_CH|D_4,N_CH|D_4,N_DH|D_4,PATEND
PPDAT_World_2_pat_5_1_0:
.byte REST,CHVOLUME,4,N_A|D_D8,REST,N_A|D_D8,REST,N_E|D_D8,REST,N_E|D_D8,REST
.byte N_DS|D_D8,REST,N_DS|D_8,N_D|D_4,N_TIE,REST,N_C|D_D8,REST,N_A|D_D8,REST
.byte N_A|D_D8,REST,N_E|D_D8,REST,N_E|D_D8,REST,N_DS|D_D8,REST,N_DS|D_8,N_D|D_4
.byte N_TIE,REST,N_C|D_D8,PATEND
PPDAT_World_2_pat_5_1_3:
.byte REST,N_A|D_D8,REST,N_A|D_D8,REST,N_E|D_D8,REST,N_E|D_D8,REST,N_DS|D_D8
.byte REST,N_DS|D_8,N_D|D_4,N_TIE,REST,N_C|D_D8,REST,N_A|D_D8,REST,N_A|D_D8
.byte REST,N_E|D_D8,REST,N_E|D_D8,REST,N_A|D_D8,REST,N_E|D_8,N_G|D_4,N_TIE,REST
.byte N_A|D_D8,PATEND
PPDAT_World_2_pat_5_1_5:
.byte ARPEGGIO,$0c,N_CH|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_AS|D_8,N_CH|D_8,N_G|D_8
.byte N_DS|D_8,N_C|D_8,N_DS|D_8,N_C|D_8,N_DS|D_8,N_C|D_8,N_DS|D_8,N_F|D_8
.byte N_G|D_8,N_CH|D_8,N_AS|D_8,N_CH|D_8,N_AS|D_8,N_CH|D_8,N_AS|D_8,N_B|D_8
.byte N_CH|D_8,N_AS|D_8,N_CH|D_8,N_AS|D_8,N_CH|D_8,N_FS|D_8,N_G|D_8,N_F|D_8
.byte N_DS|D_8,PATEND
PPDAT_World_2_pat_5_1_6:
.byte N_CH|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_AS|D_8,N_AS|D_8,N_CH|D_8,N_AS|D_8
.byte N_C|D_8,N_DS|D_8,N_C|D_8,N_DS|D_8,N_G|D_8,N_G|D_8,N_AS|D_8,N_G|D_8
.byte N_CH|D_8,N_AS|D_8,N_CH|D_8,N_AS|D_8,N_CH|D_8,N_AS|D_8,N_B|D_8,N_CH|D_8
.byte N_DSH|D_8,N_CH|D_8,N_DSH|D_8,N_CH|D_8,N_FS|D_8,N_F|D_8,N_DS|D_8,N_C|D_8
.byte PATEND
PPDAT_World_2_pat_5_1_7:
.byte ARPEGGIO,$00,N_CH|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_G|D_8,N_AS|D_8,N_G|D_8
.byte N_DS|D_8,N_FS|D_8,N_F|D_8,N_FS|D_8,N_F|D_8,N_FH|D_8,N_F|D_8,N_DSH|D_8
.byte N_DS|D_8,N_CH|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_G|D_8,N_AS|D_8,N_G|D_8
.byte N_DS|D_8,N_FS|D_8,N_F|D_8,N_FS|D_8,N_F|D_8,N_FH|D_8,N_F|D_8,N_GH|D_8
.byte N_ASH|D_8,PATEND
PPDAT_World_2_pat_5_1_8:
.byte N_CH|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_G|D_8,N_AS|D_8,N_G|D_8,N_DS|D_8
.byte N_FS|D_8,N_F|D_8,N_FS|D_8,N_F|D_8,N_FH|D_8,N_F|D_8,N_DSH|D_8,N_DS|D_8
.byte N_CH|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_G|D_8,N_AS|D_8,N_G|D_8,N_DS|D_8
.byte N_FS|D_8,N_F|D_8,N_FS|D_8,N_F|D_8,N_FH|D_8,N_F|D_8,N_GH|D_8,N_ASH|D_8
.byte PATEND
PPDAT_World_2_pat_5_1_9:
.byte REST,CHVOLUME,4,N_CH|D_8,N_AS,REST,N_CH|D_8,N_AS,REST,N_G|D_8,N_F,REST
.byte N_G|D_8,N_F,REST,N_FS|D_8,N_DS,REST,N_FS|D_8,N_F|D_4,N_TIE,REST,N_DS|D_8
.byte N_C,REST,N_CH|D_D8,REST,N_CH|D_D8,REST,N_G|D_D8,REST,N_G|D_D8,REST
.byte N_FS|D_8,N_DS,REST,N_FS|D_8,N_G|D_4,N_TIE,REST,N_AS|D_D8,PATEND
PPDAT_World_2_pat_5_1_10:
.byte REST,N_CH|D_8,N_AS,REST,N_CH|D_8,N_AS,REST,N_G|D_8,N_F,REST,N_G|D_8,N_F
.byte REST,N_FS|D_8,N_DS,REST,N_FS|D_8,N_F|D_4,N_TIE,REST,N_DS|D_8,N_C,REST
.byte N_CH|D_D8,REST,N_CH|D_D8,REST,N_G|D_D8,REST,N_G|D_D8,REST,N_FS|D_8,N_DS
.byte REST,N_FS|D_8,N_G|D_4,N_TIE,REST,N_AS|D_D8,PATEND
PPDAT_World_2_pat_5_2_0:
.byte N_A|D_D8,REST,N_A|D_D8,REST,N_E|D_D8,REST,N_E|D_D8,REST,N_DS|D_D8,REST
.byte N_DS|D_8,N_D,REST,N_D|D_D8,REST,N_C|D_D8,REST,N_A|D_D8,REST,N_A|D_D8,REST
.byte N_E|D_D8,REST,N_E|D_D8,REST,N_DS|D_D8,REST,N_DS|D_8,N_D,REST,N_D,REST,N_D
.byte REST,N_C|D_D8,REST,PATEND
PPDAT_World_2_pat_5_2_1:
.byte N_A|D_D8,REST,N_A|D_D8,REST,N_E|D_D8,REST,N_E|D_D8,REST,N_DS|D_D8,REST
.byte N_DS|D_8,N_D,REST,N_D|D_D8,REST,N_C|D_D8,REST,N_A|D_D8,REST,N_A|D_D8,REST
.byte N_E|D_D8,REST,N_E|D_D8,REST,N_DS|D_D8,REST,N_DS|D_8,N_D,REST,N_D,REST,N_D
.byte REST,N_C|D_D8,REST,PATEND
PPDAT_World_2_pat_5_2_3:
.byte N_A|D_D8,REST,N_A|D_D8,REST,N_E|D_D8,REST,N_E|D_D8,REST,N_DS|D_D8,REST
.byte N_DS|D_8,N_D,REST,N_D|D_D8,REST,N_C|D_D8,REST,N_A|D_D8,REST,N_A|D_D8,REST
.byte N_E|D_D8,REST,N_E|D_D8,REST,N_A|D_D8,REST,N_E|D_8,N_G,REST,N_G|D_D8,REST
.byte N_A|D_D8,REST,PATEND
PPDAT_World_2_pat_5_2_4:
.byte N_A|D_D8,REST,N_A|D_D8,REST,N_E|D_D8,REST,N_E|D_D8,REST,N_DS|D_D8,REST
.byte N_DS|D_8,N_D,REST,N_D|D_D8,REST,N_C|D_D8,REST,N_A|D_D8,REST,N_A|D_D8,REST
.byte N_E|D_D8,REST,N_E|D_D8,REST,N_A|D_D8,REST,N_E|D_8,N_G,REST,N_G,REST,N_G
.byte REST,N_A|D_D8,REST,PATEND
PPDAT_World_2_pat_5_2_6:
.byte N_A|D_D8,REST,N_A|D_D8,REST,N_E|D_D8,REST,N_E|D_D8,REST,N_DS|D_D8,REST
.byte N_DS|D_8,N_D,REST,N_D|D_D8,REST,N_C|D_D8,REST,N_A|D_D8,REST,N_A|D_D8,REST
.byte N_E|D_D8,REST,N_E|D_D8,REST,N_A|D_8,N_A,REST,N_E|D_8,N_G,REST,N_G,REST
.byte N_G,REST,N_A|D_8,N_A,REST,PATEND
PPDAT_World_2_pat_5_2_7:
.byte N_CH|D_8,N_AS,REST,N_CH|D_8,N_AS,REST,N_G|D_8,N_F,REST,N_G|D_8,N_F,REST
.byte N_FS|D_8,N_DS,REST,N_FS|D_8,N_F|D_4,N_TIE,REST,N_DS|D_8,N_C,REST
.byte N_CH|D_D8,REST,N_CH|D_D8,REST,N_G|D_D8,REST,N_G|D_D8,REST,N_FS|D_8,N_DS
.byte REST,N_FS|D_8,N_G|D_4,N_TIE,REST,N_AS|D_4,PATEND
PPDAT_World_2_pat_5_2_8:
.byte N_CH|D_8,N_AS,REST,N_CH|D_8,N_AS,REST,N_G|D_8,N_F,REST,N_G|D_8,N_F,REST
.byte N_FS|D_8,N_DS,REST,N_FS|D_8,N_F|D_4,N_TIE,REST,N_DS|D_8,N_C,REST
.byte N_CH|D_D8,REST,N_CH|D_D8,REST,N_G|D_D8,REST,N_G|D_D8,REST,N_FS|D_8,N_DS
.byte REST,N_FS|D_8,N_G|D_4,N_TIE,REST,N_AS|D_4,PATEND
PPDAT_World_2_pat_5_3_0:
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum1|D_8,DR_autodrum6|D_8,DR_autodrum10|D_8
.byte DR_autodrum1|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum1|D_8,DR_autodrum9|D_8,DR_autodrum1|D_8
.byte PATEND
PPDAT_World_2_pat_5_3_1:
.byte DR_autodrum17|D_1,N_TIE|D_1,N_TIE|D_1,N_TIE|D_1,PATEND
PPDAT_World_2_pat_5_3_2:
.byte DR_autodrum6|D_4,DR_autodrum1|D_4,DR_autodrum6|D_4,DR_autodrum1|D_4
.byte DR_autodrum6|D_4,DR_autodrum1|D_D4,DR_autodrum1|D_8,DR_autodrum6|D_4
.byte DR_autodrum1|D_4,DR_autodrum6|D_4,DR_autodrum6|D_4,DR_autodrum1|D_4
.byte DR_autodrum6|D_4,DR_autodrum1|D_4,DR_autodrum6|D_8,DR_autodrum1|D_4
.byte DR_autodrum1|D_8,PATEND
PPDAT_World_2_pat_5_3_3:
.byte DR_autodrum17|D_2,DR_autodrum6|D_2,DR_autodrum6|D_2,DR_autodrum6|D_2
.byte DR_autodrum6|D_2,DR_autodrum6|D_2,DR_autodrum6|D_8,DR_autodrum6|D_D4
.byte DR_autodrum6|D_4,DR_autodrum10|D_4,PATEND
PPDAT_World_2_pat_5_3_4:
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum6|D_8,DR_autodrum10|D_8
.byte DR_autodrum1|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum1|D_8,DR_autodrum10|D_8,DR_autodrum1|D_8
.byte PATEND
PPDAT_World_2_pat_5_3_6:
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum1|D_8,DR_autodrum6|D_8,DR_autodrum10|D_8
.byte DR_autodrum1|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum1|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum6|D_8,DR_autodrum9|D_8,DR_autodrum6|D_8
.byte DR_autodrum9|D_8,DR_autodrum9|D_8,DR_autodrum9|D_8,DR_autodrum9|D_8
.byte PATEND
PPDAT_World_5_pat_6_0_0:
.byte CHVOLUME,3,VIBRATO,1,N_C|D_4,N_G|D_4,N_E|D_4,N_B|D_4,N_C|D_4,N_G|D_4
.byte N_E|D_4,N_A|D_4,N_C|D_4,N_G|D_4,N_E|D_4,N_B|D_4,N_C|D_4,N_G|D_4,N_E|D_4
.byte N_A|D_4,PATEND
PPDAT_World_5_pat_6_0_1:
.byte N_C|D_4,N_G|D_4,N_E|D_4,N_B|D_4,N_C|D_4,N_G|D_4,N_E|D_4,N_A|D_4,N_C|D_4
.byte N_G|D_4,N_E|D_4,N_B|D_4,N_C|D_4,N_G|D_4,N_E|D_4,N_E|D_4,PATEND
PPDAT_World_5_pat_6_0_2:
.byte N_C|D_4,N_G|D_4,N_E|D_4,N_B|D_4,N_C|D_4,N_G|D_4,N_E|D_4,N_A|D_4,N_C|D_4
.byte N_G|D_4,N_E|D_4,N_B|D_4,N_C|D_4,N_G|D_4,N_E|D_4,N_E|D_4,PATEND
PPDAT_World_5_pat_6_0_3:
.byte N_C|D_4,N_G|D_4,N_E|D_4,N_B|D_4,N_C|D_4,N_G|D_4,N_E|D_4,N_A|D_4,N_C|D_4
.byte N_G|D_4,N_E|D_4,N_B|D_4,N_C|D_4,N_G|D_4,N_E|D_4,N_E|D_4,PATEND
PPDAT_World_5_pat_6_0_10:
.byte N_DS|D_4,N_AS|D_4,N_G|D_4,N_DH|D_4,N_DS|D_4,N_AS|D_4,N_G|D_4,N_CH|D_4
.byte N_DS|D_4,N_AS|D_4,N_G|D_4,N_DH|D_4,N_GH|D_4,N_DH|D_4,N_G|D_4,N_C|D_4
.byte PATEND
PPDAT_World_5_pat_6_0_11:
.byte CHVOLUME,3,VIBRATO,0,N_C,CHVOLUME,1,N_C,CHVOLUME,3,N_E,CHVOLUME,1,N_C
.byte CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3
.byte N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_B
.byte CHVOLUME,1,N_G,CHVOLUME,3,N_CH,CHVOLUME,1,N_B,CHVOLUME,3,N_C,CHVOLUME,1
.byte N_CH,CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E
.byte CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3
.byte N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_A,CHVOLUME,1,N_G,CHVOLUME,3,N_E
.byte CHVOLUME,1,N_A,CHVOLUME,3,N_C,CHVOLUME,1,N_E,CHVOLUME,3,N_E,CHVOLUME,1
.byte N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_C,CHVOLUME,1,N_G
.byte CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3
.byte N_B,CHVOLUME,1,N_G,CHVOLUME,3,N_CH,CHVOLUME,1,N_B,CHVOLUME,3,N_C
.byte CHVOLUME,1,N_CH,CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1
.byte N_E,CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_E,CHVOLUME,1,N_C
.byte CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_E,CHVOLUME,1,N_G,CHVOLUME,3
.byte N_C,CHVOLUME,1,N_E,PATEND
PPDAT_World_5_pat_6_0_12:
.byte CHVOLUME,3,N_C,CHVOLUME,1,N_C,CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3
.byte N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_E
.byte CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_B,CHVOLUME,1
.byte N_G,CHVOLUME,3,N_CH,CHVOLUME,1,N_B,CHVOLUME,3,N_C,CHVOLUME,1,N_CH
.byte CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3
.byte N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G
.byte CHVOLUME,1,N_E,CHVOLUME,3,N_A,CHVOLUME,1,N_G,CHVOLUME,3,N_E,CHVOLUME,1
.byte N_A,CHVOLUME,3,N_C,CHVOLUME,1,N_E,CHVOLUME,3,N_E,CHVOLUME,1,N_C
.byte CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3
.byte N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_B
.byte CHVOLUME,1,N_G,CHVOLUME,3,N_CH,CHVOLUME,1,N_B,CHVOLUME,3,N_C,CHVOLUME,1
.byte N_CH,CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E
.byte CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3
.byte N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_E,CHVOLUME,1,N_G,CHVOLUME,3,N_C
.byte CHVOLUME,1,N_E,PATEND
PPDAT_World_5_pat_6_0_13:
.byte CHVOLUME,3,N_C,CHVOLUME,1,N_C,CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3
.byte N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_E
.byte CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3,N_B,CHVOLUME,1
.byte N_G,CHVOLUME,3,N_CH,CHVOLUME,1,N_B,CHVOLUME,3,N_C,CHVOLUME,1,N_CH
.byte CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_E,CHVOLUME,3
.byte N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_E,CHVOLUME,1,N_C,CHVOLUME,3,N_G
.byte CHVOLUME,1,N_E,CHVOLUME,3,N_A,CHVOLUME,1,N_G,CHVOLUME,3,N_E,CHVOLUME,1
.byte N_A,CHVOLUME,3,N_D,CHVOLUME,1,N_FS,CHVOLUME,3,N_FS,CHVOLUME,1,N_D
.byte CHVOLUME,3,N_A,CHVOLUME,1,N_FS,CHVOLUME,3,N_D,CHVOLUME,1,N_A,CHVOLUME,3
.byte N_FS,CHVOLUME,1,N_D,CHVOLUME,3,N_A,CHVOLUME,1,N_FS,CHVOLUME,3,N_CSH
.byte CHVOLUME,1,N_A,CHVOLUME,3,N_DH,CHVOLUME,1,N_CSH,CHVOLUME,3,N_E,CHVOLUME,1
.byte N_EH,CHVOLUME,3,N_GS,CHVOLUME,1,N_E,CHVOLUME,3,N_B,CHVOLUME,1,N_GS
.byte CHVOLUME,3,N_E,CHVOLUME,1,N_B,CHVOLUME,3,N_GS,CHVOLUME,1,N_E,CHVOLUME,3
.byte N_B,CHVOLUME,1,N_GS,CHVOLUME,3,N_GS,CHVOLUME,1,N_B,CHVOLUME,3,N_E
.byte CHVOLUME,1,N_GS,PATEND
PPDAT_World_5_pat_6_0_14:
.byte REST,CHVOLUME,3,N_C,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G
.byte REST,N_B,REST,N_CH,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G
.byte REST,N_A,REST,N_E,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G
.byte REST,N_B,REST,N_CH,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G
.byte REST,N_E,PATEND
PPDAT_World_5_pat_6_0_15:
.byte REST,N_C,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_B
.byte REST,N_CH,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_A
.byte REST,N_E,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_B
.byte REST,N_CH,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_E
.byte PATEND
PPDAT_World_5_pat_6_0_16:
.byte REST,N_E,REST,N_E,REST,N_GS,REST,N_B,REST,N_E,REST,N_GS,REST,N_B,REST
.byte N_DSH,REST,N_EH,REST,N_E,REST,N_GS,REST,N_B,REST,N_E,REST,N_GS,REST,N_B
.byte REST,N_CSH,REST,N_D,REST,N_D,REST,N_FS,REST,N_A,REST,N_D,REST,N_FS,REST
.byte N_A,REST,N_CSH,REST,N_C,REST,N_C,REST,N_E,REST,N_G,INSTRUMENT,PI_Harp
.byte CHVOLUME,1,N_E|D_8,CHVOLUME,2,N_G|D_8,CHVOLUME,3,N_B|D_8,CHVOLUME,4
.byte N_C|D_8,PATEND
PPDAT_World_5_pat_6_1_0:
.byte REST|D_8,CHVOLUME,3,VIBRATO,1,N_E|D_4,N_C|D_4,N_G|D_4,N_CH|D_4,N_E|D_4
.byte N_C|D_4,N_G|D_4,N_E|D_4,N_E|D_4,N_C|D_4,N_G|D_4,N_CH|D_4,N_E|D_4,N_C|D_4
.byte N_G|D_4,N_E|D_8,PATEND
PPDAT_World_5_pat_6_1_1:
.byte REST|D_8,N_E|D_4,N_C|D_4,N_G|D_4,N_CH|D_4,N_E|D_4,N_C|D_4,N_G|D_4,N_E|D_4
.byte N_E|D_4,N_C|D_4,N_G|D_4,N_CH|D_4,N_E|D_4,N_C|D_4,N_G|D_4,N_C|D_8,PATEND
PPDAT_World_5_pat_6_1_2:
.byte REST|D_8,N_E|D_4,N_C|D_4,N_G|D_4,N_CH|D_4,N_E|D_4,N_C|D_4,N_G|D_4,N_E|D_4
.byte N_E|D_4,N_C|D_4,N_G|D_4,N_CH|D_4,N_E|D_4,N_C|D_4,N_G|D_4,N_C|D_8,PATEND
PPDAT_World_5_pat_6_1_3:
.byte REST|D_8,N_E|D_4,N_C|D_4,N_G|D_4,N_CH|D_4,N_E|D_4,N_C|D_4,N_G|D_4,N_E|D_4
.byte N_E|D_4,N_C|D_4,N_G|D_4,N_CH|D_4,N_E|D_4,N_C|D_4,N_G|D_4,N_C|D_8,PATEND
PPDAT_World_5_pat_6_1_10:
.byte REST|D_8,N_A|D_4,N_F|D_4,N_CH|D_4,N_FH|D_4,N_A|D_4,N_F|D_4,N_CH|D_4
.byte N_A|D_4,N_A|D_4,N_F|D_4,N_CH|D_4,N_FH|D_4,N_FH|D_4,N_CH|D_4,N_F|D_4
.byte N_C|D_8,PATEND
PPDAT_World_5_pat_6_1_11:
.byte CHVOLUME,4,VIBRATO,1,N_A|D_D4,N_G|D_D4,N_E|D_4,N_C|D_D4,N_D|D_D4,N_C|D_4
.byte N_A|D_D4,N_G|D_D4,N_E|D_4,N_C|D_4,N_C|D_4,N_D|D_4,N_E|D_4,PATEND
PPDAT_World_5_pat_6_1_12:
.byte N_F|D_D4,N_DS|D_D4,N_C|D_4,N_F|D_D4,N_DS|D_D4,N_C|D_4,N_F|D_D4,N_DS|D_D4
.byte N_C|D_4,N_F|D_4,N_C|D_4,N_DS|D_4,N_F|D_4,PATEND
PPDAT_World_5_pat_6_1_13:
.byte N_A|D_4,N_E|D_8,N_G|D_D4,N_E|D_8,N_D|D_8,N_C|D_4,N_C|D_4,N_D|D_4,N_C|D_4
.byte N_A|D_D4,N_G|D_D4,N_E|D_4,N_D|D_8,N_C|D_8,N_E|D_4,N_D|D_4,N_E|D_4,PATEND
PPDAT_World_5_pat_6_1_14:
.byte N_F|D_D4,N_DS|D_D4,N_C|D_4,N_F|D_D4,N_DS|D_D4,N_C|D_4,N_G|D_D4,N_F|D_D4
.byte N_D|D_4,N_C|D_8,N_E|D_8,N_G|D_4,N_E|D_4,N_CH|D_4,PATEND
PPDAT_World_5_pat_6_1_15:
.byte REST,CHVOLUME,1,VIBRATO,0,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST
.byte N_G,REST,N_B,REST,N_CH,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST
.byte N_G,REST,N_A,REST,N_E,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST
.byte N_G,REST,N_B,REST,N_CH,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST
.byte N_G,REST,N_E,REST,N_C,PATEND
PPDAT_World_5_pat_6_1_16:
.byte CHVOLUME,1,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,CHVOLUME,2,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_C|D_8,CHVOLUME,3,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_C|D_8,N_C|D_8,CHVOLUME,2,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte CHVOLUME,1,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,PATEND
PPDAT_World_5_pat_6_1_17:
.byte CHVOLUME,1,N_E|D_8,N_E|D_8,CHVOLUME,2,N_E|D_8,N_E|D_8,CHVOLUME,3,N_E|D_8
.byte N_E|D_8,CHVOLUME,2,N_E|D_8,N_E|D_8,CHVOLUME,1,N_E|D_8,N_E|D_8,CHVOLUME,2
.byte N_E|D_8,N_E|D_8,CHVOLUME,3,N_E|D_8,N_E|D_8,CHVOLUME,2,N_E|D_8,N_E|D_8
.byte CHVOLUME,1,N_D|D_8,N_D|D_8,CHVOLUME,2,N_D|D_8,N_D|D_8,CHVOLUME,3,N_D|D_8
.byte N_D|D_8,CHVOLUME,2,N_D|D_8,N_D|D_8,CHVOLUME,1,N_C|D_8,N_C|D_8,CHVOLUME,2
.byte N_C|D_8,N_C|D_8,CHVOLUME,3,N_C|D_8,N_C|D_8,CHVOLUME,2,N_C|D_8,N_C|D_8
.byte PATEND
PPDAT_World_5_pat_6_2_1:
.byte N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8
.byte N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8
.byte N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8
.byte N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DS|D_8,N_D|D_8,N_CS|D_8,N_C|D_8
.byte PATEND
PPDAT_World_5_pat_6_2_2:
.byte N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,PATEND
PPDAT_World_5_pat_6_2_3:
.byte N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,N_C|D_8,PATEND
PPDAT_World_5_pat_6_2_4:
.byte N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8
.byte N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8
.byte N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8
.byte N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_GS|D_8,N_DS|D_8,N_C|D_8
.byte PATEND
PPDAT_World_5_pat_6_2_5:
.byte N_C|D_4,N_CHH,REST,N_CHH,REST,TRANSPOSE,<-5,N_C|D_4,N_CHH,REST,N_CHH,REST
.byte TRANSPOSE,<-3,N_C|D_4,TRANSPOSE,<27,N_C,REST,N_F,REST,TRANSPOSE,<-31
.byte N_C|D_4,N_CHH,REST,N_CHH,REST|D_4,N_TIE,N_CH|D_4,REST|D_4,N_G|D_4
.byte REST|D_4,N_E|D_4,N_E|D_8,N_CH|D_8,N_G|D_8,N_E|D_8,TRANSPOSE,<12,PATEND
PPDAT_World_5_pat_6_2_7:
.byte N_C|D_4,N_CHH,REST,N_CHH,REST,TRANSPOSE,<-5,N_C|D_4,N_CHH,REST,N_CHH,REST
.byte TRANSPOSE,<-3,N_C|D_4,TRANSPOSE,<27,N_C,REST,N_F,REST,TRANSPOSE,<-31
.byte N_C|D_4,N_CHH,REST,N_CHH,REST|D_4,N_TIE,N_CH|D_4,REST|D_4,N_G|D_4
.byte REST|D_4,N_E|D_4,N_G|D_8,N_CH|D_8,N_G|D_8,N_E|D_8,TRANSPOSE,<12,PATEND
PPDAT_World_5_pat_6_2_8:
.byte N_C|D_4,N_CHH,REST,N_CHH,REST,TRANSPOSE,<-5,N_C|D_4,N_CHH,REST,N_CHH,REST
.byte TRANSPOSE,<-3,N_C|D_8,TRANSPOSE,<32,N_C,REST,N_C,REST,N_C,REST
.byte TRANSPOSE,<-36,N_C|D_4,N_CHH,REST,N_CHH,REST,N_CH|D_4,TRANSPOSE,<36,N_C
.byte REST,N_C,REST,TRANSPOSE,<-29,N_C|D_4,N_CHH,REST,N_CHH,REST,TRANSPOSE,<-3
.byte N_C|D_8,TRANSPOSE,<32,N_C,REST,N_C,REST,N_C,REST,TRANSPOSE,<-36,N_C|D_4
.byte N_CHH,REST,N_CHH,REST,TRANSPOSE,<12,PATEND
PPDAT_World_5_pat_6_2_9:
.byte N_C|D_4,N_CHH,REST,N_CHH,REST,TRANSPOSE,<-5,N_C|D_4,N_CHH,REST,N_CHH,REST
.byte TRANSPOSE,<-3,N_C|D_8,TRANSPOSE,<32,N_C,REST,N_C,REST,N_C,REST
.byte TRANSPOSE,<-36,N_C|D_4,N_CHH,REST,N_CHH,REST,INSTRUMENT,PI_Triangle_Short
.byte N_C,N_E,N_G,N_CH,N_E,N_G,N_CH,N_EH,N_G,N_CH,N_EH,N_GH,N_CHH,TRANSPOSE,<28
.byte N_C,N_DS,N_GS,N_C,N_DS,N_GS,N_CH,N_DS,N_GS,N_CH,N_DSH,N_GSH,N_DSH,N_CH
.byte N_GS,N_DSH,N_CH,N_GS,N_DS,TRANSPOSE,<-16,PATEND
PPDAT_World_5_pat_6_2_12:
.byte N_C|D_4,N_CHH,REST,N_CHH,REST,TRANSPOSE,<-5,N_C|D_4,N_CHH,REST,N_CHH,REST
.byte TRANSPOSE,<-3,N_C|D_4,TRANSPOSE,<27,N_C,REST,N_F,REST,TRANSPOSE,<-31
.byte N_C|D_4,N_CHH,REST,N_CHH,REST|D_4,N_TIE,N_CH|D_4,REST|D_4,N_G|D_4
.byte REST|D_4,N_E|D_4,N_G|D_8,N_CH|D_8,N_G|D_8,N_E|D_8,TRANSPOSE,<12,PATEND
PPDAT_World_5_pat_6_2_13:
.byte N_C|D_4,N_CHH,REST,N_CHH,REST,TRANSPOSE,<-5,N_C|D_4,N_CHH,REST,N_CHH,REST
.byte TRANSPOSE,<-3,N_C|D_4,TRANSPOSE,<27,N_C,REST,N_F,REST,TRANSPOSE,<-31
.byte N_C|D_4,N_CHH,REST,N_CHH,REST|D_4,N_TIE,N_DH|D_4,REST|D_4,N_A|D_4
.byte REST|D_4,N_GS|D_4,N_B|D_8,N_EH|D_8,N_B|D_8,N_GS|D_8,TRANSPOSE,<12,PATEND
PPDAT_World_5_pat_6_2_14:
.byte N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_B,REST,N_CH,REST
.byte N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_A,REST,N_E,REST
.byte N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_B,REST,N_CH,REST
.byte N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_E,REST,N_C,REST
.byte PATEND
PPDAT_World_5_pat_6_2_15:
.byte N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_B,REST,N_CH,REST
.byte N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_A,REST,N_E,REST
.byte N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_B,REST,N_CH,REST
.byte N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_E,REST,N_C,REST
.byte PATEND
PPDAT_World_5_pat_6_2_16:
.byte N_E,REST,N_GS,REST,N_B,REST,N_E,REST,N_GS,REST,N_B,REST,N_DSH,REST,N_EH
.byte REST,N_E,REST,N_GS,REST,N_B,REST,N_E,REST,N_GS,REST,N_B,REST,N_CSH,REST
.byte N_GS,REST,N_D,REST,N_FS,REST,N_A,REST,N_D,REST,N_FS,REST,N_A,REST,N_CSH
.byte REST,N_DH,REST,N_C,REST,N_E,REST,N_G,REST,N_C,REST,N_E,REST,N_G,REST,N_B
.byte REST,N_CH,REST,PATEND
PPDAT_World_5_pat_6_3_1:
.byte DR_autodrum14|D_1,N_TIE|D_1,N_TIE|D_1,N_TIE|D_1,PATEND
PPDAT_World_5_pat_6_3_5:
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte PATEND
PPDAT_World_5_pat_6_3_9:
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum7|D_8,DR_autodrum10|D_4,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum10|D_4,DR_autodrum7|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_4,DR_autodrum14|D_4,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte PATEND
PPDAT_World_5_pat_6_3_11:
.byte DR_autodrum17|D_D4,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,PATEND
PPDAT_World_5_pat_6_3_15:
.byte DR_autodrum17|D_1,N_TIE|D_1,DR_autodrum17|D_1,DR_autodrum17|D_1,PATEND
PPDAT_Minor_Boss_pat_7_0_0:
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_E|D_4,N_EH|D_8,CHVOLUME,1,N_TIE|D_8
.byte CHVOLUME,4,N_E|D_8,N_EH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_E|D_8
.byte N_EH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_E|D_8,N_EH|D_8,N_E|D_8
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_EH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4
.byte N_C|D_4,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,CHVOLUME,1,N_TIE|D_8
.byte CHVOLUME,4,N_C|D_8,N_CH|D_8,N_C|D_4,N_CH|D_8,PATEND
PPDAT_Minor_Boss_pat_7_0_1:
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_F|D_4,N_FH|D_8,CHVOLUME,1,N_TIE|D_8
.byte CHVOLUME,4,N_F|D_8,N_FH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_F|D_8
.byte N_FH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_F|D_8,N_FH|D_8,N_F|D_8
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_FH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4
.byte N_C|D_4,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,CHVOLUME,1,N_TIE|D_8
.byte CHVOLUME,4,N_C|D_8,N_CH|D_8,N_C|D_4,N_CH|D_8,PATEND
PPDAT_Minor_Boss_pat_7_0_2:
.byte CHVOLUME,4,VIBRATO,1,N_D|D_D4,N_F|D_D4,N_C|D_4,N_D|D_D4,N_F|D_D4,N_C|D_4
.byte N_D|D_D4,N_F|D_D4,N_C|D_4,N_D|D_4,N_D|D_4,N_F|D_4,N_C|D_4,PATEND
PPDAT_Minor_Boss_pat_7_0_3:
.byte CHVOLUME,4,VIBRATO,1,N_F|D_D4,N_AS|D_D4,N_DS|D_4,N_F|D_D4,N_AS|D_D4
.byte N_DS|D_4,N_F|D_D4,N_G|D_D4,N_F|D_4,N_G|D_4,N_G|D_4,N_F|D_4,N_DS|D_8
.byte N_C|D_8,PATEND
PPDAT_Minor_Boss_pat_7_0_4:
.byte CHVOLUME,4,VIBRATO,1,N_E|D_4,INSTRUMENT,PI_Tribal_Hit,N_E|D_8
.byte INSTRUMENT,PI_Miniboss_Flute,N_G|D_D4,N_D|D_8,INSTRUMENT,PI_Tribal_Hit
.byte N_E|D_8,INSTRUMENT,PI_Miniboss_Flute,N_E|D_4,INSTRUMENT,PI_Tribal_Hit
.byte N_E|D_8,INSTRUMENT,PI_Miniboss_Flute,N_G|D_D4,N_D|D_4,N_E|D_4
.byte INSTRUMENT,PI_Tribal_Hit,N_C|D_8,INSTRUMENT,PI_Miniboss_Flute,N_G|D_D4
.byte N_D|D_8,INSTRUMENT,PI_Tribal_Hit,N_C|D_8,INSTRUMENT,PI_Miniboss_Flute
.byte N_E|D_4,INSTRUMENT,PI_Tribal_Hit,N_C|D_4,INSTRUMENT,PI_Miniboss_Flute
.byte N_G|D_4,N_D|D_4,PATEND
PPDAT_Minor_Boss_pat_7_0_5:
.byte CHVOLUME,4,VIBRATO,1,N_F|D_4,INSTRUMENT,PI_Tribal_Hit,N_F|D_8
.byte INSTRUMENT,PI_Miniboss_Flute,N_AS|D_D4,N_DS|D_8,INSTRUMENT,PI_Tribal_Hit
.byte N_F|D_8,INSTRUMENT,PI_Miniboss_Flute,N_F|D_4,INSTRUMENT,PI_Tribal_Hit
.byte N_F|D_8,INSTRUMENT,PI_Miniboss_Flute,N_DS|D_D4,N_C|D_4,N_DS|D_4
.byte INSTRUMENT,PI_Tribal_Hit,N_DS|D_8,INSTRUMENT,PI_Miniboss_Flute,N_C|D_D4
.byte N_DS|D_8,INSTRUMENT,PI_Tribal_Hit,N_C|D_8,INSTRUMENT,PI_Miniboss_Flute
.byte N_G|D_8,INSTRUMENT,PI_Tribal_Hit,N_G|D_8,INSTRUMENT,PI_Miniboss_Flute
.byte N_F|D_4,INSTRUMENT,PI_Tribal_Hit,N_DS|D_4,N_C|D_4,PATEND
PPDAT_Minor_Boss_pat_7_0_6:
.byte CHVOLUME,3,VIBRATO,0,N_E|D_8,N_E|D_8,N_EH|D_8,N_E|D_8,N_E|D_8,N_EH|D_8
.byte N_E|D_8,N_EH|D_8,N_E|D_8,N_E|D_8,N_EH|D_8,N_E|D_8,N_E|D_8,N_E|D_8
.byte N_EH|D_8,N_E|D_8,VIBRATO,0,N_C|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_C|D_8
.byte N_CH|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_CH|D_8,N_C|D_8,PATEND
PPDAT_Minor_Boss_pat_7_0_7:
.byte CHVOLUME,3,VIBRATO,0,N_DS|D_8,N_DS|D_8,N_DSH|D_8,N_DS|D_8,N_DS|D_8
.byte N_DSH|D_8,N_DS|D_8,N_DSH|D_8,N_DS|D_8,N_DS|D_8,N_DSH|D_8,N_DS|D_8
.byte N_DS|D_8,N_DS|D_8,N_DSH|D_8,N_DS|D_8,VIBRATO,0,N_C|D_8,N_C|D_8,N_CH|D_8
.byte N_C|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_C|D_8,N_CH|D_8
.byte N_C|D_8,N_C|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,PATEND
PPDAT_Minor_Boss_pat_7_0_8:
.byte CHVOLUME,3,VIBRATO,0,N_E|D_8,N_E|D_8,N_EH|D_8,N_E|D_8,N_E|D_8,N_E|D_8
.byte N_DH|D_8,N_EH|D_8,N_E|D_8,N_E|D_8,N_EH|D_8,N_E|D_8,N_E|D_8,N_E|D_8
.byte N_GH|D_8,N_E|D_8,VIBRATO,0,N_C|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_C|D_8
.byte N_C|D_8,N_B|D_8,N_CH|D_8,N_C|D_8,N_C|D_8,N_CH|D_8,N_C|D_8,N_C|D_8,N_C|D_8
.byte N_A|D_8,N_C|D_8,PATEND
PPDAT_Minor_Boss_pat_7_0_9:
.byte CHVOLUME,3,VIBRATO,0,N_DS|D_8,N_DS|D_8,N_DSH|D_8,N_DS|D_8,N_DS|D_8
.byte N_DS|D_8,N_CSH|D_8,N_DSH|D_8,N_DS|D_8,N_DS|D_8,N_DSH|D_8,N_DS|D_8
.byte N_DS|D_8,N_DS|D_8,N_FH|D_8,N_DS|D_8,VIBRATO,0,N_DS|D_8,N_DS|D_8,N_CSH|D_8
.byte N_DSH|D_8,N_DS|D_8,N_DS|D_8,N_CSH|D_8,N_DSH|D_8,N_C|D_8,N_C|D_8,N_DSH|D_8
.byte N_DS|D_8,N_DS|D_8,N_DS|D_8,N_DSH|D_8,N_CH|D_8,PATEND
PPDAT_Minor_Boss_pat_7_0_10:
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_CH|D_4,N_CHH|D_8,CHVOLUME,1,N_TIE|D_8
.byte CHVOLUME,4,N_CH|D_8,N_CHH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_CH|D_8
.byte N_CHH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_CH|D_8,N_CHH|D_8,N_CH|D_8
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_CHH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4
.byte N_C|D_4,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,CHVOLUME,1,N_TIE|D_8
.byte CHVOLUME,4,N_C|D_8,N_CH|D_8,N_C|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4
.byte N_CH|D_8,PATEND
PPDAT_Minor_Boss_pat_7_1_0:
.byte REST|D_2,ARPEGGIO,$47,N_DS|D_1,N_DS|D_1,ARPEGGIO,$37,N_C|D_1,N_C|D_2
.byte PATEND
PPDAT_Minor_Boss_pat_7_1_1:
.byte REST|D_2,ARPEGGIO,$47,N_C|D_1,N_C|D_1,ARPEGGIO,$37,N_D|D_1,ARPEGGIO,$59
.byte N_C|D_2,PATEND
PPDAT_Minor_Boss_pat_7_1_2:
.byte ARPEGGIO,$00,N_DS|D_8,N_G|D_8,N_AS|D_8,N_G|D_8,INSTRUMENT,PI_Boss_Arp_Hit
.byte ARPEGGIO,$47,N_DS|D_4,INSTRUMENT,PI_Pizzicato_Strings,ARPEGGIO,$00
.byte N_AS|D_8,N_G|D_8,N_DS|D_8,N_G|D_8,N_AS|D_8,N_G|D_8
.byte INSTRUMENT,PI_Boss_Arp_Hit,ARPEGGIO,$47,N_DS|D_4
.byte INSTRUMENT,PI_Pizzicato_Strings,ARPEGGIO,$00,N_AS|D_8,N_F|D_8,N_C|D_8
.byte N_DS|D_8,N_G|D_8,N_DS|D_8,INSTRUMENT,PI_Boss_Arp_Hit,ARPEGGIO,$37,N_C|D_4
.byte INSTRUMENT,PI_Pizzicato_Strings,ARPEGGIO,$00,N_G|D_8,N_DS|D_8,N_C|D_8
.byte N_DS|D_8,N_G|D_8,N_DS|D_8,INSTRUMENT,PI_Boss_Arp_Hit,ARPEGGIO,$37,N_C|D_4
.byte INSTRUMENT,PI_Pizzicato_Strings,ARPEGGIO,$00,N_DS|D_8,N_DS|D_8,PATEND
PPDAT_Minor_Boss_pat_7_1_3:
.byte N_G|D_8,N_CH|D_8,N_G|D_8,N_F|D_8,INSTRUMENT,PI_Boss_Arp_Hit,ARPEGGIO,$47
.byte N_C|D_4,INSTRUMENT,PI_Pizzicato_Strings,ARPEGGIO,$00,N_CH|D_8,N_F|D_8
.byte N_G|D_8,N_CH|D_8,N_G|D_8,N_F|D_8,INSTRUMENT,PI_Boss_Arp_Hit,ARPEGGIO,$47
.byte N_C|D_4,INSTRUMENT,PI_Pizzicato_Strings,ARPEGGIO,$00,N_CH|D_8,N_F|D_8
.byte N_D|D_8,N_F|D_8,N_A|D_8,N_DH|D_8,INSTRUMENT,PI_Boss_Arp_Hit,ARPEGGIO,$37
.byte N_D|D_4,INSTRUMENT,PI_Pizzicato_Strings,ARPEGGIO,$00,N_DH|D_8,N_A|D_8
.byte N_D|D_8,N_F|D_8,N_D|D_8,N_C|D_8,INSTRUMENT,PI_Boss_Arp_Hit,ARPEGGIO,$59
.byte N_C|D_4,INSTRUMENT,PI_Pizzicato_Strings,ARPEGGIO,$00,N_CH|D_8,N_DH|D_8
.byte PATEND
PPDAT_Minor_Boss_pat_7_1_6:
.byte CHVOLUME,3,VIBRATO,2,N_G|D_1,N_TIE|D_D2,CHVOLUME,1,N_G|D_4,CHVOLUME,3
.byte N_DS|D_1,N_TIE|D_2,N_TIE|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,3,N_C|D_8
.byte CHVOLUME,1,N_TIE|D_8,PATEND
PPDAT_Minor_Boss_pat_7_1_7:
.byte CHVOLUME,3,VIBRATO,2,N_G|D_1,N_TIE|D_D2,CHVOLUME,1,N_A|D_4,CHVOLUME,3
.byte N_F|D_1,N_D|D_2,N_C|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,3,N_D|D_8
.byte CHVOLUME,1,N_TIE|D_8,PATEND
PPDAT_Minor_Boss_pat_7_1_9:
.byte CHVOLUME,3,VIBRATO,2,N_C|D_1,N_TIE|D_D2,CHVOLUME,1,N_C|D_4,CHVOLUME,3
.byte N_F|D_2,N_TIE|D_8,CHVOLUME,1,N_F|D_8,CHVOLUME,3,N_D|D_8,CHVOLUME,1
.byte N_TIE|D_8,CHVOLUME,3,N_F|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,3,N_D|D_8
.byte N_F|D_4,CHVOLUME,1,N_TIE|D_8,CHVOLUME,3,N_D|D_8,CHVOLUME,1,N_TIE|D_8
.byte PATEND
PPDAT_Minor_Boss_pat_7_1_10:
.byte CHVOLUME,3,N_DH|D_4,CHVOLUME,2,N_TIE|D_8,CHVOLUME,1,N_TIE|D_8
.byte INSTRUMENT,PI_Boss_Arp_Hit,CHVOLUME,4,VIBRATO,0,ARPEGGIO,$37,N_D|D_1
.byte N_D|D_1,N_D|D_1,ARPEGGIO,$59,N_C|D_2,PATEND
PPDAT_Minor_Boss_pat_7_2_0:
.byte N_E|D_4,INSTRUMENT,PI_Boss_Bass,N_EH|D_8,REST|D_8,N_E|D_8,N_EH|D_8
.byte REST|D_8,N_E|D_8,N_EH|D_8,REST|D_8,N_E|D_8,N_EH|D_8,N_E|D_4,N_EH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,N_C|D_8,INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_C|D_8,N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,PATEND
PPDAT_Minor_Boss_pat_7_2_1:
.byte N_F|D_4,INSTRUMENT,PI_Boss_Bass,N_FH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_F|D_8,INSTRUMENT,PI_Boss_Bass,N_FH|D_8,REST|D_8,N_F|D_8
.byte INSTRUMENT,PI_Blank,N_FH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_F|D_8
.byte N_FH|D_8,INSTRUMENT,PI_Blank,N_F|D_4,INSTRUMENT,PI_Boss_Bass,N_FH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,N_C|D_8,INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8,N_C|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,PATEND
PPDAT_Minor_Boss_pat_7_2_2:
.byte N_E|D_4,INSTRUMENT,PI_Boss_Bass,N_EH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_E|D_8,INSTRUMENT,PI_Boss_Bass,N_EH|D_8,REST|D_8,N_E|D_8
.byte INSTRUMENT,PI_Blank,N_EH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_E|D_8
.byte N_EH|D_8,INSTRUMENT,PI_Blank,N_E|D_4,INSTRUMENT,PI_Boss_Bass,N_EH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,N_C|D_8,INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_C|D_8,N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,PATEND
PPDAT_Minor_Boss_pat_7_2_3:
.byte N_F|D_4,INSTRUMENT,PI_Boss_Bass,N_FH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_F|D_8,INSTRUMENT,PI_Boss_Bass,N_FH|D_8,REST|D_8,N_F|D_8
.byte INSTRUMENT,PI_Blank,N_FH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_F|D_8
.byte N_FH|D_8,INSTRUMENT,PI_Blank,N_F|D_4,INSTRUMENT,PI_Boss_Bass,N_FH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,N_C|D_8,INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_C|D_8,N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,PATEND
PPDAT_Minor_Boss_pat_7_2_6:
.byte N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_DS|D_4,INSTRUMENT,PI_Boss_Bass,N_DSH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_DS|D_8,INSTRUMENT,PI_Boss_Bass,N_DSH|D_8
.byte REST|D_8,N_DS|D_8,INSTRUMENT,PI_Blank,N_DSH|D_8,REST|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_DS|D_8,N_DSH|D_8,INSTRUMENT,PI_Blank,N_DS|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_DSH|D_8,REST|D_8,PATEND
PPDAT_Minor_Boss_pat_7_2_7:
.byte N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_D|D_4,INSTRUMENT,PI_Boss_Bass,N_DH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_D|D_8,INSTRUMENT,PI_Boss_Bass,N_DH|D_8
.byte REST|D_8,N_D|D_8,INSTRUMENT,PI_Blank,N_DH|D_8,REST|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_D|D_8,N_DH|D_8,INSTRUMENT,PI_Blank,N_D|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_DH|D_8,REST|D_8,PATEND
PPDAT_Minor_Boss_pat_7_2_9:
.byte N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_D|D_4,INSTRUMENT,PI_Boss_Bass,N_DH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_D|D_8,INSTRUMENT,PI_Boss_Bass,N_DH|D_8
.byte REST|D_8,N_D|D_8,INSTRUMENT,PI_Blank,N_F|D_4,INSTRUMENT,PI_Boss_Bass
.byte N_FH|D_8,REST|D_8,INSTRUMENT,PI_Blank,N_F|D_8,INSTRUMENT,PI_Boss_Bass
.byte N_FH|D_8,REST|D_8,N_F|D_8,PATEND
PPDAT_Minor_Boss_pat_7_2_10:
.byte N_CH|D_4,INSTRUMENT,PI_Boss_Bass,N_CHH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_CH|D_8,INSTRUMENT,PI_Boss_Bass,N_CHH|D_8,REST|D_8,N_CH|D_8
.byte INSTRUMENT,PI_Blank,N_CHH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte N_CHH|D_8,INSTRUMENT,PI_Blank,N_CH|D_4,INSTRUMENT,PI_Boss_Bass,N_CHH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,N_C|D_8,INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8,N_C|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,PATEND
PPDAT_Minor_Boss_pat_7_3_0:
.byte DR_autodrum17|D_1,N_TIE|D_1,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,PATEND
PPDAT_Minor_Boss_pat_7_3_1:
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum9|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum9|D_8
.byte PATEND
PPDAT_Minor_Boss_pat_7_3_2:
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum9|D_8
.byte PATEND
PPDAT_Minor_Boss_pat_7_3_4:
.byte DR_autodrum17|D_2,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum9|D_8,PATEND
PPDAT_Minor_Boss_pat_7_3_6:
.byte DR_autodrum17|D_2,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,PATEND
PPDAT_Minor_Boss_pat_7_3_7:
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte PATEND
PPDAT_Minor_Boss_pat_7_3_10:
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum9|D_8,DR_autodrum7|D_8
.byte DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum9|D_8
.byte PATEND
PPDAT_Major_Boss_pat_8_0_0:
.byte REST|D_D8,CHVOLUME,1,N_C|D_4,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8,REST|D_8
.byte N_C|D_8,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8,N_C|D_4,N_CH|D_8,REST|D_8
.byte N_C|D_4,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8
.byte REST|D_8,N_C|D_8,N_CH|D_8,N_C|D_4,N_AS,PATEND
PPDAT_Major_Boss_pat_8_0_1:
.byte CHVOLUME,3,ARPEGGIO,$7c,N_D,REST,N_D,REST,N_D|D_4,N_D,REST,N_D,REST
.byte N_D|D_4,N_D|D_4,N_C|D_8,N_D|D_4,N_C|D_8,N_D|D_4,N_D,REST,N_D,REST,N_D|D_4
.byte N_D,REST,N_D,REST,N_D|D_4,N_F|D_4,N_D|D_8,N_F|D_4,N_C|D_8,N_D|D_4,PATEND
PPDAT_Major_Boss_pat_8_0_2:
.byte N_C,REST,N_C,REST,N_C|D_4,N_C,REST,N_C,REST,N_C|D_4,N_D|D_4,N_C|D_8
.byte N_D|D_4,N_C|D_8,N_D|D_4,N_E,REST,N_E,REST,N_E|D_4,N_E,REST,N_D,REST
.byte N_E|D_4,N_G|D_4,N_E|D_8,N_G|D_4,N_G|D_8,N_A|D_4,PATEND
PPDAT_Major_Boss_pat_8_0_3:
.byte CHVOLUME,4,ARPEGGIO,$00,N_D|D_8,N_A|D_8,N_D|D_8,N_G|D_8,N_D|D_8,N_F|D_8
.byte N_D|D_8,N_C|D_8,N_D|D_8,N_C|D_8,N_F|D_8,N_D|D_8,N_G|D_8,N_F|D_8,N_D|D_8
.byte N_F|D_8,N_D|D_8,N_A|D_8,N_D|D_8,N_G|D_8,N_D|D_8,N_F|D_8,N_D|D_8,N_C|D_8
.byte N_A|D_8,N_G|D_8,N_F|D_8,N_G|D_8,N_A|D_8,N_G|D_8,N_F|D_8,N_C|D_8,PATEND
PPDAT_Major_Boss_pat_8_0_4:
.byte N_D|D_8,N_A|D_8,N_D|D_8,N_G|D_8,N_D|D_8,N_F|D_8,N_D|D_8,N_C|D_8,N_D|D_8
.byte N_C|D_8,N_F|D_8,N_D|D_8,N_G|D_8,N_F|D_8,N_D|D_8,N_F|D_8,N_D|D_8,N_A|D_8
.byte N_D|D_8,N_G|D_8,N_D|D_8,N_F|D_8,N_D|D_8,N_C|D_8,N_A|D_8,N_G|D_8,N_F|D_8
.byte N_G|D_8,N_A|D_8,N_G|D_8,N_A|D_8,N_CH|D_8,PATEND
PPDAT_Major_Boss_pat_8_0_5:
.byte CHVOLUME,2,VIBRATO,2,N_DS|D_1,N_TIE|D_D2,CHVOLUME,1,N_TIE|D_4,CHVOLUME,2
.byte N_C|D_1,N_TIE|D_D2,CHVOLUME,1,N_TIE|D_4,PATEND
PPDAT_Major_Boss_pat_8_0_6:
.byte CHVOLUME,2,N_C|D_1,N_TIE|D_D2,N_F|D_4,N_D|D_1,N_TIE|D_D2,CHVOLUME,1
.byte N_TIE|D_4,PATEND
PPDAT_Major_Boss_pat_8_0_7:
.byte CHVOLUME,2,VIBRATO,2,N_C|D_1,N_TIE|D_D2,CHVOLUME,1,N_TIE|D_4,CHVOLUME,2
.byte N_DS|D_D2,N_C|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,2,N_DS|D_8,CHVOLUME,1
.byte N_TIE|D_8,CHVOLUME,2,N_C|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,2,N_GS|D_8
.byte N_CH|D_8,N_AS|D_8,N_G|D_8,PATEND
PPDAT_Major_Boss_pat_8_0_8:
.byte N_C|D_2,CHVOLUME,1,N_TIE|D_2,REST,INSTRUMENT,PI_Distant_Square_Echo
.byte VIBRATO,0,TRANSPOSE,<-36,N_C|D_8,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8
.byte N_C|D_4,N_CH|D_8,REST|D_8,N_C|D_4,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8
.byte REST|D_8,N_C|D_8,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8,N_C|D_4,N_AS
.byte TRANSPOSE,<36,PATEND
PPDAT_Major_Boss_pat_8_1_0:
.byte REST,CHVOLUME,4,VIBRATO,2,ARPEGGIO,$00,N_C|D_4,N_CH|D_8,CHVOLUME,1
.byte N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4
.byte N_C|D_8,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,N_C|D_4
.byte N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_4,N_CH|D_8,CHVOLUME,1
.byte N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4
.byte N_C|D_8,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,N_C|D_4
.byte N_AS|D_D8,PATEND
PPDAT_Major_Boss_pat_8_1_2:
.byte REST,CHVOLUME,4,N_C|D_4,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8
.byte N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,CHVOLUME,1
.byte N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,N_C|D_4,N_CH|D_8,CHVOLUME,1
.byte N_TIE|D_8,CHVOLUME,4,N_C|D_4,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4
.byte N_C|D_8,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_AS|D_8
.byte CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_G|D_8,N_AS|D_D4,N_CH|D_D8,PATEND
PPDAT_Major_Boss_pat_8_1_4:
.byte CHVOLUME,1,VIBRATO,3,N_E|D_1,N_TIE|D_1,N_C|D_1,N_TIE|D_1,PATEND
PPDAT_Major_Boss_pat_8_1_5:
.byte CHVOLUME,1,N_C|D_1,N_TIE|D_1,N_CS|D_1,N_TIE|D_1,PATEND
PPDAT_Major_Boss_pat_8_1_6:
.byte CHVOLUME,3,VIBRATO,0,ARPEGGIO,$7c,N_D,REST,N_D,REST,N_D|D_4,N_D,REST,N_D
.byte REST,N_D|D_4,N_D|D_4,N_C|D_8,N_D|D_4,N_C|D_8,N_D|D_4,N_D,REST,N_D,REST
.byte N_D|D_4,N_D,REST,N_D,REST,N_D|D_4,N_F|D_4,N_D|D_8,N_F|D_4,N_C|D_8,N_D|D_4
.byte PATEND
PPDAT_Major_Boss_pat_8_1_7:
.byte CHVOLUME,3,N_D,REST,N_D,REST,N_D|D_4,N_D,REST,N_D,REST,N_D|D_4,N_D|D_4
.byte N_C|D_8,N_D|D_4,N_C|D_8,N_D|D_4,N_C,REST,N_C,REST,N_C|D_4,N_D,REST,N_D
.byte REST,N_D|D_4,N_E,REST,N_E,REST,N_E,REST,N_E,REST,N_G,REST,N_G,REST,N_A
.byte REST,N_A,REST,PATEND
PPDAT_Major_Boss_pat_8_1_8:
.byte REST,CHVOLUME,4,N_C|D_4,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8
.byte N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,CHVOLUME,1
.byte N_TIE|D_8,CHVOLUME,4,N_C|D_8,N_CH|D_8,N_C|D_4,N_CH|D_8,CHVOLUME,1
.byte N_TIE|D_8,CHVOLUME,4,N_C|D_4,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4
.byte N_C|D_8,N_CH|D_8,CHVOLUME,1,N_TIE|D_8,CHVOLUME,4,N_C,INSTRUMENT,PI_Horn
.byte CHVOLUME,1,N_CH|D_4,CHVOLUME,2,N_CH|D_4,CHVOLUME,3,N_CH|D_4,CHVOLUME,4
.byte N_CH|D_8,CHVOLUME,1,N_TIE|D_8,PATEND
PPDAT_Major_Boss_pat_8_2_0:
.byte N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8
.byte REST|D_8,N_C|D_8,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8,N_C|D_4,N_CH|D_8
.byte REST|D_8,N_C|D_4,N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8,REST|D_8,N_C|D_8
.byte N_CH|D_8,REST|D_8,N_C|D_8,N_CH|D_8,N_C|D_4,N_AS|D_4,PATEND
PPDAT_Major_Boss_pat_8_2_1:
.byte N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,N_C|D_8,INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_C|D_8,N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_AS|D_8,REST|D_8,PATEND
PPDAT_Major_Boss_pat_8_2_3:
.byte N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,N_C|D_8,INSTRUMENT,PI_Blank,N_AS|D_8,REST|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_G|D_8,N_AS|D_8,INSTRUMENT,PI_Blank,N_AS|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,PATEND
PPDAT_Major_Boss_pat_8_2_5:
.byte N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,N_C|D_8,INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_C|D_8,N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_A|D_4,PATEND
PPDAT_Major_Boss_pat_8_2_7:
.byte N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Blank
.byte N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8,REST|D_8,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte N_CH|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_4,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_CH|D_8
.byte REST|D_8,N_C|D_8,INSTRUMENT,PI_Blank,N_CH|D_8,REST|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_A|D_8,N_CH|D_8,INSTRUMENT,PI_Blank,N_CH|D_4
.byte INSTRUMENT,PI_Boss_Bass,N_DH|D_8,REST|D_8,PATEND
PPDAT_Major_Boss_pat_8_3_0:
.byte DR_autodrum17|D_1,N_TIE|D_1,N_TIE|D_1,N_TIE|D_1,PATEND
PPDAT_Major_Boss_pat_8_3_1:
.byte DR_autodrum17|D_2,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7,DR_autodrum7
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,PATEND
PPDAT_Major_Boss_pat_8_3_2:
.byte DR_autodrum17|D_2,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6,DR_autodrum7,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,PATEND
PPDAT_Major_Boss_pat_8_3_5:
.byte DR_autodrum17|D_2,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7,DR_autodrum7
.byte DR_autodrum10|D_8,DR_autodrum7|D_8,PATEND
PPDAT_Major_Boss_pat_8_3_6:
.byte DR_autodrum17|D_2,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum7|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum7|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,PATEND
PPDAT_Final_Boss_pat_9_0_0:
.byte CHVOLUME,4,VIBRATO,1,N_F|D_D4,N_F|D_D4,N_F|D_4,N_F|D_8,N_F|D_4,N_F|D_8
.byte N_GS|D_4,N_AS|D_4,N_F|D_D4,N_F|D_D4,N_F|D_4,N_F|D_8,N_F|D_4,N_F|D_8
.byte N_DS|D_4,N_C|D_4,PATEND
PPDAT_Final_Boss_pat_9_0_1:
.byte N_C|D_D4,N_C|D_D4,N_C|D_4,N_C|D_8,N_C|D_4,N_C|D_8,N_DS|D_4,N_F|D_4
.byte N_G|D_D4,N_F|D_D4,N_DS|D_4,N_D|D_8,N_DS|D_4,N_DS|D_8,N_F|D_4,N_DS|D_8
.byte N_D|D_8,PATEND
PPDAT_Final_Boss_pat_9_0_2:
.byte CHVOLUME,4,N_C|D_4,N_G|D_4,N_AS|D_4,N_DSH|D_1,N_TIE|D_1,N_TIE|D_1
.byte N_TIE|D_4,PATEND
PPDAT_Final_Boss_pat_9_0_3:
.byte CHVOLUME,4,VIBRATO,0,N_CS|D_D4,N_CS|D_D4,N_CS|D_4,N_C|D_8,N_CS|D_4
.byte N_CS|D_8,N_DS|D_4,N_CS|D_8,N_C|D_8,N_CS|D_D4,N_CS|D_D4,N_CS|D_4,N_C|D_8
.byte N_CS|D_4,N_CS|D_8,INSTRUMENT,PI_Horn,CHVOLUME,3,N_CSH,LEGATO_ON,N_DSH
.byte LEGATO_OFF,CHVOLUME,1,N_CSH,LEGATO_ON,N_DSH,LEGATO_OFF,CHVOLUME,3,N_CSH
.byte CHVOLUME,1,N_CSH,CHVOLUME,3,N_CH,CHVOLUME,1,N_CH,PATEND
PPDAT_Final_Boss_pat_9_1_0:
.byte CHVOLUME,3,N_C,CHVOLUME,1,N_D,CHVOLUME,3,N_CH,CHVOLUME,1,N_C,CHVOLUME,3
.byte N_G,CHVOLUME,1,N_CH,CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_F
.byte CHVOLUME,1,N_C,CHVOLUME,3,N_C,CHVOLUME,1,N_F,CHVOLUME,3,N_G,CHVOLUME,1
.byte N_C,CHVOLUME,3,N_F,CHVOLUME,1,N_G,CHVOLUME,3,N_C,CHVOLUME,1,N_F
.byte CHVOLUME,3,N_CH,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_CH,CHVOLUME,3
.byte N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_F,CHVOLUME,1,N_C,CHVOLUME,3,N_G
.byte CHVOLUME,1,N_F,CHVOLUME,3,N_F,CHVOLUME,1,N_G,CHVOLUME,3,N_D,CHVOLUME,1
.byte N_F,CHVOLUME,3,N_C,CHVOLUME,1,N_D,CHVOLUME,3,N_CH,CHVOLUME,1,N_C
.byte CHVOLUME,3,N_G,CHVOLUME,1,N_CH,CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3
.byte N_F,CHVOLUME,1,N_C,CHVOLUME,3,N_C,CHVOLUME,1,N_F,CHVOLUME,3,N_G
.byte CHVOLUME,1,N_C,CHVOLUME,3,N_F,CHVOLUME,1,N_G,CHVOLUME,3,N_C,CHVOLUME,1
.byte N_F,CHVOLUME,3,N_CH,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_CH
.byte CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_F,CHVOLUME,1,N_C,CHVOLUME,3
.byte N_G,CHVOLUME,1,N_F,CHVOLUME,3,N_DS,CHVOLUME,1,N_G,CHVOLUME,3,N_D
.byte CHVOLUME,1,N_DS,PATEND
PPDAT_Final_Boss_pat_9_1_1:
.byte CHVOLUME,3,N_C,CHVOLUME,1,N_D,CHVOLUME,3,N_CH,CHVOLUME,1,N_C,CHVOLUME,3
.byte N_G,CHVOLUME,1,N_CH,CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_F
.byte CHVOLUME,1,N_C,CHVOLUME,3,N_C,CHVOLUME,1,N_F,CHVOLUME,3,N_G,CHVOLUME,1
.byte N_C,CHVOLUME,3,N_F,CHVOLUME,1,N_G,CHVOLUME,3,N_C,CHVOLUME,1,N_F
.byte CHVOLUME,3,N_CH,CHVOLUME,1,N_C,CHVOLUME,3,N_G,CHVOLUME,1,N_CH,CHVOLUME,3
.byte N_C,CHVOLUME,1,N_G,CHVOLUME,3,N_F,CHVOLUME,1,N_C,CHVOLUME,3,N_G
.byte CHVOLUME,1,N_F,CHVOLUME,3,N_F,CHVOLUME,1,N_G,CHVOLUME,3,N_D,CHVOLUME,1
.byte N_F,CHVOLUME,3,N_C,CHVOLUME,1,N_D,CHVOLUME,3,N_CH,CHVOLUME,1,N_C
.byte CHVOLUME,3,N_G,CHVOLUME,1,N_CH,CHVOLUME,3,N_C,CHVOLUME,1,N_G,CHVOLUME,3
.byte N_F,CHVOLUME,1,N_C,CHVOLUME,3,N_C,CHVOLUME,1,N_F,CHVOLUME,3,N_G
.byte CHVOLUME,1,N_C,CHVOLUME,3,N_F,CHVOLUME,1,N_G,CHVOLUME,3,N_G,CHVOLUME,1
.byte N_F,CHVOLUME,3,N_F,CHVOLUME,1,N_G,CHVOLUME,3,N_DS,CHVOLUME,1,N_F
.byte CHVOLUME,3,N_F,CHVOLUME,1,N_DS,CHVOLUME,3,N_DS,CHVOLUME,1,N_F,CHVOLUME,3
.byte N_D,CHVOLUME,1,N_DS,CHVOLUME,3,N_DS,CHVOLUME,1,N_D,CHVOLUME,3,N_D
.byte CHVOLUME,1,N_DS,PATEND
PPDAT_Final_Boss_pat_9_1_2:
.byte CHVOLUME,2,N_D,CHVOLUME,1,N_D,CHVOLUME,2,N_C,CHVOLUME,1,N_D,CHVOLUME,3
.byte N_D,CHVOLUME,1,N_C,CHVOLUME,3,N_F,CHVOLUME,1,N_D,CHVOLUME,3,N_G
.byte CHVOLUME,1,N_F,CHVOLUME,3,N_D,CHVOLUME,1,N_G,CHVOLUME,4,N_F,CHVOLUME,2
.byte N_D,CHVOLUME,4,N_AS,CHVOLUME,2,N_F,PATEND
PPDAT_Final_Boss_pat_9_1_3:
.byte CHVOLUME,3,N_DS,CHVOLUME,1,N_C,CHVOLUME,3,N_CS,CHVOLUME,1,N_DS,CHVOLUME,3
.byte N_C,CHVOLUME,1,N_CS,CHVOLUME,3,N_CS,CHVOLUME,1,N_C,CHVOLUME,3,N_CS
.byte CHVOLUME,1,N_CS,CHVOLUME,3,N_C,CHVOLUME,1,N_CS,CHVOLUME,3,N_DS,CHVOLUME,1
.byte N_C,CHVOLUME,3,N_CS,CHVOLUME,1,N_DS,CHVOLUME,3,N_DS,CHVOLUME,1,N_CS
.byte CHVOLUME,3,N_CS,CHVOLUME,1,N_DS,CHVOLUME,3,N_C,CHVOLUME,1,N_CS,CHVOLUME,3
.byte N_CS,CHVOLUME,1,N_C,CHVOLUME,3,N_CS,CHVOLUME,1,N_CS,CHVOLUME,3,N_F
.byte CHVOLUME,1,N_CS,CHVOLUME,3,N_DS,CHVOLUME,1,N_F,CHVOLUME,3,N_CS,CHVOLUME,1
.byte N_DS,CHVOLUME,3,N_DS,CHVOLUME,1,N_CS,CHVOLUME,3,N_CS,CHVOLUME,1,N_DS
.byte CHVOLUME,3,N_C,CHVOLUME,1,N_CS,CHVOLUME,3,N_CS,CHVOLUME,1,N_C,CHVOLUME,3
.byte N_CS,CHVOLUME,1,N_CS,CHVOLUME,3,N_C,CHVOLUME,1,N_CS,CHVOLUME,3,N_F
.byte CHVOLUME,1,N_C,CHVOLUME,3,N_DS,CHVOLUME,1,N_F,CHVOLUME,3,N_F,CHVOLUME,1
.byte N_DS,CHVOLUME,3,N_DS,CHVOLUME,1,N_F,CHVOLUME,3,N_CS,CHVOLUME,1,N_DS
.byte CHVOLUME,3,N_DS,CHVOLUME,1,N_CS,CHVOLUME,3,N_CS,CHVOLUME,1,N_DS
.byte CHVOLUME,3,N_DS,CHVOLUME,1,N_CS,CHVOLUME,3,N_CS,CHVOLUME,1,N_DS
.byte CHVOLUME,3,N_C,CHVOLUME,1,N_CS,PATEND
PPDAT_Final_Boss_pat_9_2_0:
.byte VIBRATO,1,N_D|D_8,N_C,REST,N_D|D_D8,REST|D_D8,N_D,REST,N_D|D_8,N_DH,REST
.byte N_D,REST,INSTRUMENT,PI_Short_Kick,N_C|D_8,INSTRUMENT,PI_Blank,N_D|D_8
.byte REST|D_8,N_F|D_8,N_D,REST,N_D|D_8,N_GH,REST,N_D,REST|D_D8,N_D|D_8
.byte REST|D_4,N_D,REST,N_D|D_8,N_CH,REST,N_D,REST,TRANSPOSE,<-10,N_C|D_8
.byte N_CH|D_8,N_AS|D_8,N_G|D_8,N_C|D_8,N_AS|D_D8,N_C,TRANSPOSE,<10,PATEND
PPDAT_Final_Boss_pat_9_2_1:
.byte N_F|D_8,N_DS,REST,N_F|D_D8,REST|D_D8,N_F,REST,N_F|D_8,N_FH,REST,N_F,REST
.byte N_DS|D_8,N_F|D_8,REST|D_8,N_GS|D_8,N_F,REST,N_F|D_8,N_ASH,REST,N_C|D_D8
.byte REST,N_CH|D_8,N_C|D_8,REST|D_8,N_CH,REST,N_C|D_8,N_DS|D_8,N_DS,REST
.byte N_DS|D_8,N_DSH|D_8,N_DS|D_8,N_F,REST,N_F|D_8,N_C|D_8,N_DS,N_DS,PATEND
PPDAT_Final_Boss_pat_9_2_2:
.byte N_F|D_D8,REST,N_C|D_D8,REST,N_DS|D_D8,REST,N_GS|D_D8,REST|D_1,N_TIE|D_1
.byte N_TIE,PATEND
PPDAT_Final_Boss_pat_9_2_3:
.byte N_CS|D_8,N_C,REST,N_CS|D_D8,REST|D_D8,N_CS,REST,N_CS|D_8,N_CSH,REST,N_CS
.byte REST,N_C|D_8,N_CS|D_8,REST|D_8,N_DS|D_8,N_CS,REST,N_CS|D_8,N_CH,REST
.byte N_CS|D_8,N_C,REST,N_CS|D_D8,REST|D_D8,N_CS,REST,N_CS|D_8,N_CSH,REST,N_CS
.byte REST,N_C|D_8,INSTRUMENT,PI_Tribal_Noise_1_26_4,N_CS|D_8,REST|D_8
.byte INSTRUMENT,PI_Blank,N_DS|D_8,N_CS,REST,N_CS|D_8,N_C,REST,PATEND
PPDAT_Final_Boss_pat_9_2_4:
.byte N_CS|D_8,N_C,REST,N_CS|D_D8,REST|D_D8,N_CS,REST,N_CS|D_8,N_CSH,REST,N_CS
.byte REST,N_C|D_8,N_CS|D_8,REST|D_8,N_DS|D_8,N_CS,REST,N_CS|D_8,N_CH,REST
.byte N_CS|D_8,N_C,REST,N_CS|D_D8,REST|D_D8,N_CS,REST,N_CS|D_8,N_CSH,REST,N_CS
.byte REST,N_C|D_8,INSTRUMENT,PI_Tribal_Noise_1_26_4,N_CS|D_8,REST|D_2
.byte N_TIE|D_8,PATEND
PPDAT_Final_Boss_pat_9_3_0:
.byte DR_autodrum17|D_4,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum20|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum21|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum21|D_8,DR_autodrum21|D_8
.byte DR_autodrum20|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum21|D_8
.byte DR_autodrum20|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum20|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum21|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum21|D_8,DR_autodrum21|D_8
.byte DR_autodrum20|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,PATEND
PPDAT_Final_Boss_pat_9_3_1:
.byte DR_autodrum17|D_4,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum20|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum21|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum21|D_8,DR_autodrum21|D_8
.byte DR_autodrum20|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum21|D_8
.byte DR_autodrum20|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum20|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum21|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum21|D_8,DR_autodrum21|D_8
.byte DR_autodrum20|D_8,DR_autodrum19|D_8,DR_autodrum9,DR_autodrum9,PATEND
PPDAT_Final_Boss_pat_9_3_2:
.byte DR_autodrum20|D_8,DR_autodrum20|D_8,DR_autodrum20|D_8,DR_autodrum20|D_8
.byte DR_autodrum10|D_8,DR_autodrum10|D_8,DR_autodrum22|D_8,DR_autodrum22|D_1
.byte N_TIE|D_1,N_TIE|D_1,N_TIE|D_8,PATEND
PPDAT_Final_Boss_pat_9_3_3:
.byte DR_autodrum17|D_4,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum20|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum21|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum21|D_8,DR_autodrum21|D_8
.byte DR_autodrum20|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum21|D_8
.byte DR_autodrum20|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum20|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum20|D_8,DR_autodrum21|D_8
.byte DR_autodrum21|D_8,DR_autodrum19|D_8,DR_autodrum21|D_8,DR_autodrum4|D_8
.byte DR_autodrum4|D_8,DR_autodrum0|D_8,DR_autodrum0|D_8,PATEND
PPDAT_World_Select_1_pat_10_0_0:
.byte CHVOLUME,4,N_C|D_8,N_G|D_8,N_CH,CHVOLUME,1,N_CH,REST
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<24,N_D|D_D8,N_E|D_8
.byte N_C|D_4,INSTRUMENT,PI_Select_Lead_1,TRANSPOSE,<-24,N_C|D_8,N_G|D_8,N_CH
.byte CHVOLUME,1,N_CH,REST,INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<29
.byte N_C|D_D8,N_E|D_8,N_D|D_8,REST|D_8,INSTRUMENT,PI_Select_Lead_1
.byte TRANSPOSE,<-29,N_C|D_8,N_CH|D_8,N_G,CHVOLUME,1,N_G,REST
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<7,N_GH|D_D8,N_AH|D_8
.byte N_ASH|D_4,INSTRUMENT,PI_Select_Lead_1,N_F|D_8,N_C|D_8,TRANSPOSE,<-7,N_C
.byte CHVOLUME,1,N_C,INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<26,N_D
.byte N_DS,N_F,N_DS,N_C,N_D,N_G|D_8,N_A|D_8,TRANSPOSE,<-26,PATEND
PPDAT_World_Select_1_pat_10_1_0:
.byte REST,CHVOLUME,1,N_C|D_8,N_G|D_8,N_CH,N_CH,REST
.byte INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<24,N_D|D_D8,N_E|D_8,N_C|D_4
.byte INSTRUMENT,PI_Select_Lead_1,TRANSPOSE,<-24,N_C|D_8,N_G|D_8,N_CH,N_CH,REST
.byte INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<29,N_C|D_D8,N_E|D_8,N_D|D_8
.byte REST|D_8,INSTRUMENT,PI_Select_Lead_1,TRANSPOSE,<-29,N_C|D_8,N_CH|D_8,N_G
.byte N_G,REST,INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<7,N_GH|D_D8,N_AH|D_8
.byte N_ASH|D_4,INSTRUMENT,PI_Select_Lead_1,N_F|D_8,N_C|D_8,TRANSPOSE,<-7,N_C
.byte N_C,INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<26,N_D,N_DS,N_F,N_DS,N_C,N_D
.byte N_G|D_8,N_A,TRANSPOSE,<-26,PATEND
PPDAT_World_Select_1_pat_10_2_0:
.byte N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8,N_DS,REST
.byte N_DS|D_8,INSTRUMENT,PI_Blank,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass
.byte N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Blank,N_F|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_F|D_8,N_G,REST,N_G|D_8,INSTRUMENT,PI_Blank
.byte N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8,N_DS,REST
.byte N_DS|D_8,INSTRUMENT,PI_Short_Kick,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass
.byte N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Short_Kick,N_F|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_F|D_8,N_G,REST,N_AS|D_8,PATEND
PPDAT_World_Select_1_pat_10_3_0:
.byte DR_autodrum6|D_8,DR_autodrum7|D_4,DR_autodrum7|D_8,DR_autodrum6|D_4
.byte DR_autodrum10|D_4,DR_autodrum6|D_8,DR_autodrum7|D_4,DR_autodrum7|D_8
.byte DR_autodrum6|D_4,DR_autodrum10|D_4,DR_autodrum6|D_8,DR_autodrum7|D_4
.byte DR_autodrum7|D_8,DR_autodrum6|D_4,DR_autodrum10|D_4,DR_autodrum6|D_8
.byte DR_autodrum7|D_4,DR_autodrum7|D_8,DR_autodrum6|D_8,DR_autodrum10|D_8
.byte DR_autodrum7|D_8,DR_autodrum10|D_8,PATEND
PPDAT_World_Select_2_pat_11_0_0:
.byte CHVOLUME,4,N_C|D_8,N_G|D_8,N_CH,CHVOLUME,1,N_CH,REST
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<24,N_D|D_8,N_C,N_E|D_8
.byte N_C|D_4,INSTRUMENT,PI_Select_Lead_1,TRANSPOSE,<-24,N_C|D_8,N_G|D_8,N_CH
.byte CHVOLUME,1,N_CH,REST,INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<29
.byte N_C|D_8,N_D,N_E|D_8,N_D|D_8,REST|D_8,INSTRUMENT,PI_Select_Lead_1
.byte TRANSPOSE,<-29,N_C|D_8,N_CH|D_8,N_G,CHVOLUME,1,N_G,REST
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<7,N_GH|D_8,N_ASH
.byte N_AH|D_8,N_CHH|D_4,INSTRUMENT,PI_Select_Lead_1,N_F|D_8,N_C|D_8
.byte TRANSPOSE,<-7,N_C,CHVOLUME,1,N_C,INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4
.byte TRANSPOSE,<26,N_D,N_DS,N_F,N_DS,N_C,N_D,N_G,N_F,N_A|D_8,TRANSPOSE,<-26
.byte PATEND
PPDAT_World_Select_2_pat_11_1_0:
.byte REST,CHVOLUME,1,VIBRATO,1,N_C|D_8,N_G|D_8,N_CH,N_CH,REST
.byte INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<24,N_D|D_8,N_C,N_E|D_8,N_C|D_4
.byte INSTRUMENT,PI_Select_Lead_1,TRANSPOSE,<-24,N_C|D_8,N_G|D_8,N_CH,N_CH,REST
.byte INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<29,N_C|D_8,N_D,N_E|D_8,N_D|D_8
.byte REST|D_8,INSTRUMENT,PI_Select_Lead_1,TRANSPOSE,<-29,N_C|D_8,N_CH|D_8,N_G
.byte N_G,REST,INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<7,N_GH|D_8,N_AH,N_AH|D_8
.byte N_CHH|D_4,INSTRUMENT,PI_Select_Lead_1,N_F|D_8,N_C|D_8,TRANSPOSE,<-7,N_C
.byte N_C,INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<26,N_D,N_DS,N_F,N_DS,N_C,N_D
.byte N_G,N_F,N_A,TRANSPOSE,<-26,PATEND
PPDAT_World_Select_2_pat_11_2_0:
.byte N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8,N_DS,REST
.byte INSTRUMENT,PI_Blank,N_DS|D_8,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass
.byte N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Blank,N_F|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_F|D_8,N_G,REST,INSTRUMENT,PI_Blank,N_G|D_8
.byte N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8,N_DS,REST
.byte INSTRUMENT,PI_Blank,N_DS|D_8,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass
.byte N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Blank,N_F|D_8
.byte INSTRUMENT,PI_Boss_Bass,N_F|D_8,INSTRUMENT,PI_Blank,N_G,REST,N_AS,N_AS
.byte PATEND
PPDAT_World_Select_2_pat_11_3_0:
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum7,DR_autodrum9|D_8
.byte DR_autodrum7|D_8,DR_autodrum6,DR_autodrum7,DR_autodrum7|D_8
.byte DR_autodrum10|D_8,DR_autodrum9|D_8,DR_autodrum6|D_8,DR_autodrum7
.byte DR_autodrum7,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum6,DR_autodrum7
.byte DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum9|D_8,DR_autodrum6|D_8
.byte DR_autodrum7,DR_autodrum7,DR_autodrum9|D_8,DR_autodrum7|D_8,DR_autodrum6
.byte DR_autodrum7,DR_autodrum7|D_8,DR_autodrum10|D_8,DR_autodrum9|D_8
.byte DR_autodrum6|D_8,DR_autodrum7,DR_autodrum7,DR_autodrum9|D_8
.byte DR_autodrum7|D_8,DR_autodrum6,DR_autodrum7,DR_autodrum7|D_8,DR_autodrum9
.byte DR_autodrum7,DR_autodrum9,DR_autodrum9,PATEND
PPDAT_World_Select_3_pat_12_0_0:
.byte CHVOLUME,4,N_C|D_8,INSTRUMENT,PI_Select_Lead_1,N_G|D_8,N_CH,CHVOLUME,1
.byte N_CH,REST,INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<24,N_D|D_8
.byte N_C,N_E|D_8,N_C|D_4,INSTRUMENT,PI_Select_Orc_Hit,TRANSPOSE,<-29,N_C|D_8
.byte INSTRUMENT,PI_Select_Lead_1,N_CH|D_8,N_FH,CHVOLUME,1,N_FH,REST
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<34,N_C|D_8,N_D,N_E|D_8
.byte N_D|D_4,INSTRUMENT,PI_Select_Orc_Hit,TRANSPOSE,<-36,N_C|D_8
.byte INSTRUMENT,PI_Select_Lead_1,N_GH|D_8,N_DH,CHVOLUME,1,N_DH,REST
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<33,N_C|D_8,N_DS,N_D|D_8
.byte N_F|D_4,INSTRUMENT,PI_Select_Orc_Hit,TRANSPOSE,<-38,N_C|D_8
.byte INSTRUMENT,PI_Select_Lead_1,N_GH|D_8,N_CH,CHVOLUME,1,N_CH
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<38,N_D,N_DS,N_F,N_DS
.byte N_C,N_D,N_G,N_F,N_A|D_8,TRANSPOSE,<-26,PATEND
PPDAT_World_Select_3_pat_12_1_0:
.byte CHVOLUME,4,VIBRATO,0,N_FH|D_D8,INSTRUMENT,PI_Select_Lead_1,CHVOLUME,1
.byte VIBRATO,1,N_C|D_8,N_F,N_F,REST,INSTRUMENT,PI_Select_Lead_2,N_GH|D_8,N_FH
.byte N_AH|D_8,N_FH|D_D8,INSTRUMENT,PI_Select_Orc_Hit,CHVOLUME,4,VIBRATO,0
.byte N_CH|D_D8,INSTRUMENT,PI_Select_Lead_1,CHVOLUME,1,VIBRATO,1,N_C|D_8,N_F
.byte N_F,REST,INSTRUMENT,PI_Select_Lead_2,N_ASH|D_8,N_CHH,TRANSPOSE,<5
.byte N_AH|D_8,N_GH|D_D8,INSTRUMENT,PI_Select_Orc_Hit,CHVOLUME,4,VIBRATO,0
.byte N_F|D_D8,INSTRUMENT,PI_Select_Lead_1,CHVOLUME,1,VIBRATO,1,N_C|D_8
.byte TRANSPOSE,<-5,N_C,N_C,REST,INSTRUMENT,PI_Select_Lead_2,N_GH|D_8,N_AH
.byte N_AH|D_8,N_CHH|D_D8,INSTRUMENT,PI_Select_Orc_Hit,CHVOLUME,4,VIBRATO,0
.byte N_F|D_D8,INSTRUMENT,PI_Select_Lead_1,CHVOLUME,1,VIBRATO,1,N_C|D_8
.byte TRANSPOSE,<-7,N_C,N_C,INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<26,N_D,N_DS
.byte N_F,N_DS,N_C,N_D,N_G,N_F,N_A,TRANSPOSE,<-19,PATEND
PPDAT_World_Select_3_pat_12_2_0:
.byte VIBRATO,2,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_DS,REST,N_DS|D_8,N_DS|D_8,REST
.byte INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Blank
.byte N_F|D_8,INSTRUMENT,PI_Boss_Bass,N_F|D_8,INSTRUMENT,PI_Blank,N_G,REST
.byte N_G|D_8,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_DS,REST,N_DS|D_8,N_DS|D_8,REST
.byte INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Blank
.byte N_F|D_8,INSTRUMENT,PI_Boss_Bass,N_F,REST|D_4,N_TIE,PATEND
PPDAT_World_Select_3_pat_12_3_0:
.byte DR_autodrum17|D_4,DR_autodrum9,DR_autodrum7,DR_autodrum10|D_8
.byte DR_autodrum6,DR_autodrum7,DR_autodrum10,DR_autodrum7,DR_autodrum9
.byte DR_autodrum7,DR_autodrum9|D_8,DR_autodrum6,DR_autodrum7,DR_autodrum10|D_8
.byte DR_autodrum9,DR_autodrum7,DR_autodrum10|D_8,DR_autodrum6,DR_autodrum7
.byte DR_autodrum10,DR_autodrum7,DR_autodrum9,DR_autodrum7,DR_autodrum9|D_8
.byte DR_autodrum6,DR_autodrum7,DR_autodrum10|D_8,DR_autodrum9,DR_autodrum7
.byte DR_autodrum10|D_8,DR_autodrum6,DR_autodrum7,DR_autodrum10,DR_autodrum7
.byte DR_autodrum9,DR_autodrum7,DR_autodrum9|D_8,DR_autodrum6,DR_autodrum7
.byte DR_autodrum10|D_8,DR_autodrum9,DR_autodrum7,DR_autodrum10|D_8
.byte DR_autodrum6,DR_autodrum7,DR_autodrum10,DR_autodrum7,DR_autodrum4
.byte DR_autodrum4,DR_autodrum0,DR_autodrum0,PATEND
PPDAT_World_Select_4_pat_13_0_0:
.byte CHVOLUME,4,N_C|D_8,INSTRUMENT,PI_Select_Lead_1,N_G|D_8,N_CH,CHVOLUME,1
.byte N_CH,REST,INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<24,N_D|D_8
.byte N_C,N_E|D_8,N_C|D_4,INSTRUMENT,PI_Select_Orc_Hit,TRANSPOSE,<-29,N_C|D_8
.byte INSTRUMENT,PI_Select_Lead_1,N_CH|D_8,N_FH,CHVOLUME,1,N_FH,REST
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<34,N_C|D_8,N_D,N_E|D_8
.byte N_D|D_4,INSTRUMENT,PI_Select_Orc_Hit,TRANSPOSE,<-36,N_C|D_8
.byte INSTRUMENT,PI_Select_Lead_1,N_GH|D_8,N_DH,CHVOLUME,1,N_DH,REST
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<33,N_C|D_8,N_DS,N_D|D_8
.byte N_F|D_4,INSTRUMENT,PI_Select_Orc_Hit,TRANSPOSE,<-38,N_C|D_8
.byte INSTRUMENT,PI_Select_Lead_1,N_GH|D_8,N_CH,CHVOLUME,1,N_CH
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,4,TRANSPOSE,<38,N_D,N_DS,N_F,N_DS
.byte N_C,N_D,N_G,N_F,N_A|D_8,TRANSPOSE,<-26,PATEND
PPDAT_World_Select_4_pat_13_1_0:
.byte CHVOLUME,4,VIBRATO,0,N_FH|D_D8,INSTRUMENT,PI_Select_Lead_1,CHVOLUME,1
.byte VIBRATO,1,N_C|D_8,N_F,N_F,REST,INSTRUMENT,PI_Select_Lead_2,N_GH|D_8,N_FH
.byte N_AH,INSTRUMENT,PI_Banjo,CHVOLUME,3,N_F,N_A,N_F,N_C
.byte INSTRUMENT,PI_Select_Orc_Hit,CHVOLUME,4,VIBRATO,0,N_CH|D_D8
.byte INSTRUMENT,PI_Select_Lead_1,CHVOLUME,1,VIBRATO,1,N_C|D_8,N_F,N_F,REST
.byte INSTRUMENT,PI_Select_Lead_2,N_ASH|D_8,N_CHH,TRANSPOSE,<5,N_AH
.byte INSTRUMENT,PI_Banjo,CHVOLUME,3,N_G,N_F,N_E,N_C
.byte INSTRUMENT,PI_Select_Orc_Hit,CHVOLUME,4,VIBRATO,0,N_F|D_D8
.byte INSTRUMENT,PI_Select_Lead_1,CHVOLUME,1,VIBRATO,1,N_C|D_8,TRANSPOSE,<-5
.byte N_C,N_C,REST,INSTRUMENT,PI_Banjo,CHVOLUME,3,N_CH|D_8
.byte INSTRUMENT,PI_Select_Lead_2,CHVOLUME,1,N_AH,INSTRUMENT,PI_Banjo
.byte CHVOLUME,3,N_AS|D_D8,N_A|D_8,INSTRUMENT,PI_Select_Orc_Hit,CHVOLUME,4
.byte VIBRATO,0,N_F|D_D8,INSTRUMENT,PI_Select_Lead_1,CHVOLUME,1,VIBRATO,1
.byte N_C|D_8,TRANSPOSE,<-7,N_C,N_C,INSTRUMENT,PI_Select_Lead_2,TRANSPOSE,<14
.byte N_DH,INSTRUMENT,PI_Banjo,CHVOLUME,3,N_F,N_DS,N_C,N_D,N_G,N_F,N_A,N_CH
.byte TRANSPOSE,<-7,PATEND
PPDAT_World_Select_4_pat_13_2_0:
.byte VIBRATO,2,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_DS,REST,N_DS|D_8,N_DS|D_8,REST
.byte INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Blank
.byte N_F|D_8,INSTRUMENT,PI_Boss_Bass,N_F|D_8,INSTRUMENT,PI_Blank,N_G,REST
.byte N_G|D_8,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_DS,REST,N_DS|D_8,N_DS|D_8,REST
.byte INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Blank
.byte N_F|D_8,INSTRUMENT,PI_Boss_Bass,N_F,REST|D_4,N_TIE,PATEND
PPDAT_World_Select_4_pat_13_3_0:
.byte DR_autodrum17|D_4,DR_autodrum9,DR_autodrum7,DR_autodrum10,DR_autodrum9
.byte DR_autodrum6,DR_autodrum7,DR_autodrum10,DR_autodrum7,DR_autodrum9
.byte DR_autodrum7,DR_autodrum9|D_8,DR_autodrum6,DR_autodrum7,DR_autodrum10|D_8
.byte DR_autodrum9,DR_autodrum7,DR_autodrum10,DR_autodrum9,DR_autodrum6
.byte DR_autodrum7,DR_autodrum10,DR_autodrum7,DR_autodrum9,DR_autodrum7
.byte DR_autodrum9|D_8,DR_autodrum6,DR_autodrum7,DR_autodrum10|D_8,DR_autodrum9
.byte DR_autodrum7,DR_autodrum10,DR_autodrum9,DR_autodrum6,DR_autodrum7
.byte DR_autodrum10,DR_autodrum7,DR_autodrum9,DR_autodrum7,DR_autodrum9|D_8
.byte DR_autodrum6,DR_autodrum7,DR_autodrum10|D_8,DR_autodrum9,DR_autodrum7
.byte DR_autodrum10,DR_autodrum9,DR_autodrum6,DR_autodrum7,DR_autodrum10
.byte DR_autodrum7,DR_autodrum4,DR_autodrum4,DR_autodrum0,DR_autodrum0,PATEND
PPDAT_World_Select_5_pat_13_0_0:
.byte CHVOLUME,4,ARPEGGIO,$00,N_C|D_8,INSTRUMENT,PI_Horn,N_G|D_8,N_CH
.byte CHVOLUME,1,N_CH,REST,INSTRUMENT,PI_Puzzle_Pulsate,CHVOLUME,4
.byte TRANSPOSE,<24,N_D|D_8,N_C,N_D,N_E,N_C|D_4,INSTRUMENT,PI_Select_Orc_Hit
.byte TRANSPOSE,<-29,N_C|D_8,INSTRUMENT,PI_Horn,N_CH|D_8,N_FH,CHVOLUME,1,N_FH
.byte REST,INSTRUMENT,PI_Puzzle_Pulsate,CHVOLUME,4,TRANSPOSE,<33,N_CS|D_8,N_DS
.byte N_F|D_8,N_DS|D_8,N_C|D_8,INSTRUMENT,PI_Select_Orc_Hit,TRANSPOSE,<-35
.byte N_C|D_8,INSTRUMENT,PI_Horn,N_GH|D_8,N_DH,CHVOLUME,1,N_DH,REST
.byte INSTRUMENT,PI_Puzzle_Pulsate,CHVOLUME,4,TRANSPOSE,<33,N_C|D_8,N_DS
.byte N_D|D_8,N_F|D_8,N_D|D_8,INSTRUMENT,PI_Select_Orc_Hit,TRANSPOSE,<-38
.byte N_C|D_8,INSTRUMENT,PI_Horn,N_GH|D_8,N_CH,CHVOLUME,1,N_CH
.byte INSTRUMENT,PI_Pizzicato_Strings,CHVOLUME,4,TRANSPOSE,<38,N_D,N_DS,N_F
.byte N_DS,N_C,N_D,N_G,N_F,N_A,CHVOLUME,1,N_TIE,TRANSPOSE,<-26,PATEND
PPDAT_World_Select_5_pat_13_1_0:
.byte CHVOLUME,4,VIBRATO,0,N_FH|D_D8,INSTRUMENT,PI_Horn,CHVOLUME,1,VIBRATO,1
.byte N_C|D_8,N_F,N_F,REST,INSTRUMENT,PI_Puzzle_Pulsate,N_GH|D_8,N_FH,N_AH
.byte INSTRUMENT,PI_Banjo,CHVOLUME,3,N_F,N_A,N_F,N_C
.byte INSTRUMENT,PI_Select_Orc_Hit,CHVOLUME,4,VIBRATO,0,N_CH|D_D8
.byte INSTRUMENT,PI_Horn,CHVOLUME,1,VIBRATO,1,N_C|D_8,N_F,N_F,REST
.byte INSTRUMENT,PI_Puzzle_Pulsate,N_ASH|D_8,N_CHH,TRANSPOSE,<5,N_AH
.byte INSTRUMENT,PI_Banjo,CHVOLUME,3,N_G,N_F,N_E,N_C
.byte INSTRUMENT,PI_Select_Orc_Hit,CHVOLUME,4,VIBRATO,0,N_F|D_D8
.byte INSTRUMENT,PI_Horn,CHVOLUME,1,VIBRATO,1,N_C|D_8,TRANSPOSE,<-5,N_C,N_C
.byte REST,INSTRUMENT,PI_Banjo,CHVOLUME,3,N_CH|D_8,INSTRUMENT,PI_Puzzle_Pulsate
.byte CHVOLUME,1,N_AH,INSTRUMENT,PI_Banjo,CHVOLUME,3,N_AS|D_D8,N_A|D_8
.byte INSTRUMENT,PI_Select_Orc_Hit,CHVOLUME,4,VIBRATO,0,N_F|D_D8
.byte INSTRUMENT,PI_Horn,CHVOLUME,1,VIBRATO,1,N_C|D_8,TRANSPOSE,<-7,N_C,N_C
.byte INSTRUMENT,PI_Puzzle_Mellow_Crazy,TRANSPOSE,<14,N_DH,INSTRUMENT,PI_Banjo
.byte CHVOLUME,3,N_F,N_DS,N_C,N_D,N_G,N_F,N_A,N_CH,TRANSPOSE,<-7,PATEND
PPDAT_World_Select_5_pat_13_2_0:
.byte VIBRATO,2,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_DS,REST,N_DS|D_8,N_DS|D_8,REST
.byte INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Blank
.byte N_F|D_8,INSTRUMENT,PI_Boss_Bass,N_F|D_8,INSTRUMENT,PI_Blank,N_G,REST
.byte N_G|D_8,N_DS|D_8,REST,INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8
.byte INSTRUMENT,PI_Blank,N_C|D_8,INSTRUMENT,PI_Boss_Bass,N_C|D_8
.byte INSTRUMENT,PI_Blank,N_DS,REST,N_DS|D_8,N_DS|D_8,REST
.byte INSTRUMENT,PI_Boss_Bass,N_DS|D_8,REST,N_DS|D_8,INSTRUMENT,PI_Blank
.byte N_F|D_8,INSTRUMENT,PI_Boss_Bass,N_F,REST|D_4,N_TIE,PATEND
PPDAT_World_Select_5_pat_13_3_0:
.byte DR_autodrum17|D_4,DR_autodrum19,DR_autodrum7,DR_autodrum10,DR_autodrum19
.byte DR_autodrum6,DR_autodrum7,DR_autodrum10,DR_autodrum7,DR_autodrum19
.byte DR_autodrum7,DR_autodrum19|D_8,DR_autodrum6,DR_autodrum7
.byte DR_autodrum10|D_8,DR_autodrum19,DR_autodrum7,DR_autodrum10,DR_autodrum19
.byte DR_autodrum6,DR_autodrum7,DR_autodrum10,DR_autodrum7,DR_autodrum19
.byte DR_autodrum7,DR_autodrum19|D_8,DR_autodrum6,DR_autodrum7
.byte DR_autodrum10|D_8,DR_autodrum19,DR_autodrum7,DR_autodrum10,DR_autodrum19
.byte DR_autodrum6,DR_autodrum7,DR_autodrum10,DR_autodrum7,DR_autodrum19
.byte DR_autodrum7,DR_autodrum19|D_8,DR_autodrum6,DR_autodrum7
.byte DR_autodrum10|D_8,DR_autodrum19,DR_autodrum7,DR_autodrum10,DR_autodrum19
.byte DR_autodrum6,DR_autodrum7,DR_autodrum10,DR_autodrum7,DR_autodrum4
.byte DR_autodrum4,DR_autodrum0,DR_autodrum0,PATEND
pently_songs:  ; 13 entries, 1606 bytes
songdef PS_World_1A, PSDAT_World_1A
songdef PS_World_1B, PSDAT_World_1B
songdef PS_World_3, PSDAT_World_3
songdef PS_World_2, PSDAT_World_2
songdef PS_World_5, PSDAT_World_5
songdef PS_Minor_Boss, PSDAT_Minor_Boss
songdef PS_Major_Boss, PSDAT_Major_Boss
songdef PS_Final_Boss, PSDAT_Final_Boss
songdef PS_World_Select_1, PSDAT_World_Select_1
songdef PS_World_Select_2, PSDAT_World_Select_2
songdef PS_World_Select_3, PSDAT_World_Select_3
songdef PS_World_Select_4, PSDAT_World_Select_4
songdef PS_World_Select_5, PSDAT_World_Select_5
PSDAT_World_1A:
playPatSq1 PP_World_1A_pat_2_0_0, 26, PI_Tribal_Background
playPatSq2 PP_World_1A_pat_2_1_0, 0, PI_Tribal_Bass
playPatNoise PP_World_1A_pat_2_3_0
setTempo 450
setBeatDuration D_4
waitRows 64
playPatSq1 PP_World_1A_pat_2_0_0, 26, PI_Tribal_Background
playPatSq2 PP_World_1A_pat_2_1_1, 5, PI_Tribal_Bass
playPatNoise PP_World_1A_pat_2_3_0
waitRows 64
playPatSq1 PP_World_1A_pat_2_0_1, 29, PI_Tribal_Background
playPatSq2 PP_World_1A_pat_2_1_2, 5, PI_Tribal_Bass
playPatNoise PP_World_1A_pat_2_3_1
waitRows 64
playPatSq1 PP_World_1A_pat_2_0_1, 29, PI_Tribal_Background
playPatSq2 PP_World_1A_pat_2_1_3, 5, PI_Tribal_Bass
playPatNoise PP_World_1A_pat_2_3_1
waitRows 64
playPatSq1 PP_World_1A_pat_2_0_4, 29, PI_Horn
playPatSq2 PP_World_1A_pat_2_1_4, 2, PI_Tribal_Bass
playPatNoise PP_World_1A_pat_2_3_3
waitRows 64
playPatSq1 PP_World_1A_pat_2_0_5, 29, PI_Horn
playPatSq2 PP_World_1A_pat_2_1_4, 2, PI_Tribal_Bass
playPatNoise PP_World_1A_pat_2_3_3
waitRows 64
playPatSq1 PP_World_1A_pat_2_0_4, 29, PI_Horn
playPatSq2 PP_World_1A_pat_2_1_7, 5, PI_Tribal_Bass
playPatNoise PP_World_1A_pat_2_3_2
waitRows 64
playPatSq1 PP_World_1A_pat_2_0_6, 29, PI_Horn
playPatSq2 PP_World_1A_pat_2_1_8, 5, PI_Tribal_Bass
playPatNoise PP_World_1A_pat_2_3_2
waitRows 64
playPatSq1 PP_World_1A_pat_2_0_7, 26, PI_Tribal_Hit
playPatSq2 PP_World_1A_pat_2_1_9, 41, PI_Horn
playPatNoise PP_World_1A_pat_2_3_4
waitRows 64
dalSegno
PSDAT_World_1B:
playPatSq1 PP_World_1B_pat_3_0_0, 17, PI_Miniboss_Flute
playPatSq2 PP_World_1B_pat_3_1_0, 56, PI_Puzzle_Mellow_Crazy
playPatTri PP_World_1B_pat_3_2_0, 19, PI_Blank
playPatNoise PP_World_1B_pat_3_3_0
setTempo 514
setBeatDuration D_4
waitRows 48
playPatSq1 PP_World_1B_pat_3_0_1, 17, PI_Miniboss_Flute
playPatSq2 PP_World_1B_pat_3_1_1, 56, PI_Puzzle_Mellow_Crazy
playPatTri PP_World_1B_pat_3_2_1, 20, PI_Blank
playPatNoise PP_World_1B_pat_3_3_0
waitRows 48
playPatSq1 PP_World_1B_pat_3_0_2, 22, PI_Select_Orc_Hit
playPatSq2 PP_World_1B_pat_3_1_2, 7, PI_Puzzle_Mellow_Crazy
playPatTri PP_World_1B_pat_3_2_2, 19, PI_Blank
playPatNoise PP_World_1B_pat_3_3_0
waitRows 48
playPatSq1 PP_World_1B_pat_3_0_2, 22, PI_Select_Orc_Hit
playPatSq2 PP_World_1B_pat_3_1_2, 7, PI_Puzzle_Mellow_Crazy
playPatTri PP_World_1B_pat_3_2_2, 19, PI_Blank
playPatNoise PP_World_1B_pat_3_3_0
waitRows 48
playPatSq1 PP_World_1B_pat_3_0_3, 20, PI_Select_Orc_Hit
playPatSq2 PP_World_1B_pat_3_1_2, 7, PI_Puzzle_Mellow_Crazy
playPatTri PP_World_1B_pat_3_2_3, 19, PI_Blank
playPatNoise PP_World_1B_pat_3_3_1
waitRows 48
playPatSq1 PP_World_1B_pat_3_0_5, 31, PI_Puzzle_Pulsate
playPatSq2 PP_World_1B_pat_3_1_5, 20, PI_Banjo
playPatTri PP_World_1B_pat_3_2_5, 12, PI_Blank
playPatNoise PP_World_1B_pat_3_3_2
waitRows 48
playPatSq1 PP_World_1B_pat_3_0_4, 31, PI_Puzzle_Pulsate
playPatSq2 PP_World_1B_pat_3_1_4, 20, PI_Banjo
playPatTri PP_World_1B_pat_3_2_4, 12, PI_Blank
playPatNoise PP_World_1B_pat_3_3_2
waitRows 48
playPatSq1 PP_World_1B_pat_3_0_5, 31, PI_Puzzle_Pulsate
playPatSq2 PP_World_1B_pat_3_1_5, 20, PI_Banjo
playPatTri PP_World_1B_pat_3_2_6, 15, PI_Blank
playPatNoise PP_World_1B_pat_3_3_5
waitRows 48
playPatSq1 PP_World_1B_pat_3_0_6, 31, PI_Puzzle_Pulsate
playPatSq2 PP_World_1B_pat_3_1_6, 20, PI_Banjo
playPatTri PP_World_1B_pat_3_2_7, 19, PI_Blank
playPatNoise PP_World_1B_pat_3_3_5
waitRows 48
dalSegno
PSDAT_World_3:
playPatSq1 PP_World_3_pat_4_0_0, 7, PI_Cave_Bass
playPatNoise PP_World_3_pat_4_3_0
stopPatSq2
stopPatTri
setTempo 450
setBeatDuration D_4
waitRows 64
playPatSq1 PP_World_3_pat_4_0_1, 7, PI_Cave_Bass
playPatSq2 PP_World_3_pat_4_1_1, 29, PI_Distant_Square_Echo
playPatTri PP_World_3_pat_4_2_1, 41, PI_Blank
playPatNoise PP_World_3_pat_4_3_0
waitRows 64
playPatSq1 PP_World_3_pat_4_0_1, 7, PI_Cave_Bass
playPatSq2 PP_World_3_pat_4_1_2, 29, PI_Distant_Square_Echo
playPatTri PP_World_3_pat_4_2_2, 41, PI_Blank
playPatNoise PP_World_3_pat_4_3_0
waitRows 64
playPatSq1 PP_World_3_pat_4_0_2, 5, PI_Cave_Bass
playPatSq2 PP_World_3_pat_4_1_3, 36, PI_Cave_Lead
playPatTri PP_World_3_pat_4_2_3, 31, PI_Blank
playPatNoise PP_World_3_pat_4_3_3
waitRows 64
playPatSq1 PP_World_3_pat_4_0_3, 2, PI_Cave_Bass
playPatSq2 PP_World_3_pat_4_1_4, 31, PI_Cave_Lead
playPatTri PP_World_3_pat_4_2_4, 31, PI_Blank
playPatNoise PP_World_3_pat_4_3_3
waitRows 64
playPatSq1 PP_World_3_pat_4_0_4, 5, PI_Cave_Bass
playPatSq2 PP_World_3_pat_4_1_5, 34, PI_Pizzicato_Strings
playPatTri PP_World_3_pat_4_2_5, 31, PI_Cave_Triangle
playPatNoise PP_World_3_pat_4_3_5
waitRows 64
playPatSq1 PP_World_3_pat_4_0_4, 5, PI_Cave_Bass
playPatSq2 PP_World_3_pat_4_1_6, 36, PI_Pizzicato_Strings
playPatTri PP_World_3_pat_4_2_6, 31, PI_Cave_Triangle
playPatNoise PP_World_3_pat_4_3_6
waitRows 64
dalSegno
PSDAT_World_2:
playPatSq1 PP_World_2_pat_5_0_1, 41, PI_Blank
playPatNoise PP_World_2_pat_5_3_2
setTempo 720
setBeatDuration D_4
waitRows 64
playPatSq1 PP_World_2_pat_5_0_1, 41, PI_Blank
playPatNoise PP_World_2_pat_5_3_2
waitRows 64
segno
playPatSq1 PP_World_2_pat_5_0_1, 41, PI_Blank
playPatSq2 PP_World_2_pat_5_1_0, 8, PI_Distant_Square_Echo
playPatTri PP_World_2_pat_5_2_0, 20, PI_Blank
playPatNoise PP_World_2_pat_5_3_4
waitRows 64
playPatSq1 PP_World_2_pat_5_0_1, 41, PI_Blank
playPatSq2 PP_World_2_pat_5_1_3, 8, PI_Distant_Square_Echo
playPatTri PP_World_2_pat_5_2_3, 20, PI_Blank
playPatNoise PP_World_2_pat_5_3_4
waitRows 64
playPatSq1 PP_World_2_pat_5_0_2, 27, PI_Puzzle_Mellow_Crazy
playPatSq2 PP_World_2_pat_5_1_0, 8, PI_Distant_Square_Echo
playPatTri PP_World_2_pat_5_2_0, 20, PI_Blank
playPatNoise PP_World_2_pat_5_3_0
waitRows 64
playPatSq1 PP_World_2_pat_5_0_4, 24, PI_Puzzle_Mellow_Crazy
playPatSq2 PP_World_2_pat_5_1_3, 8, PI_Distant_Square_Echo
playPatTri PP_World_2_pat_5_2_4, 20, PI_Blank
playPatNoise PP_World_2_pat_5_3_0
waitRows 64
playPatSq1 PP_World_2_pat_5_0_2, 27, PI_Puzzle_Mellow_Crazy
playPatSq2 PP_World_2_pat_5_1_5, 41, PI_Puzzle_Fill
playPatTri PP_World_2_pat_5_2_0, 20, PI_Blank
playPatNoise PP_World_2_pat_5_3_0
waitRows 64
playPatSq1 PP_World_2_pat_5_0_4, 24, PI_Puzzle_Mellow_Crazy
playPatSq2 PP_World_2_pat_5_1_6, 41, PI_Puzzle_Fill
playPatTri PP_World_2_pat_5_2_4, 20, PI_Blank
playPatNoise PP_World_2_pat_5_3_0
waitRows 64
playPatSq1 PP_World_2_pat_5_0_6, 27, PI_Horn
playPatSq2 PP_World_2_pat_5_1_7, 29, PI_Puzzle_Effects
playPatTri PP_World_2_pat_5_2_0, 20, PI_Blank
playPatNoise PP_World_2_pat_5_3_0
waitRows 64
playPatSq1 PP_World_2_pat_5_0_7, 27, PI_Horn
playPatSq2 PP_World_2_pat_5_1_8, 29, PI_Puzzle_Effects
playPatTri PP_World_2_pat_5_2_6, 20, PI_Blank
playPatNoise PP_World_2_pat_5_3_6
waitRows 64
playPatSq1 PP_World_2_pat_5_0_1, 41, PI_Blank
playPatSq2 PP_World_2_pat_5_1_9, 17, PI_Distant_Square_Echo
playPatTri PP_World_2_pat_5_2_7, 29, PI_Blank
playPatNoise PP_World_2_pat_5_3_1
waitRows 64
playPatSq1 PP_World_2_pat_5_0_1, 41, PI_Blank
playPatSq2 PP_World_2_pat_5_1_10, 17, PI_Distant_Square_Echo
playPatTri PP_World_2_pat_5_2_7, 29, PI_Blank
playPatNoise PP_World_2_pat_5_3_3
waitRows 64
dalSegno
PSDAT_World_5:
playPatSq1 PP_World_5_pat_6_0_0, 24, PI_Harp
playPatSq2 PP_World_5_pat_6_1_0, 24, PI_Harp
stopPatTri
stopPatNoise
setTempo 900
setBeatDuration D_4
waitRows 64
playPatSq1 PP_World_5_pat_6_0_1, 24, PI_Harp
playPatSq2 PP_World_5_pat_6_1_1, 24, PI_Harp
playPatTri PP_World_5_pat_6_2_1, 33, PI_Triangle_Choir
playPatNoise PP_World_5_pat_6_3_1
waitRows 64
playPatSq1 PP_World_5_pat_6_0_2, 20, PI_Harp
playPatSq2 PP_World_5_pat_6_1_2, 20, PI_Harp
playPatTri PP_World_5_pat_6_2_2, 32, PI_Triangle_Choir
stopPatNoise
waitRows 64
playPatSq1 PP_World_5_pat_6_0_3, 22, PI_Harp
playPatSq2 PP_World_5_pat_6_1_3, 22, PI_Harp
playPatTri PP_World_5_pat_6_2_3, 34, PI_Triangle_Choir
waitRows 64
playPatSq1 PP_World_5_pat_6_0_0, 24, PI_Harp
playPatSq2 PP_World_5_pat_6_1_0, 24, PI_Harp
playPatTri PP_World_5_pat_6_2_4, 28, PI_Triangle_Choir
waitRows 64
playPatSq1 PP_World_5_pat_6_0_1, 24, PI_Harp
playPatSq2 PP_World_5_pat_6_1_1, 24, PI_Harp
playPatTri PP_World_5_pat_6_2_5, 24, PI_Blank
playPatNoise PP_World_5_pat_6_3_5
waitRows 64
playPatSq1 PP_World_5_pat_6_0_1, 24, PI_Harp
playPatSq2 PP_World_5_pat_6_1_1, 24, PI_Harp
playPatTri PP_World_5_pat_6_2_7, 24, PI_Blank
playPatNoise PP_World_5_pat_6_3_5
waitRows 64
playPatSq1 PP_World_5_pat_6_0_2, 20, PI_Harp
playPatSq2 PP_World_5_pat_6_1_2, 20, PI_Harp
playPatTri PP_World_5_pat_6_2_8, 20, PI_Blank
playPatNoise PP_World_5_pat_6_3_5
waitRows 64
playPatSq1 PP_World_5_pat_6_0_3, 22, PI_Harp
playPatSq2 PP_World_5_pat_6_1_3, 22, PI_Harp
playPatTri PP_World_5_pat_6_2_9, 22, PI_Blank
playPatNoise PP_World_5_pat_6_3_9
waitRows 64
playPatSq1 PP_World_5_pat_6_0_10, 21, PI_Harp
playPatSq2 PP_World_5_pat_6_1_10, 19, PI_Harp
playPatTri PP_World_5_pat_6_2_5, 24, PI_Blank
playPatNoise PP_World_5_pat_6_3_5
waitRows 64
playPatSq1 PP_World_5_pat_6_0_11, 24, PI_Banjo
playPatSq2 PP_World_5_pat_6_1_11, 24, PI_Miniboss_Flute
playPatTri PP_World_5_pat_6_2_7, 24, PI_Blank
playPatNoise PP_World_5_pat_6_3_11
waitRows 64
playPatSq1 PP_World_5_pat_6_0_12, 20, PI_Banjo
playPatSq2 PP_World_5_pat_6_1_12, 24, PI_Miniboss_Flute
playPatTri PP_World_5_pat_6_2_12, 20, PI_Blank
playPatNoise PP_World_5_pat_6_3_11
waitRows 64
playPatSq1 PP_World_5_pat_6_0_11, 24, PI_Banjo
playPatSq2 PP_World_5_pat_6_1_13, 24, PI_Miniboss_Flute
playPatTri PP_World_5_pat_6_2_7, 24, PI_Blank
playPatNoise PP_World_5_pat_6_3_11
waitRows 64
playPatSq1 PP_World_5_pat_6_0_13, 20, PI_Banjo
playPatSq2 PP_World_5_pat_6_1_14, 24, PI_Miniboss_Flute
playPatTri PP_World_5_pat_6_2_13, 20, PI_Blank
playPatNoise PP_World_5_pat_6_3_11
waitRows 64
playPatSq1 PP_World_5_pat_6_0_14, 24, PI_Distant_Square_Echo
playPatSq2 PP_World_5_pat_6_1_15, 24, PI_Distant_Square_Echo
playPatTri PP_World_5_pat_6_2_14, 36, PI_Blank
playPatNoise PP_World_5_pat_6_3_1
waitRows 64
playPatSq1 PP_World_5_pat_6_0_15, 27, PI_Distant_Square_Echo
playPatSq2 PP_World_5_pat_6_1_16, 27, PI_Super_Major_Arp
playPatTri PP_World_5_pat_6_2_15, 39, PI_Blank
playPatNoise PP_World_5_pat_6_3_1
waitRows 64
playPatSq1 PP_World_5_pat_6_0_16, 20, PI_Distant_Square_Echo
playPatSq2 PP_World_5_pat_6_1_17, 20, PI_Super_Major_Arp
playPatTri PP_World_5_pat_6_2_16, 32, PI_Blank
playPatNoise PP_World_5_pat_6_3_15
waitRows 64
dalSegno
PSDAT_Minor_Boss:
playPatSq1 PP_Minor_Boss_pat_7_0_0, 3, PI_Distant_Square_Echo
playPatSq2 PP_Minor_Boss_pat_7_1_0, 24, PI_Boss_Arp_Hit
playPatTri PP_Minor_Boss_pat_7_2_0, 15, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_0
setTempo 900
setBeatDuration D_4
waitRows 64
segno
playPatSq1 PP_Minor_Boss_pat_7_0_1, 0, PI_Distant_Square_Echo
playPatSq2 PP_Minor_Boss_pat_7_1_1, 22, PI_Boss_Arp_Hit
playPatTri PP_Minor_Boss_pat_7_2_1, 12, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_1
waitRows 64
playPatSq1 PP_Minor_Boss_pat_7_0_2, 29, PI_Miniboss_Flute
playPatSq2 PP_Minor_Boss_pat_7_1_2, 24, PI_Pizzicato_Strings
playPatTri PP_Minor_Boss_pat_7_2_2, 15, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_2
waitRows 64
playPatSq1 PP_Minor_Boss_pat_7_0_3, 24, PI_Miniboss_Flute
playPatSq2 PP_Minor_Boss_pat_7_1_3, 22, PI_Pizzicato_Strings
playPatTri PP_Minor_Boss_pat_7_2_3, 12, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_2
waitRows 64
playPatSq1 PP_Minor_Boss_pat_7_0_4, 27, PI_Miniboss_Flute
playPatSq2 PP_Minor_Boss_pat_7_1_2, 24, PI_Pizzicato_Strings
playPatTri PP_Minor_Boss_pat_7_2_2, 15, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_4
waitRows 64
playPatSq1 PP_Minor_Boss_pat_7_0_5, 24, PI_Miniboss_Flute
playPatSq2 PP_Minor_Boss_pat_7_1_3, 22, PI_Pizzicato_Strings
playPatTri PP_Minor_Boss_pat_7_2_3, 12, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_2
waitRows 64
playPatSq1 PP_Minor_Boss_pat_7_0_6, 8, PI_Minor_Boss_Rhythm_Guitar
playPatSq2 PP_Minor_Boss_pat_7_1_6, 24, PI_Horn
playPatTri PP_Minor_Boss_pat_7_2_6, 12, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_6
waitRows 64
playPatSq1 PP_Minor_Boss_pat_7_0_7, 7, PI_Minor_Boss_Rhythm_Guitar
playPatSq2 PP_Minor_Boss_pat_7_1_7, 22, PI_Horn
playPatTri PP_Minor_Boss_pat_7_2_7, 17, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_7
waitRows 64
playPatSq1 PP_Minor_Boss_pat_7_0_8, 8, PI_Minor_Boss_Rhythm_Guitar
playPatSq2 PP_Minor_Boss_pat_7_1_6, 24, PI_Horn
playPatTri PP_Minor_Boss_pat_7_2_6, 12, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_6
waitRows 64
playPatSq1 PP_Minor_Boss_pat_7_0_9, 7, PI_Minor_Boss_Rhythm_Guitar
playPatSq2 PP_Minor_Boss_pat_7_1_9, 29, PI_Horn
playPatTri PP_Minor_Boss_pat_7_2_9, 17, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_6
waitRows 64
playPatSq1 PP_Minor_Boss_pat_7_0_10, 0, PI_Distant_Square_Echo
playPatSq2 PP_Minor_Boss_pat_7_1_10, 22, PI_Horn
playPatTri PP_Minor_Boss_pat_7_2_10, 12, PI_Blank
playPatNoise PP_Minor_Boss_pat_7_3_10
waitRows 64
dalSegno
PSDAT_Major_Boss:
playPatSq1 PP_Major_Boss_pat_8_0_0, 4, PI_Distant_Square_Echo
playPatSq2 PP_Major_Boss_pat_8_1_0, 4, PI_Distant_Square_Echo
playPatTri PP_Major_Boss_pat_8_2_0, 16, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_0
setTempo 900
setBeatDuration D_4
waitRows 64
segno
playPatSq1 PP_Major_Boss_pat_8_0_0, 4, PI_Distant_Square_Echo
playPatSq2 PP_Major_Boss_pat_8_1_0, 4, PI_Distant_Square_Echo
playPatTri PP_Major_Boss_pat_8_2_1, 16, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_1
waitRows 64
playPatSq1 PP_Major_Boss_pat_8_0_1, 26, PI_Boss_Arp_Hit
playPatSq2 PP_Major_Boss_pat_8_1_0, 4, PI_Distant_Square_Echo
playPatTri PP_Major_Boss_pat_8_2_1, 16, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_2
waitRows 64
playPatSq1 PP_Major_Boss_pat_8_0_2, 31, PI_Boss_Arp_Hit
playPatSq2 PP_Major_Boss_pat_8_1_2, 4, PI_Distant_Square_Echo
playPatTri PP_Major_Boss_pat_8_2_3, 16, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_1
waitRows 64
playPatSq1 PP_Major_Boss_pat_8_0_3, 50, PI_Pizzicato_Strings
playPatSq2 PP_Major_Boss_pat_8_1_0, 4, PI_Distant_Square_Echo
playPatTri PP_Major_Boss_pat_8_2_1, 16, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_1
waitRows 64
playPatSq1 PP_Major_Boss_pat_8_0_4, 50, PI_Pizzicato_Strings
playPatSq2 PP_Major_Boss_pat_8_1_8, 4, PI_Distant_Square_Echo
playPatTri PP_Major_Boss_pat_8_2_3, 16, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_1
waitRows 64
playPatSq1 PP_Major_Boss_pat_8_0_5, 23, PI_Horn
playPatSq2 PP_Major_Boss_pat_8_1_4, 19, PI_Horn
playPatTri PP_Major_Boss_pat_8_2_5, 14, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_1
waitRows 64
playPatSq1 PP_Major_Boss_pat_8_0_6, 21, PI_Horn
playPatSq2 PP_Major_Boss_pat_8_1_5, 18, PI_Horn
playPatTri PP_Major_Boss_pat_8_2_5, 14, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_5
waitRows 64
playPatSq1 PP_Major_Boss_pat_8_0_5, 23, PI_Horn
playPatSq2 PP_Major_Boss_pat_8_1_6, 24, PI_Boss_Arp_Hit
playPatTri PP_Major_Boss_pat_8_2_5, 14, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_1
waitRows 64
playPatSq1 PP_Major_Boss_pat_8_0_7, 28, PI_Horn
playPatSq2 PP_Major_Boss_pat_8_1_7, 24, PI_Boss_Arp_Hit
playPatTri PP_Major_Boss_pat_8_2_7, 14, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_6
waitRows 64
playPatSq1 PP_Major_Boss_pat_8_0_8, 40, PI_Horn
playPatSq2 PP_Major_Boss_pat_8_1_0, 4, PI_Distant_Square_Echo
playPatTri PP_Major_Boss_pat_8_2_1, 16, PI_Blank
playPatNoise PP_Major_Boss_pat_8_3_1
waitRows 64
dalSegno
PSDAT_Final_Boss:
playPatSq1 PP_Final_Boss_pat_9_0_2, 13, PI_Select_Lead_2
playPatSq2 PP_Final_Boss_pat_9_1_2, 18, PI_Boss2Echo
playPatTri PP_Final_Boss_pat_9_2_2, 20, PI_Blank
playPatNoise PP_Final_Boss_pat_9_3_2
setTempo 720
setBeatDuration D_4
waitRows 16
segno
playPatSq1 PP_Final_Boss_pat_9_0_0, 32, PI_Boss_2_Lead
playPatSq2 PP_Final_Boss_pat_9_1_0, 25, PI_Boss2Echo
playPatTri PP_Final_Boss_pat_9_2_0, 23, PI_Blank
playPatNoise PP_Final_Boss_pat_9_3_0
waitRows 64
playPatSq1 PP_Final_Boss_pat_9_0_1, 37, PI_Boss_2_Lead
playPatSq2 PP_Final_Boss_pat_9_1_1, 25, PI_Boss2Echo
playPatTri PP_Final_Boss_pat_9_2_1, 20, PI_Blank
playPatNoise PP_Final_Boss_pat_9_3_1
waitRows 64
playPatSq1 PP_Final_Boss_pat_9_0_0, 32, PI_Boss_2_Lead
playPatSq2 PP_Final_Boss_pat_9_1_0, 25, PI_Boss2Echo
playPatTri PP_Final_Boss_pat_9_2_0, 23, PI_Blank
playPatNoise PP_Final_Boss_pat_9_3_0
waitRows 64
playPatSq1 PP_Final_Boss_pat_9_0_1, 37, PI_Boss_2_Lead
playPatSq2 PP_Final_Boss_pat_9_1_1, 25, PI_Boss2Echo
playPatTri PP_Final_Boss_pat_9_2_1, 20, PI_Blank
playPatNoise PP_Final_Boss_pat_9_3_1
waitRows 64
playPatSq1 PP_Final_Boss_pat_9_0_3, 39, PI_Boss_2_Lead
playPatSq2 PP_Final_Boss_pat_9_1_3, 27, PI_Boss2Echo
playPatTri PP_Final_Boss_pat_9_2_3, 27, PI_Blank
playPatNoise PP_Final_Boss_pat_9_3_0
waitRows 64
playPatSq1 PP_Final_Boss_pat_9_0_3, 39, PI_Boss_2_Lead
playPatSq2 PP_Final_Boss_pat_9_1_3, 27, PI_Boss2Echo
playPatTri PP_Final_Boss_pat_9_2_4, 27, PI_Blank
playPatNoise PP_Final_Boss_pat_9_3_3
waitRows 64
dalSegno
PSDAT_World_Select_1:
playPatSq1 PP_World_Select_1_pat_10_0_0, 15, PI_Select_Lead_1
playPatSq2 PP_World_Select_1_pat_10_1_0, 15, PI_Select_Lead_1
playPatTri PP_World_Select_1_pat_10_2_0, 24, PI_Blank
playPatNoise PP_World_Select_1_pat_10_3_0
setTempo 450
setBeatDuration D_4
waitRows 64
dalSegno
PSDAT_World_Select_2:
playPatSq1 PP_World_Select_2_pat_11_0_0, 15, PI_Select_Lead_1
playPatSq2 PP_World_Select_2_pat_11_1_0, 15, PI_Select_Lead_1
playPatTri PP_World_Select_2_pat_11_2_0, 24, PI_Blank
playPatNoise PP_World_Select_2_pat_11_3_0
setTempo 450
setBeatDuration D_4
waitRows 64
dalSegno
PSDAT_World_Select_3:
playPatSq1 PP_World_Select_3_pat_12_0_0, 15, PI_Select_Orc_Hit
playPatSq2 PP_World_Select_3_pat_12_1_0, 22, PI_Select_Orc_Hit
playPatTri PP_World_Select_3_pat_12_2_0, 24, PI_Blank
playPatNoise PP_World_Select_3_pat_12_3_0
setTempo 450
setBeatDuration D_4
waitRows 64
dalSegno
PSDAT_World_Select_4:
playPatSq1 PP_World_Select_4_pat_13_0_0, 15, PI_Select_Orc_Hit
playPatSq2 PP_World_Select_4_pat_13_1_0, 22, PI_Select_Orc_Hit
playPatTri PP_World_Select_4_pat_13_2_0, 24, PI_Blank
playPatNoise PP_World_Select_4_pat_13_3_0
setTempo 450
setBeatDuration D_4
waitRows 64
dalSegno
PSDAT_World_Select_5:
playPatSq1 PP_World_Select_5_pat_13_0_0, 15, PI_Select_Orc_Hit
playPatSq2 PP_World_Select_5_pat_13_1_0, 22, PI_Select_Orc_Hit
playPatTri PP_World_Select_5_pat_13_2_0, 24, PI_Blank
playPatNoise PP_World_Select_5_pat_13_3_0
setTempo 450
setBeatDuration D_4
waitRows 64
dalSegno

; Make music data available to Pently
.export pently_sfx_table,pently_instruments,pently_drums,pently_patterns
.export pently_songs

; Sound effect, instrument, and song names for your program to .importzp
.exportzp pently_resume_mute,PE_autotriangle1,PE_autotriangle2,PE_autotriangle3
.exportzp PE_autotriangle4,PE_autonoise5,PE_autonoise6,PE_autonoise7
.exportzp PE_autotriangleb,PE_autonoisec,PE_autotriangle10,PE_autonoise11
.exportzp PE_autonoise13,PE_autonoise14,PE_autotriangle15,PE_autonoise16
.exportzp PE_autonoise19,PE_autonoise1d,PE_autonoise1e,PE_autonoise1f
.exportzp PE_autonoise24,PE_autonoise25,PE_autonoise2b,PE_autonoise2c
.exportzp PE_autonoise2d,PE_autonoise36,PE_autotriangle37,PI_Blank
.exportzp PI_Tribal_Noise_1_26_4,PI_Tribal_Background,PI_Tribal_Bass
.exportzp PI_Tribal_Hit,PI_Horn,PI_Distant_Square_Echo,PI_Puzzle_Effects
.exportzp PI_Short_Kick,PI_Puzzle_Mellow_Crazy,PI_Puzzle_Pulsate,PI_Puzzle_Fill
.exportzp PI_Cave_Bass,PI_Cave_Lead,PI_Boss_Bass,PI_Boss_Arp_Hit
.exportzp PI_Pizzicato_Strings,PI_Cave_Triangle,PI_Select_Lead_1
.exportzp PI_Select_Lead_2,PI_Select_Orc_Hit,PI_Boss2Echo,PI_Boss_2_Lead
.exportzp PI_Banjo,PI_Minor_Boss_Rhythm_Guitar,PI_Miniboss_Flute,PI_Harp
.exportzp PI_Triangle_Choir,PI_Triangle_Short,PI_Super_Major_Arp,PS_World_1A
.exportzp PS_World_1B,PS_World_3,PS_World_2,PS_World_5,PS_Minor_Boss
.exportzp PS_Major_Boss,PS_Final_Boss,PS_World_Select_1,PS_World_Select_2
.exportzp PS_World_Select_3,PS_World_Select_4,PS_World_Select_5
pently_resume_mute = $00

; Total music data size: 14094 bytes
; pently_sfx_table: 636 bytes
;   PE_autotriangle1: 20 bytes
;   PE_autotriangle2: 10 bytes
;   PE_autotriangle3: 10 bytes
;   PE_autotriangle4: 20 bytes
;   PE_autonoise5: 16 bytes
;   PE_autonoise6: 16 bytes
;   PE_autonoise7: 12 bytes
;   PE_autotriangleb: 20 bytes
;   PE_autonoisec: 20 bytes
;   PE_autotriangle10: 12 bytes
;   PE_autonoise11: 12 bytes
;   PE_autonoise13: 12 bytes
;   PE_autonoise14: 30 bytes
;   PE_autotriangle15: 14 bytes
;   PE_autonoise16: 24 bytes
;   PE_autonoise19: 68 bytes
;   PE_autonoise1d: 44 bytes
;   PE_autonoise1e: 44 bytes
;   PE_autonoise1f: 44 bytes
;   PE_autonoise24: 18 bytes
;   PE_autonoise25: 18 bytes
;   PE_autonoise2b: 22 bytes
;   PE_autonoise2c: 34 bytes
;   PE_autonoise2d: 22 bytes
;   PE_autonoise36: 68 bytes
;   PE_autotriangle37: 6 bytes
; pently_instruments: 560 bytes
;   PI_Blank: 5 bytes
;   PI_Tribal_Noise_1_26_4: 17 bytes
;   PI_Tribal_Background: 26 bytes
;   PI_Tribal_Bass: 27 bytes
;   PI_Tribal_Hit: 22 bytes
;   PI_Horn: 7 bytes
;   PI_Distant_Square_Echo: 5 bytes
;   PI_Puzzle_Effects: 14 bytes
;   PI_Short_Kick: 5 bytes
;   PI_Puzzle_Mellow_Crazy: 28 bytes
;   PI_Puzzle_Pulsate: 21 bytes
;   PI_Puzzle_Fill: 16 bytes
;   PI_Cave_Bass: 32 bytes
;   PI_Cave_Lead: 21 bytes
;   PI_Boss_Bass: 7 bytes
;   PI_Boss_Arp_Hit: 25 bytes
;   PI_Pizzicato_Strings: 17 bytes
;   PI_Cave_Triangle: 10 bytes
;   PI_Select_Lead_1: 15 bytes
;   PI_Select_Lead_2: 29 bytes
;   PI_Select_Orc_Hit: 38 bytes
;   PI_Boss2Echo: 10 bytes
;   PI_Boss_2_Lead: 35 bytes
;   PI_Banjo: 16 bytes
;   PI_Minor_Boss_Rhythm_Guitar: 17 bytes
;   PI_Miniboss_Flute: 27 bytes
;   PI_Harp: 25 bytes
;   PI_Triangle_Choir: 17 bytes
;   PI_Triangle_Short: 8 bytes
;   PI_Super_Major_Arp: 18 bytes
; pently_drums: 44 bytes
;   DR_autodrum0: 2 bytes
;   DR_autodrum1: 2 bytes
;   DR_autodrum2: 2 bytes
;   DR_autodrum3: 2 bytes
;   DR_autodrum4: 2 bytes
;   DR_autodrum5: 2 bytes
;   DR_autodrum6: 2 bytes
;   DR_autodrum7: 2 bytes
;   DR_autodrum8: 2 bytes
;   DR_autodrum9: 2 bytes
;   DR_autodrum10: 2 bytes
;   DR_autodrum11: 2 bytes
;   DR_autodrum12: 2 bytes
;   DR_autodrum13: 2 bytes
;   DR_autodrum14: 2 bytes
;   DR_autodrum15: 2 bytes
;   DR_autodrum16: 2 bytes
;   DR_autodrum17: 2 bytes
;   DR_autodrum19: 2 bytes
;   DR_autodrum20: 2 bytes
;   DR_autodrum21: 2 bytes
;   DR_autodrum22: 2 bytes
; pently_patterns: 11248 bytes
;   PP_World_1A_pat_2_0_0: 39 bytes
;   PP_World_1A_pat_2_0_1: 39 bytes
;   PP_World_1A_pat_2_0_4: 48 bytes
;   PP_World_1A_pat_2_0_5: 48 bytes
;   PP_World_1A_pat_2_0_6: 50 bytes
;   PP_World_1A_pat_2_0_7: 45 bytes
;   PP_World_1A_pat_2_1_0: 17 bytes
;   PP_World_1A_pat_2_1_1: 60 bytes
;   PP_World_1A_pat_2_1_2: 61 bytes
;   PP_World_1A_pat_2_1_3: 61 bytes
;   PP_World_1A_pat_2_1_4: 30 bytes
;   PP_World_1A_pat_2_1_7: 105 bytes
;   PP_World_1A_pat_2_1_8: 120 bytes
;   PP_World_1A_pat_2_1_9: 36 bytes
;   PP_World_1A_pat_2_3_0: 67 bytes
;   PP_World_1A_pat_2_3_1: 67 bytes
;   PP_World_1A_pat_2_3_2: 67 bytes
;   PP_World_1A_pat_2_3_3: 47 bytes
;   PP_World_1A_pat_2_3_4: 53 bytes
;   PP_World_1B_pat_3_0_0: 28 bytes
;   PP_World_1B_pat_3_0_1: 29 bytes
;   PP_World_1B_pat_3_0_2: 27 bytes
;   PP_World_1B_pat_3_0_3: 82 bytes
;   PP_World_1B_pat_3_0_4: 32 bytes
;   PP_World_1B_pat_3_0_5: 30 bytes
;   PP_World_1B_pat_3_0_6: 31 bytes
;   PP_World_1B_pat_3_1_0: 65 bytes
;   PP_World_1B_pat_3_1_1: 63 bytes
;   PP_World_1B_pat_3_1_2: 63 bytes
;   PP_World_1B_pat_3_1_4: 45 bytes
;   PP_World_1B_pat_3_1_5: 55 bytes
;   PP_World_1B_pat_3_1_6: 44 bytes
;   PP_World_1B_pat_3_2_0: 27 bytes
;   PP_World_1B_pat_3_2_1: 27 bytes
;   PP_World_1B_pat_3_2_2: 29 bytes
;   PP_World_1B_pat_3_2_3: 24 bytes
;   PP_World_1B_pat_3_2_4: 21 bytes
;   PP_World_1B_pat_3_2_5: 17 bytes
;   PP_World_1B_pat_3_2_6: 10 bytes
;   PP_World_1B_pat_3_2_7: 19 bytes
;   PP_World_1B_pat_3_3_0: 37 bytes
;   PP_World_1B_pat_3_3_1: 32 bytes
;   PP_World_1B_pat_3_3_2: 30 bytes
;   PP_World_1B_pat_3_3_5: 22 bytes
;   PP_World_3_pat_4_0_0: 29 bytes
;   PP_World_3_pat_4_0_1: 27 bytes
;   PP_World_3_pat_4_0_2: 27 bytes
;   PP_World_3_pat_4_0_3: 27 bytes
;   PP_World_3_pat_4_0_4: 29 bytes
;   PP_World_3_pat_4_1_1: 44 bytes
;   PP_World_3_pat_4_1_2: 55 bytes
;   PP_World_3_pat_4_1_3: 137 bytes
;   PP_World_3_pat_4_1_4: 113 bytes
;   PP_World_3_pat_4_1_5: 67 bytes
;   PP_World_3_pat_4_1_6: 67 bytes
;   PP_World_3_pat_4_2_1: 45 bytes
;   PP_World_3_pat_4_2_2: 54 bytes
;   PP_World_3_pat_4_2_3: 29 bytes
;   PP_World_3_pat_4_2_4: 20 bytes
;   PP_World_3_pat_4_2_5: 43 bytes
;   PP_World_3_pat_4_2_6: 45 bytes
;   PP_World_3_pat_4_3_0: 33 bytes
;   PP_World_3_pat_4_3_3: 41 bytes
;   PP_World_3_pat_4_3_5: 43 bytes
;   PP_World_3_pat_4_3_6: 45 bytes
;   PP_World_2_pat_5_0_1: 99 bytes
;   PP_World_2_pat_5_0_2: 29 bytes
;   PP_World_2_pat_5_0_4: 67 bytes
;   PP_World_2_pat_5_0_6: 87 bytes
;   PP_World_2_pat_5_0_7: 87 bytes
;   PP_World_2_pat_5_1_0: 37 bytes
;   PP_World_2_pat_5_1_3: 35 bytes
;   PP_World_2_pat_5_1_5: 37 bytes
;   PP_World_2_pat_5_1_6: 35 bytes
;   PP_World_2_pat_5_1_7: 37 bytes
;   PP_World_2_pat_5_1_8: 35 bytes
;   PP_World_2_pat_5_1_9: 44 bytes
;   PP_World_2_pat_5_1_10: 42 bytes
;   PP_World_2_pat_5_2_0: 39 bytes
;   PP_World_2_pat_5_2_1: 39 bytes
;   PP_World_2_pat_5_2_3: 37 bytes
;   PP_World_2_pat_5_2_4: 39 bytes
;   PP_World_2_pat_5_2_6: 41 bytes
;   PP_World_2_pat_5_2_7: 41 bytes
;   PP_World_2_pat_5_2_8: 41 bytes
;   PP_World_2_pat_5_3_0: 35 bytes
;   PP_World_2_pat_5_3_1: 7 bytes
;   PP_World_2_pat_5_3_2: 20 bytes
;   PP_World_2_pat_5_3_3: 13 bytes
;   PP_World_2_pat_5_3_4: 35 bytes
;   PP_World_2_pat_5_3_6: 35 bytes
;   PP_World_5_pat_6_0_0: 23 bytes
;   PP_World_5_pat_6_0_1: 19 bytes
;   PP_World_5_pat_6_0_2: 19 bytes
;   PP_World_5_pat_6_0_3: 19 bytes
;   PP_World_5_pat_6_0_10: 19 bytes
;   PP_World_5_pat_6_0_11: 197 bytes
;   PP_World_5_pat_6_0_12: 195 bytes
;   PP_World_5_pat_6_0_13: 195 bytes
;   PP_World_5_pat_6_0_14: 69 bytes
;   PP_World_5_pat_6_0_15: 67 bytes
;   PP_World_5_pat_6_0_16: 73 bytes
;   PP_World_5_pat_6_1_0: 24 bytes
;   PP_World_5_pat_6_1_1: 20 bytes
;   PP_World_5_pat_6_1_2: 20 bytes
;   PP_World_5_pat_6_1_3: 20 bytes
;   PP_World_5_pat_6_1_10: 20 bytes
;   PP_World_5_pat_6_1_11: 20 bytes
;   PP_World_5_pat_6_1_12: 16 bytes
;   PP_World_5_pat_6_1_13: 20 bytes
;   PP_World_5_pat_6_1_14: 17 bytes
;   PP_World_5_pat_6_1_15: 71 bytes
;   PP_World_5_pat_6_1_16: 45 bytes
;   PP_World_5_pat_6_1_17: 67 bytes
;   PP_World_5_pat_6_2_1: 35 bytes
;   PP_World_5_pat_6_2_2: 35 bytes
;   PP_World_5_pat_6_2_3: 35 bytes
;   PP_World_5_pat_6_2_4: 35 bytes
;   PP_World_5_pat_6_2_5: 43 bytes
;   PP_World_5_pat_6_2_7: 43 bytes
;   PP_World_5_pat_6_2_8: 67 bytes
;   PP_World_5_pat_6_2_9: 71 bytes
;   PP_World_5_pat_6_2_12: 43 bytes
;   PP_World_5_pat_6_2_13: 43 bytes
;   PP_World_5_pat_6_2_14: 67 bytes
;   PP_World_5_pat_6_2_15: 67 bytes
;   PP_World_5_pat_6_2_16: 67 bytes
;   PP_World_5_pat_6_3_1: 7 bytes
;   PP_World_5_pat_6_3_5: 35 bytes
;   PP_World_5_pat_6_3_9: 31 bytes
;   PP_World_5_pat_6_3_11: 33 bytes
;   PP_World_5_pat_6_3_15: 7 bytes
;   PP_Minor_Boss_pat_7_0_0: 68 bytes
;   PP_Minor_Boss_pat_7_0_1: 68 bytes
;   PP_Minor_Boss_pat_7_0_2: 20 bytes
;   PP_Minor_Boss_pat_7_0_3: 21 bytes
;   PP_Minor_Boss_pat_7_0_4: 49 bytes
;   PP_Minor_Boss_pat_7_0_5: 52 bytes
;   PP_Minor_Boss_pat_7_0_6: 41 bytes
;   PP_Minor_Boss_pat_7_0_7: 41 bytes
;   PP_Minor_Boss_pat_7_0_8: 41 bytes
;   PP_Minor_Boss_pat_7_0_9: 41 bytes
;   PP_Minor_Boss_pat_7_0_10: 73 bytes
;   PP_Minor_Boss_pat_7_1_0: 12 bytes
;   PP_Minor_Boss_pat_7_1_1: 14 bytes
;   PP_Minor_Boss_pat_7_1_2: 65 bytes
;   PP_Minor_Boss_pat_7_1_3: 63 bytes
;   PP_Minor_Boss_pat_7_1_6: 26 bytes
;   PP_Minor_Boss_pat_7_1_7: 26 bytes
;   PP_Minor_Boss_pat_7_1_9: 44 bytes
;   PP_Minor_Boss_pat_7_1_10: 26 bytes
;   PP_Minor_Boss_pat_7_2_0: 49 bytes
;   PP_Minor_Boss_pat_7_2_1: 61 bytes
;   PP_Minor_Boss_pat_7_2_2: 61 bytes
;   PP_Minor_Boss_pat_7_2_3: 61 bytes
;   PP_Minor_Boss_pat_7_2_6: 61 bytes
;   PP_Minor_Boss_pat_7_2_7: 61 bytes
;   PP_Minor_Boss_pat_7_2_9: 61 bytes
;   PP_Minor_Boss_pat_7_2_10: 61 bytes
;   PP_Minor_Boss_pat_7_3_0: 21 bytes
;   PP_Minor_Boss_pat_7_3_1: 35 bytes
;   PP_Minor_Boss_pat_7_3_2: 35 bytes
;   PP_Minor_Boss_pat_7_3_4: 32 bytes
;   PP_Minor_Boss_pat_7_3_6: 32 bytes
;   PP_Minor_Boss_pat_7_3_7: 35 bytes
;   PP_Minor_Boss_pat_7_3_10: 35 bytes
;   PP_Major_Boss_pat_8_0_0: 33 bytes
;   PP_Major_Boss_pat_8_0_1: 37 bytes
;   PP_Major_Boss_pat_8_0_2: 33 bytes
;   PP_Major_Boss_pat_8_0_3: 39 bytes
;   PP_Major_Boss_pat_8_0_4: 35 bytes
;   PP_Major_Boss_pat_8_0_5: 19 bytes
;   PP_Major_Boss_pat_8_0_6: 13 bytes
;   PP_Major_Boss_pat_8_0_7: 37 bytes
;   PP_Major_Boss_pat_8_0_8: 37 bytes
;   PP_Major_Boss_pat_8_1_0: 65 bytes
;   PP_Major_Boss_pat_8_1_2: 60 bytes
;   PP_Major_Boss_pat_8_1_4: 11 bytes
;   PP_Major_Boss_pat_8_1_5: 9 bytes
;   PP_Major_Boss_pat_8_1_6: 39 bytes
;   PP_Major_Boss_pat_8_1_7: 46 bytes
;   PP_Major_Boss_pat_8_1_8: 68 bytes
;   PP_Major_Boss_pat_8_2_0: 32 bytes
;   PP_Major_Boss_pat_8_2_1: 61 bytes
;   PP_Major_Boss_pat_8_2_3: 61 bytes
;   PP_Major_Boss_pat_8_2_5: 60 bytes
;   PP_Major_Boss_pat_8_2_7: 61 bytes
;   PP_Major_Boss_pat_8_3_0: 7 bytes
;   PP_Major_Boss_pat_8_3_1: 33 bytes
;   PP_Major_Boss_pat_8_3_2: 33 bytes
;   PP_Major_Boss_pat_8_3_5: 33 bytes
;   PP_Major_Boss_pat_8_3_6: 32 bytes
;   PP_Final_Boss_pat_9_0_0: 23 bytes
;   PP_Final_Boss_pat_9_0_1: 20 bytes
;   PP_Final_Boss_pat_9_0_2: 12 bytes
;   PP_Final_Boss_pat_9_0_3: 48 bytes
;   PP_Final_Boss_pat_9_1_0: 195 bytes
;   PP_Final_Boss_pat_9_1_1: 195 bytes
;   PP_Final_Boss_pat_9_1_2: 51 bytes
;   PP_Final_Boss_pat_9_1_3: 195 bytes
;   PP_Final_Boss_pat_9_2_0: 52 bytes
;   PP_Final_Boss_pat_9_2_1: 44 bytes
;   PP_Final_Boss_pat_9_2_2: 13 bytes
;   PP_Final_Boss_pat_9_2_3: 49 bytes
;   PP_Final_Boss_pat_9_2_4: 42 bytes
;   PP_Final_Boss_pat_9_3_0: 34 bytes
;   PP_Final_Boss_pat_9_3_1: 35 bytes
;   PP_Final_Boss_pat_9_3_2: 14 bytes
;   PP_Final_Boss_pat_9_3_3: 34 bytes
;   PP_World_Select_1_pat_10_0_0: 88 bytes
;   PP_World_Select_1_pat_10_1_0: 73 bytes
;   PP_World_Select_1_pat_10_2_0: 73 bytes
;   PP_World_Select_1_pat_10_3_0: 25 bytes
;   PP_World_Select_2_pat_11_0_0: 92 bytes
;   PP_World_Select_2_pat_11_1_0: 79 bytes
;   PP_World_Select_2_pat_11_2_0: 76 bytes
;   PP_World_Select_2_pat_11_3_0: 45 bytes
;   PP_World_Select_3_pat_12_0_0: 99 bytes
;   PP_World_Select_3_pat_12_1_0: 107 bytes
;   PP_World_Select_3_pat_12_2_0: 74 bytes
;   PP_World_Select_3_pat_12_3_0: 54 bytes
;   PP_World_Select_4_pat_13_0_0: 99 bytes
;   PP_World_Select_4_pat_13_1_0: 135 bytes
;   PP_World_Select_4_pat_13_2_0: 74 bytes
;   PP_World_Select_4_pat_13_3_0: 58 bytes
;   PP_World_Select_5_pat_13_0_0: 107 bytes
;   PP_World_Select_5_pat_13_1_0: 135 bytes
;   PP_World_Select_5_pat_13_2_0: 74 bytes
;   PP_World_Select_5_pat_13_3_0: 58 bytes
; pently_songs: 1606 bytes
;   PS_World_1A: 132 bytes
;   PS_World_1B: 168 bytes
;   PS_World_3: 132 bytes
;   PS_World_2: 207 bytes
;   PS_World_5: 304 bytes
;   PS_Minor_Boss: 205 bytes
;   PS_Major_Boss: 205 bytes
;   PS_Final_Boss: 133 bytes
;   PS_World_Select_1: 24 bytes
;   PS_World_Select_2: 24 bytes
;   PS_World_Select_3: 24 bytes
;   PS_World_Select_4: 24 bytes
;   PS_World_Select_5: 24 bytes
;
; Breakdown by song
;   Shared: 1240 bytes
;   Song Final_Boss: 1189 bytes
;   Song Major_Boss: 1199 bytes
;   Song Minor_Boss: 1697 bytes
;   Song World_1A: 1192 bytes
;   Song World_1B: 1057 bytes
;   Song World_2: 1300 bytes
;   Song World_3: 1152 bytes
;   Song World_5: 2323 bytes
;   Song World_Select_1: 283 bytes
;   Song World_Select_2: 316 bytes
;   Song World_Select_3: 358 bytes
;   Song World_Select_4: 390 bytes
;   Song World_Select_5: 398 bytes

; Period table of length 76 for ntsc: 152 bytes
.pushseg
.code
.export periodTableLo, periodTableHi
periodTableLo:
.byt $f1,$7f,$13,$ad,$4d,$f3,$9d,$4c,$00,$b8,$74,$34,$f8,$bf,$89,$56,$26,$f9
.byt $ce,$a6,$80,$5c,$3a,$1a,$fb,$df,$c4,$ab,$93,$7c,$67,$52,$3f,$2d,$1c,$0c
.byt $fd,$ef,$e1,$d5,$c9,$bd,$b3,$a9,$9f,$96,$8e,$86,$7e,$77,$70,$6a,$64,$5e
.byt $59,$54,$4f,$4b,$46,$42,$3f,$3b,$38,$34,$31,$2f,$2c,$29,$27,$25,$23,$21
.byt $1f,$1d,$1b,$1a
periodTableHi:
.byt 7,7,7,6,6,5,5,5,5,4,4,4,3,3,3,3,3,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0
.popseg

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

teleport_snd:
  .dbyt $8f20, $8020
  .dbyt $8f20, $8020
  .dbyt $8f20, $8820
  .dbyt $8620, $8420
  .dbyt $8220, $8120

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

player_bump_snd:
  .byte $8f,$0f,$8f,$08,$8f,$05,$8f,$00
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
