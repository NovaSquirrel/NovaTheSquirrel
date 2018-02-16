; Princess Engine
; Copyright (C) 2017-2018 NovaSquirrel
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

.proc ObjectMinecart_Track
Temp = 0
MiddleBlock          = 1 ; \
MiddleXPos           = 3 ; | for holding onto results so they don't have to be calculated again
MiddleYPos           = 4 ; /
OldXPosLo    = TempVal+1 ; \ for detecting how far the cart has moved
OldXPosHi    = TempVal+2 ; /
ShiftPlayerX = TempVal+3 ; position adjust when speed changes happen

  lda #0          ; no shifting initially
  sta ShiftPlayerX

  lda ObjectVYH,x ; don't interact with track if moving upwards
  bmi Done        ; skip everything
  jsr CheckTrack  ; if the minecart is on track, lift the cart up a bit to rest on top of it
  bne NotOnTrack  ; (CheckTrack also applies special track effects like speed changes)
    lda #<-$40    ; put the minecart on the track
    sta ObjectPYL,x
    jsr CheckTrack ; if moving the cart moves it off the track, fix that
    bne :+
      dec ObjectPYH,x
    :
    lda #0
    sta ObjectVYL,x
    sta ObjectVYH,x
    beq Done ; unconditional branch
NotOnTrack:
  jsr CheckWheelsBlock ; look up what block is underneath the wheel

  ; Is it a slope? If so, use the table
  lda MiddleBlock
  cmp #Metatiles::MINE_TRACK_STEEP_LEFT_BOT      ; \
  bcc NotSlope                                   ; | sloped tiles are in a range
  cmp #Metatiles::MINE_TRACK_GRADUAL_RIGHT_U + 1 ; / reject if outside this range
  bcs NotSlope
  jsr CalculateHeight
  cmp #$f0 ; $f0 means the entire column is empty, so check the one underneath
  bne :+
    inc ObjectPYH,x
    ldy MiddleYPos
    iny
    lda (LevelBlockPtr),y
    jsr CalculateHeight ; recalculate for the new position
  :
  cmp #$00 ; $00 means the entire column is filled, so check the one above
  bne :+
    dec ObjectPYH,x
    ldy MiddleYPos
    dey
    lda (LevelBlockPtr),y
    jsr CalculateHeight ; recalculate for the new position
  :
  sta ObjectPYL,x

  ; no vertical movement
  lda #0
  sta ObjectVYL,x
  sta ObjectVYH,x
NotSlope:

; Done with any sort of interaction with the track
Done:
  rts

; Calculate the height for the current X position and the block type
CalculateHeight:
  ; calculate the index into the table
  sub #Metatiles::MINE_TRACK_STEEP_LEFT_BOT
  cmp #10
  bcc :+
    ; if it's not even a slope tile at all, keep using the same height
    lda ObjectPYL,x
    rts
  :
  ; * 8 since each entry is 8 bytes
  asl
  asl
  asl
  sta Temp
  lda MiddleXPos
  ; shift down to get the actual pixels
  lsr
  lsr
  lsr
  lsr
  ; shift off one of the actual pixels so it's just 8
  lsr
  ora Temp
  tay

  lda MiddleXPos
  and #$10
  bne OddPosition
EvenPosition:
  lda HeightTable,y
  and #$f0
  jmp WasEvenPosition
OddPosition:
  lda HeightTable,y
  asl
  asl
  asl
  asl
WasEvenPosition:
  rts

; Looks at what block is under the middle of the minecart and checks if it's track
CheckTrack:
  ; Look up what block is in the middle of the sprite, offset by the wheel height
  lda ObjectPYL,x
  add #$30
  lda ObjectPYH,x
  adc #0
  sta MiddleYPos
  tay
  lda ObjectPXL,x
  add #$80
  sta MiddleXPos
  lda ObjectPXH,x
  adc #0
  jsr GetLevelColumnPtr
  sta MiddleBlock

  ; Check if it's a special track type that needs special attention, and use a jump table
  cmp #Metatiles::MINE_TRACK_BRAKES
  bcc NotSpecialTrack
  cmp #Metatiles::MINE_TRACK_SPECIAL+1
  bcs NotSpecialTrack
  sub #Metatiles::MINE_TRACK_BRAKES
  tay
  lda SpecialTrackHi,y
  pha
  lda SpecialTrackLo,y
  pha
  rts
NotSpecialTrack:
SpecialTrackReturn:
  ldy MiddleBlock
  lda MetatileFlags,y
  and #M_BEHAVIOR
  cmp #M_MINETRACK
  rts

; Look up what block is underneath the wheels
CheckWheelsBlock:
  lda ObjectPYL,x
  add #$f0
  lda ObjectPYH,x
  adc #0
  sta MiddleYPos
  tay

  lda ObjectPXL,x
  add #$80
  sta MiddleXPos
  lda ObjectPXH,x
  adc #0
  jsr GetLevelColumnPtr
  sta MiddleBlock
  tay
  rts

; Lookup table for various special track types
SpecialTrackLo:
  .lobytes SpecialTrackBrakes-1, SpecialTrackUp-1, SpecialTrackUpLeft-1, SpecialTrackUpRight-1, SpecialTrackStop-1, SpecialTrackBump-1, SpecialTrackSpecial-1
SpecialTrackHi:
  .hibytes SpecialTrackBrakes-1, SpecialTrackUp-1, SpecialTrackUpLeft-1, SpecialTrackUpRight-1, SpecialTrackStop-1, SpecialTrackBump-1, SpecialTrackSpecial-1

SpecialTrackBrakes:
  lda ObjectF4,x
  sta Temp

  lda ObjectPXL,x
  add #$80
  lda ObjectPXH,x
  adc #0
  tay
  lda ColumnBytes,y
  sta ObjectF4,x

  sub Temp
  sta ShiftPlayerX ; offset the player to account for the changing speed

  jmp SpecialTrackReturn
SpecialTrackUp:
  lda ObjectVYH,x
  bmi :+
  lda #<(-$50)
  sta ObjectVYL,x
  lda #>(-$50)
  sta ObjectVYH,x
  pla
  pla
  jmp Done
: jmp SpecialTrackReturn

SpecialTrackUpLeft:
  lda ObjectF1,x
  lsr
  bcs SpecialTrackUp
  jmp SpecialTrackReturn
SpecialTrackUpRight:
  lda ObjectF1,x
  lsr
  bcc SpecialTrackUp
  jmp SpecialTrackReturn
SpecialTrackStop:
  lda #0
  sta ObjectF4,x
  jsr EnemyTurnAround
  lda #$f0
  jsr EnemyWalk
  jmp SpecialTrackReturn


SpecialTrackBump:
  jsr EnemyTurnAround
  jmp SpecialTrackReturn
SpecialTrackSpecial:
  ; nothing special yet
  jmp SpecialTrackReturn

; Height table for how high each column of each slope tile is
; Each column is one nybble, so each metatile takes 8 bytes
HeightTable:
; MINE_TRACK_STEEP_LEFT_BOT
  .byt $ba, $98, $76, $54, $32, $10, $00, $00
; MINE_TRACK_STEEP_LEFT_TOP
  .byt $ff, $ff, $ff, $ff, $ff, $ff, $fe, $dc
; MINE_TRACK_STEEP_RIGHT_BOT
  .byt $00, $00, $12, $34, $56, $78, $9a, $bc
; MINE_TRACK_STEEP_RIGHT_TOP
  .byt $cd, $ef, $ff, $ff, $ff, $ff, $ff, $ff
; MINE_TRACK_GRADUAL_LEFT_L
  .byt $cb, $ba, $a9, $98, $87, $76, $65, $54
; MINE_TRACK_GRADUAL_LEFT_R
  .byt $43, $32, $21, $10, $00, $00, $00, $00
; MINE_TRACK_GRADUAL_LEFT_U
  .byt $ff, $ff, $ff, $ff, $fe ,$ed, $dc, $cb
; MINE_TRACK_GRADUAL_RIGHT_L
  .byt $00, $00, $00, $00, $01, $12, $23, $34
; MINE_TRACK_GRADUAL_RIGHT_R
  .byt $45, $56, $67, $78, $89, $9a, $ab, $bc
; MINE_TRACK_GRADUAL_RIGHT_U
  .byt $bc, $cd, $de, $ef, $ff, $ff, $ff, $ff
Ride:
  lda PlayerDrawY
  add #8
  cmp O_RAM::OBJ_DRAWY
  bcs NoRide
    lda #2
    sta PlayerRidingSomething
    lda #0
    sta PlayerNeedsGround

    lda ObjectPYL,x
    sub #$80-$20
    sta PlayerPYL
    lda ObjectPYH,x
    sbc #1
    sta PlayerPYH
    lda ObjectVYL,x
    sta PlayerVYL
    lda ObjectVYH,x
    sta PlayerVYH

    ; move the player in the same amount horizontally as the sprite did
    lda ObjectPXL,x
    sub OldXPosLo
    sta OldXPosLo
    lda ObjectPXH,x
    sbc OldXPosHi
    sta OldXPosHi

    lda PlayerPXL
    add OldXPosLo
    sta PlayerPXL
    lda PlayerPXH
    adc OldXPosHi
    sta PlayerPXH

    ; apply ShiftPlayerX
    lda ShiftPlayerX
    beq NoShiftPlayerX
      lda ObjectF1,x ; negate direction if facing right
      lsr
      bcs :+
        lda ShiftPlayerX
        neg
        sta ShiftPlayerX
      :
      lda ShiftPlayerX ; sign extend the shift value
      sex
      sta Temp

      ; subtract the offset
      lda PlayerPXL
      sub ShiftPlayerX
      sta PlayerPXL
      lda PlayerPXH
      sbc Temp
      sta PlayerPXH
    NoShiftPlayerX:

    ; start the cart if it isn't started already
    lda ObjectF4,x
    bne NoRide
      lda #$10
      sta ObjectF4,x
NoRide:
  rts
.endproc

ObjectMinecart_Ride = ObjectMinecart_Track::Ride

; Randomly swaps two object slots, because the NES can only display 8 sprites per scanline
; and any past that aren't drawn. This way sprites are don't just drop out of visibility.
.proc FlickerEnemies
;  rts
  lda retraces
  and #15
  tax
  jsr huge_rand
  and #15
  tay

  lda ObjectPXH,x
  sta 0
  lda ObjectPXL,x
  sta 1
  lda ObjectPYH,x
  sta 2
  lda ObjectPYL,x
  sta 3
  lda ObjectVXH,x
  sta 4
  lda ObjectVXL,x
  sta 5
  lda ObjectVYH,x
  sta 6
  lda ObjectVYL,x
  sta 7
  lda ObjectF1,x
  sta 8
  lda ObjectF2,x
  sta 9
  lda ObjectF3,x
  sta 10
  lda ObjectF4,x
  sta 11
  lda ObjectIndexInLevel,x
  sta 12
  lda ObjectTimer,x
  sta 13

  lda ObjectPXH,y
  sta ObjectPXH,x
  lda ObjectPXL,y
  sta ObjectPXL,x
  lda ObjectPYH,y
  sta ObjectPYH,x
  lda ObjectPYL,y
  sta ObjectPYL,x
  lda ObjectVXH,y
  sta ObjectVXH,x
  lda ObjectVXL,y
  sta ObjectVXL,x
  lda ObjectVYH,y
  sta ObjectVYH,x
  lda ObjectVYL,y
  sta ObjectVYL,x
  lda ObjectF1,y
  sta ObjectF1,x
  lda ObjectF2,y
  sta ObjectF2,x
  lda ObjectF3,y
  sta ObjectF3,x
  lda ObjectF4,y
  sta ObjectF4,x
  lda ObjectIndexInLevel,y
  sta ObjectIndexInLevel,x
  lda ObjectTimer,y
  sta ObjectTimer,x

  lda 0
  sta ObjectPXH,y
  lda 1
  sta ObjectPXL,y
  lda 2
  sta ObjectPYH,y
  lda 3
  sta ObjectPYL,y
  lda 4
  sta ObjectVXH,y
  lda 5
  sta ObjectVXL,y
  lda 6
  sta ObjectVYH,y
  lda 7
  sta ObjectVYL,y
  lda 8
  sta ObjectF1,y
  lda 9
  sta ObjectF2,y
  lda 10
  sta ObjectF3,y
  lda 11
  sta ObjectF4,y
  lda 12
  sta ObjectIndexInLevel,y
  lda 13
  sta ObjectTimer,y
  rts
.endproc
