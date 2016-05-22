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

; local variables common to lots of different enemy routines
.scope O_RAM
  OBJ_DRAWX = 6  ; X position the enemy is drawn at
  OBJ_DRAWY = 7  ; Y position the enemy is drawn at
  OBJ_FLAG  = 8  ; bit field for common behaviors to trigger for the enemy
  OBJ_TYPE  = 9  ; enemy type
  TILEBASE  = 10 ; base tile for the enemy's sprites
  ON_SCREEN = 11 ; nonzero if the enemy is currently on the screen
.endscope

; ObjectF2 usually holds an enemy state number
ENEMY_STATE_BITS    = %1111
ENEMY_STATE_NORMAL  = 0
ENEMY_STATE_PAUSE   = 1
ENEMY_STATE_STUNNED = 2
ENEMY_STATE_ACTIVE  = 3
ENEMY_STATE_INIT    = 4

; common object behaviors that get put in ORAM::OBJ_FLAG
.enum ObjBehavior
  AUTO_REMOVE     = $1
  GET_SHOT        = $2
  AUTO_RESET      = $4
  WAIT_UNTIL_NEAR = $8
.endenum

; run the list of sprites
.proc RunObjects
  ldx #0
Loop:
  ; launch sprite number X
  jsr Launch

  ; do extra behaviors if the sprite slot wasn't empty
  lda O_RAM::OBJ_TYPE
  beq SkipEmpty
  lsr O_RAM::OBJ_FLAG
  bcc :+
    jsr EnemyAutoRemove
  :
  lsr O_RAM::OBJ_FLAG
  bcc :+
    jsr EnemyGetShot
  :
  lsr O_RAM::OBJ_FLAG ; auto reset state when the timer reaches zero
  bcc :+
    lda ObjectTimer,x
    beq :+
    dec ObjectTimer,x
    bne :+
    lda #0
    sta ObjectF2,x
  :
  lsr O_RAM::OBJ_FLAG ; wait until near to activate
  bcc :+
    jsr EnemyActivateIfNear
  :
  ; If an object is in an init state, reset it
  lda ObjectF2,x
  cmp #ENEMY_STATE_INIT
  bne :+
    lda #0
    sta ObjectF2,x
  :
SkipEmpty:

  ; try the next sprite
  inx
  cpx #ObjectLen
  beq Exit
  jmp Loop

Launch:
  lda ObjectF1,x
  and #%11111110
  beq Exit ; don't launch if the slot is empty
  tay ; push the address first
  lsr
  sta O_RAM::OBJ_TYPE
  ; push the return address we'll use
  lda ObjectTable+1,y
  pha
  lda ObjectTable+0,y
  pha

  ; load in parameters specific to that sprite type
  ldy O_RAM::OBJ_TYPE
  lda ObjBehaviors,y
  sta O_RAM::OBJ_FLAG
  lda ObjGraphics1,y
  sta 0
  lda ObjGraphics2,y
  ldy 0
  jsr DetectSpriteSlot2
  sta O_RAM::TILEBASE
Exit:
  rts
.endproc

; pointers to all the enemy routines
.proc ObjectTable
  .raddr ObjectNone
  .raddr ObjectGoomba
  .raddr ObjectSneaker
  .raddr ObjectSpinner
  .raddr ObjectOwl
  .raddr ObjectKing
  .raddr ObjectToastBot
  .raddr ObjectBall
  .raddr ObjectPotion
  .raddr ObjectGeorge
  .raddr ObjectBigGeorge
  .raddr ObjectAlan
  .raddr ObjectGlider
  .raddr ObjectIce1
  .raddr ObjectIce2
  .raddr ObjectBallGuy
  .raddr ObjectThwomp
  .raddr ObjectCannon1
  .raddr ObjectCannon2
  .raddr ObjectBurger
  .raddr ObjectFireWalk
  .raddr ObjectFireJump
  .raddr ObjectMine
  .raddr ObjectRocket
  .raddr ObjectRocketLauncher
  .raddr ObjectFireworkShooter
  .raddr ObjectTornado
  .raddr ObjectElectricFan
  .raddr ObjectCloud
  .raddr ObjectBouncer
  .raddr ObjectGremlin
  .raddr ObjectBombGuy
  .raddr ObjectPoof
  .raddr ObjectPlayerProjectile
  .raddr ObjectBlasterShot
  .raddr ObjectSmallGlider
  .raddr ObjectBoomerang
  .raddr ObjectFireball
  .raddr ObjectFlames
  .raddr ObjectWaterBottle
  .raddr ObjectIceBlock
  .raddr ObjectRonald
  .raddr ObjectRonaldBurger
  .raddr ObjectFries
  .raddr ObjectFry
  .raddr ObjectSun
  .raddr ObjectSunKey
.endproc

; other enemy attributes
.include "../tools/objectlist.s"

ObjectNone = DoNothing

; If an object is initializing, change it to the paused state
; and hold it in the paused state until the player is near
.proc EnemyActivateIfNear
  ; If already activated, just exit
  lda ObjectF2,x
  beq Exit
  cmp #ENEMY_STATE_STUNNED
  beq Exit
  ; If it's initializing, automatically start pausing
  cmp #ENEMY_STATE_INIT
  bne :+ ; change it to paused
    lda #ENEMY_STATE_PAUSE
    sta ObjectF2,x
  :

  ; Stop pausing if close enough
  lda PlayerPXH
  sub ObjectPXH,x
  abs
  cmp #7
  bcs Exit

Yes: ; Change to normal state
  lda #ENEMY_STATE_NORMAL
  sta ObjectF2,x
Exit:
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
  cmp #1
  jeq BrickPoof
  cmp #2
  jeq ObjectFlyawayBalloon

  lda #OAM_COLOR_1
  sta 1
  lda #$51
  sta 2
  jmp GenericPoof
.endproc

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
  lda ObjectF2,x
  cmp #ENEMY_STATE_STUNNED
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

.proc EnemyGetShot
  jsr EnemyGetShotTest
  bcc :+
  jsr EnemyGotShot
: rts
.endproc

.proc EnemyGetShotTest
CenterX = TempVal+0
CenterY = TempVal+1
ProjectileIndex = TempVal+2
ProjectileType  = 0
  ; Skip offscreen enemies
  lda O_RAM::ON_SCREEN
  bne :+
  clc
  rts
:

  ; Move the X and Y to the centers
  lda O_RAM::OBJ_DRAWX
  add #8-1
  sta TouchLeftA
  lda O_RAM::OBJ_DRAWY
  add #8-1
  sta TouchTopA

  ; Set collision size
  lda #16+2
  sta TouchWidthA
  sta TouchHeightA

  ldy #0
Loop:
  sty ProjectileIndex

  ; Only check for player projectiles
  lda ObjectF1,y
  lsr
  cmp #Enemy::PLAYER_PROJECTILE
  jne Nope

  ; Skip if too far away horizontally
  lda ObjectPXH,x
  sub ObjectPXH,y
  abs
  cmp #2
  bcs Nope

  ; Skip if too far away vertically
  lda ObjectPYH,x
  sub ObjectPYH,y
  abs
  cmp #3
  bcs Nope

  RealXPosToScreenPosByY ObjectPXL, ObjectPXH, TouchLeftB
  RealYPosToScreenPosByY ObjectPYL, ObjectPYH, TouchTopB

  ; ChkTouchGeneric wants the center of each object, so add width and height divided by 2
  lda ObjectF2,y
  tay
  sta ProjectileType
  lda PlayerProjectileSizeTable,y
  sta TouchWidthB
  sta TouchHeightB
  lda TouchLeftB
  sta TouchLeftB
  lda TouchTopB
  sta TouchTopB
  jsr ChkTouchGeneric
  bcc Nope
  sec
  rts
Nope: 
  ldy ProjectileIndex
  ; Try the next one
  iny
  cpy #ObjectLen
  jne Loop
  clc
  rts
.endproc

.proc EnemyGotShot
ProjectileIndex = TempVal+2
ProjectileType  = 0
  ldy ProjectileType
  lda PlayerProjectileActionTable,y
  asl    ; most significant bit = remove projectile
  bcc NoRemove
    cpy #PlayerProjectileType::STUN_STAR ; if not stun, OK
    bne RemoveOK
    ldy ObjectF2,x
    cpy #ENEMY_STATE_STUNNED
    beq NoRemove
RemoveOK:
    ldy ProjectileIndex
    pha
    lda #0
    sta ObjectF1,y
    pla
NoRemove:
  tay
  lda Responses+1,y
  pha
  lda Responses+0,y
  pha
  rts
Responses:
  .raddr Nothing
  .raddr Bump
  .raddr Stun
  .raddr Damage
  .raddr BlowAway
  .raddr Copy
Bump:
  ldy ProjectileIndex
  lda ObjectVXL,y ; no bump if object isn't moving
  ora ObjectVYL,y
  beq Nothing

  lda #SFX::BUMP
  jsr PlaySoundDebounce
  lda #>-1
  sta ObjectVYH,x
  lda #<-$30
  sta ObjectVYL,x
  lda ObjectF1,x
  eor #1
  sta ObjectF1,x
  lda #ENEMY_STATE_STUNNED
  sta ObjectF2,x
  lda #90
  sta ObjectTimer,x

;  jsr huge_rand
;  asr
;  asr
;  sta ObjectVXL,x
;  sex
;  sta ObjectVXH,x
Nothing:
  rts
Stun:
  lda #ENEMY_STATE_STUNNED
  sta ObjectF2,x
  lda #180
  sta ObjectTimer,x
  rts
Damage:
  lda #SFX::ENEMY_HURT
  jsr PlaySoundDebounce
  lda #Enemy::POOF * 2
  sta ObjectF1,x
  lda #0
  sta ObjectTimer,x
  sta ObjectF2,x
  rts
BlowAway:
  rts
Copy:
  ; maybe change it so they have to be stunned?
  ldy #0
  lda ObjectF1,x
  lsr
  sta 0
: lda EnemyAbilityTable,y
  beq @End
  cmp 0
  bne @Nope
  lda EnemyAbilityTable+1,y
  ora #128
  sta NeedAbilityChange
  rts
@Nope:
  iny
  iny
  bne :-
@End:
  rts
EnemyAbilityTable:
  .byt Enemy::BALL,             AbilityType::BALL
  .byt Enemy::GEORGE,           AbilityType::WATER
  .byt Enemy::BIG_GEORGE,       AbilityType::WATER
  .byt Enemy::GLIDER,           AbilityType::GLIDER
  .byt Enemy::ICE_1,            AbilityType::NICE
  .byt Enemy::ICE_2,            AbilityType::NICE
  .byt Enemy::BURGER,           AbilityType::BURGER
  .byt Enemy::FIRE_WALK,        AbilityType::FIRE
  .byt Enemy::FIRE_JUMP,        AbilityType::FIRE
  .byt Enemy::FLAMES,           AbilityType::FIRE
  .byt Enemy::ROCKET,           AbilityType::FIREWORK
  .byt Enemy::ROCKET_LAUNCHER,  AbilityType::FIREWORK
  .byt Enemy::FIREWORK_SHOOTER, AbilityType::FIREWORK
  .byt Enemy::TORNADO,          AbilityType::FAN
  .byt Enemy::ELECTRIC_FAN,     AbilityType::FAN
  .byt Enemy::CLOUD,            AbilityType::FAN
  .byt Enemy::BOUNCER,          AbilityType::BLASTER
  .byt Enemy::GREMLIN,          AbilityType::BLASTER
  .byt Enemy::BOMB_GUY,         AbilityType::BOMB
  .byt Enemy::RONALD,           AbilityType::BURGER
  .byt Enemy::SUN,              AbilityType::FIRE
  .byt Enemy::BALL_GUY,         AbilityType::BALL
  .byt 0
.endproc

; Copies the position from object X to object Y
; (also initializes state in object Y to zero)
.proc ObjectCopyPosXY
  lda #0
  sta ObjectF2,y

  lda ObjectPXH,x
  sta ObjectPXH,y

  lda ObjectPXL,x
  sta ObjectPXL,y

  lda ObjectPYH,x
  sta ObjectPYH,y

  lda ObjectPYL,x
  sta ObjectPYL,y
  rts
.endproc

.proc EnemyTurnAround
  lda ObjectF1,x
  beq No
  eor #1
  sta ObjectF1,x
No:
  rts
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

; Counts the amount of a certain object that currently exists
; inputs: A (object type)
; outputs: Y (count)
; locals: 0
.proc CountObjectAmount
  stx TempX
  sta 0  ; 0 = object num
  ldx #0
  ldy #0 ; Y = counter for number of matching objects
: lda ObjectF1,x
  and #<~1
  cmp 0
  bne :+
  iny ; yes, this is the object
: inx
  cpx #ObjectLen
  bne :--
  ldx TempX
  rts
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

.proc EnemyLookAtPlayer
  lda ObjectPXH,x
  cmp PlayerPXH
  lda ObjectF1,x
  and #<~1
  adc #0
  sta ObjectF1,x
  rts
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

.proc AimAtPlayer
  lda O_RAM::OBJ_DRAWX
  sta 0
  lda O_RAM::OBJ_DRAWY
  sta 1
  lda PlayerDrawX
  sta 2
  lda PlayerDrawY
  sta 3
  jsr getAngle
  tay
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
  rts
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


.proc EnemyHover
  ldy ObjectTimer,x

  lda Wavy,y
  sex
  sta 0
  lda ObjectPYL,x
  add Wavy,y
  sta ObjectPYL,x
  lda ObjectPYH,x
  adc 0
  sta ObjectPYH,x

  inc ObjectTimer,x
  lda ObjectTimer,x
  and #63
  sta ObjectTimer,x
  rts
Wavy:
  .byt 0, 0, 1, 2, 3, 3, 4
  .byt 5, 5, 6, 6, 7, 7, 7
  .byt 7, 7, 7, 7, 7, 7, 7
  .byt 6, 6, 5, 5, 4, 3, 3
  .byt 2, 1, 0, 0

  .byt <-0, <-0, <-1, <-2, <-3, <-3, <-4
  .byt <-5, <-5, <-6, <-6, <-7, <-7, <-7
  .byt <-7, <-7, <-7, <-7, <-7, <-7, <-7
  .byt <-6, <-6, <-5, <-5, <-4, <-3, <-3
  .byt <-2, <-1, <-0, <-0
.endproc

.proc ObjectCannon1
  jsr EnemyHover

  ; Get speeds for projectiles
  lda ObjectF1,x
  and #1
  tay
  lda HSpeedL,y
  sta 0
  lda HSpeedH,y
  sta 1

  lda retraces
  and #7
  bne NoShoot
    jsr huge_rand
    and #7
    bne NoShoot
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
  rts
CannonFrame:
  .byt $0c, $0c, $0d, $0d, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP
HSpeedL:
  .byt <$38, <-$38
HSpeedH:
  .byt >$38, >-$38
.endproc

.proc ObjectCannon2
  jsr EnemyHover
  ; Get speeds for projectiles
  lda ObjectF1,x
  and #1
  tay
  lda HSpeedL,y
  sta 2
  lda HSpeedH,y
  sta 3

  ; Get projectile type
  ldy ObjectPXH,x
  lda ColumnBytes,y
  asl
  sta 1

  lda retraces
  and #7
  bne NoShoot
    ; Limit object amount
    lda 1
    jsr CountObjectAmount
    iny
    tya
    cmp ObjectF3,x
    bcs NoShoot
    jsr huge_rand
    and #7
    bne NoShoot
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
  rts
CannonFrame:
  .byt $0e, $0e, $0f, $0f, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP, OAM_COLOR_2, OAM_COLOR_2|OAM_YFLIP
HSpeedL:
  .byt <$38, <-$38
HSpeedH:
  .byt >$38, >-$38
.endproc

.proc ObjectBurger
  jsr EnemyDespawnTimer
  jsr EnemyApplyVelocity
  ; Display the different burger varieties differently
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

      jsr FindFreeObjectY
      bcc :+
        jsr ObjectClearY
        jsr ObjectCopyPosXY

        lda #Enemy::FLAMES*2
        sta ObjectF1,y
        lda #10
        sta ObjectTimer,y
  :
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

.proc EnemySpeedLimit
  ; Limit speed
  ; Maybe I can make this smaller?
  php
  lda ObjectVXH,x
  sta TouchTemp
  ; Flip to positive if needed
  bpl :+
    neg16x ObjectVXL, ObjectVXH
: lda ObjectVXH,x
  bne TooBig
  lda ObjectVXL,x
  cmp #$30
  bcc :+
TooBig:
    lda #$30
    sta ObjectVXL,x
    lda #0
    sta ObjectVXH,x
  :

  ; Flip back to negative if it was negative
  lda TouchTemp
  bpl :+
    neg16x ObjectVXL, ObjectVXH
: plp
  rts
.endproc

.proc LakituMovement
  jsr EnemyApplyVelocity

  ; Stop if stunned
  lda ObjectF2,x
  beq :+
    lda #0
    sta ObjectVXL,x
    sta ObjectVXH,x
  :

  ; Change direction to face the player
  jsr EnemyLookAtPlayer
  and #1
  tay

  ; Only speed up if not around player
  lda ObjectPXH,x
  sub PlayerPXH
  abs
  cmp #3
  bcc :+
  lda SpeedL,y
  add ObjectVXL,x
  sta ObjectVXL,x
  lda SpeedH,y
  adc ObjectVXH,x
  sta ObjectVXH,x
  jsr EnemySpeedLimit
:
  rts
SpeedL:
  .byt <$04, <-$04
SpeedH:
  .byt >$04, >-$04
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

; ------------------------------------------------------------------------------------------------
; adds the object's X and Y speeds to its X and Y positions
; input: X (object slot)
.proc EnemyApplyVelocity
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

; Walks forward, and turns around if walking farther
; would cause the object to fall off the edge of a platform
; input: A (walk speed), X (object slot)
.proc EnemyWalkOnPlatform
  jsr EnemyWalk
  jsr EnemyAutoBump

  lda ObjectPYH,x
  add #1
  tay
  lda ObjectPXL,x
  add #$80
  lda ObjectPXH,x
  adc #0
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  cmp #M_SOLID_TOP
  bcs :+
    jsr EnemyTurnAround
  :
  rts
.endproc

; hurts the player if they're touching the 8x8 enemy
; input: X (object slot)
.proc SmallEnemyPlayerTouchHurt
  lda ObjectF2,x
  and #ENEMY_STATE_BITS
  cmp #ENEMY_STATE_STUNNED
  beq :+
  jsr SmallPlayerTouch
  bcc :+
  jsr HurtPlayer
: rts
.endproc

; hurts the player if they're touching the enemy
; input: X (object slot)
.proc EnemyPlayerTouchHurt
  lda ObjectF2,x
  and #ENEMY_STATE_BITS
  cmp #ENEMY_STATE_STUNNED
  beq :+
  jsr EnemyPlayerTouch
  bcc :+
  jsr HurtPlayer
: rts
.endproc

; Checks if the player is touching the enemy
; input: X (object slot)
; output: carry (touching enemy)
.proc EnemyPlayerTouch ; assumes 16x16 enemies and 8x24 player
  lda #8
  sta TouchWidthB
  asl
  sta TouchWidthA
  sta TouchHeightA
  lda #24
  sta TouchHeightB
AfterHeightWidth:
;  ; enemies off the screen aren't touching the player!
;  lda O_RAM::ON_SCREEN
;  bne :+
;  clc
;  rts
;:
  ; Skips collisions if too far away horizontally or vertically.
  ; Saves some CPU. Used to be necessary because the old collision
  ; detection routine had overflow problems.

  ; Skip if too far away horizontally
  lda ObjectPXH,x
  sub PlayerPXH
  abs
  cmp #2
  bcc :+
  clc
  rts
:
  ; Skip if too far away vertically
  lda ObjectPYH,x
  sub PlayerPYH
  abs
  cmp #3
  bcc :+
  clc
  rts
:

  ; Now to actually call the collision detection routine!
  lda O_RAM::OBJ_DRAWX
  sta TouchLeftA
  lda O_RAM::OBJ_DRAWY
  sta TouchTopA
  lda PlayerDrawX
  sta TouchLeftB
  lda PlayerDrawY
  sta TouchTopB
  jmp ChkTouchGeneric
.endproc

; Checks if the player is touching the enemy projectile
; input: X (object slot)
; output: carry (touching enemy)
.proc SmallPlayerTouch ; assumes 8x8 enemies and 8x24 player
  lda #8
  sta TouchWidthA
  sta TouchHeightA
  sta TouchWidthB
  lda #24
  sta TouchHeightB
  jmp EnemyPlayerTouch::AfterHeightWidth
.endproc

; Makes the enemy walk forward and checks for collision
; input: A (walking distance), X (object slot)
; output: carry (bumped into something), 0 (block that was bumped into)
.proc EnemyWalk ; assumes 16x16 enemies
WalkDistance = 0
NewXL = 1
NewXH = 2
  sta WalkDistance

  lda ObjectF2,x
  and #ENEMY_STATE_BITS
  ; Change this when I have nonzero states that still involve walking
  beq Yes
  clc
  rts
Yes:

  ldy ObjectPYH,x

  lda ObjectF1,x ; negate speed if facing left
  lsr
  bcc FacingRight
FacingLeft:
  lda ObjectPXL,x ; calculate new position
  sub WalkDistance
  sta NewXL
  lda ObjectPXH,x
  sbc #0
  sta NewXH
  jmp NotFacingRight
FacingRight:
  lda ObjectPXL,x ; calculate new position
  add WalkDistance
  sta NewXL
  lda ObjectPXH,x
  adc #0
  sta NewXH
  lda NewXL ; check at the object's right edge instead
  add #$f0
  lda NewXH
  adc #0
NotFacingRight:
  jsr GetLevelColumnPtr

; check if the object bumped into a wall
  tay
  lda MetatileFlags,y
  and #M_SOLID_ALL
  beq :+
    sty 0 ; 0 = block type we bumped into
    sec
    rts
  :

  lda NewXL
  sta ObjectPXL,x
  lda NewXH
  sta ObjectPXH,x

  clc
  rts
.endproc

; Increases enemy gravity and applies it
; input: X (object slot)
.proc EnemyGravity
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
  lda ObjectPYL,x
  add ObjectVYL,x
  sta ObjectPYL,x
  lda ObjectPYH,x
  adc ObjectVYH,x
  sta ObjectPYH,x
  rts
.endproc

.proc EnemyDecTimer
  lda ObjectTimer,x
  beq :+
    dec ObjectTimer,x
    bne :+
      lda #ENEMY_STATE_NORMAL
      sta ObjectF2,x
: rts
.endproc

; Calls EnemyGravity and then fixes things if they land on a solid block
; Assumes 16x16 object
; input: X (object slot)
; output: carry (standing on platform)
.proc EnemyFall
  jsr EnemyGravity

  ; Remove enemy if it falls too far off the bottom
  lda ObjectPYH,x
  bmi :+
    cmp #15
    bcc :+
      lda #0
      sta ObjectF1,x
      pla
      pla
      rts
  :

  jsr EnemyCheckStandingOnSolid
  beq :+ ; no touching solid
    lda #0
    sta ObjectPYL,x
    sta ObjectVYH,x
    sta ObjectVYL,x
    sec
    rts
: clc
  rts
.endproc

; Calls EnemyGravity and then fixes things if they land on a solid block
; Assumes 8x8 object
; input: X (object slot)
; output: carry (standing on platform)
.proc ObjectFallSmall
  jsr EnemyGravity

  ; Automatically remove if too far off the bottom
  lda ObjectPYH,x
  bmi :+
    cmp #17
    bcc :+
      lda #0
      sta ObjectF1,x
      pla
      pla
      rts
  :
  ; If going upwards, check on top
  lda ObjectVYH,x
  bpl NotUp
  lda ObjectPXL,x
  add #$40
  lda ObjectPXH,x
  adc #0
  ldy ObjectPYH,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  bpl :+
  lda #0
  sta ObjectVYH,x
  lda #$10
  sta ObjectVYL,x
: clc
  rts
NotUp:
  lda ObjectPYL,x
  add #$80
  lda ObjectPYH,x
  adc #0
  tay
  lda ObjectPXH,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  cmp #M_SOLID_TOP
  bcc :+ ; no touching solid
YesSolid:
    lda #$80
    sta ObjectPYL,x
    lda #0
    sta ObjectVYH,x
    sta ObjectVYL,x
    sec
    rts
: clc
  rts
.endproc

; Checks if an object is on top of a solid block
; input: X (object slot)
; output: Zero flag (not zero if on top of a solid block)
.proc EnemyCheckStandingOnSolid
  lda #0
  sta 0
  lda ObjectVYH,x
  bpl :+
  lda #0
  rts
:

  lda ObjectPYH,x ; get left side
  add #1
  pha
  tay
  lda ObjectPXH,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  cmp #M_SOLID_TOP
  rol 0

  pla ; get right side
  tay ; reuse same Y
  lda ObjectPXL,x
  add #$f0
  lda ObjectPXH,x
  adc #0
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  cmp #M_SOLID_TOP
  rol 0
  lda 0
  rts
.endproc

; Automatically makes an enemy turn around if they bump into something
; or climbs over climbable ledges
; input: carry (if not set, won't bump into something), 0 (block that was bumped into)
.proc EnemyAutoBump
  bcc NoBump
  ; react to thing we're bumping into
  lda 0
  cmp #Metatiles::GROUND_CLIMB_L
  beq TryClimb
  cmp #Metatiles::GROUND_CLIMB_R
  beq TryClimb
; bump!
  jmp EnemyTurnAround
TryClimb:
    lda #255
    sta ObjectVYH,x
    lda #<-$30
    sta ObjectVYL,x

    lda ObjectF1,x
    and #1
    tay
    lda ObjectPXL,x
    add OffsetAmountL,y
    sta ObjectPXL,x
    lda ObjectPXH,x
    adc OffsetAmountH,y
    sta ObjectPXH,x
    rts
NoBump:
  rts
OffsetAmountL:
  .byt <($20), <(-$20)
OffsetAmountH:
  .byt >($20), >(-$20)
.endproc

; Automatically removes an enemy if they're too far away from the camera
.proc EnemyAutoRemove
  lda ObjectPXH,x
  sub ScrollX+1
  cmp #<-8
  bcs Good
  cmp #24
  bcc Good
  lda #0
  sta ObjectF1,x
Good:
  rts  
.endproc

; Randomly swaps two object slots, because the NES can only display 8 sprites per scanline
; and any past that aren't drawn. This way sprites are don't just drop out of visibility.
.proc FlickerEnemies
  lda retraces
  and #7
  tax
  jsr huge_rand
  and #7
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

; Clears out an object slot
; input: X (object slot)
.proc ObjectClearX
  lda #255
  sta ObjectIndexInLevel,x
  lda #0
  sta ObjectF2,x
  sta ObjectF3,x
  sta ObjectF4,x
  sta ObjectVXH,x
  sta ObjectVXL,x
  sta ObjectVYH,x
  sta ObjectVYL,x
  rts
.endproc

; Clears out an object slot
; input: Y (object slot)
.proc ObjectClearY
  lda #255
  sta ObjectIndexInLevel,y
  lda #0
  sta ObjectF2,y
  sta ObjectF3,y
  sta ObjectF4,y
  sta ObjectVXH,y
  sta ObjectVXL,y
  sta ObjectVYH,y
  sta ObjectVYL,y
  sta ObjectTimer,y
  rts
.endproc

; Draws an 8x8 sprite
; input: X (object slot), A (object tile)
DispObject8x8:
  pha
  lda #OAM_COLOR_1
  sta 1
  pla

; Draws an 8x8 sprite
; input: X (object slot), A (object tile), 1 (sprite palette), 2 (X offset), 3 (Y offset)
.proc DispObject8x8_Attr
DrawX = O_RAM::OBJ_DRAWX
DrawY = O_RAM::OBJ_DRAWY

  sta 0

  lda #0
  sta 2
  sta 3
  sta O_RAM::ON_SCREEN
WithXYOffset:

  lda ObjectPXL,x
  sub ScrollX+0
  sta DrawX
  lda ObjectPXH,x
  sbc ScrollX+1
  rtscc
  cmp #16
  rtscs
  .repeat 4
    lsr
    ror DrawX
  .endrep
  lda DrawX
  cmp #$f8
  rtscs
  lda ObjectPYH,x
  cmp #15
  rtscs
  inc O_RAM::ON_SCREEN

  RealYPosToScreenPosByX ObjectPYL, ObjectPYH, DrawY
  ldy OamPtr
  lda DrawX
  add 2
  sta OAM_XPOS,y
  lda DrawY
  add 3
  sta OAM_YPOS,y
  lda 1 ; defaults to OAM_COLOR_1
  sta OAM_ATTR,y
  lda 0
  sta OAM_TILE,y
  iny
  iny
  iny
  iny
  sty OamPtr
  rts
.endproc
.proc DispObject8x8_XYOffset
  sta 0
  lda #0
  sta O_RAM::ON_SCREEN
  beq DispObject8x8_Attr::WithXYOffset
.endproc

; Decrements an enemy's timer and remove the object when it runs out
; input: X (object slot)
.proc EnemyDespawnTimer
  lda retraces
  and #3
  bne :+
  dec ObjectTimer,x
  bne :+
  lda #0
  sta ObjectF1,x
: rts
.endproc

.proc EnemyPosToVel
  lda ObjectPXL,x
  sta ObjectVXL,x
  lda ObjectPXH,x
  sta ObjectVXH,x
  lda ObjectPYL,x
  sta ObjectVYL,x
  lda ObjectPYH,x
  sta ObjectVYH,x
  rts
.endproc

.proc CloneObjectX
  sty TempY
  jsr FindFreeObjectY
  bcc :+
  jsr ObjectCopyPosXY
  lda ObjectTimer,x
  sta ObjectTimer,y
  lda ObjectF1,x
  sta ObjectF1,y
  lda ObjectF2,x
  sta ObjectF2,y
  lda #0
  sta ObjectF3,y
  lda ObjectVXL,x
  sta ObjectVXL,y
  lda ObjectVXH,x
  sta ObjectVXH,y
  lda ObjectVYL,x
  sta ObjectVYL,y
  lda ObjectVYH,x
  sta ObjectVYH,y
: ldy TempY
  rts
.endproc
