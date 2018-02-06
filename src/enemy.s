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

.proc ObjectGoomba
  jsr EnemyFall
  lda ObjectF3,x
  beq :+
  php
  jsr EnemyBounceRandomHeights
  plp
  bcc :+
  jsr EnemyLookAtPlayer  
:
  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump

  ; Switch between three frames
  lda retraces
  lsr
  lsr
  lsr
  and #3
  tay
  lda Frames,y
  ldy #OAM_COLOR_2
  jsr DispEnemyWide

  jmp GoombaSmoosh
Frames:
  .byt $0c, $10, $14, $10
.endproc

.proc GoombaSmoosh
  jsr EnemyPlayerTouch
  bcc NoTouch
  ; Custom behavior, so can't use EnemyPlayerTouchHurt
  lda PlayerDrawY
  add #8
  cmp O_RAM::OBJ_DRAWY
  bcc FlattenGoomba

  ; Not flattening? Then hurt the player
  lda ObjectF2,x
  cmp #ENEMY_STATE_STUNNED ; if the enemy isn't stunned, that is
  beq NoTouch
  jsr HurtPlayer
  jsr EnemyTurnAround
NoTouch:
  rts
.endproc

.proc FlattenGoomba
  lda #Enemy::POOF * 2
  sta ObjectF1,x
  lda #0
  sta ObjectTimer,x
  sta ObjectF2,x
  sta ObjectF3,x
  sta ObjectF4,x
  sta O_RAM::OBJ_TYPE ; fixes a bug where after changing to the poof, it still checks for projectiles
  lda #<-1
  sta PlayerVYH
  lda #<-$60
  sta PlayerVYL
  lda #22
  sta PlayerJumpCancelLock
  lda #SFX::ENEMY_SMOOSH
  sta NeedSFX
  rts
.endproc

.proc GenericPoof
DrawX = O_RAM::OBJ_DRAWX
DrawY = O_RAM::OBJ_DRAWY
.ifdef REAL_COLLISION_TEST
  jsr DispEnemyWideCalculatePositions
  bcc NoDraw
.endif

  lda ObjectTimer,x
  asl
  sta 0

  ldy OamPtr
  lda DrawY
  sub 0
  sta OAM_YPOS+(4*0),y
  sta OAM_YPOS+(4*1),y
  lda DrawY
  add #8
  add 0
  sta OAM_YPOS+(4*2),y
  sta OAM_YPOS+(4*3),y

  lda DrawX
  sub 0
  sta OAM_XPOS+(4*0),y
  sta OAM_XPOS+(4*2),y
  lda DrawX
  add #8
  add 0
  sta OAM_XPOS+(4*1),y
  sta OAM_XPOS+(4*3),y

  lda 1
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y
  sta OAM_ATTR+(4*2),y
  sta OAM_ATTR+(4*3),y
  lda 2
  sta OAM_TILE+(4*0),y
  sta OAM_TILE+(4*1),y
  sta OAM_TILE+(4*2),y
  sta OAM_TILE+(4*3),y
  tya
  add #4*4
  sta OamPtr
NoDraw:
  inc ObjectTimer,x
  lda ObjectTimer,x
  cmp #6
  bcc :+
  lda #0
  sta ObjectF1,x
: rts
.endproc

.proc ObjectFloatingText
; Disappear
  inc ObjectTimer,x
  lda ObjectTimer,x
  cmp #15
  bcs :+ ; float up
    ; A is still ObjectTimer,x, don't reload it
    asl
    asl
    sta 0
    lda ObjectPYL,x
    sub 0
    sta ObjectPYL,x
    subcarryx ObjectPYH
    jmp :++
  :
  cmp #60
  bcc :+
    lda #0
    sta ObjectF1,x
  :

.ifdef REAL_COLLISION_TEST
  jsr DispEnemyWideCalculatePositions
  bcc NoDraw
.endif
; Display
  lda #$60
  sta O_RAM::TILEBASE
  lda #<Metasprite
  ldy #>Metasprite
  jmp DispEnemyMetasprite
NoDraw:
  rts

Metasprite:
  MetaspriteHeader 4, 1, 0
  .byt $1c, $1d, $1e, $1f
.endproc

.proc BrickPoof ; the particles used for brick poofs
  lda #OAM_COLOR_1
  sta 1
  lda retraces
  and #1
  ora #$56
  sta 2
  jmp GenericPoof
.endproc

.proc ObjectCarryableBlock
  jsr CarryAboveHead

  ; Animation for picking the block up
  ldy ObjectF4,x
  beq :+
    dec ObjectF4,x
    lda ObjectPYL,x
    add YAnimationL,y
    sta ObjectPYL,x
    lda ObjectPYH,x
    adc YAnimationH,y
    sta ObjectPYH,x
  :  

  lda PlayerOnGround ; Down = place on the ground
  beq :+
  lda PlayerRidingSomethingLast
  bne :+
  lda keydown
  and #KEY_DOWN
  beq :+
    ; Check if it would push the player into a ceiling
    ; similar to the code used for ice and burgers
    lda PlayerPYL
    add #$80
    lda PlayerPYH
    adc #<-1
    tay
    lda PlayerPXL
    add #$40
    lda PlayerPXH
    adc #0
    jsr GetLevelColumnPtr
    tay
    lda MetatileFlags,y
    bmi :+

    ; Get the tile this is going to go into
    lda PlayerPYL
    add #<(20*16)
    lda PlayerPYH
    adc #>(20*16)
    tay
    lda PlayerPXL
    add #$40
    lda PlayerPXH
    adc #0
    jsr GetLevelColumnPtr
    cmp BackgroundMetatile ; can only place it into background
    bne :+
      lda #Metatiles::PICKUP_BLOCK
      jsr ChangeBlockFar
      dec PlayerPYH
      lda #0
      sta ObjectF1,x
      sta CarryingPickupBlock
      lda #SFX::PLACE_BLOCK
      sta NeedSFX
      rts
  :

  lda #$58
  ldy #OAM_COLOR_1
  jsr DispEnemyWide
  rts
YAnimationL:
  .lobytes 0, 2*16, 4*16, 8*16, 10*16, 16*16, 20*16, 24*16
YAnimationH:
  .hibytes 0, 2*16, 4*16, 8*16, 10*16, 16*16, 20*16, 24*16

.endproc

.proc ObjectPushableBlock
  lda FallingBlockPointer+1
  bne OnlyDraw

  ; Move in the appropriate direction
  lda ObjectF1,x
  lsr
  bcs :+
    lda ObjectPXL,x
    add #$20
    sta ObjectPXL,x
    addcarryx ObjectPXH
  :
  lda ObjectF1,x
  lsr
  bcc :+
    lda ObjectPXL,x
    sub #$20
    sta ObjectPXL,x
    subcarryx ObjectPXH
  :
  ; Go up if necessary
  lda ObjectVYL,x
  beq :+
    lda ObjectPYL,x
    sub #$20
    sta ObjectPYL,x
    subcarryx ObjectPYH
  :

  ; 
  lda ObjectPXL,x
  bne NotAligned
    lda #0
    sta ObjectF1,x
    ldy ObjectPYH,x
    lda ObjectPXH,x
    jsr GetLevelColumnPtr
    lda #Metatiles::PUSHABLE_BLOCK
    jsr ChangeBlockFar

    ; Check if it needs to start falling
    iny
    lda (LevelBlockPtr),y
    cmp BackgroundMetatile
    beq :+
      rts
    :
    ; Start falling
    lda LevelBlockPtr+0
    sta FallingBlockPointer+0
    lda LevelBlockPtr+1
    sta FallingBlockPointer+1
    sty FallingBlockY
    rts
  NotAligned:

OnlyDraw:
  ; Move the block one pixel up to counteract sprites being drawn one pixel down 
  lda ObjectPYL,x
  pha
  lda ObjectPYH,x
  pha

  lda ObjectPYL,x
  sub #$10
  sta ObjectPYL,x
  subcarryx ObjectPYH

  lda #$58
  ldy #OAM_COLOR_1
  jsr DispEnemyWide

  ; Restore Y position
  pla
  sta ObjectPYH,x
  pla
  sta ObjectPYL,x
  rts
.endproc

.proc ObjectFlyawayBalloon
DrawX = O_RAM::OBJ_DRAWX
DrawY = O_RAM::OBJ_DRAWY
.ifdef REAL_COLLISION_TEST
  jsr DispEnemyWideCalculatePositions
  bcc NoDraw
.endif
  ldy OamPtr
  lda DrawY
  sta OAM_YPOS+(4*0),y
  add #8
  sta OAM_YPOS+(4*1),y

  lda #OAM_COLOR_1
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y

  lda DrawX
  sta OAM_XPOS+(4*0),y
  sta OAM_XPOS+(4*1),y

  ; Balloon tail animation
  lda retraces
  lsr
  lsr
  lsr
  lsr
  bcs :+
    lda #OAM_XFLIP|OAM_COLOR_1
    sta OAM_ATTR+(4*1),y
    lda OAM_XPOS+(4*1),y
    add #1
    sta OAM_XPOS+(4*1),y
  :

  lda #$5c
  sta OAM_TILE+(4*0),y
  lda #$5d
  sta OAM_TILE+(4*1),y
  tya
  add #8
  sta OamPtr
NoDraw:

  jsr EnemyApplyYVelocity

  ; Increase velocity
  lda ObjectVYL,x
  sub #$02
  sta ObjectVYL,x
  lda ObjectVYH,x
  sbc #0
  sta ObjectVYH,x

  ; Automatically remove balloon if off the top of the screen
  lda ObjectPYH,x
  bpl :+
  lda #0
  sta ObjectF1,x
: rts
.endproc

.proc ObjectPoof ; also for particle effects
DrawX = O_RAM::OBJ_DRAWX
DrawY = O_RAM::OBJ_DRAWY
.ifndef REAL_COLLISION_TEST
  RealXPosToScreenPosByX ObjectPXL, ObjectPXH, DrawX
.endif
  RealYPosToScreenPosByX ObjectPYL, ObjectPYH, DrawY

  ldy ObjectF2,x
  beq RegularPoof
    lda ObjHi-1,y
    pha
    lda ObjLo-1,y
    pha
    rts
RegularPoof:

  lda #OAM_COLOR_1
  sta 1
  lda #$51
  sta 2
  jmp GenericPoof

ObjLo:
  .byt <(BrickPoof-1)
  .byt <(ObjectFlyawayBalloon-1)
  .byt <(ObjectFloatingText-1)
  .byt <(ObjectPushableBlock-1)
  .byt <(ObjectCarryableBlock-1)
ObjHi:
  .byt >(BrickPoof-1)
  .byt >(ObjectFlyawayBalloon-1)
  .byt >(ObjectFloatingText-1)
  .byt >(ObjectPushableBlock-1)
  .byt >(ObjectCarryableBlock-1)
.endproc

.proc ObjectSneaker
  jsr EnemyFall
  lda ObjectF2,x
  bne :+
  lda ObjectF4,x
  cmp #$20
  bcc :+
  sub #$20
  asl
  jsr EnemyWalk
  jsr EnemyAutoBump
:

  ; Alternate between two frames
  lda retraces
  and #4
  ldy #OAM_COLOR_2
  jsr DispEnemyWide

  ; Count up a timer before starting to move
  lda ObjectF2,x
  bne :+
    lda O_RAM::ON_SCREEN
    beq :+
      lda ObjectF4,x
      cmp #$20+$30/2
      beq :+
        inc ObjectF4,x
  :

  jmp EnemyPlayerTouchHurt
.endproc

.proc ObjectSpinner
  lda ObjectF2,x
  bne :+
  jsr EnemyApplyVelocity
  inc ObjectF4,x
:

  lda retraces
  and #8
  beq OtherFrame
  lda #<SpinnerFrame1
  ldy #>SpinnerFrame1
  bne NotOtherFrame
OtherFrame:
  lda #<SpinnerFrame2
  ldy #>SpinnerFrame2
NotOtherFrame:
  jsr DispEnemyWideNonsequential
Behavior:
  lda ObjectF3,x
  and #1
  beq :+
    lda ObjectF4,x
    lsr
    and #31
    tay
    lda SineTable,y
    sta ObjectVYL,x
    sex
    sta ObjectVYH,x
  :

  lda ObjectF3,x
  and #2
  beq :+
    lda ObjectF4,x
    lsr
    and #31
    tay
    lda CosineTable,y
    sta ObjectVXL,x
    sex
    sta ObjectVXH,x
  :

  lda ObjectF3,x ; only default version aims at player
  bne DontAimAtPlayer

  ; Aim at player sometimes
  lda O_RAM::ON_SCREEN
  beq OffScreen
  lda retraces
  and #31
  cmp #5
  bne DontAimAtPlayer
  jsr AimAtPlayer
  ; Vary the angle a little
  jsr huge_rand
  lsr
  bcc :+
  iny
: lsr
  bcc :+
  dey
: tya
  and #31 ; Keep angle within bounds
  tay
  lda #1
  jsr SpeedAngle2OffsetQuarter
  lda 0
  sta ObjectVXL,x
  lda 1
  sta ObjectVXH,x
  lda 2
  sta ObjectVYL,x
  lda 3
  sta ObjectVYH,x
DontAimAtPlayer:
  jmp EnemyPlayerTouchHurt
OffScreen:
  lda #0
  sta ObjectVXL,x
  sta ObjectVYL,x
  sta ObjectVXH,x
  sta ObjectVYH,x
  rts
SpinnerFrame1:
  .byt $08, $09, $08, $09, OAM_COLOR_2, OAM_COLOR_2, OAM_COLOR_2|OAM_XFLIP, OAM_COLOR_2|OAM_XFLIP
SpinnerFrame2:
  .byt $0a, $0b, $0a, $0b, OAM_COLOR_2, OAM_COLOR_2, OAM_COLOR_2|OAM_XFLIP, OAM_COLOR_2|OAM_XFLIP 
.endproc

.proc ObjectOwl
  jsr EnemyFall
  jsr EnemyBumpOnCeiling

  lda ObjectF3,x
  bne FlyingOwl
  lda #$10
  jsr EnemyWalkOnPlatform
Display:
  lda retraces
  and #4
  add #$18
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
  jmp EnemyPlayerTouchHurt

FlyingOwl:
  lda ObjectF2,x
  bne Display
  
  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump

  lda retraces
  and #15
  bne :+
    jsr EnemyLookAtPlayer

    ; Fly up
    lda PlayerPYH
    bmi :+
    cmp ObjectPYH,x
    bcs :+
    lda #<(-$040)
    sta ObjectVYL,x
    lda #>(-$040)
    sta ObjectVYH,x
  :

  jmp Display
.endproc

.proc ObjectKing
  jsr LakituMovement

  ; Drop toast bots sometimes
  lda #Enemy::TOASTBOT*2
  jsr CountObjectAmount
  cpy #2
  bcs :+
  lda ObjectF2,x
  bne :+
    lda retraces
    bne :+
      jsr FindFreeObjectY
      bcc :+
        jsr ObjectCopyPosXY
        jsr ObjectClearY
        lda ObjectF1,x
        and #1
        ora #Enemy::TOASTBOT*2
        sta ObjectF1,y
  :

  ; Draw the sprite
  lda ObjectF1,x
  lsr
  bcs Left
Right:
  lda #<MetaspriteR
  ldy #>MetaspriteR
  jmp WasRight
Left:
  lda #<MetaspriteL
  ldy #>MetaspriteL
WasRight:
  jmp DispEnemyMetasprite

MetaspriteR:
  MetaspriteHeader 2, 4, 2
  .byt $00, $01, $08, $09
  .byt $02, $03, $0a, $0b
MetaspriteL:
  MetaspriteHeader 2, 4, 2
  .byt $02|OAM_XFLIP, $03|OAM_XFLIP, $0a|OAM_XFLIP, $0b|OAM_XFLIP
  .byt $00|OAM_XFLIP, $01|OAM_XFLIP, $08|OAM_XFLIP, $09|OAM_XFLIP
.endproc

.proc ObjectToastBot
  jsr EnemyFall

  ; Make robots poof automatically after awhile
  inc ObjectTimer,x
  lda ObjectTimer,x
  cmp #240
  bcc :+
    lda #0
    sta ObjectTimer,x
    sta ObjectF2,x
    lda #Enemy::POOF*2
    sta ObjectF1,x
  :

  ; Look at the player sometimes
  lda retraces
  and #31
  bne :+
    jsr EnemyLookAtPlayer
  :

  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump

  lda retraces
  and #4
  add #$0c
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
  jmp EnemyPlayerTouchHurt
.endproc

.proc ObjectBall
  jsr EnemyFall
  bcc :+
    lda ObjectF2,x
    bne :+
      lda #<(-$68)
      sta ObjectVYL,x
      lda #>(-$68)
      sta ObjectVYH,x
  :
  jsr EnemyBumpOnCeiling

  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump

  ldy #0
  lda #OAM_COLOR_2 << 2
  jsr DispEnemyWideFlipped

  inc ObjectF4,x
  lda ObjectF4,x
  bne :+
    lda #0
    sta ObjectF1,x
    rts
  :

  jmp EnemyPlayerTouchHurt
.endproc

.proc ObjectPotion
  rts
.endproc

.proc ObjectGeorge
  jsr EnemyFall
  lda #$10
  jsr EnemyWalkOnPlatform

  lda #$18
  ldy #OAM_COLOR_3
  jsr DispEnemyWide

  jsr EnemyPlayerTouchHurt


  lda ObjectF3,x ; even harder
  beq RegularBehavior
  cmp #1
  beq Tricky
    lda retraces
    and #7
    bne :+
    jsr huge_rand
    and #7
    beq ThrowBottle
: rts

Tricky:
  lda ObjectF3,x ; alternate behavior that makes them harder
  cmp #1
  bne RegularBehavior
    lda retraces
    and #31
    bne :+
    jsr huge_rand
    lsr
    bcc ThrowBottle
: rts

RegularBehavior:
  lda ObjectF2,x
  bne :+
    lda retraces
    and #63
    bne :+
ThrowBottle:
      jsr FindFreeObjectY
      bcc :+
        lda #0
        sta ObjectF2,y

        jsr ObjectCopyPosXYOffset

        ; Crappy trajectory calculation
        sty TempY
        jsr AimAtPlayer
        lda #1
        jsr SpeedAngle2Offset
        ldy TempY
        lda 0
        asr
        sta ObjectVXL,y
        lda 1
        sta ObjectVXH,y
        lda #<(-$40)
        sta ObjectVYL,y
        lda #>(-$40)
        sta ObjectVYH,y

        lda #Enemy::WATER_BOTTLE*2
        sta ObjectF1,y
        lda #10
        sta ObjectTimer,y
  :
  rts
.endproc

.proc ObjectBigGeorge
  rts
.endproc

.proc ObjectAlan
  rts
.endproc

.proc ObjectIce1
  lda ObjectF3,x
  cmp #2
  beq KickEnemy
  cmp #1
  beq BouncyEnemy
  jsr EnemyFall
  bcc NoWalk

  ; Calculate walk speed for the slippery walking
  lda ObjectF4,x
  inc ObjectF4,x
  and #$3f
  cmp #$20
  bcc :+
  sub #$20
  eor #255
  add #$21
:
  ldy ObjectF3,x
  cpy #3
  beq WalkOnLedge
  jsr EnemyWalk
  jsr EnemyAutoBump
NoWalk:

Draw:
  ; Walk cycle
  lda retraces
  lsr
  lsr
  and #3
  tay
  lda Frames,y
  ldy #OAM_COLOR_3
  jsr DispEnemyWide

  jmp EnemyPlayerTouchHurt
Frames:
  .byt $0a, $0e, $0a, $12

WalkOnLedge:
  lda #$10
  jsr EnemyWalkOnPlatform
  jmp NoWalk

KickEnemy:
  jsr EnemyFall

  lda ObjectF2,x
  bne :+
    lda retraces
    and #63
    bne :+
      jsr FindFreeObjectY
      bcc :+
        lda #0
        sta ObjectF2,y

        jsr ObjectCopyPosXY
        jsr ObjectClearY

        lda ObjectF1,x
        and #1
        ora #Enemy::ICE_BLOCK*2
        sta ObjectF1,y
        
        lda #15
        sta ObjectTimer,y
        lda #$38
        sta ObjectF3,y
  :

  jmp Draw

BouncyEnemy:
  lda ObjectF2,x
  bne :+
  jsr EnemyFall
  bcc :+
  lda #<(-$40)
  sta ObjectVYL,x
  lda #>(-$40)
  sta ObjectVYH,x
  lda #10
  sta ObjectTimer,x
  lda #ENEMY_STATE_PAUSE
  sta ObjectF2,x
:
  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump
  jmp Draw
.endproc

.proc ObjectIce2
  lda #$16
  ldy #OAM_COLOR_3
  jsr DispEnemyWide

  lda PlayerPXH
  sub ObjectPXH,x
  abs
  cmp #3
  bcc CloseUp
  ; Far from the player, walk and bump into things
    lda #$10
    jsr EnemyWalk
    jsr EnemyAutoBump

    jmp WasFar
CloseUp:
    lda ObjectF2,x
    bne :+
  ; Close up to the player, try and make spikes
    lda #Enemy::FALLING_SPIKE*2
    jsr CountObjectAmount
    cpy #3
    bcs :+
    jsr FindFreeObjectY
    bcc :+
    jsr ObjectClearY
    lda #Enemy::FALLING_SPIKE*2
    sta ObjectF1,y
    lda PlayerPXH
    sta ObjectPXH,y
    jsr huge_rand
    sta ObjectPXL,y

    lda #0
    sta ObjectPYH,y
    lda #3
    sta ObjectF3,y
  :
WasFar:

  jmp EnemyPlayerTouchHurt

.if 0 ; unused behavior
  lda ObjectF3,x
  beq DoNormal

  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump
  jmp DoNothing
DoNormal:

  jsr EnemyFall
  bcc NoWall
  lda ObjectF2,x
  bne NoWall
  lda retraces
  and #7
  bne NoWall
    ldy ObjectPYH,x
    dey
    lda ObjectPXH,x
    jsr GetLevelColumnPtr
    beq NotObstructed
    lda ObjectPXH,x ; store old X so we can restore it
    sta 4
    lda PlayerPXH
    cmp ObjectPXH,x
    beq NoWall
    bcc GoLeft
    bcs GoRight
NotObstructed:
    iny
    jsr MakeIce
    dec ObjectPYH,x
NoWall:
DoNothing:

  lda #$16
  ldy #OAM_COLOR_3
  jsr DispEnemyWide

  jmp EnemyPlayerTouchHurt

GoLeft:
  ldy ObjectPYH,x
  iny
  dec ObjectPXH,x
  lda ObjectPXH,x
  jmp MakeIceAndPtr
GoRight:
  ldy ObjectPYH,x
  iny
  inc ObjectPXH,x
  lda ObjectPXH,x
MakeIceAndPtr:
  jsr GetLevelColumnPtr
MakeIce:
  cpy #14
  bcs :+
  cpy #4
  bcc :+
  lda (LevelBlockPtr),y
  bne :+
  lda #Metatiles::ICE
  jsr ChangeBlockFar
  lda #2
  sta 0
  lda #Metatiles::EMPTY
  jmp DelayChangeBlockFar
: lda 4
  sta ObjectPXH,x
  rts
.endif
.endproc

.proc EnemyBounceRandomHeights
  bcc :+
    ; Bounce when reaching the ground, if not stunned
    lda ObjectF2,x
    bne :+
      jsr huge_rand
      ora #$80      
      sta ObjectVYL,x
      lda #255
      sta ObjectVYH,x
  :
  rts
.endproc

.proc ObjectBallGuy
  jsr EnemyFall
  jsr EnemyBounceRandomHeights

  jsr EnemyBumpOnCeiling

.if 0
  ; Bounce against ceilings
  lda ObjectPYL,x
  sub #$20
  lda ObjectPYH,x
  sbc #0
  tay
  lda ObjectPXH,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  bpl :+
  lda #0
  sta ObjectVYL,x
  sta ObjectVYH,x
:
.endif

  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump

  lda #4
  ldy #OAM_COLOR_2
  jsr DispEnemyWide

  jmp EnemyPlayerTouchHurt
.endproc

.proc ObjectThwomp
  lda ObjectF3,x ; if behavior set to 1, home in on player
  beq :+
  lda ObjectF2,x
  bne :+
    lda #$10
    jsr EnemyWalk
    jsr EnemyAutoBump

    jsr huge_rand
    and #7
    bne :+
    jsr EnemyLookAtPlayer
  :

  lda ObjectF2,x
  cmp #ENEMY_STATE_ACTIVE
  bne :+
  jsr EnemyFall
  bcc :+
  lda #ENEMY_STATE_PAUSE
  sta ObjectF2,x
:

  lda ObjectF2,x
  cmp #ENEMY_STATE_PAUSE
  bne :+
    lda ObjectPYL,x
    sub #$10
    sta ObjectPYL,x
    subcarryx ObjectPYH

    ; Check for collision with the ceiling
    ldy ObjectPYH,x
    lda ObjectPXH,x
    jsr GetLevelColumnPtr
    tay
    lda MetatileFlags,y
    bpl :+
    lda #0
    sta ObjectPYL,x
    inc ObjectPYH,x
    lda #ENEMY_STATE_NORMAL
    sta ObjectF2,x
  :

  lda ObjectF2,x
  bne :+
  lda ObjectPXH,x ; Player within 4 blocks horizontally
  sub PlayerPXH
  abs
  ldy ObjectF3,x           ; smaller distance if on homing mode
  cmp DistanceToTrigger,y
  bcs :+
    lda #ENEMY_STATE_ACTIVE
    sta ObjectF2,x
    lda ObjectVYH,x ; fix vertical velocity if it's negative
    bpl :+
      lda #0
      sta ObjectVYH,x
      sta ObjectVYL,x
  :

  lda #$08
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
  jmp EnemyPlayerTouchHurt

DistanceToTrigger:
  .byt 4, 2
.endproc

; Hover the cannon and control logic relating to when to shoot
.proc ObjectCannonCommon1
  jsr EnemyHover
NoHover:
  ; initialize the timer if object is initializing
  lda ObjectF2,x
  cmp #ENEMY_STATE_INIT
  beq InitTimer

  ; decrease the timer otherwise
  dec ObjectTimer,x
  bne NotFire
  jsr InitTimer

  ; Get speeds for projectiles
  lda ObjectF1,x
  and #1
  tay
  lda HSpeedL,y
  sta 0
  lda HSpeedH,y
  sta 1

  sec ; carry set: fire
  rts

InitTimer:
  jsr huge_rand
  and #63
  add #60
  sta ObjectTimer,x
NotFire:
  clc ; clear carry, don't fire
  rts
HSpeedL:
  .byt <$38, <-$38
HSpeedH:
  .byt >$38, >-$38
.endproc
ObjectCannonCommon1NoHover = ObjectCannonCommon1::NoHover

; Display an indicator when the cannon is about to fire
.proc ObjectCannonCommon2
  lda O_RAM::ON_SCREEN
  beq :+
  lda ObjectTimer,x
  cmp #32
  bcs :+
    ldy OamPtr
    lda #$50
    sta OAM_TILE,y
    lda #OAM_COLOR_1
    sta OAM_ATTR,y
    lda O_RAM::OBJ_DRAWX
    add #4
    sta OAM_XPOS,y
    lda O_RAM::OBJ_DRAWY
    sub ObjectTimer,x
    sta OAM_YPOS,y
    tya
    add #4
    sta OamPtr
  :
  rts
.endproc

; Shoots burgers only, ObjectF3 specifies the type of burger
.proc ObjectCannon1
  jsr ObjectCannonCommon1
  bcc NoShoot
    jsr FindFreeObjectY
    bcc NoShoot
      jsr ObjectCopyPosXY

      lda 0
      sta ObjectVXL,y
      lda 1
      sta ObjectVXH,y
      lda #0
      sta ObjectVYL,y
      sta ObjectVYH,y

      lda #15
      sta ObjectTimer,y

      lda #Enemy::BURGER*2
      sta ObjectF1,y

      lda ObjectF3,x
      sta ObjectF3,y
NoShoot:

  lda #<CannonFrame
  ldy #>CannonFrame
  jsr DispEnemyWideNonsequential

  jmp ObjectCannonCommon2
CannonFrame:
  .byt $0c, $0c, $0d, $0d, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP
.endproc

; Shoots arbitary objects, ObjectF3 limits how many of the object will be made
.proc ObjectCannon2
  jsr ObjectCannonCommon1
  bcc NoShoot
    ; Get projectile type
    ldy ObjectPXH,x
    lda ColumnBytes,y
    asl
    sta 1

    ; Limit object amount
    ; (A is still object type)
    jsr CountObjectAmount
    iny ; compare against the limit set in cannon's ObjectF3
    tya ; and if it's too high then don't shoot
    cmp ObjectF3,x
    bcs NoShoot
      jsr FindFreeObjectY
      bcc NoShoot
        jsr ObjectCopyPosXY
        jsr ObjectClearY

        lda 2
        sta ObjectVXL,y
        lda 3
        sta ObjectVXH,y
        lda #0
        sta ObjectVYL,y
        sta ObjectVYH,y

        ; Copy object and direction
        lda ObjectF1,x
        and #1
        ora 1
        sta ObjectF1,y
NoShoot:

  lda #<CannonFrame
  ldy #>CannonFrame
  jsr DispEnemyWideNonsequential

  jmp ObjectCannonCommon2
CannonFrame:
  .byt $0e, $0e, $0f, $0f, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP
.endproc

.proc ObjectBurger
  ; Burger type 1 has thwomp-like behavior
  lda ObjectF3,x
  cmp #1
  bne :+
    lda ObjectPXH,x
    cmp PlayerPXH
    bne :+
      lda #0
      sta ObjectVXL,x
      sta ObjectVXH,x
      lda #ENEMY_STATE_ACTIVE
      sta ObjectF2,x  
  :
  lda ObjectF2,x
  cmp #ENEMY_STATE_ACTIVE
  bne :+
    jsr EnemyFall
  :

  jsr EnemyDespawnTimer
  lda ObjectF2,x
  bne :+
  jsr EnemyApplyVelocity
: ; Display the different burger varieties differently
  lda ObjectF3,x ; multiply variety by 4 for starting tile number
  asl
  asl
  ora #$10
  ldy #OAM_COLOR_3
  jsr DispEnemyWide

; ----------------
  lda ObjectF3,x
  cmp #2
  bne NotHoming
NotHoming:

  jmp EnemyPlayerTouchHurt
;  jmp GoombaSmoosh
.endproc

.proc ObjectFireWalk
  jsr EnemyFall
  lda #$10
  ldy ObjectF3,x
  bne :+
  jsr EnemyWalk
  jsr EnemyAutoBump
  jmp NormalWalk
: 
  jsr EnemyWalkOnPlatform
NormalWalk:

  ; Make flames sometimes
  lda ObjectF2,x
  bne :+
    lda retraces
    and #15
    bne :+
      jsr FindFreeObjectY
      bcc :+
        jsr ObjectCopyPosXY

        ; Throw fires in the air
        lda #<(-$20)
        sta ObjectVYL,y
        lda #>(-$20)
        sta ObjectVYH,y

        ; Random X velocity
        jsr huge_rand
        asr
        asr
        sta ObjectVXL,y
        sex
        sta ObjectVXH,y

        lda #Enemy::FLAMES*2
        sta ObjectF1,y
        lda #8
        sta ObjectTimer,y
  :

  ; Alternate between two frames
  lda retraces
  lsr
  and #4
  ora #$10
  ldy #OAM_COLOR_3
  jsr DispEnemyWide

  jmp EnemyPlayerTouchHurt
.endproc

.proc ObjectFireJump
  jsr EnemyFall
  bcc :+
    ; Bounce and make fire when reaching the ground, if not stunned
    lda ObjectF2,x
    bne :+
      lda #<(-$40)
      sta ObjectVYL,x
      lda #>(-$40)
      sta ObjectVYH,x

      lda ObjectF3,x
      bne ObjectFireTrig

      lda #Enemy::FLAMES*2  ; limit the number of flames
      jsr CountObjectAmount
      cpy #3
      bcs :+

      jsr FindFreeObjectY
      bcc :+
        jsr ObjectClearY
        jsr ObjectCopyPosXY

        lda #Enemy::FLAMES*2
        sta ObjectF1,y
        lda #10
        sta ObjectTimer,y
  :
  lda ObjectF3,x
  bne ObjectFireTrig
  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump

  ; which frame, out of 8?
  lda retraces
  lsr
  lsr
  lsr
  and #7
  tay
Display:
  ; calculate the flip
  lda ObjectF1,x
  and #1
  eor Flip,y
  ora #OAM_COLOR_3<<2
  sta 0

  ; get the desired frame
  lda Frames,y
  tay
  lda 0
  jsr DispEnemyWideFlipped
  jmp EnemyPlayerTouchHurt

Flip: .byt %00, %00, %00, %00, %11, %11, %11, %11
Frames: .byt 0, 4, 8, 12, 0, 4, 8, 12

ObjectFireTrig:
  lda ObjectF4,x
  tay
  jsr Display

  lda O_RAM::ON_SCREEN
  bne :+
    rts
:

  jsr AimAtPlayer
  sta 3
  lsr
  lsr
  sta ObjectF4,x

  ; Shoot at the player?
  lda retraces
  and #127
  bne :+
      lda ObjectF2,x ; don't shoot if stunned
      bne :+
      jsr FindFreeObjectY
      bcc :+
      jsr ObjectClearY
      jsr ObjectCopyPosXY

      lda #Enemy::FIREBALL*2
      sta ObjectF1,y
      lda #27
      sta ObjectTimer,y
      sta ObjectF3,y ; no-gravity fireball

      tya
      pha
      ldy 3
      lda #1
      jsr SpeedAngle2Offset
      pla
      tay
      lda 0
      sta ObjectVXL,y
      lda 1
      sta ObjectVXH,y
      lda 2
      sta ObjectVYL,y
      lda 3
      sta ObjectVYH,y
:
  rts

.endproc

.proc ObjectMine
  ldy #$1c
  lda #OAM_COLOR_2 << 2
  jsr DispEnemyWideFlipped

  jsr EnemyPlayerTouch
  bcc :+
    lda #7
    jmp EnemyExplode
  :
  rts
.endproc

.proc ObjectRocket
TargetAngle = 0
AbsDifference = 1
  ldy ObjectF3,x
  lda #1
  jsr SpeedAngle2OffsetHalf
  lda 0
  sta ObjectVXL,x
  lda 1
  sta ObjectVXH,x
  lda 2
  sta ObjectVYL,x
  lda 3
  sta ObjectVYH,x

  lda ObjectF2,x
  bne :+
  jsr EnemyApplyVelocity
:

  ; Display the correct frame
  lda ObjectF3,x
  and #%11100
  asl
  add #<FrameRight
  sta 0
  lda #>FrameRight
  adc #0
  sta 1
  lda #0
  jsr DispEnemyWideNonsequentialFlipped

  lda ObjectF2,x ; don't turn while stunned
  beq :+
  cmp #ENEMY_STATE_PAUSE
  beq WaitExplode
  rts
:

  inc ObjectF4,x
  lda ObjectF4,x
  cmp #255 ; explode if it's been long enough
  beq DoExplode
  cmp #120
  bcs Exit ; no retargeting past a certain point

; Angle the rocket to aim at the player
  lda retraces
  and #3
  bne Exit

  jsr AimAtPlayer
  sty TargetAngle

  lda ObjectF3,x
  sub TargetAngle
  abs
  sta AbsDifference

  cmp #16
  bcs :+
  lda ObjectF3,x
  cmp TargetAngle
  bcc :+
  dec ObjectF3,x
  jmp Exit
:

  lda AbsDifference
  cmp #16
  bcc :+
  lda ObjectF3,x
  cmp TargetAngle
  bcs :+
  dec ObjectF3,x
  jmp Exit
:

  inc ObjectF3,x
Exit:
  lda ObjectF3,x
  and #31
  sta ObjectF3,x

; Explode if needed
  jsr EnemyPlayerTouch
  bcs DoExplode

  jsr EnemyCheckOverlappingOnSolid
  bcc :+
DoExplode:
  lda ObjectF2,x
  bne :+
  lda ObjectTimer,x
  bne :+
    lda #ENEMY_STATE_PAUSE
    sta ObjectF2,x
    lda #15
    sta ObjectTimer,x
  :
  rts

WaitExplode:
  lda ObjectF3,x
  add #2
  sta ObjectF3,x

  lda ObjectTimer,x
  cmp #1
  bne :+
    lda #7
    jmp EnemyExplode
  :
  rts

FrameRight:
  .byt $06, $06, $07, $07
  .byt OAM_COLOR_2,                     OAM_COLOR_2|OAM_YFLIP,           OAM_COLOR_2,                     OAM_COLOR_2|OAM_YFLIP
FrameDownRight:
  .byt $03, $02, $05, $04
  .byt OAM_COLOR_2|OAM_YFLIP,           OAM_COLOR_2|OAM_YFLIP,           OAM_COLOR_2|OAM_YFLIP,           OAM_COLOR_2|OAM_YFLIP
FrameDown:
  .byt $01, $00, $01, $00
  .byt OAM_COLOR_2|OAM_YFLIP,           OAM_COLOR_2|OAM_YFLIP,           OAM_COLOR_2|OAM_XFLIP|OAM_YFLIP, OAM_COLOR_2|OAM_XFLIP|OAM_YFLIP
FrameDownLeft:
  .byt $05, $04, $03, $02
  .byt OAM_COLOR_2|OAM_YFLIP|OAM_XFLIP, OAM_COLOR_2|OAM_YFLIP|OAM_XFLIP, OAM_COLOR_2|OAM_YFLIP|OAM_XFLIP, OAM_COLOR_2|OAM_YFLIP|OAM_XFLIP
FrameLeft:
  .byt $07, $07, $06, $06
  .byt OAM_COLOR_2|OAM_XFLIP,           OAM_COLOR_2|OAM_YFLIP|OAM_XFLIP, OAM_COLOR_2|OAM_XFLIP,           OAM_COLOR_2|OAM_YFLIP|OAM_XFLIP
FrameUpLeft:
  .byt $04, $05, $02, $03
  .byt OAM_COLOR_2|OAM_XFLIP,          OAM_COLOR_2|OAM_XFLIP,            OAM_COLOR_2|OAM_XFLIP,           OAM_COLOR_2|OAM_XFLIP
FrameUp:
  .byt $00, $01, $00, $01
  .byt OAM_COLOR_2,                    OAM_COLOR_2,                      OAM_COLOR_2|OAM_XFLIP,           OAM_COLOR_2|OAM_XFLIP
FrameUpRight:
  .byt $02, $03, $04, $05
  .byt OAM_COLOR_2,                    OAM_COLOR_2,                      OAM_COLOR_2,                     OAM_COLOR_2
.endproc

.proc ObjectRocketLauncher
  jsr ObjectCannonCommon1
  bcc NoShoot
    lda #Enemy::ROCKET*2  ; limit the number of rockets
    jsr CountObjectAmount
    cpy #3
    bcs NoShoot
      jsr FindFreeObjectY
      bcc NoShoot
        jsr ObjectCopyPosXY
        jsr ObjectClearY

        lda #Enemy::ROCKET*2
        sta ObjectF1,y
        lda #24
        sta ObjectF3,y
NoShoot:

  lda #<Frame
  ldy #>Frame
  jsr DispEnemyWideNonsequential

  jmp ObjectCannonCommon2
Frame:
  .byt $18, $19, $18, $19, OAM_COLOR_2, OAM_COLOR_2, OAM_COLOR_2|OAM_XFLIP, OAM_COLOR_2|OAM_XFLIP  
.endproc

.proc ObjectFireworkShooter
  lda #0
  sta ObjectF2,x

  jsr ObjectCannonCommon1NoHover
  bcc NoShoot
    ldy ObjectF4,x
    lda LaunchAnglesL,y
    sta 2
    lda LaunchAnglesH,y
    sta 3
    lda #Enemy::FIREWORK_SHOT*2
    jsr CountObjectAmount
    cpy #3
    bcs NoShoot
      jsr FindFreeObjectY
      bcc NoShoot
        jsr ObjectCopyPosXYOffset
        jsr ObjectClearY

        lda #Enemy::FIREWORK_SHOT*2
        sta ObjectF1,y
        lda 2
        sta ObjectVXL,y
        lda 3
        sta ObjectVXH,y
        lda #35
        sta ObjectTimer,y

        lda ObjectF3,x
        bne LiftedShot
        lda #<(-$70)
        sta ObjectVYL,y
        lda #>(-$70)
        sta ObjectVYH,y
NoShoot:

  lda ObjectF3,x
  bne DrawSideways

  ; Look to the side or up depending on the distance to the player
  jsr EnemyLookAtPlayer
  lda PlayerPXH
  sub ObjectPXH,x
  abs
  cmp #3
  bcc DrawStraight

; Draw tilted to the side
  lda #$0a
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
SideFinish:
  lda ObjectF1,x
  and #1
  sta ObjectF4,x ; direction
  jmp ObjectCannonCommon2

DrawStraight:
  lda #<Frame
  ldy #>Frame
  jsr DispEnemyWideNonsequential

  lda #2
  sta ObjectF4,x ; direction
  jmp ObjectCannonCommon2

LiftedShot:
  lda ObjectVXL,y
  asl
  sta ObjectVXL,y
  lda ObjectVXH,y
  rol
  sta ObjectVXH,y
  lda #<(-$40)
  sta ObjectVYL,y
  lda #>(-$40)
  sta ObjectVYH,y
DrawSideways:
  lda #<FrameSideways
  ldy #>FrameSideways
  jsr DispEnemyWideNonsequential
  jmp SideFinish 

Frame:
  .byt $08, $09, $08, $09, OAM_COLOR_2, OAM_COLOR_2, OAM_COLOR_2|OAM_XFLIP, OAM_COLOR_2|OAM_XFLIP
FrameSideways:
  .byt $0e, $0e, $0f, $0f, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP

LaunchAnglesL:
  .byt <$18, <-$18, $00
LaunchAnglesH:
  .byt >$18, >-$18, $00
.endproc

.proc ObjectTornado
  lda #$20
  jsr EnemyWalk
  bcs Destroy   ; disappear if bumping into a wall

  lda retraces
  lsr
  and #4
  add #$18
  ldy #OAM_COLOR_1
  jsr DispEnemyWide

  jsr EnemyPlayerTouch
  bcc :+
    lda ObjectPXL,x
    add #$40
    sta PlayerPXL
    lda ObjectPXH,x
    adc #0
    sta PlayerPXH
    lda ObjectPYL,x
    sta PlayerPYL
    lda ObjectPYH,x
    sta PlayerPYH
    lda #0
    sta PlayerVYL
    sta PlayerVYH
  :

  rts
Destroy:
  lda #0
  sta ObjectF1,x
  rts
.endproc

.proc ObjectElectricFan
  jsr EnemyFall
  lda retraces
  lsr
  and #4
  ldy #OAM_COLOR_2
  jsr DispEnemyWide

  lda ObjectF2,x
  bne NoShoot
  lda retraces
  and #63
  cmp #10
  bne NoShoot
      jsr FindFreeObjectY
      bcc NoShoot
        jsr ObjectClearY
        jsr ObjectCopyPosXY

        lda ObjectF1,x
        and #1
        ora #Enemy::TORNADO*2
        sta ObjectF1,y
NoShoot:
  rts
.endproc

.proc ObjectCloud
Distance = 1
  jsr EnemyApplyXVelocity

  lda ObjectF2,x
  jne NoShootNoMove

  jsr EnemyLookAtPlayer

  lda PlayerPXH
  sub ObjectPXH,x
  abs
  sta Distance
  cmp #2
  bcs ChargeIn

  lda retraces
  and #31
  cmp #0
  bne NoShootNoMove
      jsr FindFreeObjectY
      bcc NoShootNoMove
        jsr ObjectClearY
        jsr ObjectCopyPosXY
        jsr EnemyPosToVelY

        lda #24
        sta ObjectF4,y

        lda ObjectF1,x
        and #1
        ora #Enemy::CLOUD_SWORD*2
        sta ObjectF1,y

        lda #30
        sta ObjectTimer,x
        lda #ENEMY_STATE_PAUSE
        sta ObjectF2,x
        bne NoShootNoMove ; unconditional branch
ChargeIn:
  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump
  jsr EnemyHover
NoShootNoMove:

  lda retraces
  lsr
  and #4
  add #$08
  ldy #OAM_COLOR_1
  jsr DispEnemyWide
  rts
.endproc

.proc ObjectCloudSword
  inc ObjectF3,x ; animation counter

  ; Move clockwise or counter-clockwise
  lda retraces
  lsr
  bcc :+
    lda ObjectF1,x
    and #1
    tay
    lda ObjectF4,x
    add Direction,y
    sta ObjectF4,x
  :

  ; Get the sine/cosine stuff
  lda ObjectF4,x
  and #31
  tay
  lda #4
  jsr SpeedAngle2Offset

  ; Delete the sword if it goes too far
  lda ObjectF4,x
  and #31
  cmp #14
  beq Destroy
  cmp #2
  bne :+
Destroy:
    lda #0
    sta ObjectF1,x
    rts
  :

  ; Put at the right offset
  lda 0
  add ObjectVXL,x
  sta ObjectPXL,x
  lda ObjectVXH,x
  adc 1
  sta ObjectPXH,x

  lda 2
  add ObjectVYL,x
  sta ObjectPYL,x
  lda ObjectVYH,x
  adc 3
  sta ObjectPYH,x

  ; Draw the right animation frame
  lda ObjectF3,x
  cmp #12
  bcs Horizontal
  cmp #8
  bcs Diagonal
  bcc Vertical

Diagonal:
  lda #$12
  ldy #OAM_COLOR_1
  jsr DispEnemyWide
  jmp EnemyPlayerTouchHurt
Vertical:
  lda #OAM_COLOR_1
  sta 1
  lda #4 ; x
  sta 2
  lda #8 ; y
  sta 3
  lda #$11
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  ldy 4
  lda #4
  sta 2
  lda #0
  sta 3
  lda #$10
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  jmp SmallEnemyPlayerTouchHurt
Horizontal:
  lda ObjectF1,x
  lsr
  bcs HorizontalLeft
  lda #OAM_COLOR_1
  sta 1
  lda #0 ; x
  sta 2
  lda #4 ; y
  sta 3
  lda #$16
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  ldy 4
  lda #8
  sta 2
  lda #4
  sta 3
  lda #$17
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  jmp SmallEnemyPlayerTouchHurt
HorizontalLeft:
  lda #OAM_COLOR_1|OAM_XFLIP
  sta 1
  lda #8 ; x
  sta 2
  lda #4 ; y
  sta 3
  lda #$16
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  ldy 4
  lda #0
  sta 2
  lda #4
  sta 3
  lda #$17
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  jmp SmallEnemyPlayerTouchHurt

Direction: .byt 1, <-1
.endproc

.proc ObjectBouncer
  rts
.endproc

.proc ObjectGremlin
  rts
.endproc

.proc ObjectBombGuy
  jsr EnemyFall

  lda ObjectF2,x
  bne WasStunned
  lda PlayerPXH
  sub ObjectPXH,x
  abs
  cmp #3
  bcc TooClose
NotClose:
  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump
WasStunned:
  lda #0
  sta ObjectF4,x
  jmp WasNotClose
TooClose:
  jsr EnemyLookAtPlayer
  inc ObjectF4,x
  lda ObjectF4,x
  cmp #45 ; explode if sitting still for too long
  bne :+
  lda #18
  jsr EnemyExplode
:
WasNotClose:

  lda retraces
  lsr
  and #4
  add #$10
  ldy #OAM_COLOR_3
  jsr DispEnemyWide
  jsr EnemyPlayerTouchHurt
  rts
.endproc

.proc EnemyExplode
  sta ObjectTimer,x
  lda #$40
  jsr ObjectOffsetXY
  jsr EnemyPosToVel

  lda #SFX::BOOM1
  sta NeedSFX

  lda #0
  sta ObjectF3,x
  sta ObjectF4,x

  lda #Enemy::EXPLOSION*2
  sta ObjectF1,x
  jmp CloneObjectX
.endproc

.proc ObjectRonald
  jsr EnemyFall

  lda ObjectF3,x
  bne :+
    jsr EnemyActivateIfNear
  :

  ; Change direction to face the player
  jsr EnemyLookAtPlayer

  ; Save speed for the fireball
  and #1
  tay
  lda SpeedL,y
  sta 0
  lda SpeedH,y
  sta 1

  lda ObjectF2,x
  bne NoShoot
  lda retraces
  and #63
  cmp #42
  bne NoShoot
      jsr FindFreeObjectY
      bcc NoShoot
        jsr ObjectClearY
        jsr ObjectCopyPosXY

        lda ObjectPXL,y
        add #$40
        sta ObjectPXL,y
        lda ObjectPXH,y
        adc #0
        sta ObjectPXH,y

        lda 0
        sta ObjectVXL,y
        lda 1
        sta ObjectVXH,y
        lda #<-$20
        sta ObjectVYL,y
        lda #>-$20
        sta ObjectVYH,y
        lda #90
        sta ObjectTimer,y

        lda #Enemy::FIREBALL*2
        sta ObjectF1,y
NoShoot:

  lda retraces
  and #63
  cmp #42
  lda #0
  adc #0
  asl
  asl
  ldy #OAM_COLOR_3
  jsr DispEnemyWide

  jmp EnemyPlayerTouchHurt
SpeedL:
  .byt <$20, <-$20
SpeedH:
  .byt >$20, >-$20
.endproc

.proc ObjectRonaldBurger
  jsr LakituMovement

  ; Drop fries sometimes
  lda ObjectF2,x
  bne :+
    lda retraces
    bne :+
      jsr FindFreeObjectY
      bcc :+
        jsr ObjectCopyPosXY
        jsr ObjectClearY
        lda #Enemy::FRIES*2
        sta ObjectF1,y
  :

  ; Draw the sprite
  lda ObjectF1,x
  lsr
  bcs Left
Right:
  lda #<MetaspriteR
  ldy #>MetaspriteR
  jmp WasRight
Left:
  lda #<MetaspriteL
  ldy #>MetaspriteL
WasRight:
  jsr DispEnemyMetasprite

  jsr EnemyGetShotTest
  bcc :+
ProjectileIndex = TempVal+2
  ldy ProjectileIndex
  lda #0
  sta ObjectF1,y
  lda #Enemy::RONALD*2
  sta ObjectF1,x
:

  jmp EnemyPlayerTouchHurt
MetaspriteR:
  MetaspriteHeader 2, 3, 3
  .byt $14, $15, $18
  .byt $16, $17, $19
MetaspriteL:
  MetaspriteHeader 2, 3, 3
  .byt $16|OAM_XFLIP, $17|OAM_XFLIP, $19|OAM_XFLIP
  .byt $14|OAM_XFLIP, $15|OAM_XFLIP, $18|OAM_XFLIP
.endproc

.proc ObjectFries
  jsr EnemyFall
  bcc InAir
  inc ObjectTimer,x

  ; Remove fries if around for too long
  lda ObjectTimer,x
  cmp #100
  bcc :+
  lda #0
  sta ObjectF1,x
: ; Explode fries if around long enough
  lda ObjectTimer,x
  cmp #50
  bne NotExplode
  lda #4
  sta ObjectF3,x
  jsr LaunchFry
  jsr LaunchFry
  jsr LaunchFry
  jsr LaunchFry
NotExplode:
InAir:

  lda #$0c
  add ObjectF3,x
  ldy #OAM_COLOR_3
  jmp DispEnemyWide
LaunchFry:
  jsr FindFreeObjectY
  bcc :+
   jsr ObjectClearY
   lda ObjectPXL,x
   add #$40
   sta ObjectPXL,y
   lda ObjectPXH,x
   adc #0
   sta ObjectPXH,y

   lda ObjectPYL,x
   sta ObjectPYL,y
   lda ObjectPYH,x
   sta ObjectPYH,y

   ; Throw fries in the air
   lda #<(-$40)
   sta ObjectVYL,y
   lda #>(-$40)
   sta ObjectVYH,y

   ; Random X velocity
   jsr huge_rand
   sta ObjectF3,y
   asr
   asr
   sta ObjectVXL,y
   sex
   sta ObjectVXH,y

   lda #Enemy::FRY*2
   sta ObjectF1,y
:
  rts
.endproc

.proc ObjectFry
  jsr EnemyApplyVelocity
  jsr EnemyGravity

  ; Remove enemy if offscreen
  lda ObjectPYH,x
  cmp #17
  bcc :+
    lda #0
    sta ObjectF1,x
  :

  ; Generate the random flips and stuff
  lda ObjectF3,x
  and #3
  asl
  add #$1a
  cmp #$20
  bcc :+
  lda #$1a
: sta TempVal ; Tile

  ; Draw tile 1
  lda ObjectF3,x
  asl
  asl
  and #OAM_XFLIP
  ora #OAM_COLOR_3
  sta 1
  lda #0
  sta 2
  lda #<-4
  sta 3
  lda #$1a
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  ; Draw tile 2
  lda #4
  sta 3
  lda #$1b
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  jmp SmallEnemyPlayerTouchHurt
  rts
.endproc

.proc ObjectSun
  lda ObjectF2,x
  bne SkipMovement
  jsr LakituMovement

  ; Increase the counter
  inc ObjectF4,x
  lda #0
  sta 1
  lda ObjectF4,x
  ; Go a bit slowly
  lsr
  lsr
  lsr
  and #31
  tay
  ; Sinewave shaped vertical movement
  lda CosineTable,y
  asr
  sta ObjectVYL,x
  sex
  sta ObjectVYH,x

  ; Stop it from getting too high vertically
  lda ObjectPYH,x
  cmp #2
  bcs SkipMovement
  lda #2
  sta ObjectPYH,x
  lda #0
  sta ObjectPYL,x
SkipMovement:

  lda retraces
  lsr
  lsr
  and #3
  tay
  lda Frames,y
  tay
  lda #OAM_COLOR_3 << 2
  jsr DispEnemyWideFlipped
  jmp EnemyPlayerTouchHurt
Frames:
.byt 0, 4, 8, 4
.endproc

.proc CarryAboveHead
  ; Position above the player's head
  lda PlayerPXL
  sub #$40
  sta ObjectPXL,x
  lda PlayerPXH
  sbc #0
  sta ObjectPXH,x
  lda PlayerPYL
  sta ObjectPYL,x
  lda PlayerPYH
  sub #1
  sta ObjectPYH,x
  rts
.endproc

.proc ObjectSunKey
  lda #$14
  ldy #OAM_COLOR_3
  jsr DispEnemyWide
  jsr EnemyPlayerTouch
  ; Pick up if touching and pressing Up
  bcc :+
    lda CarryingPickupBlock
    bne :+
    lda keydown
    and #KEY_UP
    beq :+
      lda #1
      sta ObjectF4,x
      sta CarryingSunKey
  :

  lda ObjectF4,x
  beq NotCarried

IsCarried:
  ; Put down if requested
  lda keydown
  and #KEY_DOWN
  beq :+
    lda #0
    sta ObjectF4,x
    sta CarryingSunKey
  :
  jsr CarryAboveHead

  lda retraces
  bne :+
    ; how many suns exist?
    lda #Enemy::SUN*2
    jsr CountObjectAmount
    cpy #0
    bne :+ ; there's a sun already
      jsr FindFreeObjectY
      bcc :+
        jsr ObjectClearY
        lda ObjectPXL,x
        sta ObjectPXL,y
        lda ObjectPXH,x
        sub #2
        sta ObjectPXH,y

        lda #2
        sta ObjectPYL,y
        sta ObjectPYH,y

        lda #Enemy::SUN*2
        sta ObjectF1,y
        lda #ENEMY_STATE_STUNNED ; start out stunned
        sta ObjectF2,y
        lda #45
        sta ObjectTimer,y
  :
  rts

NotCarried:
  jsr EnemyFall  
  rts
.endproc

.proc ObjectFirebar
  lda ObjectF2,x
  cmp #ENEMY_STATE_INIT
  bne :+
    jsr EnemyPosToVel
  :

  lda ObjectF1,x
  and #1
  tay
  lda ObjectF4,x
  add Direction,y
  sta ObjectF4,x
;  and #3
;  beq :+
;  rts
;: lda ObjectF4,x
  lsr
  lsr
  and #31
  tay
  lda ObjectF3,x
  jsr SpeedAngle2Offset

  lda 0
  add ObjectVXL,x
  sta ObjectPXL,x
  lda ObjectVXH,x
  adc 1
  sta ObjectPXH,x

  lda 2
  add ObjectVYL,x
  sta ObjectPYL,x
  lda ObjectVYH,x
  adc 3
  sta ObjectPYH,x

  lda #$1c
;  ora O_RAM::TILEBASE
  ldy #OAM_COLOR_3
  jsr DispEnemyWide
  jmp EnemyPlayerTouchHurt
Direction: .byt <-1, 1
.endproc

.proc ObjectBossFight
WALKER = 0
JUMPER = 1
DIAGONAL = 2
BOMBER = 3
SMILOID = 4

  ; Get the boss number
  lda ObjectF3,x
  asl
  ; Run the init routine if initializing
  ldy ObjectF2,x
  cpy #ENEMY_STATE_INIT
  bne :+
  ; carry is set if equal
  adc #NumRoutines*2-1
: tay
  lda RunBossRoutine+1,y
  pha
  lda RunBossRoutine+0,y
  pha
  rts

NumRoutines = 2

RunBossRoutine:
  .raddr DABGFight
  .raddr DABGFight
InitBossRoutine:
  .raddr DABGInit
  .raddr DABGInit
MaxOnScreen:
  .byt 6, 3
AmountToKill:
  .byt 12, 10
EnemyListIndex: ; where to start in EnemyList
  .byt 0, 12

EnemyList:
; fight 1
  .byt WALKER, WALKER, WALKER, WALKER
  .byt WALKER, WALKER, WALKER, WALKER
  .byt WALKER, WALKER, WALKER, WALKER
; fight 2
  .byt SMILOID, WALKER, SMILOID, WALKER
  .byt WALKER,  WALKER, WALKER,  WALKER
  .byt SMILOID, SMILOID

DABGInit:
  ldy ObjectF3,x
  lda AmountToKill,y
  sta LevelVariable
  lda EnemyListIndex,y
  sta LevelVariable2
  rts
DABGFight:
  stx TempX

; Limit max number of enemies onscreen to the amount left
  ldy ObjectF3,x
  lda MaxOnScreen,y
  sta 1 ; max
  lda LevelVariable
  beq WonTeleport
  cmp MaxOnScreen,y
  bcs :+
  sta 1
:

  lda retraces
  and #31
  bne NoAddST
  lda #Enemy::SCHEME_TEAM*2
  jsr CountObjectAmount
  cpy 1
  bcs NoAddST
  lda #Enemy::SCHEME_TEAM*2
  jsr FindFreeObjectForTypeX
  bcc NoAddST
  jsr ObjectClearX
  ; get the next enemy
  ldy LevelVariable2
  lda EnemyList,y
  inc LevelVariable2
  sta ObjectF3,x

  lda PlayerPXH
  sta ObjectPXH,x
  lda #0
  sta ObjectPYH,x
NoAddST:
  ldx TempX
  rts
WonTeleport:
  ldx TempX
  inc ObjectTimer,x
  lda ObjectTimer,x
  cmp #30
  bcc :+
  lda #0
  sta ObjectF1,x
  lda ObjectPXH,x
  jmp DoTeleport
: rts
.endproc

.proc ObjectSchemeTeam
WALKER = ObjectBossFight::WALKER
JUMPER = ObjectBossFight::JUMPER
DIAGONAL = ObjectBossFight::DIAGONAL
BOMBER = ObjectBossFight::BOMBER
SMILOID = ObjectBossFight::SMILOID

HeadTile = 0
BodyTile = 1
; weapons = OR with $0c or $1c
ProjectileIndex = EnemyGetShotTest::ProjectileIndex
ProjectileType  = EnemyGetShotTest::ProjectileType

  ; Do alternate behavior if it's a smiloid
  lda ObjectF3,x
  cmp #SMILOID
  jcs DoSmiloid

  ; Fall and move forward if not falling
  ; Regular enemies are 8x16, so temporarily change EnemyRightEdge
  lda #$70
  sta EnemyRightEdge
  jsr EnemyFall
  bcc :+
  lda #$0e
  jsr EnemyWalk
  jsr EnemyAutoBump
: lda #$f0
  sta EnemyRightEdge

  jsr WrapVertically
  jsr DrawSchemeTeam

ShootPlayerMaybe:
  lda ObjectF2,x
  bne NoShoot

  lda retraces
  and #3
  bne NoShoot

  jsr huge_rand
  and #%1111
  bne NoShoot
    lda ObjectPXH,x
    cmp PlayerPXH
    lda ObjectF1,x
    and #<~1
    adc #0
    sta ObjectF1,x
    and #1
    tay
    lda BulletSpeedXL,y

    sta 1
    lda BulletSpeedXH,y
    sta 2

    jsr FindFreeObjectY
    bcc NoShoot
      jsr ObjectCopyPosXY
      jsr ObjectClearY
      lda #Enemy::BLASTER_SHOT*2
      sta ObjectF1,y
      lda #$1c
      sta ObjectF3,y
      lda #10
      sta ObjectTimer,y
      lda 1
      sta ObjectVXL,y
      lda 2
      sta ObjectVXH,y
NoShoot:

EnemyInteraction:
  lda #$80
  sta TouchWidthA
  lda #0
  sta TouchWidthA2
  sta TouchHeightA
  lda #$01
  sta TouchHeightA2
  jsr EnemyGetShotTestCustomSize
  bcc TouchPlayer
  lda ObjectF2,x
  bne :+
    ; stun the enemy
    lda #ENEMY_STATE_STUNNED
    sta ObjectF2,x
    lda #180
    sta ObjectTimer,x

    ; remove the projectile
    ldy ProjectileIndex
    lda #0
    sta ObjectF1,y

    lda #SFX::ENEMY_HURT
    sta NeedSFX
:
TouchPlayer:
  lda ObjectF2,x
  beq :+
  lda #8
  sta TouchWidthB
  sta TouchWidthA
  asl
  sta TouchHeightA
  lda #24
  sta TouchHeightB
  jsr EnemyPlayerTouch::AfterHeightWidth
  bcc :+
    lda #SFX::ENEMY_SMOOSH
    sta NeedSFX

    countdown LevelVariable

    lda #0
    sta ObjectF1,x
: rts

DrawSchemeTeam:
XGunOffset = 1
Attribute = 2
  jsr DispEnemyWideCalculatePositions
.ifdef REAL_COLLISION_TEST
  bcs :+
  rts
:
.endif
  ldy OamPtr

  lda O_RAM::OBJ_DRAWY
  sta OAM_YPOS+(4*0),y
  add #6
  sta OAM_YPOS+(4*2),y
  add #2
  sta OAM_YPOS+(4*1),y

  lda O_RAM::TILEBASE
  sta OAM_TILE+(4*0),y

  ; Save Y because it's the OAM pointer
  sty 0
  ; Get X offset for gun
  lda ObjectF1,x
  and #1
  tay
  lda DirOffsetX,y
  sta XGunOffset
  lda DirAttribute,y
  sta Attribute

  lda retraces
  lsr
  lsr
  and #3
  tay
  lda BodyAnim,y
  ora O_RAM::TILEBASE
  ldy 0
  sta OAM_TILE+(4*1),y
  lda O_RAM::TILEBASE
  ora #$0c
  sta OAM_TILE+(4*2),y

  lda O_RAM::OBJ_DRAWX
  sta OAM_XPOS+(4*0),y
  sta OAM_XPOS+(4*1),y
  add XGunOffset
  sta OAM_XPOS+(4*2),y

  lda Attribute
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y
  sta OAM_ATTR+(4*2),y

  lda ObjectF2,x
  beq :+
    ; turn into the card thing if stunned
    lda O_RAM::TILEBASE
    ora #$1a
    sta OAM_TILE+(4*0),y
    ora #1
    sta OAM_TILE+(4*1),y
    lda #$f0
    sta OAM_YPOS+(4*2),y
:

  tya
  add #4*3
  sta OamPtr
  rts

; X gun offsets for both directions
DirOffsetX:
  .byt 8, <-8
; attributes for both directions
DirAttribute:
  .byt OAM_COLOR_2, OAM_COLOR_2|OAM_XFLIP

BulletSpeedXL:
  .byt <($11), <(-$11)
BulletSpeedXH:
  .byt >($11), >(-$11)

BulletSpeedXL2:
  .byt <($21), <(-$21)
BulletSpeedXH2:
  .byt >($21), >(-$21)

BodyAnim: ; animations for the body types
  .byt $10, $11, $10, $12 ; walking
  .byt $14, $15, $14, $15 ; jumping
  .byt $13, $13, $13, $13 ; flying

WrapVertically:
  ; Wrap positions around
  lda ObjectPYH,x
  bmi :+
    cmp #14
    bcc :+
      lda #0
      sta ObjectPYH,x
      sta ObjectPYL,x
      
      jsr huge_rand
      and #$1f
      sta ObjectPXH,x
  :
  rts

; ------------------ smiloid-only stuff ---------------

DoSmiloid:
  lda ObjectF2,x ; float over to player while the smiloid is stunned
  bne NotMoving
    jsr EnemyFall
    bcc :+
    ; smiloid jumping
    lda PlayerPYH
    sub ObjectPYH,x
    abs                ; get coarse distance difference
    cmp #2
    bcc :+
      lda ObjectF2,x
      bne :+
      lda PlayerPYH    ; player above smiloid?
      cmp ObjectPYH,x
      bcs :+
        ; Jump!
        lda #<(-$50)
        sta ObjectVYL,x
        lda #>(-$50)
        sta ObjectVYH,x
  :
  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump
  jsr WrapVertically
NotMoving:

  lda ObjectF2,x
  beq :+
    lda ObjectPYH,x
    cmp #2
    beq AtTop
    bcc :+
      lda ObjectVYL,x
      sub #$01
      sta ObjectVYL,x
      subcarryx ObjectVYH
      jsr EnemyApplyYVelocity
      jmp :+
AtTop:
     lda #0
     sta ObjectVYL,x
     sta ObjectVYH,x
  :

  lda #$04
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
  jsr EnemyPlayerTouchHurt

  ; smiloid shooting
  lda ObjectF2,x
  bne NoShoot2

  lda retraces
  and #15
  bne NoShoot2

  lda PlayerPYL
  add #$80
  lda PlayerPYH
  adc #0
  cmp ObjectPYH,x
  bne NoShoot2
    lda ObjectPXH,x ; look at the player
    cmp PlayerPXH
    lda ObjectF1,x
    and #<~1
    adc #0
    sta ObjectF1,x
    and #1
    tay            ; use the direction as an index now
    lda BulletSpeedXL2,y

    sta 1
    lda BulletSpeedXH2,y
    sta 2

    jsr FindFreeObjectY
    bcc NoShoot2
      jsr ObjectCopyPosXYOffset
      jsr ObjectClearY
      lda #Enemy::BLASTER_SHOT*2
      sta ObjectF1,y
      lda #$1c
      sta ObjectF3,y
      lda #10
      sta ObjectTimer,y
      lda 1
      sta ObjectVXL,y
      lda 2
      sta ObjectVXH,y
NoShoot2:

  ; check for collision with bullets
  jsr EnemyGetShotTest
  bcc :+
  lda ObjectF2,x
  bne :+
    ; stun the enemy
    lda #ENEMY_STATE_STUNNED
    sta ObjectF2,x
    lda #180
    sta ObjectTimer,x
    lda #0
    sta ObjectVYL,x
    sta ObjectVYH,x

    ; remove the projectile
    ldy ProjectileIndex
    lda #0
    sta ObjectF1,y

    lda #SFX::ENEMY_HURT
    sta NeedSFX

    inc ObjectF4,x ; increment damage counter
    lda ObjectF4,x
    cmp #4         ; die if shot too much
    bcc :+
      lda #Enemy::POOF * 2
      sta ObjectF1,x
      lda #0
      sta ObjectTimer,x
      sta ObjectF2,x
      sta ObjectF3,x
      sta ObjectF4,x
      sta O_RAM::OBJ_TYPE ; fixes a bug where after changing to the poof, it still checks for projectiles

      lda #SFX::ENEMY_SMOOSH
      sta NeedSFX

      countdown LevelVariable
:

  rts
.endproc

.proc ObjectFlyingArrow
  jsr EnemyDespawnTimer   ; Have a timeout so the arrow disappears on its own
  jsr EnemyApplyVelocity  ; Fly forward
  jsr EnemyYLimit         ; Disappear if it goes off the top or bottom

  ; Check if it's touching a block
  jsr EnemyCheckOverlappingOnSolid
  bcc ArrowDidntHit
  ; Is this a block we care about?
  ldy #13
: lda ReactWithTypes,y
  cmp 0
  beq ArrowHit
  dey
  bpl :-
ArrowDidntHit:
  ; Arrow didn't hit any blocks it cares about, so draw it instead

  ; Face left if going left
  ; Adjust the horizontal direction of the object to match
  lda ObjectF1,x
  and #<~1        ; Clear horizontal direction flag
  sta ObjectF1,x
  lda ObjectVXL,x
  bpl :+
    inc ObjectF1,x  ; Set it if needed
  :

; Draw the arrow
  lda ObjectVYL,x ; No vertical movement? Display a horizontal arrow
  beq Horizontal
  lda ObjectVYH,x ; Check if moving up or moving down
  bmi Up          ; Negative = moving up
  lda #4          ; Vertical arrow sprite
  bne Skip
Horizontal:
  lda #0          ; Horizontal arrow sprite
Skip:
  ldy #OAM_COLOR_3
  jmp DispEnemyWide
Up:
  ldy #4
  lda #%1101
  jmp DispEnemyWideFlipped

ArrowHit:
  cpy #12
  bcs ForkArrow
  cpy #8
  bcs WasNotArrow

ChangeTheDirection:
  jsr SnapXY

  ; Get the arrow direction
  tya
  and #3
  tay
  jsr ArrowChangeDirection
  jmp EraseBlock

SnapXY:
  ; Snap to right X and Y
  lda ObjectPXL,x
  add #$80
  lda ObjectPXH,x
  adc #0
  sta ObjectPXH,x
  lda ObjectPYL,x
  add #$80
  lda ObjectPYH,x
  adc #0
  sta ObjectPYH,x
  rts

ForkArrow:
  sty TempY ; Block type out of the table
  stx TempX
  jsr CloneObjectX
  bcc :+
    tya
    tax
    jsr SnapXY
    lda TempY
    and #3
    tay
    iny
    jsr ArrowChangeDirection
  :

  ldx TempX
  jmp EraseBlock

WasNotArrow: ; Hit a block that didn't result in a new arrow coming out
  lda #SFX::SMASH
  jsr PlaySound

  lda #0
  sta ObjectF1,x
EraseBlock: ; Hit a block that did result in an arrow coming out
  lda BackgroundMetatile
  ldy 1
  jmp ChangeBlockFar

ReactWithTypes:
  .byt Metatiles::METAL_ARROW_LEFT,  Metatiles::METAL_ARROW_DOWN
  .byt Metatiles::METAL_ARROW_UP,    Metatiles::METAL_ARROW_RIGHT
  .byt Metatiles::WOOD_ARROW_LEFT,   Metatiles::WOOD_ARROW_DOWN
  .byt Metatiles::WOOD_ARROW_UP,     Metatiles::WOOD_ARROW_RIGHT
  .byt Metatiles::METAL_BOMB,        Metatiles::METAL_CRATE
  .byt Metatiles::WOOD_BOMB,         Metatiles::WOOD_CRATE
  .byt Metatiles::FORK_ARROW_DOWN,   Metatiles::FORK_ARROW_UP
.endproc

.proc ObjectFallingBomb
  jsr EnemyGravity

  jsr EnemyCheckOverlappingOnSolid
  bcc :+
    ; No explosion yet
    lda #0
    sta ObjectF1,x
  :

  lda #8
  ldy #OAM_COLOR_2
  jmp DispEnemyWide
.endproc

.proc ObjectFallingSpike
  lda PlayerPXH
  sub ObjectPXH,x
  abs
  cmp ObjectF3,x
  bcs :+
  lda #1
  sta ObjectF4,x ; turn on falling flag
:

  lda ObjectF4,x
  beq :+
  jsr EnemyGravity
:

  ; remove if it falls too far
  lda ObjectPYH,x
  cmp #15
  bcc :+
    lda #0
    sta ObjectF1,x
    rts
  :

  lda #OAM_COLOR_1
  sta 1
  lda #4
  sta 2 ; X offset
  lda #0
  sta 3 ; Y offset
  lda #$08
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  ; Draw tile 2
  lda #8
  sta 3 ; Y offset
  lda #$09
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  jmp SmallEnemyPlayerTouchHurt
.endproc

.proc ObjectBoulder
  ldy ObjectPYH,x ; Preload this for the init and fall test

  lda ObjectF2,x
  cmp #ENEMY_STATE_INIT
  bne :+
    ; Place a BOULDER_SOLID at the current position
    lda ObjectPXH,x
    ; Y is already the Y position high byte
    jsr GetLevelColumnPtr
    lda #Metatiles::BOULDER_SOLID
    sta (LevelBlockPtr),y
  :

  ; Keep falling
  lda ObjectF4,x
  bne KeepFalling

  ; Y is already the Y position high byte
  iny
  lda ObjectPXH,x
  jsr GetLevelColumnPtr
  cmp BackgroundMetatile
  beq StartFalling

Draw:
  ; Update the level sprite list
  ldy ObjectIndexInLevel,x
  lda ObjectPYH,x
  sta SpriteListRAM+1,y

  lda #12
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
  rts

StartFalling:
  lda #$4
  sta ObjectF4,x
  lda #Metatiles::BOULDER_SOLID
  jsr ChangeBlockFar

KeepFalling:
  lda ObjectPYL,x
  add #$40
  sta ObjectPYL,x
  addcarryx ObjectPYH

  dec ObjectF4,x
  beq Finish
  jmp Draw
Finish:
  ldy ObjectPYH,x
  dey
  lda ObjectPXH,x
  jsr GetLevelColumnPtr
  lda BackgroundMetatile
  jsr ChangeBlockFar
  jmp Draw
.endproc

.proc ObjectBigGlider
  lda ObjectF2,x
  bne NoMove

  ; Increase the counter
  inc ObjectF4,x

  ; Store the horizontal flag in a counter
  lda ObjectF1,x
  and #1
  sta 1

; -----------------------------
  lda ObjectF4,x
  lsr
  bcs NoMove
  lda ObjectF4,x
  lsr
  and #3
  sta 0
  tay

  lda GliderPushX,y ; get X push value from table
  ldy 1             ; and flip it horizontally if the sprite is to be flipped horizontally
  beq :+
    neg
: sta 2
  sex
  sta 3
  ldy 0
  
  lda ObjectPXL,x   ; add X push to the X position
  add 2
  sta ObjectPXL,x
  lda ObjectPXH,x
  adc 3
  sta ObjectPXH,x

; DO Y

  lda GliderPushY,y ; get Y push value from table
  ldy ObjectF3,x    ; and flip it vertically if the sprite is to be flipped vertically
  beq :+
    neg
: sta 2
  sex
  sta 3
  ldy 0

  lda ObjectPYL,x
  add 2
  sta ObjectPYL,x
  lda ObjectPYH,x
  adc 3
  sta ObjectPYH,x

NoMove:
; -----------------------------
  ; Wrap diagonally off the top and bottom of the screen

  lda ObjectPYH,x
  cmp #255
  bne :+
  lda #14
  jsr VerticalWrap
:

  lda ObjectPYH,x
  cmp #15
  bne :+
  lda #0
  jsr VerticalWrap
:

  ; Decide whether to flip or not, based on stunned state and if it's going up or down.
  ; Preserve the real stunned state.
  lda ObjectF2,x
  pha
  beq NotStunned
Stunned:
  lda ObjectF3,x
  lsr
  bcc :+
  lda #ENEMY_STATE_NORMAL
  sta ObjectF2,x
: jmp Draw

NotStunned:
  lda ObjectF3,x
  lsr
  bcc :+
  lda #ENEMY_STATE_STUNNED
  sta ObjectF2,x
:

Draw:
; Draw the glider
  lda ObjectF4,x
  and #%110
  asl
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
  jsr EnemyPlayerTouchHurt

  pla
  sta ObjectF2,x
  rts

VerticalWrap:
  pha
  lda ObjectF1,x
  lsr
  jcs @Left
  lda ObjectPXH,x
  sub #$0f
  sta ObjectPXH,x
  pla
  sta ObjectPYH,x
  rts
@Left:
  lda ObjectPXH,x
  add #$0f
  sta ObjectPXH,x
  pla
  sta ObjectPYH,x
  rts

GliderPushX:
  .byt $00, $00, $00, $50
GliderPushY:
  .byt $00, $50, $00, $00
.endproc

.proc ObjectBigLWSS
  lda ObjectF2,x
  bne NoMove

  ; Increase the counter
  inc ObjectF4,x

  lda ObjectF4,x
  and #3
  cmp #2
  bne Skip

  lda ObjectF3,x
  bne Up
Down:
  lda ObjectPYL,x
  add #$30
  sta ObjectPYL,x
  addcarryx ObjectPYH
  jmp Skip
Up:
  lda ObjectPYL,x
  sub #$30
  sta ObjectPYL,x
  subcarryx ObjectPYH  
Skip:
  lda ObjectF4,x
  and #3
  cmp #0
  bne :+
  jsr EnemyTurnAround
:
NoMove:

  ; Wrap vertically
  lda ObjectPYH,x
  cmp #15
  bne :+
  lda #0
  sta ObjectPYH,x
: cmp #255
  bne :+
  lda #14
  sta ObjectPYH,x
:

  ; --------- Draw ---------
  lda ObjectF2,x
  pha
  lda ObjectF3,x ; make upward facing spaceships go up
  beq :+
  lda ObjectF2,x
  eor #ENEMY_STATE_STUNNED
  sta ObjectF2,x
:
  ; Do the drawing now
  lda ObjectF4,x
  asl
  and #4
  add #$18
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
  pla
  sta ObjectF2,x
  jsr EnemyPlayerTouchHurt
  rts
.endproc

.proc ObjectMinecart
Temp = 0
MiddleBlock          = 1 ; \
MiddleXPos           = 3 ; | for holding onto results so they don't have to be calculated again
MiddleYPos           = 4 ; /
OldXPosLo    = TempVal+1 ; \ for detecting how far the cart has moved
OldXPosHi    = TempVal+2 ; /
ShiftPlayerX = TempVal+3 ; position adjust when speed changes happen
; ObjectF4 is the current speed (magnitude, not signed velocity)
  jsr EnemyFall ; clobbers 0

  ; save the old X position
  lda ObjectPXL,x
  sta OldXPosLo
  lda ObjectPXH,x
  sta OldXPosHi

  lda ObjectF4,x  ; move forward at the cart's current speed
  jsr EnemyWalk   ; clobbers 0, 1, 2

  lda #<ObjectMinecart_Track
  ldy #>ObjectMinecart_Track
  jsr InObjectBank2

  lda #$00
  ldy #OAM_COLOR_2
  jsr DispEnemyWide

  ; Let the player ride on it
  jsr CollideRide16
  bcc NoRide
    lda #<ObjectMinecart_Ride
    ldy #>ObjectMinecart_Ride
    jsr InObjectBank2
NoRide:

  rts
.endproc

.proc ObjectBoomerangGuy
TheMask = 0
TheTimer = 1
TheTurnaround = 2
  jsr EnemyFall

  lda retraces
  lsr
  lsr
  and #7
  tay
  lda Frames,y
  ldy #OAM_COLOR_3
  jsr DispEnemyWide

  jsr EnemyPlayerTouchHurt

  ldy ObjectF3,x
  lda RetracesMasks,y
  sta TheMask
  lda TimerList,y
  sta TheTimer
  lda TurnaroundList,y
  sta TheTurnaround

  lda ObjectF2,x
  bne :+
    lda retraces
    and TheMask
    bne :+
ThrowBoomerang:
      jsr FindFreeObjectY
      bcc :+
        lda #Enemy::BOOMERANG*2
        sta ObjectF1,y
        lda #0
        sta ObjectF2,y
        lda TheTimer
        sta ObjectTimer,y
        lda TheTurnaround
        sta ObjectF4,y

        jsr ObjectCopyPosXYOffset

        ; Crappy trajectory calculation
        sty TempY
        jsr AimAtPlayer
        lda #1
        jsr SpeedAngle2Offset
        ldy TempY
        lda 0
        sta ObjectVXL,y
        lda 1
        sta ObjectVXH,y
        lda 2
        sta ObjectVYL,y
        lda 3
        sta ObjectVYH,y
  :

  rts
RetracesMasks:
  .byt 63,   127,  31
TimerList:
  .byt 30/4, 60/4, 15/4
TurnaroundList:
  .byt 15,   30,   15/2
Frames:
  .byt 0, 0, 0, 4, 8, 8, 8, 4
.endproc

.proc ObjectGrabbyHand
  ; Prepare yourself for some lame code
  lda ObjectF2,x
  cmp #ENEMY_STATE_INIT
  bne :+
    jsr EnemyPosToVel
  :

  ; Copy velocity to position so we can aim from there
  lda ObjectVXL,x
  sta ObjectPXL,x
  lda ObjectVYL,x
  sta ObjectPYL,x
  lda ObjectVXH,x
  sta ObjectPXH,x
  lda ObjectVYH,x
  sta ObjectPYH,x

  ; Draw a star in the middle
  lda #OAM_COLOR_1
  sta 1
  lda #4 ; x
  sta 2
  lda #4 ; y
  sta 3
  lda #$51
  jsr DispObject8x8_XYOffset

  ; Retarget when at the star
  lda ObjectF4,x
  bne NoRetarget
  lda O_RAM::ON_SCREEN
  beq NoRetarget

  jsr AimAtPlayer
  sta ObjectF3,x 

  ; Pause a bit before throwing
  lda #45
  sta ObjectTimer,x
  lda #ENEMY_STATE_PAUSE
  sta ObjectF2,x
  inc ObjectF4,x
NoRetarget:
  lda ObjectF2,x
  bne :+
  inc ObjectF4,x ; increase counter
  lda ObjectF4,x ; restrict its range
  and #63
  sta ObjectF4,x
:

  lda ObjectF4,x
  and #31
  tay
  lda SineTable,y
  abs
  lsr
  lsr
  ldy ObjectF3,x ; get angle
  jsr SpeedAngle2Offset

  ; Apply an offset away from the center
  lda 0
  add ObjectVXL,x
  sta ObjectPXL,x
  lda ObjectVXH,x
  adc 1
  sta ObjectPXH,x

  lda 2
  add ObjectVYL,x
  sta ObjectPYL,x
  lda ObjectVYH,x
  adc 3
  sta ObjectPYH,x

  jsr EnemyLookAtPlayer

  lda retraces
  lsr
  lsr
  and #4
  add #$0c
  ldy #OAM_COLOR_3
  jsr DispEnemyWide

  jmp EnemyPlayerTouchHurt
.endproc

.proc ObjectMolSno
  lda #$10
  add ObjectF4,x ; speed up with damage
  jsr EnemyWalk
  jsr EnemyAutoBump

  jsr EnemyFall
  bcc :+
    lda ObjectPXH,x
    cmp #6
    beq @YesJump
    lda ObjectPXH,x
    cmp #8
    bne :+
@YesJump:
      lda #<(-$060)
      sta ObjectVYL,x
      lda #>(-$060)
      sta ObjectVYH,x
  :

; Move position up temporarily
  lda ObjectPYL,x
  sub #$80
  sta ObjectPYL,x
  subcarryx ObjectPYH

  lda ObjectF3,x ; invincibility
  beq :+
  dec ObjectF3,x
  lda retraces
  and #1
  beq DontDraw
:

; Lookup the correct animation frame
  lda ObjectF1,x
  and #1
  asl ;2
  asl ;4
  sta 0
  lda retraces
  and #4
  lsr
  lsr
  ora 0

  ; Use throwing frame if throwing
  ldy ObjectF2,x
  cpy #ENEMY_STATE_ACTIVE
  bne :+
    and #4
    ora #2
  :

  tay
  lda FramesLo,y
  pha
  lda FramesHi,y
  tay
  pla
  jsr DispEnemyMetasprite
DontDraw:

; Switch into can throwing mode
  lda ObjectF2,x
  cmp #ENEMY_STATE_NORMAL
  bne :+
    dec ObjectTimer,x
    bne :+
      lda #ENEMY_STATE_ACTIVE
      sta ObjectF2,x
      jsr huge_rand
      and #15
      add #50
      sta ObjectTimer,x
      lda #ENEMY_STATE_ACTIVE
      sta ObjectF2,x
  :

; Throw cans
  lda ObjectF2,x
  cmp #ENEMY_STATE_ACTIVE
  bne :+
    dec ObjectTimer,x
    bne @NoResetThrow
    lda #ENEMY_STATE_NORMAL
    sta ObjectF2,x
    lda #180
    sta ObjectTimer,x
@NoResetThrow:
    lda retraces
    and #7
    bne :+
      jsr FindFreeObjectY
      bcc :+
        jsr EnemyLookAtPlayer
        lda #Enemy::MOLSNO_NOTE*2
        sta ObjectF1,y
        lda #0
        sta ObjectF2,y
        lda #40
        sta ObjectTimer,y

        jsr ObjectCopyPosXYOffset

        sty TempY
        jsr AimAtPlayer
        lda #1
        jsr SpeedAngle2Offset
        ldy TempY
        lda 0
        sta ObjectVXL,y
        lda 1
        sta ObjectVXH,y
        lda 2
        sta ObjectVYL,y
        lda 3
        sta ObjectVYH,y
  :

; Move position back down
  lda ObjectPYL,x
  add #$80
  sta ObjectPYL,x
  addcarryx ObjectPYH

; Write health indicator
  ldy OamPtr
  lda #$48
  sub ObjectF4,x
  sta OAM_TILE,y
  lda #OAM_COLOR_1
  sta OAM_ATTR,y
  lda #24
  sta OAM_YPOS,y
  lda #256-32
  sta OAM_XPOS,y
  iny
  iny
  iny
  iny
  sty OamPtr

; If the boss is out of hitpoints, wait a bit and then teleport
  lda ObjectF4,x
  cmp #8
  bcc :+
    inc LevelVariable
    lda LevelVariable
    cmp #30
    bcc NotShot
    lda #16
    jmp DoTeleport
  :

; Get hit by projectiles
  lda ObjectF3,x
  bne NotShot
  jsr EnemyGetShotTest
  bcc :+
ProjectileIndex = TempVal+2
  ldy ProjectileIndex
  lda #0
  sta ObjectF1,y
  inc ObjectF4,x ; increase hit counter
  lda #90
  sta ObjectF3,x ; be invincible for a bit
  lda #SFX::ENEMY_HURT
  sta NeedSFX
:
NotShot:

  rts
FramesLo:
  .lobytes MetaspriteR, MetaspriteRWalk, MetaspriteRThrow, MetaspriteRMusic
  .lobytes MetaspriteL, MetaspriteLWalk, MetaspriteLThrow, MetaspriteLMusic
FramesHi:
  .hibytes MetaspriteR, MetaspriteRWalk, MetaspriteRThrow, MetaspriteRMusic
  .hibytes MetaspriteL, MetaspriteLWalk, MetaspriteLThrow, MetaspriteLMusic

MetaspriteR:
  MetaspriteHeader 2, 3, 2
  .byt $00, $10, $02
  .byt $01, $11, $03
MetaspriteRWalk:
  MetaspriteHeader 2, 3, 2
  .byt $00, $10, $04
  .byt $01, $11, $05
MetaspriteRThrow:
  MetaspriteHeader 2, 3, 2
  .byt $06, $16, $08
  .byt $07, $17, $09
MetaspriteRMusic:
  MetaspriteHeader 2, 3, 2
  .byt $12, $10, $02
  .byt $13, $11, $03
MetaspriteL:
  MetaspriteHeader 2, 3, 2
  .byt $01|OAM_XFLIP, $11|OAM_XFLIP, $03|OAM_XFLIP
  .byt $00|OAM_XFLIP, $10|OAM_XFLIP, $02|OAM_XFLIP
MetaspriteLWalk:
  MetaspriteHeader 2, 3, 2
  .byt $01|OAM_XFLIP, $11|OAM_XFLIP, $05|OAM_XFLIP
  .byt $00|OAM_XFLIP, $10|OAM_XFLIP, $04|OAM_XFLIP
MetaspriteLThrow:
  MetaspriteHeader 2, 3, 2
  .byt $07|OAM_XFLIP, $17|OAM_XFLIP, $09|OAM_XFLIP
  .byt $06|OAM_XFLIP, $16|OAM_XFLIP, $08|OAM_XFLIP
MetaspriteLMusic:
  MetaspriteHeader 2, 3, 2
  .byt $13|OAM_XFLIP, $11|OAM_XFLIP, $03|OAM_XFLIP
  .byt $12|OAM_XFLIP, $10|OAM_XFLIP, $02|OAM_XFLIP
.endproc

.proc ObjectMolSnoNote
  dec ObjectTimer,x
  bne :+
  lda #0
  sta ObjectF1,x
  rts
:

  jsr EnemyApplyVelocity
  lda retraces
  lsr
  lsr
  and #3
  tay
  lda Attr,y
  sta 1

  lda Tile,y
  ora O_RAM::TILEBASE
  jsr DispObject8x8_Attr
  jmp SmallEnemyPlayerTouchHurt

Tile:
  .byt $14, $15, $14, $15
Attr:
  .byt OAM_COLOR_2, OAM_COLOR_2, OAM_COLOR_2|OAM_XFLIP|OAM_YFLIP, OAM_COLOR_2|OAM_XFLIP|OAM_YFLIP

.endproc

.proc ObjectBuddy
  jsr EnemyFall
  jsr EnemyBumpOnCeiling

  lda #$10
  jsr EnemyWalk
  bcc :+
  ; Interact with solid collectibles too (arrow blocks)
  ldy ObjectPYH,x
  lda 0
  jsr DoCollectibleFar
  sec
  jsr EnemyAutoBump
:

  jsr GetPointerForMiddleWide
  cmp #Metatiles::SPRING
  bne :+
    lda #<-1
    sta ObjectVYH,x
    lda #<-$60
    sta ObjectVYL,x
    bne DoneInteract
  :
  cmp #Metatiles::CAMPFIRE
  bne :+
    lda #0
    sta ObjectF1,x
    rts
  :
  cmp #Metatiles::TOGGLE_SWITCH
  bne :+
    jsr SwitchCooldown
    bcc DoneInteract
    jsr HitToggleSwitch
    jmp DoneInteract
  :
  jsr DoCollectibleFar
DoneInteract:

  lda retraces
  and #4
  add #$14
  ldy #OAM_COLOR_3
  jmp DispEnemyWide
.endproc

.proc ObjectBeamEmitter
; to do, make the -emitter- do the collision instead
  lda ObjectPXH,x
  sub PlayerPXH
  abs
  cmp #10
  bcs :+

  lda retraces
  and #7
  bne :+
    jsr FindFreeObjectY
    bcc :+
      jsr ObjectCopyPosXYOffset

      txa
      pha
      lda ObjectF3,x
      tax
      lda TableXL,x
      sta ObjectVXL,y
      lda TableXH,x
      sta ObjectVXH,y
      lda TableYL,x
      sta ObjectVYL,y
      lda TableYH,x
      sta ObjectVYH,y
      pla
      tax

      lda #Enemy::LASER_BEAM*2
      sta ObjectF1,y
      lda #30
      sta ObjectTimer,y
  :

.if 0
  lda ObjectPXH,x
  jsr GetLevelColumnPtr ; prep LevelBlockPtr
  ldy ObjectPYH,x       ; prep Y index

  stx TempX
  lda ObjectF3,x
  cmp #2
  beq Down
  cmp #3
  beq Up
  rts

Down:
  lda (LevelBlockPtr),y
  iny
  tax
  lda MetatileFlags,x
  bpl Down

  ldx TempX
  rts

Up:
  lda (LevelBlockPtr),y
  dey
  tax
  lda MetatileFlags,x
  bpl Up

  ldx TempX
.endif
  rts

TableXL: .lobytes $80, -$80, 0, 0
TableXH: .hibytes $80, -$80, 0, 0
TableYL: .lobytes 0, 0, $80, -$80
TableYH: .hibytes 0, 0, $80, -$80
.endproc

.proc ObjectLaserBeam
  dec ObjectTimer,x
  beq Destroy

  lda ObjectPYH,x
  cmp #15
  bcs Destroy

  jsr EnemyCheckOverlappingOnSolid
  bcs HitSolid

  lda #OAM_COLOR_3
  sta 1
  lda #$54
  jsr DispObject8x8_Attr

  jsr SmallPlayerTouch
  bcc NoTouch
    jsr HurtPlayer
    lda ObjectVXL,x
    bne Horizontal
  Vertical:
    ; Now push the player away
    lda #<(-$80)
    sta PlayerVXL
    lda #>(-$80)
    sta PlayerVXH

    ; Compare player X to object X
    ; Still not completely flawless, but better than direction or X speed
    lda PlayerPXH
    cmp ObjectPXH,x
    bcc :+
    bne RightAnyway
    lda PlayerPXL
    cmp ObjectPXL,x
    bcc :+
RightAnyway:
      lda #<($80)
      sta PlayerVXL
      lda #>($80)
      sta PlayerVXH
    :
    jmp EnemyApplyVelocity
  Horizontal:
    ; not sure how to handle horizontal well yet
NoTouch:
  jmp EnemyApplyVelocity

HitSolid:
  ldy #7
: lda ReactWithTypes,y
  cmp 0 ; block type
  beq ArrowHit
  dey
  bpl :-
  ; drop into Destroy
Destroy:
  lda #0
  sta ObjectF1,x
  rts
ArrowHit:
  ; Change into an arrow and fly off
  lda #Enemy::FLYING_ARROW*2
  sta ObjectF1,x
  jmp ObjectFlyingArrow::ChangeTheDirection

ReactWithTypes:
  .byt Metatiles::METAL_ARROW_LEFT,  Metatiles::METAL_ARROW_DOWN
  .byt Metatiles::METAL_ARROW_UP,    Metatiles::METAL_ARROW_RIGHT
  .byt Metatiles::WOOD_ARROW_LEFT,   Metatiles::WOOD_ARROW_DOWN
  .byt Metatiles::WOOD_ARROW_UP,     Metatiles::WOOD_ARROW_RIGHT
.endproc
