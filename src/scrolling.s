; Princess Engine
; Copyright (C) 2014-2018 NovaSquirrel
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

.proc AdjustCamera
LevelIndex = 0   ; index for (ScrollLevelPointer),y
AttrIndex = 1
Temp = 2
Target = 2
ScrollOldX = 4
LevelPointer2 = 6
ScrollDifference = 6
DrawX = Temp
NewCameraX = Temp

  ; To compare the new scroll position to the old one,
  ; we need to make a copy of the original scroll
  lda ScrollX+0
  sta ScrollOldX+0
  lda ScrollX+1
  sta ScrollOldX+1

; ----------------------------------------
; FOLLOW THE PLAYER
; ----------------------------------------
  ; Step 1: Find the position that the camera seeks.
  lda PlayerPXL
  sta Target+0
  lda PlayerPXH
  ;ldy PlayerDirForScroll  ; 0 for right, 1 for left
  sub #8 ;CameraTargetByFacing,y
  bcs :+ ; <-- if it goes past zero, zero out the scroll
    lda #0
    sta Target+0
    sec ; <-- for the sbc coming up
: sta Target+1
 
  ; Step 2: Find the distance that the camera must move
  ; to reach this position.
  lda Target+0
  sbc ScrollX+0
  sta Target+0
  lda Target+1
  sbc ScrollX+1
  ; and divide by 4 for smoothing
  cmp #$80
  ror
  ror Target+0
  cmp #$80
  ror
  ror Target+0
  sta Target+1
 
  ; Limit speed
  ; Maybe I can make this smaller?
  php
  lda Target+1
  sta TouchTemp
  ; Flip to positive if needed
  bpl :+
    neg16 Target+0, Target+1
: lda Target+1
  bne TooBig
  lda Target+0
  cmp #$80
  bcc :+
TooBig:
    lda #0
    sta Target+1
    lda #$7f
    sta Target+0
  :

  ; Flip back to negative if it was negative
  lda TouchTemp
  bpl :+
    neg16 Target+0, Target+1
: plp

  ; Step 3: Add this to produce the camera's new position.
  ; The bit shifted out of Target+0 into carry can be used
  ; for free
  lda Target+0
  adc ScrollX+0
  sta ScrollX+0
  lda Target+1
  adc ScrollX+1
  sta ScrollX+1

; ----------------------------------------
; SCROLL BARRIERS (left)
; ----------------------------------------  
  lda ScrollX+1
  eor ScrollOldX+1
  and #%00010000
  beq NoScreenChangeLeft
  lda ScrollX+0
  cmp #$80
  bcc NoScreenChangeLeft
  ; See if we're scrolling past a barrier
  lda ScrollOldX+1
  lsr
  lsr
  lsr
  lsr
  tay
  lda ScreenFlags,y
  lsr
  bcc NoScreenChangeLeft
  lda ScrollOldX+1
  and #$f0
  sta ScrollX+1
  lda #0
  sta ScrollX+0 
NoScreenChangeLeft:

; ----------------------------------------
; SCROLL BARRIERS (right)
; ----------------------------------------  
  lda ScrollX+1
  and #$0f
  bne NoScreenChangeRight
  lda ScrollX+0
  and #$f0
  beq NoScreenChangeRight
  lda ScrollX+1
  ; Check the next screen and see if it's got a barrier
  lsr
  lsr
  lsr
  lsr
  tay
  lda ScreenFlags+1,y
  lsr
  bcc NoScreenChangeRight
  lda #$0f
  sta ScrollX+0
NoScreenChangeRight:

; ----------------------------------------
; UPDATE THE NAMETABLES
; ----------------------------------------

  ; Scroll updates are done in chunks that are 32 pixels wide
  ; so check to find out if we're on a new chunk or not
  lda ScrollX+1
  eor ScrollOldX+1
  and #%10 ; need updates every 32 pixels
  bne :+

  ; There are only four options so a jump table would be silly.
  ; Instead, I jump based on how many times I can decrement X before it's zero.
  ; (if it's already zero, exit)
  ldx IsScrollUpdate
  beq _rts

  ; Update the right half of a column of metatiles on the screen
  inc ThirtyUpdateAddr+1
  dex
  jeq UpdateScrollBufferRight
  dex
  jeq ScrollBuffer3
  dex
  jeq UpdateScrollBufferRight
_rts:
  rts
:

; If we're scrolling to the left, update the far left
; If we're scrolling to the right, update the far right
  lda ScrollX+1
  cmp ScrollOldX+1
  beq _rts
  bcs Right

Left:
  lsr
  sub #2
  jmp FillIt
Right:
  lsr
  add #10
FillIt:
  sta ScrollUpdateChunk

  ; Make a pointer to the level data that
  ; the blocks will be taken from.
  lda #6>>1 ; this 6 will get shifted over to become $60
            ; so that the pointer starts from $6000
  sta ScrollLevelPointer+1
  lda ScrollUpdateChunk
  .repeat 5
    asl
    rol ScrollLevelPointer+1
  .endrep
  sta ScrollLevelPointer

  ; Make another pointer that's one column to the right
  ; (used for updating the attribute table)
  ora #16
  sta LevelPointer2
  lda ScrollLevelPointer+1
  sta LevelPointer2+1

  ; make ThirtyUpdate address (low part)
  lda ScrollUpdateChunk
  asl
  asl
  and #31
  sta ThirtyUpdateAddr+1

  ; make ThirtyUpdate address (high part)
  lda ScrollUpdateChunk
  and #%1000 ; becomes 0 or 4
  lsr
  ora #$20   ; $20xx or $24xx
  sta ThirtyUpdateAddr+0

  ; fill ThirtyUpdate buffer
  jsr UpdateScrollBufferLeft

  ; fill attributes buffer
  ldy #0
  sty AttrIndex
LoopAttr:
  ; top left corner of attribute byte
  lda (ScrollLevelPointer),y
  tax
  lda MetatilePalettes,x
  and #%00000011
  sta Temp

  ; top right corner of attribute byte
  lda (LevelPointer2),y
  tax
  lda MetatilePalettes,x
  and #%00001100
  ora Temp
  sta Temp
  iny

  ; bottom left corner of attribute byte
  lda (ScrollLevelPointer),y
  tax
  lda MetatilePalettes,x
  and #%00110000
  ora Temp
  sta Temp

  ; bottom right corner of attribute byte
  lda (LevelPointer2),y
  tax
  lda MetatilePalettes,x
  and #%11000000
  ora Temp
  iny

  ; store the attribute byte we just built
  ldx AttrIndex
  sta AttributeWriteD,x
  inx
  stx AttrIndex
  cpx #8
  bne LoopAttr

  ; make attribute addresses
  lda ScrollUpdateChunk
  and #7
  sta Temp
  ldx #3
: lda AttributeAddrsLo,x
  ora Temp
  sta AttributeWriteA2,x
  dex
  bpl :-

  ; Make high address for all the attribute writes,
  ; which will be on the same nametable as the tile updates
  lda ThirtyUpdateAddr+0
  ora #3
  sta AttributeWriteA1

  lda #4
  sta IsScrollUpdate
  rts

AttributeAddrsLo:
  .byt $c0, $c8, $d0, $d8

;CameraTargetByFacing: ; 3/8 and 5/8
;  .byt 8, 8 ;6, 10
.endproc

.proc ScrollBuffer3
  ; ---- also spawn any sprites we need to spawn ----

  jsr SpritePointerAdjust
.if 0
  lda ScrollUpdateChunk
  asl
  sta 1                 ; 1 = destination column
  ldy CurSpriteIndex
  lda SpriteListRAM,y   ; current sprite X pos > destination?
  cmp 1
  beq No
  bcc Increase
Decrease:               ; yes, decrease it
  jsr SpritePointerDecrease
  jmp No
Increase:               ; no, increase it
  jsr SpritePointerIncrease
No:
.endif

  lda ScrollLevelPointer
  add #16
  sta ScrollLevelPointer
  jmp UpdateScrollBufferLeft
.endproc

.proc UpdateScrollBufferLeft
LevelIndex = 0
  ldy #0
LoopLeft:
  sty LevelIndex
  lda (ScrollLevelPointer),y
  tax
  tya
  asl ; Thirty index is LevelIndex * 2
  tay
  lda MetatileUL,x
  sta ThirtyUpdateTile+0,y
  lda MetatileLL,x
  sta ThirtyUpdateTile+1,y
  ldy LevelIndex
  iny
  cpy #15
  bne LoopLeft
  rts
.endproc

.proc UpdateScrollBufferRight
LevelIndex = 0
  ldy #0
LoopRight:
  sty LevelIndex
  lda (ScrollLevelPointer),y
  tax
  tya
  asl ; Thirty index is LevelIndex * 2
  tay
  lda MetatileUR,x
  sta ThirtyUpdateTile+0,y
  lda MetatileLR,x
  sta ThirtyUpdateTile+1,y
  ldy LevelIndex
  iny
  cpy #15
  bne LoopRight
  rts
.endproc

; ------------------------------------------------------------------------------------
.proc SpritePointerAdjust
  lda ScrollUpdateChunk ; convert update chunk to level column
  asl                   ; by multiplying by 2
  sta 1                 ; 1 = first column to look for
  ora #1
  sta 2                 ; 2 = second column to look for
  and #$f0
  sta 3                 ; 3 = screen number
  ; Get index for FirstSpriteOnScreen
  lsr
  lsr
  lsr
  lsr
  tay
  lda FirstSpriteOnScreen,y
  cmp #255
  beq Exit

  tay
Loop:
  lda SpriteListRAM,y
  cmp #255
  beq Exit
  pha
  and #$f0
  cmp 3
  bne Exit_PLA
  pla
  cmp 1
  beq Make
  cmp 2
  beq Make  
Next:
  iny
  iny
  iny
  bne Loop

Make:
  jsr TryMakeSprite
  jmp Next
Exit_PLA:
  pla
Exit:
  rts
.endproc

; Try to make a sprite from the level sprite list
; inputs: Y (sprite index)
; locals: 0
; preserves Y
.proc TryMakeSprite
  sty 0
  ldx #0
: lda ObjectF1,x             ; if there's a sprite in that location
  beq :+
  lda ObjectIndexInLevel,x   ; and it's spawned from this entry in the sprite list
  cmp 0
  beq AlreadyMade            ; don't spawn it again
: inx                        ; try next object slot
  cpx #ObjectLen
  bne :--
  beq NotAlreadyMade
AlreadyMade:
  rts
NotAlreadyMade:              ; okay, go spawn the object
  lda SpriteListRAM+2,y
  jsr FindFreeObjectForTypeX
  bcs :+
  rts
:

  lda SpriteListRAM,y        ; get object X position
  sta ObjectPXH,x            ; write it

  lda #0                     ; clear stuff out in the new sprite
  sta ObjectF3,x
  sta ObjectF4,x
  sta ObjectTimer,x
  sta ObjectVXH,x
  sta ObjectVXL,x
  sta ObjectVYH,x
  sta ObjectVYL,x
  sta ObjectPXL,x
  sta ObjectPYL,x

  lda #ENEMY_STATE_INIT      ; objects have the "INIT" state for one frame
  sta ObjectF2,x

  lda SpriteListRAM+1,y  ; get Y and flags
  and #15                ; write only Y position to object's Y
  sta ObjectPYH,x
  cmp SpriteListRAM+1,y  ; check if Y = the Y+Flags byte; if so, no flags
  beq NoFlags
  lda SpriteListRAM+1,y
  lsr
  lsr
  lsr
  lsr
  sta ObjectF3,x
.if 0 ; This is for an unused feature
      ; if I need more than 4 bits per sprite I can use the column bytes feature
  and #%1000
  beq NoFlags    ; if the high bit isn't set, not using extended flags
  tya            ; save Y since we'll need it again right after
  pha
  lda ObjectF3,x ; get the 3 bits already written
  and #%0111     ; select them only
  sec            ; add LastSpriteIndex+1 since at LastSpriteIndex it's the end of sprite list marker
  adc LastSpriteIndex
  tay
  lda SpriteListRAM+1,y
  sta ObjectF3,x
  pla
  tay
.endif
NoFlags:
  ldy 0                       ; restore Y to what it was
  tya
  sta ObjectIndexInLevel,x    ; no "sty absolute,x" so transfer first
  rts
.endproc

