; Princess Engine
; Copyright (C) 2016 NovaSquirrel
;
; This program is free software: you can redistribute it and/or
; modify it under the terms of the GNU General Public License as
; published by the Free Software Foundation; either version 3 of the
; License, or (at your option) any later version.
;
; This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;

.include "../tools/thinfontdata.s"

.proc RenderThinString
InputString = 0
Index = 8

; Clear out the font space
  lda #0
  tax
  stx Index
  ldy #63
: sta UploadTileSpace,y
  dey
  bne :-

; A and X still zero
  tay ; and now Y is too. Y will be used for the 

Loop:
  ; Left character
  ldx Index
  inc Index
  lda InputString,x
  tax
  lda ThinFont1,x
  and #$f0
  sta UploadTileSpace+0,y
  lda ThinFont2,x
  and #$f0
  sta UploadTileSpace+1,y
  sta UploadTileSpace+2,y
  lda ThinFont3,x
  and #$f0
  sta UploadTileSpace+3,y
  lda ThinFont4,x
  and #$f0
  sta UploadTileSpace+4,y
  sta UploadTileSpace+5,y
  lda ThinFont5,x
  and #$f0
  sta UploadTileSpace+6,y

  ; Right character
  ldx Index
  inc Index
  lda InputString,x
  tax
  lda ThinFont1,x
  and #$0f
  ora UploadTileSpace+0,y
  sta UploadTileSpace+0,y
  lda ThinFont2,x
  and #$0f
  pha
  ora UploadTileSpace+1,y
  sta UploadTileSpace+1,y
  pla
  ora UploadTileSpace+2,y
  sta UploadTileSpace+2,y
  lda ThinFont3,x
  and #$0f
  ora UploadTileSpace+3,y
  sta UploadTileSpace+3,y
  lda ThinFont4,x
  and #$0f
  pha
  ora UploadTileSpace+4,y
  sta UploadTileSpace+4,y
  pla
  ora UploadTileSpace+5,y
  sta UploadTileSpace+5,y
  lda ThinFont5,x
  and #$0f
  ora UploadTileSpace+6,y
  sta UploadTileSpace+6,y

  ; Next tile
  tya
  add #16
  tay
  cpy #64
  jne Loop

  ; Write the address to upload it to
  lda #$17
  sta UploadTileAddress+1
  lda #$c0
  sta UploadTileAddress+0
  rts
.endproc
