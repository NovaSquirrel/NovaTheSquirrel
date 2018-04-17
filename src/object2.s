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

.proc ObjectFighterMaker_Run
XOffset = LevelDecodePointer+0
YOffset = LevelDecodePointer+1
; attacks:
; 1. kick
; 2. vertical bodyslam
; 3. stomp from above
; 4. swoop from above (or not)

  ; Countdown the timer
  lda ObjectTimer,x
  beq :+
    dec ObjectTimer,x
  :

  ldy ObjectF3,x ; phase number
  jeq Phase0
  dey
  jeq Phase1
  dey
  jeq Phase2
  jmp Phase3

Draw:
  lda YOffsets,y
  sta YOffset

  lda ObjectVXL,x ; reuse unused X velocity byte for invincibility
  and #1
  bne _rts

  ; Look up pointer for the specified frame
  lda ObjectF1,x
  lsr
  bcc :+
    tya
    eor #4
    tay
  :
  sty TempY ; return frame number in Y
  lda MetaspritePointersL,y
  sta 0
  lda MetaspritePointersH,y
  sta 1
  lda XOffsets,y
  sta XOffset
  jsr DispEnemyMetasprite_2
_rts:
  rts

Phase0: ; kick
  jsr Fall
  bcc @InAir

  lda ObjectTimer,x ; don't move if kicking
  bne @InAir

  lda ObjectPXH,x ; kick if close
  sub PlayerPXH
  abs
  cmp #4
  bcs :+
     lda retraces
     and #31
     bne :+
       ; Find X offset for direction first
       lda ObjectF1,x
       and #1
       tay
       lda KickOffsetXL,y
       sta 0
       lda KickOffsetXH,y
       sta 1
       lda #20
       sta ObjectTimer,x

       jsr Kicksplosion
       jsr Kicksplosion
  :

  jsr DriftOverToYou
@InAir:

  lda ObjectTimer, x
  cmp #1
  lda #0
  adc #0
  tay
  jmp Draw
KickOffsetXL: .lobytes (16*16), -(8*16)
KickOffsetXH: .hibytes (16*16), -(8*16)

; ----------------------

Phase1: ; vertical bodyslam
  jsr Fall
  php
  bcc @InAir

  lda ObjectPXH,x ; BODYSLAM if close
  sub PlayerPXH
  abs
  cmp #4
  bcs :+
    lda ObjectTimer,x
    bne :+
    lda ObjectVYL,x
    ora ObjectVYH,x
    bne :+
      lda #<(-$60)
      sta ObjectVYL,x
      lda #>(-$60)
      sta ObjectVYH,x

      ; Store old player position in unused X velocity byte
      lda PlayerPXH
      sta ObjectVXH,x

      ; Don't bodyslam again for a bit
      lda #90
      sta ObjectTimer,x
  :
  jsr DriftOverToYou

  jmp NotInAir
@InAir:
  lda ObjectVXH,x
  jsr FastDriftOverToYou
NotInAir:

  plp
  bcs @Standing
  ldy #3
  jmp Draw
@Standing:
  ldy #0
  jmp Draw

; ----------------------

Phase2: ; stomp
  lda ObjectVYH,x ; only stomp if not moving vertically
  ora ObjectVYL,x
  bne @NoStomp
  lda ObjectPXH,x ; stomp if close
  sub PlayerPXH
  abs
  cmp #2
  bcs :+
    lda #<(-20)
    sta ObjectVYL,x
    lda #>($20)
    sta ObjectVYH,x
  :

  lda PlayerPXH
  jsr FastDriftOverToYou
  jsr EnemyLookAtPlayer_2
@NoStomp:
  jsr EnemyApplyYVelocity_2

  ; Past the ground?
  lda ObjectPYH,x
  cmp #10
  bcc :+
  lda ObjectPYL,x
  cmp #$80
  bcc :+
    lda #10
    sta ObjectPYH,x
    lda #$80
    sta ObjectPYL,x
    lda #<(-$10)
    sta ObjectVYL,x
    lda #>(-$10)
    sta ObjectVYH,x

    lda #$40
    sta 0
    lda #$00
    sta 1
    jsr Kicksplosion
    jsr Kicksplosion
  :

  ; Past the "ceiling"?
  lda ObjectPYH,x
  cmp #3
  bcs :+
  lda ObjectPYL,x
  cmp #$80
  bcs :+
    lda #0
    sta ObjectVYL,x
    sta ObjectVYH,x
  :

  ldy #2
  jmp Draw

; ----------------------

Phase3: ; swoop from above
; or just stand still I guess
  ldy #0
  jmp Draw

; ----------------------

DriftOverToYou:
  ; Face the player every 16 frames
  lda retraces
  and #15
  bne :+
  jsr EnemyLookAtPlayer_2
:

  ; Slide over to the player
  lda PlayerPXH
  sub ObjectPXH,x
  asl
  asl
  sta 0
  sex
  sta 1

  lda ObjectPXL,x
  add 0
  sta ObjectPXL,x
  lda ObjectPXH,x
  adc 1
  sta ObjectPXH,x
  rts

; input: A (column to seek out)
FastDriftOverToYou:
  ; Slide over to the player
  sub ObjectPXH,x
  pha
  sex
  sta 1
  pla
  ; shift separately to account for integer overflow
  .repeat 4
    asl
    rol 1
  .endrep
  sta 0  

  lda ObjectPXL,x
  add 0
  sta ObjectPXL,x
  lda ObjectPXH,x
  adc 1
  sta ObjectPXH,x
  rts

Kicksplosion:
  ; KICK, and make a small explosion
  jsr FindFreeObjectY
  bcc :+ ; no slots free
  lda #Enemy::EXPLOSION*2
  sta ObjectF1,y

  lda #$8
  sta ObjectTimer,y

  lda #SFX::BOOM1
  sta NeedSFX

  ; Offset the kick sidewards
  lda ObjectPXL,x
  add 0
  sta ObjectVXL,y
  lda ObjectPXH,x
  adc 1
  sta ObjectPXH,y
  sta ObjectVXH,y

  ; Offset the kick downwards
  lda ObjectPYL,x
  add #$02
  sta ObjectVYL,y
  lda ObjectPYH,x
  adc #$02
  sta ObjectPYH,y
  sta ObjectVYH,y

  lda #0
  sta ObjectF3,y
  sta ObjectF4,y
: rts

Fall:
  jsr EnemyGravity_2

  ; Is the enemy past the ground?
  lda ObjectPYH,x
  cmp #10
  bcc :+
  lda ObjectPYL,x
  cmp #$80
  bcc :+
  lda #10
  sta ObjectPYH,x
  lda #$80
  sta ObjectPYL,x
  lda #0
  sta ObjectVYH,x
  sta ObjectVYL,x
  sec
  rts
:
  clc
  rts

MetaspritePointersL:
  .lobytes MetaspriteR, MetaspriteKickR, MetaspriteFlyVertR, MetaspriteFlyHorizR
  .lobytes MetaspriteL, MetaspriteKickL, MetaspriteFlyVertL, MetaspriteFlyHorizL
MetaspritePointersH:
  .hibytes MetaspriteR, MetaspriteKickR, MetaspriteFlyVertR, MetaspriteFlyHorizR
  .hibytes MetaspriteL, MetaspriteKickL, MetaspriteFlyVertL, MetaspriteFlyHorizL
XOffsets:
  .byt 0, 0,   0, <-(12)
  .byt 0, <-8, 0, <-(12)
YOffsets:
  .byt 0, 0,   0,    24 ;12

MetaspriteR:
  MetaspriteHeader 2, 5, 2
  .byt $00, $10, $02, $12, $08
  .byt $01, $11, $03, $13, $09
MetaspriteKickR:
  MetaspriteHeader 3, 5, 2
  .byt $00, $10, $02, $12, $08
  .byt $01, $11, $03, $0f, $18
  .byt $20, $20, $20, $20, $19
MetaspriteFlyVertR:
  MetaspriteHeader 2, 5, 2
  .byt $04, $14, $06, $16, $08
  .byt $05, $15, $07, $17, $09
MetaspriteFlyHorizR:
  MetaspriteHeader 5, 2, 2
  .byt $0a, $1a
  .byt $0b, $1b
  .byt $0c, $1c
  .byt $0d, $1d
  .byt $0e, $1e
MetaspriteL:
  MetaspriteHeader 2, 5, 2
  .byt $01|OAM_XFLIP, $11|OAM_XFLIP, $03|OAM_XFLIP, $13|OAM_XFLIP, $09|OAM_XFLIP
  .byt $00|OAM_XFLIP, $10|OAM_XFLIP, $02|OAM_XFLIP, $12|OAM_XFLIP, $08|OAM_XFLIP
MetaspriteKickL:
  MetaspriteHeader 3, 5, 2
  .byt $20, $20, $20, $20, $19|OAM_XFLIP
  .byt $01|OAM_XFLIP, $11|OAM_XFLIP, $03|OAM_XFLIP, $0f|OAM_XFLIP, $18|OAM_XFLIP
  .byt $00|OAM_XFLIP, $10|OAM_XFLIP, $02|OAM_XFLIP, $12|OAM_XFLIP, $08|OAM_XFLIP
MetaspriteFlyVertL:
  MetaspriteHeader 2, 5, 2
  .byt $05|OAM_XFLIP, $15|OAM_XFLIP, $07|OAM_XFLIP, $17|OAM_XFLIP, $09|OAM_XFLIP
  .byt $04|OAM_XFLIP, $14|OAM_XFLIP, $06|OAM_XFLIP, $16|OAM_XFLIP, $08|OAM_XFLIP
MetaspriteFlyHorizL:
  MetaspriteHeader 5, 2, 2
  .byt $0e|OAM_XFLIP, $1e|OAM_XFLIP
  .byt $0d|OAM_XFLIP, $1d|OAM_XFLIP
  .byt $0c|OAM_XFLIP, $1c|OAM_XFLIP
  .byt $0b|OAM_XFLIP, $1b|OAM_XFLIP
  .byt $0a|OAM_XFLIP, $1a|OAM_XFLIP
.endproc

.proc JackStone_Init
  jsr JackMakePlatforms
  rts

JackMakePlatforms:
  ; Erase all platforms
  ldy #ObjectLen-1
: lda ObjectF1,y
  and #<~1
  cmp #Enemy::MOVING_PLATFORM_PUSH*2
  bne :+
  lda #0
  sta ObjectF1,y
: dey
  bpl :--

@Loop:
  ldy ObjectF4,x ; platform index
  inc ObjectF4,x ; next index
  lda JackPlatformsX,y
  sta 0
  lda JackPlatformsY,y
  sta 1

  jsr FindFreeObjectY
  bcc :+
    jsr ObjectClearY
    lda 0
    and #15
    sta ObjectPXH,y
    lda 1
    sta ObjectPYH,y
    lda #0
    sta ObjectPXL,y
    sta ObjectPYL,y
    lda #Enemy::MOVING_PLATFORM_PUSH*2
    sta ObjectF1,y
    lda #4
    sta ObjectF3,y
  :

  lda 0
  bpl @Loop
  rts
JackPlatformsX:
  .byt 2, 5, 7, 10, 13|128
  .byt 13, 3, 6, 10, 4, 7|128

JackPlatformsY:
  .byt 8, 9, 7,  5, 4
  .byt 4, 5, 6,  7, 9, 10
.endproc

.proc JackStone_Fight
ScreenX = 4
ScreenY = 5

  lda #16
  sub ObjectVXH,x
  tay
  lda BCD99,y
  unpack 0, 1
; Write health indicator
  ldy OamPtr
  ; First digit
  lda #$40
  ora 1
  sta OAM_TILE+(4*0),y
  ; Second digit
  lda #$40
  ora 0
  sta OAM_TILE+(4*1),y
  ; Other attributes
  lda #OAM_COLOR_1
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y
  lda #24
  sta OAM_YPOS+(4*0),y
  sta OAM_YPOS+(4*1),y
  lda #256-32-8
  sta OAM_XPOS+(4*0),y
  lda #256-32
  sta OAM_XPOS+(4*1),y
  tya
  add #4*2
  sta OamPtr

  ; Convert X object position to a screen scroll position
  lda ObjectPXL,x
  sta BackgroundBossScrollX
  lda ObjectPXH,x
  .repeat 4
    lsr
    ror BackgroundBossScrollX
  .endrep
  ; (Adjust for width of the boss, and scroll moving in an opposite direction)
  lda #<-(32-4)
  sub BackgroundBossScrollX
  sta BackgroundBossScrollX
  ; Convert Y object position to a screen scroll position
  lda ObjectPYL,x
  sta BackgroundBossScrollY
  lda ObjectPYH,x
  .repeat 4
    lsr
    ror BackgroundBossScrollY
  .endrep
  ; (Adjust for width of the boss, and scroll moving in an opposite direction)
  lda #<-(10*8)
  sub BackgroundBossScrollY
  sta BackgroundBossScrollY
  ;  lda #16
;  sta BackgroundBossScrollY

  lda ObjectF2,x
  beq NormalState
PauseState:
  dec ObjectTimer,x
  bne :+
    lda #<(-$80)
    sta ObjectVYL,x
    lda #>(-$80)
    sta ObjectVYH,x
    lda #0
    sta ObjectF2,x
  :
  jmp DoCollision
NormalState:
  jsr EnemyGravity_2

  lda ObjectPYH,x
  cmp #10
  bcc :+
    lda #10
    sta ObjectPYH,x
    lda #0
    sta ObjectPYL,x
    sta ObjectVYL,x
    sta ObjectVYH,x

    lda ObjectPXH,x
    sub PlayerPXH
    abs
    cmp #2
    bcs :+
      lda #1
      sta ObjectF2,x
      lda #45
      sta ObjectTimer,x
  :

  jsr DoCollision

  jmp ObjectFighterMaker_Run::DriftOverToYou

DoCollision:
  ; Calculate collision position
  ldy OamPtr
  lda #<-32
  sub BackgroundBossScrollX
  sta ScreenX
  lda #<-(90)
  sub BackgroundBossScrollY
  sta ScreenY

; ------------ Check collision with player ----------
  ; Enemy collision coordinate
  lda ScreenX
  sta TouchLeftA
  lda ScreenY
  sta TouchTopA
  ; Player collision coordinate
  lda PlayerDrawX
  sta TouchLeftB
  lda PlayerDrawY
  sta TouchTopB

  ; 8x24 player collision
  lda #8
  sta TouchWidthB
  lda #24
  sta TouchHeightB
  ; 22x64 enemy collision
  lda #22
  sta TouchWidthA
  lda #64
  sta TouchHeightA
  jsr ChkTouchGeneric
  bcc :+
    jsr HurtPlayer
  :

.if 0 ; visualizer for collision boxes
  ldy OamPtr
  lda #$53
  sta OAM_TILE+(4*0),y
  lda #1
  sta OAM_ATTR+(4*0),y
  lda ScreenX
  sta OAM_XPOS+(4*0),y
  lda ScreenY
  sta OAM_YPOS+(4*0),y
  iny
  iny
  iny
  iny
  sty OamPtr
  ldy OamPtr
  lda #$53
  sta OAM_TILE+(4*0),y
  lda #1
  sta OAM_ATTR+(4*0),y
  lda ScreenX
  add #22
  sta OAM_XPOS+(4*0),y
  lda ScreenY
  add #64
  sta OAM_YPOS+(4*0),y
  iny
  iny
  iny
  iny
  sty OamPtr
.endif
; ------------ Check collision with player projectiles ----------
ProjectileIndex = TempVal+2
  ldy #ObjectLen-1
CheckProjectileLoop:
  sty ProjectileIndex

  lda ObjectF1,y
  lsr
  cmp #Enemy::PLAYER_PROJECTILE
  bne NotPlayerProjectile
    RealXPosToScreenPosByY ObjectPXL, ObjectPXH, TouchLeftB
    RealYPosToScreenPosByY ObjectPYL, ObjectPYH, TouchTopB
    ; Look up the projectile's size
    lda ObjectF2,y
    tay
    lda PlayerProjectileSizeTable2,y
    sta TouchWidthB
    sta TouchHeightB
    jsr ChkTouchGeneric
    bcc NotPlayerProjectile ; no collision
      ldy ProjectileIndex
      lda #0
      sta ObjectF1,y
      inc ObjectVXH,x
      lda #SFX::ENEMY_HURT
      sta NeedSFX

      ; Move cannon to player's Y position
      ldy #ObjectLen-1
    CannonReplaceLoop:
      lda ObjectF1,y
      lsr
      cmp #Enemy::CANNON_1
      bne :+
      lda PlayerPYH
      sta ObjectPYH,y

      ; Also move to the opposite side of the screen as the player
      lda #$e
      sta ObjectPXH,y
      lda #Enemy::CANNON_1 * 2 + 1
      sta ObjectF1,y
      lda PlayerDrawX
      bpl :+
        lda #$1
        sta ObjectPXH,y
        lda #Enemy::CANNON_1 * 2
        sta ObjectF1,y
    : dey
      bpl CannonReplaceLoop

NotPlayerProjectile:
  ldy ProjectileIndex
  dey
  jne CheckProjectileLoop
  rts
.endproc

; Randomly swaps two object slots, because the NES can only display 8 sprites per scanline
; and any past that aren't drawn. This way sprites are don't just drop out of visibility.
.proc FlickerEnemies
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

; Draws a metasprite object
; Different from the regular code in that it has an offset (in pixels)
; and takes the pointer in 0, 1
; inputs: 0,1 (metasprite definition), X (object slot), X and Y offsets (LevelDecodePointer and +1)
.proc DispEnemyMetasprite_2
Temp = TouchTemp
Data        = 0
Width       = 2
Height      = 3
CurHeight   = 4
Attribute   = 5
CurX        = Temp+0
CurY        = Temp+1
OldWidth    = Temp+2
StartIndex  = Temp+3
ColumnX     = Temp+4
XOffset     = LevelDecodePointer+0
YOffset     = LevelDecodePointer+1
  stx TempX

  ldy #1
  sty StartIndex
  ; not on-screen until it's confirmed to be
  dey ; Y = 0
  sty O_RAM::ON_SCREEN
  
  ; read the header byte and separate it out into width, height and palette
  ; costs like ~6 more cycles than reading 3 separate bytes
  ; ldy #0 - Y still = 0
  lda (Data),y
  tax
  and #7
  sta Height
  txa
  lsr
  lsr
  lsr
  tax
  and #7
  sta Width
  sta OldWidth
  txa
  lsr
  lsr
  lsr
  sta Attribute

  ; width and height go from 1-8, not 0-7
  inc Width
  inc Height

  ldx TempX ; we need the object slot index again to read the object's X position

; --- compute the X and Y positions ---
  RealXPosToScreenPosByX ObjectPXL, ObjectPXH, O_RAM::OBJ_DRAWX
;  sta HighX

  ; divide the columns by 3
  ; to do: optimize
  ldy O_RAM::OBJ_DRAWX
  sty ColumnX
  .repeat 3
    lsr
    ror ColumnX
  .endrep

  ; init CurX
  lda O_RAM::OBJ_DRAWX
  add XOffset
  sta CurX

  RealYPosToScreenPosByX ObjectPYL, ObjectPYH, O_RAM::OBJ_DRAWY

; --- do any clipping necessary ---
LeftClip:
  lda ColumnX
  bpl NoLeftClip
    add Width ; make sure the sprite is on the screen at all
    bpl :+
_rts1: rts
  : beq _rts1

    sta Width

    ; inefficient lame code, but shouldn't have to run many iterations
    ldy ColumnX
  : lda StartIndex
    add Height
    sta StartIndex
    lda CurX
    add #8
    sta CurX
    iny
    bne :-
    jmp NoRightClip
  NoLeftClip:
RightClip:
  lda ColumnX
  cmp #32
  bcs _rts1
  add Width
  cmp #32
  bcc NoRightClip
  sub #32

  ; width = width - the number of offscreen tiles
  eor #$FF
  sec
  adc Width
  sta Width

  NoRightClip:

  inc O_RAM::ON_SCREEN

;  ; draw the tiles horizontally flipped if needed
;  lda ObjectF1,x
  ; We no longer need X since we already have the object's positions,
  ; so it's free for use here.
  ldx OamPtr
;  lsr
;  jcs DispEnemyMetaspriteLeft

; --- draw the tiles ---
  ; start Y at the position where it'll start reading tile data
  ldy StartIndex
  dey
@ColumnLoopStart:
  lda O_RAM::OBJ_DRAWY
  add YOffset
  sta CurY
  lda Height
  sta CurHeight
@ColumnLoop:
  iny           ; next sprite will use the next tile
  lda (Data),y  ; read a tile
  and #%00100000
  bne @SkipTile
  lda (Data),y
  pha
  and #%00011111
  ora O_RAM::TILEBASE
  sta OAM_TILE,x
  pla
  and #OAM_XFLIP | OAM_YFLIP
  eor Attribute
  sta OAM_ATTR,x

  ; X and Y
  lda CurX
  sta OAM_XPOS,x
  lda CurY
  sta OAM_YPOS,x
  add #8   ; move the next Y position down a tile
  sta CurY

  ; next tile in OAM
  inx
  inx
  inx
  inx
@SkipTileGoBack:
  ; see if there's more tiles for this column or not
  dec CurHeight
  bne @ColumnLoop

  ; no? is this the last column?
  dec Width
  beq Exit

  ; no? then next column
  lda CurX
  add #8
  sta CurX
  jmp @ColumnLoopStart

@SkipTile:
  lda CurY
  add #8
  sta CurY
  jmp @SkipTileGoBack
Exit:
  stx OamPtr
  ldx TempX
  rts
.endproc

.proc EnemyGravity_2
  lda ObjectVYH,x
  bmi GravityAddOK
  lda ObjectVYL,x
  cmp #$60
  bcs SkipGravity
GravityAddOK:
  lda ObjectVYL,x
  add #4
  sta ObjectVYL,x
  bcc SkipGravity
    inc ObjectVYH,x
SkipGravity:

  ; apply gravity
  jmp EnemyApplyYVelocity_2
.endproc

.proc EnemyApplyVelocity_2
; apply X
  lda ObjectPXL,x
  add ObjectVXL,x
  sta ObjectPXL,x
  lda ObjectPXH,x
  adc ObjectVXH,x
  sta ObjectPXH,x
YOnly:
; apply Y
  lda ObjectPYL,x
  add ObjectVYL,x
  sta ObjectPYL,x
  lda ObjectPYH,x
  adc ObjectVYH,x
  sta ObjectPYH,x
  rts
.endproc
EnemyApplyYVelocity_2 = EnemyApplyVelocity_2::YOnly

.proc EnemyApplyXVelocity_2
  lda ObjectPXL,x
  add ObjectVXL,x
  sta ObjectPXL,x
  lda ObjectPXH,x
  adc ObjectVXH,x
  sta ObjectPXH,x
  rts
.endproc

.proc EnemyLookAtPlayer_2
  ; Look at player  
  lda ObjectPXH,x
  cmp PlayerPXH
  lda ObjectF1,x
  and #<~1
  adc #0
  sta ObjectF1,x
  rts
.endproc

.proc PlayerProjectileSizeTable2 ; always screen pixels
  ; Stun
  .byt 8
  ; Copy
  .byt 8
  ; Blaster
  .byt 8
  ; Glider
  .byt 8
  ; Boomerang
  .byt 8
  ; Fireball
  .byt 8
  ; Flame
  .byt 16 ; was 8, should be 16?
  ; Water bottle
  .byt 8
  ; Fireworks cursor
  .byt 8
  ; Bomb
  .byt 16
  ; Explosion
  .byt 8
  ; Ice block
  .byt 16
  ; Lamp flame
  .byt 16
  ; Tornado
  .byt 16
  ; Burger
  .byt 16
  ; Mirror?
  .byt 16
.endproc

