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
  ; Stun
  .byt PlayerProjectileAction::STUN   | PlayerProjectileAction::REMOVE_SHOT
  ; Copy
  .byt PlayerProjectileAction::COPY
  ; Blaster
  .byt PlayerProjectileAction::DAMAGE | PlayerProjectileAction::REMOVE_SHOT
  ; Glider
  .byt PlayerProjectileAction::DAMAGE | PlayerProjectileAction::REMOVE_SHOT
  ; Boomerang
  .byt PlayerProjectileAction::DAMAGE
  ; Fireball
  .byt PlayerProjectileAction::DAMAGE | PlayerProjectileAction::REMOVE_SHOT
  ; Flame
  .byt PlayerProjectileAction::DAMAGE
  ; Water bottle
  .byt PlayerProjectileAction::DAMAGE | PlayerProjectileAction::REMOVE_SHOT
  ; Fireworks cursor
  .byt PlayerProjectileAction::NOTHING
  ; Bomb
  .byt PlayerProjectileAction::BUMP
  ; Explosion
  .byt PlayerProjectileAction::DAMAGE
  ; Ice
  .byt PlayerProjectileAction::BUMP
  ; Lamp flame
  .byt PlayerProjectileAction::DAMAGE
  ; Tornado
  .byt PlayerProjectileAction::BLOW_AWAY
  ; Burger
  .byt PlayerProjectileAction::BUMP
  ; Mirror?
  .byt PlayerProjectileAction::BUMP
.endproc

; Used for setting widths and heights for sprite/projectile collisions
.ifndef REAL_COLLISION_TEST
.proc PlayerProjectileSizeTable
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
.else
.proc PlayerProjectileSizeTableLo
  ; Stun
  .byt <(8*16)
  ; Copy
  .byt <(8*16)
  ; Blaster
  .byt <(8*16)
  ; Glider
  .byt <(8*16)
  ; Boomerang
  .byt <(8*16)
  ; Fireball
  .byt <(8*16)
  ; Flame
  .byt <(16*16)
  ; Water bottle
  .byt <(8*16)
  ; Fireworks cursor
  .byt <(8*16)
  ; Bomb
  .byt <(16*16)
  ; Explosion
  .byt <(8*16)
  ; Ice block
  .byt <(16*16)
  ; Lamp flame
  .byt <(16*16)
  ; Tornado
  .byt <(16*16)
  ; Burger
  .byt <(16*16)
  ; Mirror?
  .byt <(16*16)
.endproc
.proc PlayerProjectileSizeTableHi
  ; Stun
  .byt >(8*16)
  ; Copy
  .byt >(8*16)
  ; Blaster
  .byt >(8*16)
  ; Glider
  .byt >(8*16)
  ; Boomerang
  .byt >(8*16)
  ; Fireball
  .byt >(8*16)
  ; Flame
  .byt >(16*16)
  ; Water bottle
  .byt >(8*16)
  ; Fireworks cursor
  .byt >(8*16)
  ; Bomb
  .byt >(16*16)
  ; Explosion
  .byt >(8*16)
  ; Ice block
  .byt >(16*16)
  ; Lamp flame
  .byt >(16*16)
  ; Tornado
  .byt >(16*16)
  ; Burger
  .byt >(16*16)
  ; Mirror
  .byt >(16*16)
.endproc
.endif

; Used by ObjectBounceHoriz. If these values are added to ObjectPXL
; the new coordinate will be the top right corner.
.proc PlayerProjectileRightCornerTable
  ; Stun
  .byt $70
  ; Copy
  .byt $70
  ; Blaster
  .byt $70
  ; Glider
  .byt $70
  ; Boomerang
  .byt $70
  ; Fireball
  .byt $70
  ; Flame
  .byt $f0
  ; Water bottle
  .byt $70
  ; Fireworks cursor
  .byt $70
  ; Bomb
  .byt $f0
  ; Explosion
  .byt $70
  ; Ice block
  .byt $f0
  ; Lamp flame
  .byt $f0
  ; Tornado
  .byt $f0
  ; Burger
  .byt $f0
  ; Mirror
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
Lo = 1
Hi = 2
TheY = 4
Block = 0
  lda ObjectVXH,x ; if not moving, we're not bouncing
  ora ObjectVXL,x
  bne :+          ; return, don't do anything
_rts2:
  clc
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
  lda ObjectPXH,x
  ldy ObjectPYH,x
  jsr GetLevelColumnPtr
  sta Block
  tay
  lda MetatileFlags,y
  jmi SolidAbove

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
  sta Block
  tay
  lda MetatileFlags,y
  bmi SolidAbove ; solid but not bumping

  lda ObjectPXH,x
  ldy ObjectPYH,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  bpl Nonsolid

  ldy TheY
  lda ObjectPXL,x
  add ObjectVXL,x
  lda ObjectPXH,x
  adc ObjectVXH,x
  jsr GetLevelColumnPtr
GotIt:
  sta Block
  tay
  lda MetatileFlags,y
  bpl Nonsolid

  neg16x ObjectVXL, ObjectVXH

  jsr EnemyTurnAround
Solid:
  sec
  rts
Nonsolid:
  clc
  rts
SolidAbove:
  ; make sure TheY is correct for a collision above
  lda ObjectPYH,x
  sta TheY
  sec
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
  .raddr ProjLampFlame
  .raddr ProjTornado
  .raddr ProjBurger
  .raddr ProjMirror

BreakBricks:
  ; Break any bricks the projectile touches
  jsr GetPointerForMiddle
  sta TempVal
  sty 0
  tay
  lda MetatileFlags,y
  and #M_BEHAVIOR
  cmp #M_BRICKS
  bne :+
  ldy 0           ; Reload Y position
  jsr DoBreakBricksFar
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
  lda TempVal
  cmp #Metatiles::TOGGLE_SWITCH
  bne :+
    lda #0
    sta ObjectF1,x
    jsr HitToggleSwitch
    lda #0 ; make the next branch always happen
  :
  cmp #Metatiles::GLIDER_BLOCK
  bne :+
    lda #0
    sta ObjectF1,x
    lda BackgroundMetatile
    ldy 0
    jsr ChangeBlockFar    
  :

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
  bcc @Done
  lda #<-$18
  sta ObjectVYL,x
  lda #255
  sta ObjectVYH,x

  ldy TempY
  cpy #15
  bcs @Done
  lda (LevelBlockPtr),y
  cmp #Metatiles::WATER_FROZEN
  bne :+
  lda #Metatiles::WATER_TOP
  jsr ChangeBlockFar
  lda #SFX::ARROW_SHOOT
  jsr PlaySound
  jmp @Done
:
  lda (LevelBlockPtr),y
  cmp #Metatiles::ICE2
  beq @YesIce
  cmp #Metatiles::ICE
  bne :+
@YesIce:
  lda BackgroundMetatile
  jsr ChangeBlockFar
  lda #SFX::ARROW_SHOOT
  jsr PlaySound
  jmp @Done
:
  lda (LevelBlockPtr),y
  cmp #Metatiles::LAVA_FROZEN
  bne :+
  lda #Metatiles::LAVA_TOP
  jsr ChangeBlockFar
  lda #SFX::ARROW_SHOOT
  jsr PlaySound
;  jmp @Done
:

@Done:
  jmp EnemyApplyVelocity

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
  jsr ObjectBounceHoriz

  ; Check if bouncing against ice, and melt it if so
  bcc :+
  ldy 4 ; TheY
  lda 0 ; Block
  cmp #Metatiles::ICE2
  beq @YesIce
  cmp #Metatiles::ICE
  bne :+
@YesIce:
  lda #SFX::ARROW_SHOOT
  jsr PlaySound
  lda BackgroundMetatile
  jmp ChangeBlockFar
:
  rts 

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
  jsr EnemyApplyVelocity ; actually applies the vertical velocity a second time

  lda ObjectPYH,x
  cmp #15
  bcs :+
  jsr GetPointerForMiddle
  cmp #Metatiles::CAMPFIRE
  bne :+
    lda #SFX::ARROW_SHOOT
    jsr PlaySound
    lda #0
    sta ObjectF1,x
    lda #Metatiles::CAMPFIRE_OUT
    jsr ChangeBlockFar
  :

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
  lda #<-$20
  sta ObjectVYL,x
  lda #<-1
  sta ObjectVYH,x
@NoUp:

  lda keydown
  and #KEY_DOWN
  beq @NoDn
  lda #$20
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

  jsr GetPointerForMiddleWide
  cmp #Metatiles::CAMPFIRE
  beq DoExplode

  lda ObjectTimer,x
  cmp #1
  bne NotBombExplode
DoExplode:
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
  lda #OAM_COLOR_1 << 2
  ldy #$70
  jsr DispEnemyWideFlipped

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
  jsr EnemyFallIce
  lda ObjectF3,x
  sta TempVal ; keep the F3 that was actually used for later
  jsr EnemyWalk
  jsr EnemyAutoBump

  lda ObjectPXL,x
  add #$80
  lda ObjectPXH,x
  adc #0
  ldy ObjectPYH,x
  jsr GetLevelColumnPtr
  cmp #Metatiles::CEILING_BARRIER
  bne :+
  lda #0
  sta ObjectF1,x
  rts
: cmp #Metatiles::CAMPFIRE
  bne :+
    lda #SFX::ARROW_SHOOT
    jsr PlaySound
    lda #0
    sta ObjectF1,x
    lda #Metatiles::CAMPFIRE_OUT
    jsr ChangeBlockFar
    jmp @NotFreeze
: cmp #Metatiles::WATER_TOP
  bne @NotFreeze
    lda #Metatiles::WATER_FROZEN
    jsr ChangeBlockFar

    ; Change block to the right
    lda LevelBlockPtr
    add #$10
    sta LevelBlockPtr
    addcarry LevelBlockPtr+1
    jsr FreezeWaterCommon

    ; Change block to the left
    lda LevelBlockPtr
    sub #$20
    sta LevelBlockPtr
    subcarry LevelBlockPtr+1
    jsr FreezeWaterCommon

    lda #0
    sta ObjectF1,x
@NotFreeze:
  cmp #Metatiles::LAVA_TOP
  bne @NotFreezeLava
    lda #Metatiles::LAVA_FROZEN
    jsr ChangeBlockFar

    ; Change block to the right
    lda LevelBlockPtr
    add #$10
    sta LevelBlockPtr
    addcarry LevelBlockPtr+1
    jsr FreezeLavaCommon

    ; Change block to the left
    lda LevelBlockPtr
    sub #$20
    sta LevelBlockPtr
    subcarry LevelBlockPtr+1
    jsr FreezeLavaCommon

    lda #0
    sta ObjectF1,x
@NotFreezeLava:

  lda ObjectF3,x
  beq :+
  dec ObjectF3,x
  lda #10
  sta ObjectTimer,x
: sta ObjectVXL,x ; required to be nonzero for the projectile to collide with enemies

  ldy #$70
  lda #OAM_COLOR_1 << 2
  jsr DispEnemyWideFlipped
  jsr CollideRide16
  jsr RideOnProjectile
  bcc @NotRiding

  ; without this, if the block falls fast enough the player will fall off
  lda ObjectVYL,x
  sta PlayerVYL
  lda ObjectVYH,x
  sta PlayerVYH

  ; add the speed to the player so they move with the block
  lda TempVal
  beq @NotRiding
  sta 0
  lda #0
  sta 1

  ; let the player keep the block going
  lda keydown+1
  and #KEY_SNES_A
  bne @KeepIceGoing
  lda keydown
  and #KEY_DOWN
  beq :+
@KeepIceGoing:
  inc ObjectF3,x
:

  ; Face left if needed
  lda ObjectF1,x
  lsr
  bcc :+
  lda 0
  neg
  sta 0
  lda #255
  sta 1
:

  ; Finally add the offset to the player position
  lda PlayerPXL
  add 0
  sta PlayerPXL
  lda PlayerPXH
  adc 1
  sta PlayerPXH
@NotRiding:
  rts

FreezeWaterCommon:
  lda (LevelBlockPtr),y
  cmp #Metatiles::WATER_TOP
  bne :+
    lda #0
    sta 0
    lda #Metatiles::WATER_FROZEN
    jsr DelayChangeBlockFar
: rts

FreezeLavaCommon:
  lda (LevelBlockPtr),y
  cmp #Metatiles::LAVA_TOP
  bne :+
    lda #0
    sta 0
    lda #Metatiles::LAVA_FROZEN
    jsr DelayChangeBlockFar
: rts

ProjLampFlame:
  jsr EnemyApplyVelocity
  lda retraces
  and #8
  bne :+
    jsr EnemyTurnAround
  :

  lda #$7c
  ldy #OAM_COLOR_1
  jmp DispEnemyWide

ProjTornado:
  jsr EnemyApplyVelocity

  ; Disappear when a solid object is hit
  jsr GetBlockUnderProjectile
  cmp #Metatiles::CAMPFIRE
  bne :+
    lda #Metatiles::CAMPFIRE_OUT
    jsr ChangeBlockFar
    lda #20
    sta 0
    lda #Metatiles::CAMPFIRE
    jsr DelayChangeBlockFar
    jmp :++
  :
  tay
  lda MetatileFlags,y
  bpl :+
    lda #0
    sta ObjectF1,x
  :

  ; Float upwards
  lda ObjectVYL,x
  sub ObjectF4,x
  sta ObjectVYL,x
  subcarryx ObjectVYH

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

  jsr GetPointerForMiddleWide
  cmp #Metatiles::CEILING_BARRIER
  beq @DoExplosion
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

GetBlockUnderProjectile = GetPointerForMiddle

ProjMirror:
  jsr EnemyApplyVelocity

  ; Draw tile 1
  lda #OAM_COLOR_1
  sta 1
  lda #0
  sta 2
  lda #<-4
  sta 3
  lda #$70 ; tile
  jsr DispObject8x8_XYOffset
  ; Draw tile 2
  lda #0 ; x
  sta 2
  lda #4 ; y
  sta 3
  lda #$71 ; tile
  jmp DispObject8x8_XYOffset
.endproc

; To do, share code with regular EnemyFall
; because it's basically the same thing
.proc EnemyFallIce
  jsr EnemyGravity

  ; Remove enemy if it falls too far off the bottom
  lda ObjectPYH,x
  bmi :+
    cmp #250
    bcc NotOffTop
    lda #0
    sta ObjectPYH,x
    sta ObjectPYL,x
    rts
NotOffTop:
    cmp #15
    bcc :+
      lda #0
      sta ObjectF1,x
      pla
      pla
      rts
  :

  jsr EnemyCheckStandingOnSolidIce
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

; Checks if an object is on top of a solid block (ice version)
; input: X (object slot)
; output: Zero flag (not zero if on top of a solid block)
; locals: 0, 1, 2, 3, 4
.proc EnemyCheckStandingOnSolidIce
LeftBlock = 1
RightBlock = 2
YIndex = 3
EitherSolid = 4
LeftPtr = LevelDecodePointer

  lda #0
  sta EitherSolid
  lda ObjectVYH,x
  bpl :+
  lda #0
  rts
:

  lda ObjectPYH,x ; get left side
  add #1
  pha
  tay
  sty YIndex
  lda ObjectPXH,x
  jsr GetLevelColumnPtr
  sta LeftBlock
  tay
  ; Copy the block pointer over
  lda LevelBlockPtr+0
  sta LeftPtr+0
  lda LevelBlockPtr+1
  sta LeftPtr+1
  ; Now test solidity
  lda MetatileFlags,y
  cmp #M_SOLID_TOP
  rol EitherSolid

  pla ; get right side
  tay ; reuse same Y
  lda ObjectPXL,x
  add EnemyRightEdge
  lda ObjectPXH,x
  adc #0
  jsr GetLevelColumnPtr
  sta RightBlock
  tay
  lda MetatileFlags,y
  cmp #M_SOLID_TOP
  rol EitherSolid

  ; Check if anything needs to be frozen
  ldy YIndex
  lda LeftBlock
  jsr IsIce
  bcs :+
  ; Left is unfrozen, make sure right is
    lda RightBlock
    jsr IsIce
    bcc No
     lda LeftPtr+0
     sta LevelBlockPtr
     lda LeftPtr+1
     sta LevelBlockPtr+1
     bne Freeze ; unconditional, never zero
  :

  ; Left is frozen, make sure right isn't
  lda RightBlock
  jsr IsIce
  bcc Freeze

No:
  lda EitherSolid
  rts

Freeze:
  lda #0
  sta 0
  lda (LevelBlockPtr),y
  cmp #Metatiles::WATER_TOP
  beq OK
  cmp #Metatiles::LAVA_TOP
  bne No
OK:
  sub #1
  jsr DelayChangeBlockFar

  lda EitherSolid
  rts

IsIce:
  cmp #Metatiles::WATER_FROZEN
  beq Yes
  cmp #Metatiles::LAVA_FROZEN
  beq Yes
  clc
  rts
Yes:
  sec
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

.proc ObjectFaceballShot
  jsr EnemyApplyVelocity
  jsr EnemyDespawnTimer

  lda #OAM_COLOR_2
  lda #$1f
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

  jsr EnemyApplyVelocity

  lda retraces
  lsr
  lsr
  and #7
  tay
  lda BoomerangSpinA,y
  sta 1
  lda BoomerangSpinT,y
  ora O_RAM::TILEBASE
  jsr DispObject8x8_Attr

  dec ObjectF4,x
  bne NoFlip
  neg16x ObjectVXL, ObjectVXH
  neg16x ObjectVYL, ObjectVYH
NoFlip:
  jmp SmallEnemyPlayerTouchHurt
BoomerangSpinT: .byt $1d, $1e, $1f, $1e, $1d, $1e, $1f, $1e
BoomerangSpinA:
  .byt OAM_COLOR_3, OAM_COLOR_3, OAM_COLOR_3, OAM_COLOR_3|OAM_YFLIP
  .byt OAM_COLOR_3|OAM_YFLIP, OAM_COLOR_3|OAM_XFLIP|OAM_YFLIP, OAM_COLOR_3|OAM_XFLIP|OAM_YFLIP, OAM_COLOR_3|OAM_XFLIP
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
  jsr EnemyFall

  lda ObjectF3,x
  jsr EnemyWalk
  jsr EnemyAutoBump

  ldy #$04
  lda #OAM_COLOR_3 << 2
  jsr DispEnemyWideFlipped

  ; Count down the speed
  lda ObjectF3,x
  beq :+
    dec ObjectF3,x
  :
  jmp EnemyPlayerTouchHurt
.endproc

.proc ObjectExplosion
  jsr EnemyDespawnTimer
  jsr ObjectPlayerProjectile::ProjExplosion
  jmp SmallEnemyPlayerTouchHurt
.endproc

.proc ObjectFireworkShot
  dec ObjectTimer,x
  beq DoExplode
  jsr EnemyGravity
  jsr EnemyApplyXVelocity
  jsr huge_rand
  and #OAM_XFLIP | OAM_YFLIP
  ora #OAM_COLOR_3
  sta 1
  lda retraces
  lsr
  and #3
  ora #$1c
  ora O_RAM::TILEBASE
  jsr DispObject8x8_Attr

; Explode if needed
  jsr EnemyPlayerTouch
  bcs DoExplode
  rts
DoExplode:
    lda #7
    jmp EnemyExplode
.endproc
