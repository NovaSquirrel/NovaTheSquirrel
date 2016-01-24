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

.enum PlayerProjectileAction
  NOTHING
  BUMP
  KNOCK
  STUN
  DAMAGE
  BLOW_AWAY
  COPY
  REMOVE_SHOT = 128
.endenum

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

.proc PlayerProjectileRightCornerTable ; used by ObjectBounceHoriz
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
  jsr ProjectilePlayerTouch
  bcc :+
  jsr HurtPlayer
: rts
.endproc

.proc ProjectilePlayerTouch
  ldy ObjectF2,x
  lda PlayerProjectileSizeTable,y
  sta TouchWidthA
  sta TouchHeightA

  lda #8
  sta TouchWidthB
  lda #24
  sta TouchHeightB

  jmp EnemyPlayerTouch::AfterHeightWidth
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

  ; negate 16
  sec             ;Ensure carry is set
  lda #0          ;Load constant zero
  sbc ObjectVXL,x ;... subtract the least significant byte
  sta ObjectVXL,x ;... and store the result
  lda #0          ;Load constant zero again
  sbc ObjectVXH,x ;... subtract the most significant byte
  sta ObjectVXH,x ;... and store the result

  ldy ObjectF2,x
  lda PlayerProjectileSizeTable,y
  cmp #16
  jne EnemyTurnAround

_rts:
  rts

.endproc

.proc ObjectOffsetXY
  sta 0
; X
  lda ObjectPXL,x
  add 0
  sta ObjectPXL,x
  addcarryx ObjectPXH
; Y
  lda ObjectPYL,x
  add 0
  sta ObjectPYL,x
  addcarryx ObjectPYH
  rts
.endproc

.proc ObjectOffsetXYNegative
  sta 0
; X
  lda ObjectPXL,x
  sub 0
  sta ObjectPXL,x
  subcarryx ObjectPXH
; Y
  lda ObjectPYL,x
  sub 0
  sta ObjectPYL,x
  subcarryx ObjectPYH
  rts
.endproc

.proc ObjectPlayerProjectile
  jsr EnemyDespawnTimer

  lda ObjectF1,x
  and #<~1
  cmp #Enemy::ENEMY_PROJECTILE*2
  bne NotEnemyProjectile
  jsr ProjectilePlayerTouchHurt
NotEnemyProjectile:

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

ProjStunStar:
  jsr EnemyApplyVelocity
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
ProjLifeGlider:
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

  lda 0
  add #$70
  jmp DispObject8x8_Attr
GliderPushX:
  .byt $00, $00, $00, $30
GliderPushY:
  .byt $00, $30, $00, $00

ProjBoomerang:
  jsr EnemyApplyVelocity
  lda #$70
  jmp DispObject8x8
ProjFireball:
  jsr ObjectFallSmall
  bcc :+
  lda #<-$20
  sta ObjectVYL,x
  lda #255
  sta ObjectVYH,x
: jsr EnemyApplyVelocity

  lda ObjectTimer,x
  cmp #1
  bne NotFlame
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
ProjFlame:
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
  :
  lda #$74
  ldy #OAM_COLOR_1
  jmp DispEnemyWide
ProjWaterBottle:
  jsr EnemyGravity
  jsr EnemyApplyVelocity
  lda #$70
  jmp DispObject8x8
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
  lda #PlayerProjectileType::EXPLOSION
  sta ObjectF2,x
  lda #10
  sta ObjectTimer,x
  rts
NotBombExplode:
  lda #$70
  ldy #0
  jsr DispEnemyWide
  jmp ObjectBounceHoriz

ProjExplosion:
  jsr huge_rand
  add ObjectPXL,x
  sta ObjectPXL,x
  jsr huge_rand
  add ObjectPYL,x
  sta ObjectPYL,x

  jsr EnemyApplyVelocity
  lda #$53
  jmp DispObject8x8

ProjIceBlock:
  jsr EnemyApplyVelocity
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
  jsr EnemyApplyVelocity
  lda #$70
  ldy #OAM_COLOR_1
  jmp DispEnemyWide
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


