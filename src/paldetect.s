;
; TV system detection code, mark 2
; Copyright 2017 Damian Yerrick
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

;
; Uses the length from one frame to the next to detect NTSC, PAL
; NES, or Dendy in 41 bytes.  This is slightly bigger than the old
; NMI-dependent detection used since Pently 3 (2011, Thwaite),
; but it also does all the vblank waiting needed for PPU warm-up,
; saving an estimated 13 init code bytes.
;

;Edited to remove alignment
;;
; Waits for 1284*y + 5*x cycles + 5 cycles, minus 1284 if x is
; nonzero, and then reads bit 7 and 6 of the PPU status port.
; @param X fine period adjustment
; @param Y coarse period adjustment
; @return N=NMI status; V=sprite 0 status; X=Y=0; A unchanged
.proc wait1284y
  dex
  bne wait1284y
  dey
  bne wait1284y
  bit $2002
  rts
.endproc
wait1284y_end:

;;
; Waits for the PPU to stabilize and returns which TV system
; is in use.  Assumes NMI is disabled.
; @return A is 0 for NTSC or RGB, 1 for PAL NES, or 2 for Dendy and
; similar PAL famiclones designed for compatibility with NTSC games
.proc getTVSystem
  ; Pressing Reset during vertical blanking (vblank) on a toploader
  ; leaves NMI unacknowledged, causing vwait1 loop to be skipped.
  ; So acknowledge NMI.
  bit $2002

  ; Edited to copy routine into aligned memory
  ldx #wait1284y_end-wait1284y
: lda wait1284y,x
  sta 0,x
  dex
  bpl :-

  ; Wait for the start of vblank at the bottom of a frame.
  ; This may occasionally miss a frame due to a race in the PPU;
  ; this is harmless.
  vwait1:
    bit $2002
    bpl vwait1
  
  ; The PPU is stable at the end of a vblank.  Determining the TV
  ; system takes slightly longer than that: into the post-render
  ; or vblank below the second frame.
  ;
  ; NTSC: 29780 cycles, 23.19 loops.  Will end in vblank
  ; PAL NES: 33247 cycles, 25.89 loops.  Will end in vblank
  ; Dendy: 35464 cycles, 27.62 loops.  Will end in post-render
  ldx #0
  ldy #24
  jsr 0
  bpl not_ntsc
    ; Another vblank happened within 24 loops.
    ; It must be NTSC.
    tya
    rts
  not_ntsc:

  lda #1
  ldy #3
  jsr 0
  
  ; If another vblank happened by 27 loops, we're on a PAL NES.
  ; Otherwise, we're on a Dendy (PAL famiclone).
  bmi not_dendy
    asl a
  not_dendy:
  rts
.endproc