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
  AUTO_REMOVE = $1
  GET_SHOT    = $2
  AUTO_RESET  = $4
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
  lsr O_RAM::OBJ_FLAG
  bcc :+
    lda ObjectTimer,x
    beq :+
    dec ObjectTimer,x
    bne :+
    lda #0
    sta ObjectF2,x
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
  .raddr ObjectFireBurning
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
.endproc

; other enemy attributes
.include "../tools/objectlist.s"

ObjectNone = DoNothing

.proc BrickPoof ; the particles used for brick poofs
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

  lda #OAM_COLOR_1
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y
  sta OAM_ATTR+(4*2),y
  sta OAM_ATTR+(4*3),y
  lda retraces
  and #1
  ora #$56
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

.proc ObjectPoof ; also for particle effects
DrawX = O_RAM::OBJ_DRAWX
DrawY = O_RAM::OBJ_DRAWY

  RealXPosToScreenPosByX ObjectPXL, ObjectPXH, DrawX
  RealYPosToScreenPosByX ObjectPYL, ObjectPYH, DrawY
  lda ObjectF2,x
  jne BrickPoof

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

  lda #OAM_COLOR_1
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y
  sta OAM_ATTR+(4*2),y
  sta OAM_ATTR+(4*3),y
  lda #$51
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

.proc ObjectGoomba
  jsr EnemyFall
  lda #$10
  jsr EnemyWalk
  jsr EnemyAutoBump

  ; Alternate between two frames
  lda retraces
  lsr
  lsr
  lsr
  and #3
  tay
  lda Frames,y
  ldy #OAM_COLOR_2
  jsr DispEnemyWide

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
Frames:
  .byt $0c, $10, $14, $10
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
CenterX = TempVal+0
CenterY = TempVal+1
ProjectileIndex = TempVal+2
ProjectileType  = 0
  ; Skip offscreen enemies
  lda O_RAM::ON_SCREEN
  rtseq

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
  bcc :+
  clc
  rts
:
  ; Skip if too far away vertically
  lda ObjectPYH,x
  sub ObjectPYH,y
  abs
  cmp #3
  bcc :+
  clc
  rts
:

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
   add PlayerProjectileHalfSizeTable,y
   sta TouchLeftB
   lda TouchTopB
   add PlayerProjectileHalfSizeTable,y
   sta TouchTopB
  jsr ChkTouchGeneric
  bcc Nope
  jsr EnemyGotShot
Nope: 
  ldy ProjectileIndex
  ; Try the next one
  iny
  cpy #ObjectLen
  jne Loop
  rts
.endproc

.proc EnemyGotShot
ProjectileIndex = TempVal+2
ProjectileType  = 0
  ldy ProjectileType
  lda PlayerProjectileActionTable,y
  asl    ; most significant bit = remove projectile
  bcc :+
    ldy ProjectileIndex
    pha
    lda #0
    sta ObjectF1,y
    pla
  :
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
  lda #SFX::BUMP
  jsr PlaySoundDebounce
  lda #>-1
  sta ObjectVYH,x
  lda #<-$30
  sta ObjectVYL,x
  lda ObjectF1,x
  eor #1
  sta ObjectF1,x
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
  jmp ChangePlayerAbility
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
  .byt Enemy::FIRE_BURNING,     AbilityType::FIRE
  .byt Enemy::ROCKET,           AbilityType::FIREWORK
  .byt Enemy::ROCKET_LAUNCHER,  AbilityType::FIREWORK
  .byt Enemy::FIREWORK_SHOOTER, AbilityType::FIREWORK
  .byt Enemy::TORNADO,          AbilityType::FAN
  .byt Enemy::ELECTRIC_FAN,     AbilityType::FAN
  .byt Enemy::CLOUD,            AbilityType::FAN
  .byt Enemy::BOUNCER,          AbilityType::BLASTER
  .byt Enemy::GREMLIN,          AbilityType::BLASTER
  .byt Enemy::BOMB_GUY,         AbilityType::BOMB
  .byt 0
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
  rts
.endproc

.proc ObjectSpinner
  rts
.endproc

.proc ObjectOwl
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
  rts
.endproc

.proc ObjectToastBot
  rts
.endproc

.proc ObjectBall
  rts
.endproc

.proc ObjectPotion
  rts
.endproc

.proc ObjectGeorge
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
  rts
.endproc

.proc ObjectThwomp
  rts
.endproc

.proc ObjectCannon1
  rts
.endproc

.proc ObjectCannon2
  rts
.endproc

.proc ObjectBurger
  rts
.endproc

.proc ObjectFireWalk
  rts
.endproc

.proc ObjectFireJump
  jsr EnemyFall
  bcc :+
    lda ObjectF2,x
    bne :+
    lda #<(-$40)
    sta ObjectVYL,x
    lda #>(-$40)
    sta ObjectVYH,x
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

.proc ObjectFireBurning
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
  ; aside from skipping collisions and saving CPU time,
  ; these checks keep the collision detection routine from
  ; having problems with overflow

  ; skip if too far away horizontally
  lda ObjectPXH,x
  sub PlayerPXH
  abs
  cmp #2
  bcc :+
  clc
  rts
:
  ; skip if too far away vertically
  lda ObjectPYH,x
  sub PlayerPYH
  abs
  cmp #3
  bcc :+
  clc
  rts
:

  ; Now to actually call the collision detection routine!
  ; ChkTouchGeneric wants the center of each object, so add width and height divided by 2
  ; maybe these could be adc instead of add?
  lda O_RAM::OBJ_DRAWX
  add #16/2
  sta TouchLeftA
  lda O_RAM::OBJ_DRAWY
  add #16/2
  sta TouchTopA
  lda PlayerDrawX
  ;add #8/2 <-- already handled when PlayerDrawX is written
  sta TouchLeftB
  lda PlayerDrawY
  ;add #24/2
  sta TouchTopB
  jmp ChkTouchGeneric
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

  lda ObjectVYH,x
  bpl :+
  clc
  rts
: lda ObjectPYL,x
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

; Draws an 8x8 sprite
; input: X (object slot), A (object tile)
DispObject8x8:
  pha
  lda #OAM_COLOR_1
  sta 1
  pla

; Draws an 8x8 sprite
; input: X (object slot), A (object tile), 1 (sprite palette)
.proc DispObject8x8_Attr
DrawX = O_RAM::OBJ_DRAWX
DrawY = O_RAM::OBJ_DRAWY

  sta 0

  lda #0
  sta O_RAM::ON_SCREEN

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
  sta OAM_XPOS,y
  lda DrawY
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

