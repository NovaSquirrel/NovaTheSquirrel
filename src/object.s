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
ENEMY_STATE_NORMAL  = 0
ENEMY_STATE_PAUSE   = 128|1
ENEMY_STATE_STUNNED = 128|2
ENEMY_STATE_ACTIVE  = 128|3
ENEMY_STATE_INIT    = 128|4

; common object behaviors that get put in ORAM::OBJ_FLAG
.enum ObjBehavior
  AUTO_REMOVE     = $1
  GET_SHOT        = $2
  AUTO_RESET      = $4
  WAIT_UNTIL_NEAR = $8
.endenum

; object flags
.enum ObjFlag
  SECONDARY     = 0
  PRIMARY       = 1
  ESSENTIAL     = 2
  PRIORITY_BITS = 3
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
  lda ObjGraphics,y
  jsr DetectSpriteSlot
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
  .raddr ObjectMovingPlatformH
  .raddr ObjectMovingPlatformLine
  .raddr ObjectFirebar
  .raddr ObjectBossFight
  .raddr ObjectSchemeTeam
  .raddr ObjectFlyingArrow
  .raddr ObjectFallingBomb
  .raddr ObjectBoulder
  .raddr ObjectCheckpoint
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

; Check for a collision with a player projectile
; and run the default handler for it
.proc EnemyGetShot
  jsr EnemyGetShotTest
  bcc :+
  jsr EnemyGotShot
: rts
.endproc

; Check for collision with a player projectile
; and stores the projectile type and index if found
; outputs: carry (success), TempVal+2 (index), 0 (type)
.proc EnemyGetShotTest
ProjectileIndex = TempVal+2
ProjectileType  = 0
  ; Set collision size
  lda #16
  sta TouchWidthA
  sta TouchHeightA
CustomSize:

  ; Skip offscreen enemies
  lda O_RAM::ON_SCREEN
  bne :+
  clc
  rts
:

  ; Copy the position
  lda O_RAM::OBJ_DRAWX
  sta TouchLeftA
  lda O_RAM::OBJ_DRAWY
  sta TouchTopA

  ldy #ObjectLen-1
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
  dey
  jpl Loop
  clc
  rts
.endproc
EnemyGetShotTestCustomSize = EnemyGetShotTest::CustomSize

; A handler for EnemyGetShotTest+
.proc EnemyGotShot
ProjectileIndex = EnemyGetShotTest::ProjectileIndex
ProjectileType  = EnemyGetShotTest::ProjectileType
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
  lda #0
  sta ObjectVYL,x
  sta ObjectVYH,x
  ldy ProjectileIndex
  lda ObjectPXL,y
  sta ObjectPXL,x
  lda ObjectPXH,y
  sta ObjectPXH,x
  lda ObjectPYL,y
  sta ObjectPYL,x
  lda ObjectPYH,y
  sta ObjectPYH,x
  ; Destroy if too far off top
  cmp #255
  bne :+
  lda #0
  sta ObjectF1,x
:
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

; Counts the amount of a certain object that currently exists
; inputs: A (object type * 2)
; outputs: Y (count)
; locals: 0
.proc CountObjectAmount
  stx TempX
  sta 0  ; 0 = object num
  ldx #ObjectLen-1
  ldy #0 ; Y = counter for number of matching objects
: lda ObjectF1,x
  and #<~1
  cmp 0
  bne :+
  iny ; yes, this is the object
: dex
  bpl :--
  ldx TempX
  rts
.endproc

; Changes object X's direction to face the player
.proc EnemyLookAtPlayer
  lda ObjectPXH,x
  cmp PlayerPXH
  lda ObjectF1,x
  and #<~1
  adc #0
  sta ObjectF1,x
  rts
.endproc

; Finds the angle between the object's screen position and the player's
; outputs: A and Y (Direction)
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

; Causes the object to hover in place
.proc EnemyHover
  ldy ObjectF4,x

  lda Wavy,y
  sex
  sta 0
  lda ObjectPYL,x
  add Wavy,y
  sta ObjectPYL,x
  lda ObjectPYH,x
  adc 0
  sta ObjectPYH,x

  inc ObjectF4,x
  lda ObjectF4,x
  and #63
  sta ObjectF4,x
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

; Clamps down horizontal enemy speed to 3 px/frame
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

; Causes the enemy to move back and forth horizontally,
; seeking the player
.proc LakituMovement
  jsr EnemyApplyVelocity

  ; Stop if stunned
  lda ObjectF2,x
  beq :+
    lda #0
    sta ObjectVXL,x
    sta ObjectVXH,x
  :

  lda #0 ; the "bounce" effect gives vertical velocity, so don't let it
  sta ObjectVYL,x
  sta ObjectVYH,x

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

; Check for collision with a rideable 16x16 thing
.proc CollideRide16
  ; Check for collision with player
  lda PlayerVYH
  bmi _rts
  lda ObjectPXH,x
  sub PlayerPXH
  abs
  cmp #3
  bcc :+
_rts:
  pla
  pla
  rts
: lda #8
  sta TouchWidthB
  sta TouchHeightA
  lda #6
  sta TouchHeightB
  lda #16
  sta TouchWidthA
  lda O_RAM::OBJ_DRAWX
  sta TouchLeftA
  lda O_RAM::OBJ_DRAWY
  sta TouchTopA
  lda PlayerDrawX
  sta TouchLeftB
  lda PlayerDrawY
  add #24
  sta TouchTopB
  jmp ChkTouchGeneric
.endproc

; Displays a 32 pixel wide platform and tests for player collision
.proc DrawPlatformAndCollide
  jsr EnemyAutoRemoveFar

  ; Draw the platform
  lda #$60
  sta O_RAM::TILEBASE
  lda #<Metasprite
  ldy #>Metasprite
  jsr DispEnemyMetasprite

  ; Check for collision with player
  lda PlayerVYH
  bmi _rts
  lda ObjectPXH,x
  sub PlayerPXH
  abs
  cmp #3
  bcc :+
_rts:
  pla
  pla
  rts
: lda #8
  sta TouchWidthB
  sta TouchHeightA
  lda #6
  sta TouchHeightB
  lda #32
  sta TouchWidthA
  lda O_RAM::OBJ_DRAWX
  sta TouchLeftA
  lda O_RAM::OBJ_DRAWY
  sta TouchTopA
  lda PlayerDrawX
  sta TouchLeftB
  lda PlayerDrawY
  add #24
  sta TouchTopB
  jmp ChkTouchGeneric
Metasprite:
  MetaspriteHeader 4, 1, 1
  .byt 0, 1, 1, 2
.endproc

.proc ObjectMovingPlatformLine
  ; convert horizontal flip to direction
  lda ObjectF2,x
  cmp #ENEMY_STATE_INIT
  bne :+
    lda ObjectF1,x
    and #1
    asl
    sta ObjectF2,x
  :

  ; change directions if on grid and it's needed
  lda ObjectPXL,x
  ora ObjectPYL,x
  bne NotOnGrid

  lda ObjectPXH,x
  sub #1
  jsr GetLevelColumnPtr
  ldy ObjectF2,x
  lda ForwardIndex,y
  add ObjectPYH,x
  tay
  lda (LevelBlockPtr),y
  cmp #Metatiles::PATH_LINE
  beq NoChange

  ; Try left
  ldy ObjectF2,x
  lda LeftIndex,y
  add ObjectPYH,x
  tay
  lda (LevelBlockPtr),y
  cmp #Metatiles::PATH_LINE
  bne :+
    dec ObjectF2,x
    jmp NoChange
: ; Try right
  ldy ObjectF2,x
  lda RightIndex,y
  add ObjectPYH,x
  tay
  lda (LevelBlockPtr),y
  cmp #Metatiles::PATH_LINE
  bne :+
    inc ObjectF2,x
    jmp NoChange
: ; If neither left or right work, go backwards
  lda ObjectF2,x
  eor #2
  sta ObjectF2,x
NoChange:
NotOnGrid:
  lda ObjectF2,x
  and #3
  sta ObjectF2,x

  lda ObjectF3,x
  bne :+
  ; Move the platform forward
  ldy ObjectF2,x
  lda ObjectPXL,x
  add XOffsetLo,y
  sta ObjectPXL,x
  lda ObjectPXH,x
  adc XOffsetHi,y
  sta ObjectPXH,x
  lda ObjectPYL,x
  add YOffsetLo,y
  sta ObjectPYL,x
  lda ObjectPYH,x
  adc YOffsetHi,y
  sta ObjectPYH,x
:

  jsr DrawPlatformAndCollide
  bcc :+
    lda #2
    sta PlayerRidingSomething
    lda #0
    sta PlayerVYL
    sta PlayerVYH
    sta ObjectF3,x

    ; Move the player with the platform
    lda ObjectPYL,x
    sub #$80
    sta PlayerPYL
    lda ObjectPYH,x
    sbc #1
    sta PlayerPYH

    ; (this part fixes the 1 frame delay there would otherwise be vertically)
    ldy ObjectF2,x
    lda PlayerPYL
    add YOffsetLo,y
    sta PlayerPYL
    lda PlayerPYH
    adc YOffsetHi,y
    sta PlayerPYH

    lda PlayerPXL
    add XOffsetLo,y
    sta PlayerPXL
    lda PlayerPXH
    adc XOffsetHi,y
    sta PlayerPXH
:
  rts

XOffsetLo: .byt <($10), 0, <(-$10), 0
XOffsetHi: .byt >($10), 0, >(-$10), 0
YOffsetLo: .byt 0, <($10), 0, <(-$10)
YOffsetHi: .byt 0, >($10), 0, >(-$10)

LEFT  = 0
DOWN  = 16+1
UP    = 16-1
RIGHT = 16*2
ForwardIndex:
  .byt RIGHT, DOWN,  LEFT, UP
LeftIndex:
  .byt UP,    RIGHT, DOWN, LEFT
RightIndex:
  .byt DOWN,  LEFT,  UP,   RIGHT
.endproc

.proc ObjectMovingPlatformH
SavedDirection = TempVal+1
  ; Move forward
  lda ObjectF1,x
  and #1
  tay
  sty SavedDirection
  lda ObjectPXL,x
  add OffsetLo,y
  sta ObjectPXL,x
  lda ObjectPXH,x
  adc OffsetHi,y
  sta ObjectPXH,x

  ; If initializing, shift F3 over 4 bits so we can compare directly against it
  lda ObjectF2,x
  cmp #ENEMY_STATE_INIT
  bne :+
    lda ObjectF3,x
    asl
    asl
    asl
    asl
    sta ObjectF3,x
  :

  inc ObjectTimer,x
  lda ObjectTimer,x
  cmp ObjectF3,x
  bne :+
    jsr EnemyTurnAround
    lda #0
    sta ObjectTimer,x
  :

  jsr DrawPlatformAndCollide
  bcc NoTouch
    lda PlayerPYL
    add #<(24*16)
    lda PlayerPYH
    adc #>(24*16)
    cmp ObjectPYH,x
    beq :+
      inc PlayerPYH
    :

    lda #0
    sta PlayerVYH
    sta PlayerVYL

    lda ObjectF1,x
    and #1
    tay
    lda PlayerPXL
    add OffsetLo,y
    sta PlayerPXL
    lda PlayerPXH
    adc OffsetHi,y
    sta PlayerPXH

    lda #1
    sta PlayerRidingSomething
NoTouch:
  rts

OffsetLo: .byt <($10), <(-$10)
OffsetHi: .byt >($10), >(-$10) 
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
EnemyPlayerTouchCustomSize = EnemyPlayerTouch::AfterHeightWidth

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
  ; Change this when I have nonzero states that still involve walking
  beq Yes
  lda ObjectF1,x
  ; Projectiles can always walk
  and #<~1
  cmp #Enemy::PLAYER_PROJECTILE*2
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
  add EnemyRightEdge
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
  sty TempY
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
  sty TempY
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
  add EnemyRightEdge
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

; Checks if an object's center is overlapping a solid block
; input: X (object slot)
; output: carry (set if overlapping a solid), 0 (block type), 1 (Y position)
.proc EnemyCheckOverlappingOnSolid
  lda ObjectPYL,x
  add #$80
  lda ObjectPYH,x
  adc #0
  tay
  lda ObjectPXL,x
  add #$80
  lda ObjectPXH,x
  adc #0
  jsr GetLevelColumnPtr
  sta 0
  sty 1
  tay
  lda MetatileFlags,y
  cmp #M_SOLID_ALL
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

.proc EnemyAutoRemoveFar
  lda ObjectPXH,x
  sub ScrollX+1
  abs
  cmp #34
  bcc Good
  lda #0
  sta ObjectF1,x
Good:
  rts
.endproc

; Randomly swaps two object slots, because the NES can only display 8 sprites per scanline
; and any past that aren't drawn. This way sprites are don't just drop out of visibility.
.proc FlickerEnemies
  rts
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
Tile = 0
Attributes = 1
XOffset = 2
YOffset = 3

  sta Tile

  lda #0
  sta XOffset
  sta YOffset
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
  lda Attributes ; defaults to OAM_COLOR_1
  sta OAM_ATTR,y
  lda Tile
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

; Finds a free slot and copies object X to the new slot
; input: X (object to copy)
; output: Y (new object), carry (success)
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

.proc EnemyYLimit
  lda ObjectPYH,x
  bpl :+
  lda #0
  sta ObjectF1,x
: rts
.endproc

.proc ObjectCheckpoint
  lda #0 ; Attributes
  sta 1

  ; Draw checkpoint spinning in a circle
  lda retraces
  and #31
  tay
  lda CosineTable,y
  jsr AsrAsrAsr
  add #4
  sta 2 ; X offset
  lda SineTable,y
  jsr AsrAsrAsr
  add #4
  sta 3 ; Y offset
  lda #$52 ; Tile
  jsr DispObject8x8_XYOffset

  ; Touch checkpoint
  jsr SmallPlayerTouch
  bcc NoTouch
  ; Store the X and Y for the checkpoint
  lda #0
  sta ObjectF1,x
  lda ObjectPXH,x
  sta CheckpointX
  lda ObjectPYH,x
  sub #1
  sta CheckpointY

  ; Copy game state
  ldy #GameStateLen-1
: lda CurrentGameState,y
  sta CheckpointGameState,y
  dey
  bpl :-
NoTouch:
  rts

AsrAsrAsr:
  asr
  asr
  asr
  rts  
.endproc
