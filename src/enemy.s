; Princess Engine
; Copyright (C) 2014-2016 NovaSquirrel
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

; Display
  lda #$60
  sta O_RAM::TILEBASE
  lda #<Metasprite
  ldy #>Metasprite
  jmp DispEnemyMetasprite

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

.proc ObjectFlyawayBalloon
DrawX = O_RAM::OBJ_DRAWX
DrawY = O_RAM::OBJ_DRAWY
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

  ; Apply velocity
  lda ObjectPYL,x
  add ObjectVYL,x
  sta ObjectPYL,x
  lda ObjectPYH,x
  adc ObjectVYH,x
  sta ObjectPYH,x

  ; Add velocity
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
  RealXPosToScreenPosByX ObjectPXL, ObjectPXH, DrawX
  RealYPosToScreenPosByX ObjectPYL, ObjectPYH, DrawY
  lda ObjectF2,x
  cmp #PoofSubtype::BRICKS
  jeq BrickPoof
  cmp #PoofSubtype::BALLOON
  jeq ObjectFlyawayBalloon
  cmp #PoofSubtype::FLOAT_TEXT
  jeq ObjectFloatingText

  lda #OAM_COLOR_1
  sta 1
  lda #$51
  sta 2
  jmp GenericPoof
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
  lda #$10
  jsr EnemyWalkOnPlatform
  lda retraces
  and #4
  add #$18
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
  jmp EnemyPlayerTouchHurt
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
  rts
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

        lda ObjectPXL,x
        add #$40
        sta ObjectPXL,y
        lda ObjectPXH,x
        adc #0
        sta ObjectPXH,y

        lda ObjectPYL,x
        add #$40
        sta ObjectPYL,y
        lda ObjectPYH,x
        adc #0
        sta ObjectPYH,y

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

.proc ObjectGlider
  rts
.endproc

.proc ObjectIce1
  rts
.endproc

.proc ObjectIce2
  rts
.endproc

.proc ObjectBallGuy
  jsr EnemyFall
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

  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump

  lda #4
  ldy #OAM_COLOR_2
  jsr DispEnemyWide

  jmp EnemyPlayerTouchHurt
.endproc

.proc ObjectThwomp
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

    ; Check for collision
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
  lda ObjectPXH,x
  sub PlayerPXH
  abs
  cmp #4
  bcs :+
    lda #ENEMY_STATE_ACTIVE
    sta ObjectF2,x
    lda ObjectVYH,x ; fix vertical velocity if it's negative
    bpl :+
      lda #0
      sta ObjectVYH,x
      sta ObjectVYL,x
  :

  lda #$a8
  ldy #OAM_COLOR_2
  jsr DispEnemyWide
  jmp EnemyPlayerTouchHurt
.endproc

; Hover the cannon and control logic relating to when to shoot
.proc ObjectCannonCommon1
  jsr EnemyHover

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
        sta $255
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
  jsr EnemyDespawnTimer
  lda ObjectF2,x
  bne :+
  jsr EnemyApplyVelocity
: ; Display the different burger varieties differently
  lda ObjectF3,x
  asl
  asl
  ora #$10
  ldy #OAM_COLOR_3
  jsr DispEnemyWide
  jmp GoombaSmoosh
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
  rts
.endproc

.proc ObjectRocket
  rts
.endproc

.proc ObjectRocketLauncher
  rts
.endproc

.proc ObjectFireworkShooter
  rts
.endproc

.proc ObjectTornado
  rts
.endproc

.proc ObjectElectricFan
  rts
.endproc

.proc ObjectCloud
  rts
.endproc

.proc ObjectBouncer
  rts
.endproc

.proc ObjectGremlin
  rts
.endproc

.proc ObjectBombGuy
  rts
.endproc

.proc ObjectRonald
  jsr EnemyFall

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
  jsr DispEnemyWide
  rts
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
  rts
.endproc

.proc ObjectSunKey
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
  ora O_RAM::TILEBASE
  ldy #OAM_COLOR_3
  jsr DispEnemyWide
  jmp EnemyPlayerTouchHurt
Direction: .byt <-1, 1
.endproc

.proc ObjectBossFight
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

NumRoutines = 1

RunBossRoutine:
  .raddr DABGFight
InitBossRoutine:
  .raddr DABGInit

DABGInit:
  lda #20
  sta LevelVariable
  rts
DABGFight:
  lda #Enemy::SCHEME_TEAM*2
  jsr CountObjectAmount
  rts

.endproc

.proc ObjectSchemeTeam
WALKER = 0
JUMPER = 1
DIAGONAL = 2
BOMBER = 3

HeadTile = 0
BodyTile = 1
; weapons = OR with $0c or $1c
ProjectileIndex = EnemyGetShotTest::ProjectileIndex
ProjectileType  = EnemyGetShotTest::ProjectileType

  ; Fall and move forward if not falling
  lda #$70
  sta EnemyRightEdge
  jsr EnemyFall
  bcc :+
  lda #$0e
  jsr EnemyWalk
: jsr EnemyAutoBump
  lda #$f0
  sta EnemyRightEdge

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
    bcc :+
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
  lda #8
  sta TouchWidthA
  asl
  sta TouchHeightA
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
    ora #4
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

BodyAnim:
  .byt $10, $11, $10, $12 ; walking
  .byt $14, $15, $14, $15 ; jumping
  .byt $13, $13, $13, $13 ; flying
.endproc

.proc ObjectFlyingArrow
  jsr EnemyDespawnTimer
  jsr EnemyApplyVelocity
  jsr EnemyYLimit

  jsr EnemyCheckOverlappingOnSolid
  bcc ArrowDidntHit
  ldy #11
: lda ReactWithTypes,y
  cmp 0
  beq ArrowHit
  dey
  bpl :-
ArrowDidntHit:

  ; Face left if going left
  lda ObjectF1,x
  and #<~1  
  sta ObjectF1,x
  lda ObjectVXL,x
  bpl :+
  inc ObjectF1,x
:

; Draw the arrow
  lda ObjectVYL,x ; No vertical movement? Display a horizontal arrow
  beq Horizontal
  lda ObjectVYH,x ; Check if moving up or moving down
  bmi Up          ; Negative = moving up
  lda #4
  bne Skip
Horizontal:
  lda #0
Skip:
  ldy #OAM_COLOR_3
  jmp DispEnemyWide
Up:
  ldy #4
  lda #%1101
  jmp DispEnemyWideFlipped

ArrowHit:
  cpy #8
  bcs WasNotArrow

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

  tya
  and #3
  tay
  jsr ArrowChangeDirection
  jmp WasArrow
WasNotArrow:
  lda #SFX::SMASH
  jsr PlaySound

  lda #0
  sta ObjectF1,x
WasArrow:
  lda #0
  ldy 1
  jmp ChangeBlockFar

ReactWithTypes:
  .byt Metatiles::METAL_ARROW_LEFT,  Metatiles::METAL_ARROW_DOWN
  .byt Metatiles::METAL_ARROW_UP,    Metatiles::METAL_ARROW_RIGHT
  .byt Metatiles::WOOD_ARROW_LEFT,   Metatiles::WOOD_ARROW_DOWN
  .byt Metatiles::WOOD_ARROW_UP,     Metatiles::WOOD_ARROW_RIGHT
  .byt Metatiles::METAL_BOMB,        Metatiles::METAL_CRATE
  .byt Metatiles::WOOD_BOMB,         Metatiles::WOOD_CRATE
.endproc

.proc ObjectFallingBomb
  jsr EnemyApplyVelocity
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

.proc ObjectBoulder
  jsr EnemyFall

  lda #12
  ldy #OAM_COLOR_2
  jmp DispEnemyWide
.endproc

