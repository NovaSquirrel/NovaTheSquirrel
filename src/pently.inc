;
; Pently music engine public API
; Copyright 2009-2015 Damian Yerrick
;
; Copying and distribution of this file, with or without
; modification, are permitted in any medium without royalty provided
; the copyright notice and this notice are preserved in all source
; code copies.  This file is offered as-is, without any warranty.
;

; Methods ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
; Initializes the sound channels and stops all sound effects
; and music.
.global pently_init

;;
; Updates sound registers.  Call this once each frame.
; Overwrites: ???
.global pently_update

;;
; Starts a sound effect.
; @param A the sound effect ID
.global pently_start_sound

;;
; Starts a piece of music.
; @param A the music ID
.global pently_start_music

;;
; Stops the music.
.global pently_stop_music

;;
; Resumes the stopped music.
.global pently_resume_music

; Fields ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; It's highly discouraged to write to any of these.
; Use the methods above instead.

;;
; Nonzero if music is currently playing
.global pently_music_playing

;;
; The number of rows per beat set by the current music track.
.global pently_rows_per_beat

;;
; The row within a beat, in the range 0 to pently_rows_per_beat
.global pently_row_beat_part

;;
; The fraction of a row until the next row is processed.
; Will range from -3000 to 0 on PAL or -3606 to 0 on NTSC.
.global pently_tempoCounterLo, pently_tempoCounterHi

