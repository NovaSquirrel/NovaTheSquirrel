;
; Pently audio engine
; Sound effect player and "mixer"
; Copyright 2009-2018 Damian Yerrick
; 
; This software is provided 'as-is', without any express or implied
; warranty.  In no event will the authors be held liable for any damages
; arising from the use of this software.
; 
; Permission is granted to anyone to use this software for any purpose,
; including commercial applications, and to alter it and redistribute it
; freely, subject to the following restrictions:
; 
; 1. The origin of this software must not be misrepresented; you must not
;    claim that you wrote the original software. If you use this software
;    in a product, an acknowledgment in the product documentation would be
;    appreciated but is not required.
; 2. Altered source versions must be plainly marked as such, and must not be
;    misrepresented as being the original software.
; 3. This notice may not be removed or altered from any source distribution.
;

; Edited to work .include'd
.include "pentlyconfig.inc"
.include "pently.inc"
.include "pentlyseq.inc"
.include "pentlybss.inc"

.if PENTLY_USE_MUSIC
;  .import pently_update_music, pently_update_music_ch
.endif
;.import periodTableLo, periodTableHi, pently_sfx_table
.if PENTLY_USE_PAL_ADJUST
  .importzp tvSystem
.endif
;.export pentlyBSS
;.exportzp pently_zp_state

.assert (pently_zptemp + 5) <= $100, error, "pently_zptemp must be within zero page"

SNDCHN = $4015

.if PENTLY_USE_MUSIC = 0
  PENTLYZP_SIZE = 16
.elseif PENTLY_USE_ATTACK_PHASE
  PENTLYZP_SIZE = 32
.else
  PENTLYZP_SIZE = 21
.endif

.pushseg
.zeropage
pently_zp_state: .res PENTLYZP_SIZE
sfx_datalo = pently_zp_state + 0
sfx_datahi = pently_zp_state + 1
.bss

; The statically allocated prefix of pentlyBSS
pentlyBSS: .res 18

sfx_rate = pentlyBSS + 0
sfx_ratecd = pentlyBSS + 1
ch_lastfreqhi = pentlyBSS + 2
sfx_remainlen = pentlyBSS + 3

.popseg
pentlysound_code_start = *
;;
; Initializes all sound channels.
; Call this at the start of a program or as a "panic button" before
; entering a long stretch of code where you don't call pently_update.
;
.proc pently_init
  lda #$0F
  sta SNDCHN
  lda #$30
  sta $4000
  sta $4004
  sta $400C
  sta ch_lastfreqhi+0
  sta ch_lastfreqhi+8
  sta ch_lastfreqhi+4
  lda #8
  sta $4001
  sta $4005
  lda #$80
  sta $4008
  asl a
  sta $4003
  sta $4007
  sta $400F
  sta sfx_remainlen+0
  sta sfx_remainlen+4
  sta sfx_remainlen+8
  sta sfx_remainlen+12
  sta sfx_ratecd+0
  sta sfx_ratecd+4
  sta sfx_ratecd+8
  sta sfx_ratecd+12
  .if ::PENTLY_USE_MUSIC
    sta pently_music_playing
  .endif
  lda #PENTLY_INITIAL_4011
  sta $4011
  rts
.endproc

;;
; Starts a sound effect.
; (Trashes pently_zptemp+0 through +4 and X.)
;
; @param A sound effect number (0-63)
;
.proc pently_start_sound
snddatalo = pently_zptemp + 0
snddatahi = pently_zptemp + 1
sndchno   = pently_zptemp + 2
sndlen    = pently_zptemp + 3
sndrate   = pently_zptemp + 4

  asl a
  asl a
  tax
  lda pently_sfx_table,x
  sta snddatalo
  lda pently_sfx_table+1,x
  sta snddatahi
  lda pently_sfx_table+2,x
  and #$0C
  sta sndchno
  lda pently_sfx_table+2,x
  lsr a
  lsr a
  lsr a
  lsr a
  sta sndrate
  lda pently_sfx_table+3,x
  sta sndlen

  ; Split up square wave sounds between pulse 1 ($4000) and
  ; pulse 2 ($4004) depending on which has less data left to play
  .if ::PENTLY_USE_SQUARE_POOLING
    lda sndchno
    bne not_ch0to4  ; if not ch 0, don't try moving it
      lda sfx_remainlen+4
      cmp sfx_remainlen
      bcs not_ch0to4
      lda #4
      sta sndchno
    not_ch0to4:
  .endif 

  ; Play only if this sound effect is no shorter than the existing
  ; effect on the same channel
  ldx sndchno
  lda sndlen
  cmp sfx_remainlen,x
  bcc ch_full

  ; Replace the current sound effect if any
  sta sfx_remainlen,x
  lda snddatalo
  sta sfx_datalo,x
  lda snddatahi
  sta sfx_datahi,x
  lda sndrate
  sta sfx_rate,x
  lda #0
  sta sfx_ratecd,x
ch_full:
  rts
.endproc

;;
; Updates sound effect channels.
;
.proc pently_update
  .if ::PENTLY_USE_MUSIC
    jsr pently_update_music
  .endif
  ldx #12
loop:
  .if ::PENTLY_USE_MUSIC
    jsr pently_update_music_ch
  .endif
  jsr pently_update_one_ch
  dex
  dex
  dex
  dex
  bpl loop
  rts
.endproc

.proc pently_update_one_ch
srclo     = pently_zptemp + 0
srchi     = pently_zptemp + 1
tvol      = pently_zptemp + 2
tpitch    = pently_zptemp + 3
tpitchadd = pently_zptemp + 4


  ; At this point, the music engine should have left duty and volume
  ; in tvol and pitch in tpitch.
  lda sfx_remainlen,x
  ora sfx_ratecd,x
  bne ch_not_done
  
  ; Only music is playing
  .if ::PENTLY_USE_MUSIC
    lda tvol
    .if ::PENTLY_USE_VIS
      sta pently_vis_dutyvol,x
    .endif
    bne update_channel_hw
  .endif

  ; Turn off the channel and force a reinit of the length counter.
  cpx #8
  beq not_triangle_kill
    lda #$30
  not_triangle_kill:
  sta $4000,x
  lda #$FF
  sta ch_lastfreqhi,x
  rts
ch_not_done:

  ; playback rate divider
  dec sfx_ratecd,x
  bpl rate_divider_cancel
  lda sfx_rate,x
  sta sfx_ratecd,x

  ; fetch the instruction
  lda sfx_datalo+1,x
  sta srchi
  lda sfx_datalo,x
  sta srclo
  clc
  adc #2
  sta sfx_datalo,x
  bcc :+
    inc sfx_datahi,x
  :
  ldy #0
  .if ::PENTLY_USE_MUSIC
    .if ::PENTLY_USE_MUSIC_IF_LOUDER
      lda tvol
      pha
      and #$0F
      sta tvol
      lda (srclo),y
      and #$0F

      ; At this point: A = sfx volume; tvol = music volume
      cmp tvol
      pla
      sta tvol
      bcc music_was_louder
    .endif
    .if ::PENTLY_USE_VIBRATO || ::PENTLY_USE_PORTAMENTO
      sty tpitchadd  ; sfx don't support fine pitch adjustment
      .if ::PENTLY_USE_VIS
        tya
        sta pently_vis_pitchlo,x
      .endif
    .endif
  .endif
  lda (srclo),y
  sta tvol
  iny
  lda (srclo),y
  sta tpitch
music_was_louder:
  dec sfx_remainlen,x

update_channel_hw:
  ; XXX vis does not work with no-music
  .if ::PENTLY_USE_VIS
    lda tpitch
    sta pently_vis_pitchhi,x
  .endif
  lda tvol
  .if ::PENTLY_USE_VIS
    sta pently_vis_dutyvol,x
  .endif
  ora #$30
  cpx #12
  bne notnoise
  sta $400C
  lda tpitch
  sta $400E
rate_divider_cancel:
  rts

notnoise:
  ; If triangle, keep linear counter load (bit 7) on while playing
  ; so that envelopes don't terminate prematurely
  .if ::PENTLY_USE_TRIANGLE_DUTY_FIX
    cpx #8
    bne :+
    and #$0F
    beq :+
      ora #$80  ; for triangle keep bit 7 (linear counter load) on
    :
  .endif

  sta $4000,x
  ldy tpitch
  .if ::PENTLY_USE_PAL_ADJUST
    ; Correct pitch for PAL NES only, not NTSC (0) or PAL famiclone (2)
    lda tvSystem
    lsr a
    bcc :+
      iny
  :
  .endif

  lda periodTableLo,y
  .if ::PENTLY_USE_VIBRATO || ::PENTLY_USE_PORTAMENTO
    clc
    adc tpitchadd
    sta $4002,x
    lda tpitchadd
    and #$80
    bpl :+
      lda #$FF
    :
    adc periodTableHi,y
  .else
    sta $4002,x
    lda periodTableHi,y
  .endif
  cmp ch_lastfreqhi,x
  beq no_change_to_hi_period
  sta ch_lastfreqhi,x
  sta $4003,x
no_change_to_hi_period:

  rts
.endproc

PENTLYSOUND_SIZE = * - pentlysound_code_start

; aliases for cc65
_pently_init = pently_init
_pently_start_sound = pently_start_sound
_pently_update = pently_update
