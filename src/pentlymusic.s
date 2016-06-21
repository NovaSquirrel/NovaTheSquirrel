;
; Pently music engine
; Copyright 2009-2015 Damian Yerrick
;
; Copying and distribution of this file, with or without
; modification, are permitted in any medium without royalty provided
; the copyright notice and this notice are preserved in all source
; code copies.  This file is offered as-is, without any warranty.
;

.include "pently.inc"
.include "pentlyseq.inc"

pently_zptemp = 0

.ifndef SOUND_NTSC_ONLY
SOUND_NTSC_ONLY = 0
.endif
.if (!SOUND_NTSC_ONLY)
.importzp tvSystem
.endif

.ifndef PENTLY_USE_ROW_CALLBACK
PENTLY_USE_ROW_CALLBACK = 0
.endif
.if PENTLY_USE_ROW_CALLBACK
.import pently_row_callback, pently_dalsegno_callback
.endif

NUM_CHANNELS = 4
DRUM_TRACK = 12
ATTACK_TRACK = 16

; pently_zp_state:
;       +0              +1              +2              +3
; $00 | Sq1 sound effect data ptr       Sq1 envelope data ptr
; $04-$0C repeat for Sq2, Tri, Noise
; $10 | Sq1 music pattern data ptr      Conductor data ptr
; $14 | Sq2 music pattern data ptr      Unused
; $18-$20 repeat for Tri, Noise, Attack

; pentlyBSS:
;       +0              +1              +2              +3
; $00-$0F Sound effect state for Sq1, Sq2, Tri, Noise
; $00 | Effect rate     Rate counter    Last period MSB Effect length
; $10-$1F Instrument envelope state for Sq1, Sq2, Tri, Noise
; $10 | Attack length   Attack pitch    Sustain vol     Note pitch
; $20-$2F Instrument arpeggio state
; $20 | Legato enable   Arpeggio phase  Arp interval 1  Arp interval 2
; $30-$43 Pattern reader state for Sq1, Sq2, Tri, Noise, Attack
; $20 | Note time left  Instrument ID   Pattern ID      Transpose amt
; $34 | Grace note time Unused          conductor use
; $48 End of allocation

noteAttackPos = pently_zp_state + 2
musicPatternPos = pently_zp_state + 16

conductorSegno = pently_zp_state + 26
conductorPos = pently_zp_state + 30
attack_remainlen = pentlyBSS + 16
attackPitch = pentlyBSS + 17
noteEnvVol = pentlyBSS + 18
notePitch = pentlyBSS + 19
noteLegato = pentlyBSS + 32
arpPhase = pentlyBSS + 33
arpInterval1 = pentlyBSS + 34
arpInterval2 = pentlyBSS + 35
noteRowsLeft = pentlyBSS + 48
noteInstrument = pentlyBSS + 49
musicPattern = pentlyBSS + 50
patternTranspose = pentlyBSS + 51
graceTime = pentlyBSS + 68
unused69 = pentlyBSS + 69

; Shared state
unused70 = pentlyBSS + 70
attackChannel = pentlyBSS + 71
pently_rows_per_beat = pentlyBSS + 74
pently_row_beat_part = pentlyBSS + 75
pently_tempoCounterLo = pentlyBSS + 78
pently_tempoCounterHi = pentlyBSS + 79
music_tempoLo = pentlyBSS + 82
music_tempoHi = pentlyBSS + 83
conductorWaitRows = pentlyBSS + 86
pently_music_playing = pentlyBSS + 87

FRAMES_PER_MINUTE_PAL = 3000
FRAMES_PER_MINUTE_NTSC = 3606

fpmLo:
  .byt <FRAMES_PER_MINUTE_NTSC, <FRAMES_PER_MINUTE_PAL
fpmHi:
  .byt >FRAMES_PER_MINUTE_NTSC, >FRAMES_PER_MINUTE_PAL
invfpm:
  .byt 8192*48/FRAMES_PER_MINUTE_NTSC, 8192*48/FRAMES_PER_MINUTE_PAL

silentPattern:
  .byt 26*8+7, 255
  
durations:
  .byt 1, 2, 3, 4, 6, 8, 12, 16
invdurations:
  .byt 48/1, 48/2, 48/3, 48/4, 48/6, 48/8, 48/12, 48/16

.proc pently_start_music
  asl a
  tax
  lda pently_songs,x
  sta conductorPos
  sta conductorSegno
  lda pently_songs+1,x
  sta conductorPos+1
  sta conductorSegno+1

  ldx #ATTACK_TRACK
  bne channelLoopSkipHWOnly
  channelLoop:
    lda #0
    sta noteEnvVol,x
    sta noteLegato,x
    sta arpInterval1,x
    sta arpInterval2,x
    sta arpPhase,x
    channelLoopSkipHWOnly:
    lda #<silentPattern
    sta musicPatternPos,x
    lda #>silentPattern
    sta musicPatternPos+1,x
    sta musicPattern,x  ; bit 7 set: no pattern playing
    lda #0
    sta patternTranspose,x
    sta noteInstrument,x
    sta noteRowsLeft,x
    sta attack_remainlen,x
    sta graceTime,x
    dex
    dex
    dex
    dex
    bpl channelLoop
  ; A is still 0
  sta conductorWaitRows
  sta attackChannel
  lda #4
  sta pently_rows_per_beat
  lda #$FF
  sta pently_row_beat_part
  sta pently_tempoCounterLo
  sta pently_tempoCounterHi
  lda #<300
  sta music_tempoLo
  lda #>300
  sta music_tempoHi
.endproc
.proc pently_resume_music
  lda #1
  sta pently_music_playing
  rts
.endproc

.proc pently_stop_music
  lda #0
  sta pently_music_playing
  rts
.endproc

.proc pently_update_music
  lda pently_music_playing
  beq music_not_playing
  lda music_tempoLo
  clc
  adc pently_tempoCounterLo
  sta pently_tempoCounterLo
  lda music_tempoHi
  adc pently_tempoCounterHi
  sta pently_tempoCounterHi
  bcs new_tick
music_not_playing:
  rts
new_tick:

.if ::SOUND_NTSC_ONLY
  ldy #0
.else
  ldy tvSystem
  beq is_ntsc_1
  ldy #1
is_ntsc_1:
.endif

  ; Subtract tempo
  lda pently_tempoCounterLo
  sbc fpmLo,y
  sta pently_tempoCounterLo
  lda pently_tempoCounterHi
  sbc fpmHi,y
  sta pently_tempoCounterHi
  
  ; Update row
  ldy pently_row_beat_part
  iny
  cpy pently_rows_per_beat
  bcc :+
  ldy #0
:
  sty pently_row_beat_part
  

.if ::PENTLY_USE_ROW_CALLBACK
  jsr pently_row_callback
.endif

  lda conductorWaitRows
  beq doConductor
  dec conductorWaitRows
  jmp skipConductor

doConductor:
conbyte = pently_zptemp + 0

  ldy #0
  lda (conductorPos),y
  inc conductorPos
  bne :+
    inc conductorPos+1
  :
;  sta conbyte
  cmp #CON_SETTEMPO
  bcc @notTempoChange
  cmp #CON_SETBEAT
  bcc @isTempoChange
    and #%00000111
    tay
    lda durations,y
    sta pently_rows_per_beat
    ldy #0
    sty pently_row_beat_part
    jmp doConductor
  @isTempoChange:
    and #%00000111
    sta music_tempoHi
  
    lda (conductorPos),y
    inc conductorPos
    bne :+
      inc conductorPos+1
    :
    sta music_tempoLo
    jmp doConductor
  @notTempoChange:
  cmp #CON_WAITROWS
  bcc conductorPlayPattern
  bne @notWaitRows
    jmp conductorDoWaitRows
  @notWaitRows:

  cmp #CON_ATTACK_SQ1
  bcc @notAttackSet
  cmp #CON_NOTEON
  bcs @handleNoteOn
    and #%00000011
    asl a
    asl a
    sta attackChannel
    jmp doConductor
  @handleNoteOn:
    and #%00000011
    asl a
    asl a
    tax
    lda (conductorPos),y
    inc conductorPos
    bne :+
      inc conductorPos+1
    :
    pha
    lda (conductorPos),y
    inc conductorPos
    bne :+
      inc conductorPos+1
    :
    tay
    pla
    jsr music_play_note
    jmp doConductor

  @notAttackSet:

  cmp #CON_FINE
  bne @notFine
    lda #0
    sta pently_music_playing
    sta music_tempoHi
    sta music_tempoLo
.if ::PENTLY_USE_ROW_CALLBACK
    clc
    jmp pently_dalsegno_callback
.else
    rts
.endif
  @notFine:

  cmp #CON_SEGNO
  bne @notSegno
    lda conductorPos
    sta conductorSegno
    lda conductorPos+1
    sta conductorSegno+1
    jmp doConductor
  @notSegno:

  cmp #CON_DALSEGNO
  bne @notDalSegno
    lda conductorSegno
    sta conductorPos
    lda conductorSegno+1
    sta conductorPos+1
.if ::PENTLY_USE_ROW_CALLBACK
    sec
    jsr pently_dalsegno_callback
.endif
    jmp doConductor
  @notDalSegno:
  
  jmp skipConductor

conductorPlayPattern:
  and #$07
  asl a
  asl a
  tax

  lda #0
  cpx #ATTACK_TRACK
  bcs :+
    sta noteLegato,x  ; start all patterns with legato off
  :
  sta noteRowsLeft,x
  lda (conductorPos),y
  sta musicPattern,x
  iny
  lda (conductorPos),y
  sta patternTranspose,x
  iny
  lda (conductorPos),y
  sta noteInstrument,x
  tya
  sec
  adc conductorPos
  sta conductorPos
  bcc :+
    inc conductorPos+1
  :
  jsr startPattern
  jmp doConductor

  ; this should be last so it can fall into skipConductor
conductorDoWaitRows:
  lda (conductorPos),y
  inc conductorPos
  bne :+
    inc conductorPos+1
  :
  sta conductorWaitRows

skipConductor:

  ldx #4 * (NUM_CHANNELS - 1)
  channelLoop:
    jsr processTrackPattern
    dex
    dex
    dex
    dex
    bpl channelLoop
  ldx #ATTACK_TRACK
  ; fall through

processTrackPattern:
  lda noteRowsLeft,x
  beq anotherPatternByte
skipNote:
  dec noteRowsLeft,x
  rts

anotherPatternByte:
  lda (musicPatternPos,x)
  cmp #255
  bne notStartPatternOver
    jsr startPattern
    lda (musicPatternPos,x)
  notStartPatternOver:
    
  inc musicPatternPos,x
  bne patternNotNewPage
    inc musicPatternPos+1,x
  patternNotNewPage:

  cmp #INSTRUMENT
  bcc notExtraCommand
  beq isInstrument
    cmp #ARPEGGIO
    bne notArpeggio
    lda (musicPatternPos,x)
    lsr a
    lsr a
    lsr a
    lsr a
    sta arpInterval1,x
    lda (musicPatternPos,x)
    and #$0F
    sta arpInterval2,x
    jmp nextPatternByte
  notArpeggio:
    cmp #LEGATO_ON+1
    bcs notLegato
    cpx #ATTACK_TRACK
    bcs anotherPatternByte
      and #$01
      sta noteLegato,x
      bpl anotherPatternByte
  notLegato:
    cmp #GRACE
    bcc isTranspose
    bne anotherPatternByte
    lda (musicPatternPos,x)
    sta graceTime,x
    jmp nextPatternByte
  isTranspose:
    ; clc
    lda patternTranspose,x
    adc (musicPatternPos,x)
    sta patternTranspose,x
    jmp nextPatternByte
  isInstrument:
    lda (musicPatternPos,x)
    sta noteInstrument,x
  nextPatternByte:
    inc musicPatternPos,x
    bne anotherPatternByte
    inc musicPatternPos+1,x
    jmp anotherPatternByte
  notExtraCommand:
  
  ; set the note's duration
  pha
  and #$07
  tay
  lda durations,y
  sta noteRowsLeft,x
  pla
  lsr a
  lsr a
  lsr a
  cmp #25
  bcc isTransposedNote
  beq notKeyOff
    lda #0
    sta attack_remainlen,x
    cpx #ATTACK_TRACK
    bcs notKeyOff
    sta noteEnvVol,x
  notKeyOff:
  jmp skipNote

  isTransposedNote:
    cpx #DRUM_TRACK
    beq isDrumNote
    clc
    adc patternTranspose,x
    ldy noteInstrument,x
    jsr music_play_note
    jmp skipNote

isDrumNote:
  asl a
  pha
  tax
  lda pently_drums,x
  jsr pently_start_sound
  pla
  tax
  lda pently_drums+1,x
  bmi noSecondDrum
  jsr pently_start_sound
noSecondDrum:
  ldx #DRUM_TRACK
  jmp skipNote

startPattern:
  lda musicPattern,x
  asl a
  bcc @notSilentPattern
    lda #<silentPattern
    sta musicPatternPos,x
    lda #>silentPattern
    sta musicPatternPos+1,x
    rts
  @notSilentPattern:
  tay
  lda pently_patterns,y
  sta musicPatternPos,x
  lda pently_patterns+1,y
  sta musicPatternPos+1,x
  rts
.endproc

;;
; Plays note A on channel X (0, 4, 8, 12) with instrument Y.
; Trashes 0-1 and preserves X.
.proc music_play_note
notenum       = pently_zptemp + 0
instrument_id = pently_zptemp + 1

  sta notenum
  sty instrument_id
  tya
  asl a
  asl a
  adc instrument_id
  tay
  
  ; at this point:
  ; x = channel #
  ; y = offset in instrument table
  cpx #ATTACK_TRACK
  bcs skipSustainPart
    lda notenum
    sta notePitch,x
    lda arpPhase,x
    bmi :+
      ; If not an injected attack, also change attack pitch
      lda notenum
      sta attackPitch,x
    :
    lda noteLegato,x
    bne skipAttackPart
    lda #0
    sta arpPhase,x
    lda instrument_id
    sta noteInstrument,x
    lda pently_instruments,y
    asl a
    asl a
    asl a
    asl a
    ora #$0C
    sta noteEnvVol,x
  skipSustainPart:

  lda pently_instruments+4,y
  beq skipAttackPart
    txa
    pha
    cpx #ATTACK_TRACK
    bcc notAttackChannel
      ldx attackChannel
      lda #$80  ; Disable arpeggio until sustain
      sta arpPhase,x
    notAttackChannel:
    lda notenum
    sta attackPitch,x
    lda pently_instruments+4,y
    sta noteAttackPos+1,x
    lda pently_instruments+3,y
    sta noteAttackPos,x
    lda pently_instruments+2,y
    and #$7F
    sta attack_remainlen,x
    pla
    tax
  skipAttackPart:
  rts
.endproc

.proc pently_update_music_ch
xsave      = pently_zptemp + 0
ysave      = pently_zptemp + 1
out_volume = pently_zptemp + 2
out_pitch  = pently_zptemp + 3

  lda pently_music_playing
  beq silenced
  lda graceTime,x
  beq nograce
  dec graceTime,x
  bne nograce
  jsr pently_update_music::processTrackPattern
nograce:
  lda attack_remainlen,x
  beq noAttack
  dec attack_remainlen,x
  lda (noteAttackPos,x)
  inc noteAttackPos,x
  bne :+
  inc noteAttackPos+1,x
:
  sta out_volume
  lda (noteAttackPos,x)
  inc noteAttackPos,x
  bne :+
  inc noteAttackPos+1,x
:
  clc
  adc attackPitch,x
  ldy arpPhase,x
  bmi storePitchNoArpeggio
storePitchWithArpeggio:
  sta out_pitch
  stx xsave
  lda #$7F
  and arpPhase,x
  tay
  beq bumpArpPhase

  ; So we're in a nonzero phase.  Load the interval.
  clc
  adc xsave
  tax
  lda arpInterval1-1,x

  ; If phase 2's interval is 0, cycle through two phases (1, 2)
  ; instead of three (0, 1, 2).
  bne bumpArpPhase
  cpy #2
  bcc bumpArpPhase
  ldy #0
bumpArpPhase:
  iny
  cpy #3
  bcc noArpRestart
  ldy #0
noArpRestart:

  ; At this point, A is the arpeggio interval and Y is the next phase
  clc
  adc out_pitch
  sta out_pitch
  ldx xsave
  tya
  sta arpPhase,x
  rts

storePitchNoArpeggio:
  sta out_pitch
  rts

noAttack:
  lda noteEnvVol,x
  lsr a
  lsr a
  lsr a
  lsr a
  bne notSilenced
silenced:
  lda #0
  sta out_volume
  rts
notSilenced:
  sta out_volume
  lda noteInstrument,x
  asl a
  asl a
  adc noteInstrument,x
  tay  
  lda out_volume
  eor pently_instruments,y
  and #$0F
  eor pently_instruments,y
  sta out_volume
  lda noteEnvVol,x
  sec
  sbc pently_instruments+1,y
  bcc silenced
  sta noteEnvVol,x
  lda notePitch,x
  sty ysave
  jsr storePitchWithArpeggio
  ldy ysave

  ; bit 7 of attribute 2: cut note when half a row remains
  lda pently_instruments+2,y
  bpl notCutNote
  lda noteRowsLeft,x
  bne notCutNote

  clc
  lda pently_tempoCounterLo
  adc #<(FRAMES_PER_MINUTE_NTSC/2)
  lda pently_tempoCounterHi
  adc #>(FRAMES_PER_MINUTE_NTSC/2)
  bcc notCutNote
  
  ; if the next byte in the pattern is a tie or a legato enable
  lda (musicPatternPos,x)
  cmp #LEGATO_ON
  beq notCutNote
  cmp #LEGATO_OFF
  beq yesCutNote
  and #$F8
  cmp #N_TIE
  beq notCutNote
  lda noteLegato,x
  bne notCutNote
yesCutNote:
  lda #0
  sta noteEnvVol,x

notCutNote:
  rts

.endproc
