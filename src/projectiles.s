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

; Different projectile actions for the table after this
.enum PlayerProjectileAction
  NOTHING
  BUMP
  STUN
  DAMAGE
  BLOW_AWAY
  COPY
  REMOVE_SHOT = 128
.endenum

; Actions to take when a projectile hits an enemy.
; REMOVE_SHOT means delete the projectile after a collision.
.proc PlayerProjectileActionTable
  .byt PlayerProjectileAction::STUN   | PlayerProjectileAction::REMOVE_SHOT
  .byt PlayerProjectileAction::COPY
  .byt PlayerProjectileAction::DAMAGE | PlayerProjectileAction::REMOVE_SHOT
  .byt PlayerProjectileAction::DAMAGE | PlayerProjectileAction::REMOVE_SHOT
  .byt PlayerProjectileAction::DAMAGE
  .byt PlayerProjectileAction::DAMAGE | PlayerProjectileAction::REMOVE_SHOT
  .byt PlayerProjectileAction::DAMAGE
  .byt PlayerProjectileAction::DAMAGE | PlayerProjectileAction::REMOVE_SHOT
  .byt PlayerProjectileAction::NOTHING
  .byt PlayerProjectileAction::BUMP
  .byt PlayerProjectileAction::DAMAGE
  .byt PlayerProjectileAction::BUMP
  .byt PlayerProjectileAction::DAMAGE
  .byt PlayerProjectileAction::BLOW_AWAY
  .byt PlayerProjectileAction::BUMP
  .byt PlayerProjectileAction::BUMP
.endproc

; Used for setting widths and heights for collisions
.proc PlayerProjectileSizeTable
  .byt 8
  .byt 8
  .byt 8
  .byt 8
  .byt 8
  .byt 8
  .byt 8
  .byt 8
  .byt 8
  .byt 16
  .byt 8
  .byt 16
  .byt 16
  .byt 16
  .byt 16
  .byt 16
.endproc

; Used by ObjectBounceHoriz. If these values are added to ObjectPXL
; the new coordinate will be the top right corner.
.proc PlayerProjectileRightCornerTable
  .byt $70
  .byt $70
  .byt $70
  .byt $70
  .byt $70
  .byt $70
  .byt $70
  .byt $70
  .byt $70
  .byt $f0
  .byt $70
  .byt $f0
  .byt $f0
  .byt $f0
  .byt $f0
  .byt $f0
.endproc

.proc ProjectilePlayerTouchHurt
  jsr SmallPlayerTouch
  bcc :+
  jsr HurtPlayer
: rts
.endproc

.proc ObjectBounceHoriz
; todo: fix the part where it always seems to bounce when going right and using a small object
Lo = 0
Hi = 1
TheY = 2
  lda ObjectVXH,x ; if not moving, we're not bouncing
  ora ObjectVXL,x
  bne :+          ; return, don't do anything
_rts2:
  rts
:

  lda ObjectPYL,x
  add #$40
  lda ObjectPYH,x
  adc #0
  sta TheY

  lda ObjectVXH,x
  bmi Left        ; if a negative velocity, we're going left

Right: ; right edge
  ; FIRST, make sure we're not passing through something above
;  lda ObjectPXL,x
;  add ObjectVXL,x
;  lda ObjectPXH,x
;  adc ObjectVXH,x
  lda ObjectPXH,x
  ldy ObjectPYH,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  bmi _rts2 ; solid

  ldy ObjectF2,x
  lda PlayerProjectileRightCornerTable,y
  add ObjectPXL,x
  sta Lo

  ldy TheY

  lda ObjectPXH,x
  adc #0
  sta Hi

  lda Lo
  add ObjectVXL,x
  lda Hi
  adc ObjectVXH,x
  jsr GetLevelColumnPtr
  jmp GotIt

Left: ; start from left edge
  ; FIRST, make sure we're not passing through something above
  ldy ObjectF2,x
  lda PlayerProjectileRightCornerTable,y
  add ObjectPXL,x
  lda ObjectPXH,x
  adc #0
  ldy ObjectPYH,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  bmi _rts ; solid

  lda ObjectPXH,x
  ldy ObjectPYH,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  bpl _rts ; not solid

  ldy TheY
  lda ObjectPXL,x
  add ObjectVXL,x
  lda ObjectPXH,x
  adc ObjectVXH,x
  jsr GetLevelColumnPtr
GotIt:
  tay
  lda MetatileFlags,y
  bpl _rts ; not solid

  neg16x ObjectVXL, ObjectVXH

  ldy ObjectF2,x
  lda PlayerProjectileSizeTable,y
  cmp #16
  jne EnemyTurnAround

_rts:
  rts

.endproc

.proc ObjectRemoveTooLow
  lda ObjectPYH,x
  cmp #15
  bcc :+
    lda #0
    sta ObjectF1,x
  :
  rts
.endproc

; Handler for all the different types of player projectiles
.proc ObjectPlayerProjectile
  jsr EnemyDespawnTimer

  lda ObjectF2,x
  and #31
  asl
  tay
  lda ObjectPlayerProjectileRoutines+1,y
  pha
  lda ObjectPlayerProjectileRoutines+0,y
  pha
  rts
ObjectPlayerProjectileRoutines:
  .raddr ProjStunStar
  .raddr ProjCopyOrb
  .raddr ProjBlasterShot
  .raddr ProjLifeGlider
  .raddr ProjBoomerang
  .raddr ProjFireball
  .raddr ProjFlame
  .raddr ProjWaterBottle
  .raddr ProjFireworksCursor
  .raddr ProjBomb
  .raddr ProjExplosion
  .raddr ProjIceBlock
  .raddr ProjKickedIce
  .raddr ProjTornado
  .raddr ProjBurger
  .raddr ProjBall

BreakBricks:
  ; Break any bricks the projectile touches
  lda ObjectPYL,x
  add #$40
  lda ObjectPYH,x
  adc #0
  tay
  lda ObjectPXL,x
  add #$40
  lda ObjectPXH,x
  adc #0
  jsr GetLevelColumnPtr
  sty 0
  tay
  lda MetatileFlags,y
  and #M_BEHAVIOR
  cmp #M_BRICKS
  bne :+
  ldy 0           ; Reload Y position
  jsr DoBreakBricks
  lda #0          ; Remove the shot
  sta ObjectF1,x
: rts

ProjStunStar:
  jsr EnemyApplyVelocity
;  jsr BreakBricks
  lda #$51
  jmp DispObject8x8

ProjCopyOrb:
  jsr EnemyApplyVelocity
  lda #$2d
  jmp DispObject8x8

ProjBlasterShot:
  jsr EnemyApplyVelocity
  lda #$70
  jmp DispObject8x8

DoGlider:
  lda ObjectF1,x    ; if facing left, turn on horizontal flip bit
  and #1
  beq :+
    lda #OAM_XFLIP
: sta 1             ; 1 = attribute to use in DispObject8x8_Attr

  lda retraces
  and #3
  sta 0
  tay

; DO X

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

  lda ObjectF3,x    ; if facing up, turn on vertical flip bit
  beq :+
    lda #OAM_YFLIP
: ora 1
  sta 1
  rts

ProjLifeGlider:
  jsr BreakBricks
  jsr ObjectRemoveTooLow
  jsr DoGlider
  lda 0
  add #$70
  jmp DispObject8x8_Attr
GliderPushX:
  .byt $00, $00, $00, $30
GliderPushY:
  .byt $00, $30, $00, $00

ProjBoomerang:
  jsr EnemyApplyVelocity
  jsr ObjectRemoveTooLow

  lda ObjectPYL,x
  add #$40
  lda ObjectPYH,x
  adc #0
  tay
  lda ObjectPXL,x
  add #$40
  lda ObjectPXH,x
  adc #0
  jsr GetLevelColumnPtr
  jsr DoCollectibleFar

  lda retraces
  lsr
  lsr
  and #7
  tay
  lda BoomerangSpinA,y
  sta 1
  lda BoomerangSpinT,y
  jsr DispObject8x8_Attr

  inc ObjectF3,x
  lda ObjectF3,x
  cmp #28
  bne NoFlip
  lda #1
  neg16x ObjectVXL, ObjectVXH
  neg16x ObjectVYL, ObjectVYH
NoFlip:
  rts
BoomerangSpinT: .byt $70, $71, $72, $71, $70, $71, $72, $71
BoomerangSpinA:
  .byt OAM_COLOR_1, OAM_COLOR_1, OAM_COLOR_1, OAM_COLOR_1|OAM_YFLIP
  .byt OAM_COLOR_1|OAM_YFLIP, OAM_COLOR_1|OAM_XFLIP|OAM_YFLIP, OAM_COLOR_1|OAM_XFLIP|OAM_YFLIP, OAM_COLOR_1|OAM_XFLIP
DoFireball:
  jsr ObjectFallSmall
  bcc :+
  lda #<-$18
  sta ObjectVYL,x
  lda #255
  sta ObjectVYH,x
: jsr EnemyApplyVelocity
  rts

ProjFireball:
  jsr DoFireball
  lda ObjectTimer,x
  cmp #2
  bcs NotFlame
  lda #$40
  jsr ObjectOffsetXYNegative
  lda #PlayerProjectileType::FLAME
  sta ObjectF2,x
  lda #10
  sta ObjectTimer,x
  rts
NotFlame:
  lda retraces
  lsr
  lsr
  and #3
  add #$70
  jsr DispObject8x8
  jmp ObjectBounceHoriz

DoFlame:
  jsr EnemyFall
  bcc :+
    lda #0
    sta ObjectVXH,x
    sta ObjectVXL,x
:
  jsr EnemyApplyVelocity
  lda retraces
  and #8
  bne :+
    jsr EnemyTurnAround
: rts

ProjFlame:
  jsr DoFlame
  lda #$74
  ldy #OAM_COLOR_1
  jmp DispEnemyWide

ProjWaterBottle:
  jsr EnemyGravity
  jsr EnemyApplyVelocity

  ; Draw the water bottle
  lda retraces
  lsr
  lsr
  lsr
  and #3
  tay
  sty 4
  ; Draw tile 1
  lda SpinningBottleA,y
  sta 1
  lda SpinningBottleX1,y
  sta 2
  lda SpinningBottleY1,y
  sta 3
  lda SpinningBottleT1,y
  jsr DispObject8x8_XYOffset
  ; Draw tile 2
  ldy 4
  lda SpinningBottleX2,y
  sta 2
  lda SpinningBottleY2,y
  sta 3
  lda SpinningBottleT2,y
  jmp DispObject8x8_XYOffset

; E versions for enemies
SpinningBottleT1:  .byt $70, $72, $70, $72
SpinningBottleT2:  .byt $71, $73, $71, $73
SpinningBottleT1E: .byt $1c, $1e, $1c, $1e
SpinningBottleT2E: .byt $1d, $1f, $1d, $1f
SpinningBottleX1:  .byt 0, 4, 0, <-4
SpinningBottleY1:  .byt <-4, 0, 4, 0
SpinningBottleX2:  .byt 0, <-4, 0, 4
SpinningBottleY2:  .byt 4, 0, <-4, 0
SpinningBottleA:
  .byt OAM_COLOR_1, OAM_COLOR_1 | OAM_XFLIP, OAM_COLOR_1|OAM_YFLIP, OAM_COLOR_1
SpinningBottleAE:
  .byt OAM_COLOR_3, OAM_COLOR_3 | OAM_XFLIP, OAM_COLOR_3|OAM_YFLIP, OAM_COLOR_3

ProjFireworksCursor:
  jsr EnemyApplyVelocity
  lda #0
  sta ObjectVYL,x
  sta ObjectVYH,x

  lda keydown
  and #KEY_UP
  beq @NoUp
  lda #<-$10
  sta ObjectVYL,x
  lda #<-1
  sta ObjectVYH,x
@NoUp:

  lda keydown
  and #KEY_DOWN
  beq @NoDn
  lda #$10
  sta ObjectVYL,x
@NoDn:

  lda #$70
  jmp DispObject8x8
ProjBomb:
  lda ObjectF3,x
  beq :+
  jsr EnemyFall
  bcc :+
  lda #0
  sta ObjectVXH,x
  sta ObjectVXL,x
: jsr EnemyApplyVelocity

  lda ObjectTimer,x
  cmp #1
  bne NotBombExplode
  lda #$40
  jsr ObjectOffsetXY
  lda #10
ChangeToExplosion:
  pha
  lda #SFX::BOOM1
  sta NeedSFX
  jsr EnemyPosToVel
  lda #PlayerProjectileType::EXPLOSION
  sta ObjectF2,x
  pla
  sta ObjectTimer,x
  jmp CloneObjectX

NotBombExplode:
  lda #$70
  ldy #OAM_COLOR_1
  jsr DispEnemyWide

; ride on the bomb
  lda ObjectVYL,x
  ora ObjectVYH,x
  bne :+
  jsr CollideRide16
  jsr RideOnProjectile
  jmp ObjectBounceHoriz

RideOnProjectile:
  bcc :++
    lda PlayerDrawY
    add #8
    cmp O_RAM::OBJ_DRAWY
    bcs :+
      lda #2
      sta PlayerRidingSomething
      lda ObjectPYL,x
      sub #$80
      sta PlayerPYL
      lda ObjectPYH,x
      sbc #1
      sta PlayerPYH
      lda #0
      sta PlayerVYL
      sta PlayerVYH
      sec
      rts
: clc
: rts

ProjExplosion:
  jsr huge_rand
  and #31
  tay
  lda ObjectF3,x
  lsr
  lsr
  jsr SpeedAngle2Offset
  inc ObjectF3,x

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

  lda #OAM_COLOR_0
  sta 1
  lda retraces
  and #1
  add #$53
  jmp DispObject8x8_Attr

ProjIceBlock:
  lda #$30
  jsr EnemyWalk
  jsr EnemyAutoBump
  lda #$70
  ldy #OAM_COLOR_1
  jmp DispEnemyWide
ProjKickedIce:
  jsr EnemyApplyVelocity
  lda #$70
  ldy #OAM_COLOR_1
  jsr DispEnemyWide
  jmp ObjectBounceHoriz
ProjTornado:
  jsr EnemyApplyVelocity
  lda retraces
  and #4
  ora #$70
  ldy #OAM_COLOR_1
  jmp DispEnemyWide
ProjBurger:
  lda ObjectTimer,x
  cmp #1
  bne :+
@DoExplosion:
    lda #5
    jmp ChangeToExplosion
  :

  lda ObjectPXH,x
  ldy ObjectPYH,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  bmi @DoExplosion

  jsr EnemyApplyVelocity
  lda #$70
  ldy #OAM_COLOR_1
  jsr DispEnemyWide
  jsr CollideRide16
  jsr RideOnProjectile
  ; Also move the player when the burger moves
  bcc :+
  lda PlayerPXL
  add ObjectVXL,x
  sta PlayerPXL
  lda PlayerPXH
  adc ObjectVXH,x
  sta PlayerPXH
:
  rts
ProjBall:
  jsr EnemyFall
  bcc :+
  lda #<-$20
  sta ObjectVYL,x
  lda #255
  sta ObjectVYH,x
: jsr EnemyApplyVelocity
  lda #$70
  ldy #OAM_COLOR_1
  jsr DispEnemyWide
  jmp ObjectBounceHoriz
.endproc

; Enemy routine. Checks for player projectiles and reacts to them.
.proc EnemyTouchPlayerProjectiles
Action = 0
Object = 1
Width  = TouchWidthA
Height = TouchHeightA
  lda O_RAM::ON_SCREEN ; skip if off screen
  bne :+
  rts
:
  lda #16
  sta TouchWidthB
  sta TouchHeightB
  lda O_RAM::OBJ_DRAWX
  sta TouchLeftB
  lda O_RAM::OBJ_DRAWY
  sta TouchTopB

  stx Object
  ldy #0
Loop:
  lda ObjectF1,y
  lsr
  cmp #Enemy::PLAYER_PROJECTILE
  bne Skip
  tax
  lda PlayerProjectileSizeTable,x
  sta Width
  sta Height
  lda PlayerProjectileActionTable,x
  sta Action
  ldx Object
  asl      ; we don't care about shifting but we do care about the zero flag
  beq Skip ; and if we're supposed to do nothing in response to the projectile, OK
           ; though there's only one projectile so far that doesn't have an action associated, so I dunno
  lda ObjectPXH,y
  sub ObjectPXH,x
  abs
  cmp #3
  bcs Skip ; too far away

Skip:
  iny 
  cpy #ObjectLen
  bne Loop
  rts
.endproc

.proc ObjectBlasterShot
  jsr EnemyApplyVelocity
  jsr EnemyDespawnTimer
  lda #OAM_COLOR_2
  sta 1
  lda ObjectF3,x
  ora O_RAM::TILEBASE
  jsr DispObject8x8_Attr
  jmp SmallEnemyPlayerTouchHurt
.endproc

.proc ObjectSmallGlider
  jsr EnemyDespawnTimer
  jmp SmallEnemyPlayerTouchHurt
.endproc

.proc ObjectBoomerang
  jsr EnemyDespawnTimer
  jmp SmallEnemyPlayerTouchHurt
.endproc

.proc ObjectFireball
  lda ObjectF3,x
  beq YesGravity
    jsr EnemyApplyVelocity
    jmp NoGravity
YesGravity:
  jsr ObjectPlayerProjectile::DoFireball
NoGravity:
  dec ObjectTimer,x
  lda ObjectTimer,x
  bne :+
    lda #0
    sta ObjectF1,x
  :
  lda #OAM_COLOR_3
  sta 1
  lda retraces
  lsr
  lsr
  and #3
  ora #$18
  ora O_RAM::TILEBASE
  jsr DispObject8x8_Attr
  jmp SmallEnemyPlayerTouchHurt
.endproc

.proc ObjectFlames
  jsr EnemyDespawnTimer
  jsr ObjectPlayerProjectile::DoFlame
  lda #$1c
  ora O_RAM::TILEBASE
  ldy #OAM_COLOR_3
  jsr DispEnemyWide
  jmp EnemyPlayerTouchHurt
.endproc

.proc ObjectWaterBottle
  jsr EnemyDespawnTimer
  jsr EnemyGravity
  jsr EnemyApplyVelocity

  ; Draw the water bottle
  lda retraces
  lsr
  lsr
  lsr
  and #3
  tay
  sty 4
  ; Draw tile 1
  lda ObjectPlayerProjectile::SpinningBottleAE,y
  sta 1
  lda ObjectPlayerProjectile::SpinningBottleX1,y
  sta 2
  lda ObjectPlayerProjectile::SpinningBottleY1,y
  sta 3
  lda ObjectPlayerProjectile::SpinningBottleT1E,y
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  ; Draw tile 2
  ldy 4
  lda ObjectPlayerProjectile::SpinningBottleX2,y
  sta 2
  lda ObjectPlayerProjectile::SpinningBottleY2,y
  sta 3
  lda ObjectPlayerProjectile::SpinningBottleT2E,y
  ora O_RAM::TILEBASE
  jsr DispObject8x8_XYOffset
  jmp SmallEnemyPlayerTouchHurt
.endproc

.proc ObjectIceBlock
  jsr EnemyDespawnTimer
  jsr EnemyApplyVelocity
  rts
.endproc
