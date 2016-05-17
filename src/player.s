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

.proc RunPlayer
  jsr UpdateStatus
  jmp HandlePlayer
.endproc

NOVA_ACCEL_SPEED = 2
NOVA_DECEL_SPEED = 4
NOVA_WALK_SPEED = 2
NOVA_RUN_SPEED = 4

.proc UpdateStatus
HealthX = 0
HealthCount = 1
  ldy OamPtr
  lda #15
  sta HealthX
  sta OAM_YPOS+(4*0),y
  sta OAM_YPOS+(4*1),y
  sta OAM_XPOS+(4*0),y
  sta OAM_XPOS+(4*2),y
  lda #15+8
  sta OAM_YPOS+(4*2),y
  sta OAM_YPOS+(4*3),y
  sta OAM_XPOS+(4*1),y
  sta OAM_XPOS+(4*3),y
  lda #$4c
  sta OAM_TILE+(4*0),y
  lda #$4d
  sta OAM_TILE+(4*2),y
  lda #$4e
  sta OAM_TILE+(4*1),y
  lda #$4f
  sta OAM_TILE+(4*3),y
  lda #OAM_COLOR_0
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y
  sta OAM_ATTR+(4*2),y
  sta OAM_ATTR+(4*3),y
  tya
  add #4*4
  tay

; Draw all hearts needed
  lda PlayerHealth
  lsr
  php
  sta HealthCount
Loop:
  lda HealthCount
  beq NoMoreHearts
  lda #$4a
  jsr MakeHeart
  dec HealthCount
  bne Loop
NoMoreHearts:

  plp ; add a half heart if needed
  bcc :+
    lda #$4b
    jsr MakeHeart
  :

  sty OamPtr
  rts

MakeHeart:
  sta OAM_TILE,y
  lda HealthX
  sta OAM_XPOS,y
  add #8
  sta HealthX
  lda #0
  sta OAM_ATTR,y
  lda #15+16
  sta OAM_YPOS,y
  iny
  iny
  iny
  iny
  rts
.endproc

.proc HandlePlayer
;OldPlayerPYL = 0
;OldPlayerPYH = 1
Temp = 1
BlockUL = 2
BlockUR = 3
BlockLL = 4
BlockLR = 5
BlockFootL = TempSpace+1  ; TempSpace is free here because
BlockFootR = TempSpace+2  ; the buffer isn't filled until after Handleplayer
FourCorners = 6
FootCorners = TempSpace+3
BlockMiddle = TempSpace+4
XForMiddle  = TempSpace+5
BottomCMP = 7
SkipFourCorners = 8
MaxSpeedLeft = 9
MaxSpeedRight = 10
  lda #0
  sta PlayerOnGround
  sta FourCorners
  sta FootCorners
  sta SkipFourCorners

  lda ForceControllerTime
  beq :+
    dec ForceControllerTime
    lda keydown
    and #<~(KEY_LEFT|KEY_RIGHT)
    ora ForceControllerBits
    sta keydown
  :

  lda PlayerWasRunning ; nonzero = B button, only updated when on ground
  beq :+
    lda #<-(NOVA_RUN_SPEED*16)
    sta MaxSpeedLeft
    lda #NOVA_RUN_SPEED*16
    sta MaxSpeedRight
    bne NotWalkSpeed
: lda #<-(NOVA_WALK_SPEED*16)
  sta MaxSpeedLeft
  lda #NOVA_WALK_SPEED*16
  sta MaxSpeedRight
NotWalkSpeed:


  ; Handle holding and letting go of a balloon
  lda PlayerHasBalloon
  beq @NoBalloon
    ; Lift the player up
    lda #255
    sta PlayerVYH
    lda #<-$10
    sta PlayerVYL

    ; Let go if pressing A or B, or if too high
    lda keynew
    and #KEY_B|KEY_A
    bne @LetGo
    lda PlayerPYH
    cmp #$04
    bcc @LetGo
    ; Also if they touch something solid above
    lda PlayerPXL
    add #$40
    lda PlayerPXH
    adc #0
    ldy PlayerPYH
    jsr GetLevelColumnPtr
    sta BlockLR
    tax
    lda MetatileFlags,x
    bmi @LetGo
    bpl @NoLetGo
@LetGo:
    lsr PlayerHasBalloon
    jsr FindFreeObjectY
    bcc @NoSlotFree
    lda #Enemy::POOF*2
    sta ObjectF1,y

    ; Copy the X over with an offset
    ldx PlayerDir
    lda PlayerPXL
    add BalloonOffsetLo,x
    sta ObjectPXL,y
    lda PlayerPXH
    adc BalloonOffsetHi,x
    sta ObjectPXH,y
    ; Copy other stuff
    lda PlayerPYL
    sub #$80
    sta ObjectPYL,y
    lda PlayerPYH
    sbc #0
    sta ObjectPYH,y
    lda #2
    sta ObjectF2,y
    lda #0
    sta ObjectVYL,y
    sta ObjectVYH,y
    sta ObjectTimer,y
  @NoSlotFree:
@NoLetGo:
@NoBalloon:


  lda PlayerOnLadder       ; skip gravity if on a ladder
  bne HandleLadderClimbing
  ; add gravity
  lda PlayerVYH
  bmi GravityAddOK
  lda PlayerVYL
  cmp #$60
  bcs SkipGravity
GravityAddOK:
  lda PlayerVYL
  add #4
  sta PlayerVYL
  bcc SkipGravity
    inc PlayerVYH
SkipGravity:
  jmp PlayerIsntOnLadder
HandleLadderClimbing:
  lda #0
  sta PlayerVYL
  sta PlayerVYH
  jsr OfferJump
  lda keydown
  and #KEY_UP
  beq :+
    lda PlayerPYL
    sub #$20
    sta PlayerPYL
    subcarry PlayerPYH
  :
  lda keydown
  and #KEY_DOWN
  beq :+
    lda PlayerPYL
    add #$20
    sta PlayerPYL
    addcarry PlayerPYH
  :
PlayerIsntOnLadder:

  ; apply gravity
  lda PlayerPYL
  add PlayerVYL
  sta PlayerPYL
  lda PlayerPYH
  adc PlayerVYH
;  and #$0f
  sta PlayerPYH

  ; Handle the player going off the top and bottom of the screen
  ; (A is still PlayerPYH)
  cmp #14
  bcc NotOffTopBottom
  ; Warp the player if needed
  ldy #0
  lda PlayerPXH ; get screen number only
  lsr
  lsr
  lsr
  lsr
  ldx PlayerPYH
  bmi :+
    ora #$10 ; move onto the LevelLinkDown if on the bottom side
    ldy #1
: tax
  lda LevelLinkUp,x
  bne LevelLinkNonzero
; Respond to the screen that's linked to itself:

  lda PlayerPYH ; don't kill if on the top side of the screen
  bmi :+
  lda PuzzleMode
  bne :+
  ; In action mode, die
  ; (A = 0 still)
  sta PlayerHealth
: jmp @ActionMode

  ; In puzzle mode, a non-linked screen wraps around
  lda PlayerPYH
  and #$0f
  sta PlayerPYH
@ActionMode:

  jmp NotOffTopBottom
LevelLinkNonzero:
  asl
  asl
  asl
  asl
  add PlayerPXH
  sta PlayerPXH

  inc NeedLevelRerender
  lda LevelLinkStartYL,y
  sta PlayerPYL
  lda LevelLinkStartYH,y
  sta PlayerPYH
NotOffTopBottom:

  countdown PlayerJumpCancelLock
  countdown PlayerWalkLock
  countdown PlayerInvincible

  lda PlayerTailAttack
  beq NoTail
    inc PlayerTailAttack
    lda PlayerTailAttack
    cmp #6 ; launch attack
    bne :+
      jsr DoTailAttack
    :
    lda PlayerTailAttack
    cmp #14
    bcc :+
      lda #0
      sta PlayerTailAttack
    :
    jmp SkipTail
NoTail:
  lda PlayerJumping
  bne OkayIfLeftRight
  lda keylast
  and #KEY_B|KEY_LEFT|KEY_RIGHT
  bne :+
OkayIfLeftRight:
  lda keynew
  and #KEY_B
  beq :+
    lda PlayerPYH
    cmp #15
    bcs :+
    lda #SFX::TAIL_WHOOSH
    jsr PlaySound
    inc PlayerTailAttack

    ; Detonate any fireworks
    ldy #0
  @Loop:
    lda ObjectF1,y
    lsr
    cmp #Enemy::PLAYER_PROJECTILE
    bne @No
    lda ObjectF2,y
    cmp #PlayerProjectileType::FIREWORK_CURSOR
    bne @No
    tya
    tax
    lda #$40
    jsr ObjectOffsetXY
    lda #10
    sta ObjectTimer,y
    lda #PlayerProjectileType::EXPLOSION
    sta ObjectF2,y
    lda #0 ; when it's not cleared it's cool and flies off
    sta ObjectVXH,y
    sta ObjectVXL,y
    sta ObjectVYH,y
    sta ObjectVYL,y
    lda #SFX::BOOM1
    sta NeedSFX
  @No:
    iny
    cpy #ObjectLen
    bne @Loop
  :
SkipTail:

  lda PlayerVYH
  bpl :+
    lda PlayerJumpCancel
    bne :+
    lda keydown        ; cancel a jump
    and #KEY_A
    bne :+
      lda PlayerJumpCancelLock
      bne :+
        inc PlayerJumpCancel

        ; Forced jump like when climbing are handled differently
        lda ForceControllerTime
        beq @IsNotForce
        lda #0
        sta PlayerVYL
        sta PlayerVYH
        beq :+
@IsNotForce:

        lda PlayerVYL
        cmp #<(-$20)
        bcs :+
        lda #>(-$20)
        sta PlayerVYH
        lda #<(-$20)
        sta PlayerVYL
  :

  lda PlayerJumpCancel
  beq :+
    lda PlayerVYH
    sta PlayerJumpCancel
  :
 
  lda PlayerWalkLock
  bne NotWalk
  ; handle left and right
  lda keydown
  and #KEY_LEFT
  beq NotLeft
    ldy #0
    sty PlayerDownTimer
    iny
    sty PlayerDir
    lda PlayerVXL
    cmp MaxSpeedLeft ; can be either run speed or walk speed
    beq NotLeft
    cmp #<-(NOVA_RUN_SPEED*16)
    beq NotLeft

    lda PlayerVXL
    bne :+
       dec PlayerVXH
  : sub #NOVA_ACCEL_SPEED
    sta PlayerVXL
NotLeft:

  lda keydown
  and #KEY_DOWN
  beq NotDown
    lda PlayerDownTimer
    cmp #60
    bcs YesDown
    inc PlayerDownTimer
    bne YesDown
  NotDown:
   lda #0
   sta PlayerDownTimer
  YesDown:

  lda keydown
  and #KEY_RIGHT
  beq NotRight
    lda #0
    sta PlayerDownTimer
    sta PlayerDir

    lda PlayerVXL
    cmp MaxSpeedRight ; can be either run speed or walk speed
    beq NotRight
    cmp #NOVA_RUN_SPEED*16
    beq NotRight

    lda PlayerVXL
    add #NOVA_ACCEL_SPEED
    sta PlayerVXL
    bne NotRight
      inc PlayerVXH
NotRight:
NotWalk:

  lda #NOVA_DECEL_SPEED ; adjust the deceleration speed if you're trying to turn around
  sta Temp
.if 1
  lda keydown
  and #KEY_LEFT
  beq :+
    lda PlayerVXH
    bmi IsMoving
    lsr Temp
  :
  lda keydown
  and #KEY_RIGHT
  beq :+
    lda PlayerVXL
    ora PlayerVXH
    beq Stopped
    lda PlayerVXH
    bpl IsMoving
    lsr Temp
  :
.endif
;  lda keydown
;  and #KEY_LEFT|KEY_RIGHT
;  bne IsMoving
    lda PlayerVXL
    ora PlayerVXH
    beq IsMoving
      lda PlayerVXH ; if negative, make positive
      and #128
      sta 0
      beq :+
        neg16 PlayerVXL, PlayerVXH
      :

      lda PlayerVXL
      sub Temp ;#NOVA_DECEL_SPEED
      sta PlayerVXL
      bcs @NotCarry
        dec PlayerVXH
        bpl @NotCarry
          lda #0
          sta PlayerVXH
          sta PlayerVXL
  @NotCarry:

      lda 0   ; if it was negative make negative again
      beq :+
        neg16 PlayerVXL, PlayerVXH
      :
Stopped:
IsMoving:

; fix walk speed if we just came out of a run
   lda PlayerVXL
   bit PlayerVXH
   bpl :+
     neg
   :
   cmp MaxSpeedRight
   beq NoFixWalkSpeed
   bcc NoFixWalkSpeed
   sub #NOVA_DECEL_SPEED
   bit PlayerVXH
   bpl :+
     neg
   :
   sta PlayerVXL
NoFixWalkSpeed:

  ; apply speed without caring if it's gonna push us into a wall or not
  lda PlayerPXL
  add PlayerVXL
  sta PlayerPXL
  lda PlayerPXH
  adc PlayerVXH
  sta PlayerPXH

  ; ------- FOUR CORNER COLLISION DETECTION -------
  ; http://pineight.com/mw/index.php?title=Four-corner_collision_detection

  ; Don't react to collision if off the top of the screen
  lda PlayerPYH
  rtsmi

  lda #M_SOLID_ALL
  sta BottomCMP
  lda PlayerVYH
  bmi :+
    lda #0
    sta PlayerJumping
    lda #M_SOLID_TOP
    sta BottomCMP
  :

  ; check blocks in the middle
  lda PlayerPYL
  add #<(16*16)
  lda PlayerPYH
  adc #>(16*16)
  tay
  sta TempSpace
  lda #$40
  add PlayerPXL
  lda PlayerPXH
  adc #0
  sta XForMiddle
  jsr GetLevelColumnPtr
  sta BlockMiddle
  tay

  ; A is going to get overwritten now so take this opportunity to update PlayerLocationNow/Last
  lda PlayerLocationNow
  sta PlayerLocationLast
  lda LevelBlockPtr
  sta PlayerLocationNow

  ; now check if it's a block with special behavior
  lda MetatileFlags,y
  and #M_BEHAVIOR
  cmp #M_SPECIAL_MISC
  bne DoneCheckMiddle
  tya ; Y contains the block ID, copy it back
  ldy TempSpace
  jsr DoSpecialMisc
DoneCheckMiddle:

  ; top
  lda PlayerPYL
  add #<(8*16)
  lda PlayerPYH
  adc #>(8*16)
  tay
  lda PlayerPXH
  jsr GetLevelColumnPtr
  sta BlockUL
  tax
  lda MetatileFlags,x
  cmp #$80
  rol FourCorners
  lda #$70
  add PlayerPXL            ; right side
  lda PlayerPXH
  adc #0
  jsr GetLevelColumnPtr
  sta BlockUR
  tax
  lda MetatileFlags,x
  cmp #$80
  rol FourCorners

  ;bottom
  lda PlayerPYL
  add #<(24*16)
  lda PlayerPYH
  adc #>(24*16)
  tay
  lda #$20 ; left side
  add PlayerPXL            ; left side
  lda PlayerPXH
  adc #0
  jsr GetLevelColumnPtr
  sta BlockLL
  tax
  lda MetatileFlags,x
  cmp BottomCMP
  rol FourCorners
  lda #$40
  add PlayerPXL            ; right side
  lda PlayerPXH
  adc #0
  jsr GetLevelColumnPtr
  sta BlockLR
  tax
  lda MetatileFlags,x
  cmp BottomCMP
  rol FourCorners

  ; Cancel the ladder if we move into a non-ladder thing
  lda PlayerOnLadder
  beq :+
  lda BlockMiddle
  cmp #Metatiles::LADDER
  beq :+
  cmp #Metatiles::LADDER_TOP
  beq :+
  lda BlockLL
  cmp #Metatiles::LADDER
  beq :+
  cmp #Metatiles::LADDER_TOP
  beq :+
  lda BlockLR
  cmp #Metatiles::LADDER
  beq :+
  cmp #Metatiles::LADDER_TOP
  beq :+
  lsr PlayerOnLadder
:
 
  ; Don't react to collision if told not to
  lda SkipFourCorners
  rtsne

  ; now call the right routine
  ldx FourCorners
  lda FourCornersH,x
  pha
  lda FourCornersL,x
  pha
  rts

HSpeedDirectionOffset:
  .byt $8f, 0

FourCornersL:
  .byt <(FC_____ -1), <(FC____R -1)
  .byt <(FC___L_ -1), <(FC___LR -1)
  .byt <(FC__R__ -1), <(FC__R_R -1)
  .byt <(FC__RL_ -1), <(FC__RLR -1)
  .byt <(FC_L___ -1), <(FC_L__R -1)
  .byt <(FC_L_L_ -1), <(FC_L_LR -1)
  .byt <(FC_LR__ -1), <(FC_LR_R -1)
  .byt <(FC_LRL_ -1), <(FC_LRLR -1)
FourCornersH:
  .byt >(FC_____ -1), >(FC____R -1)
  .byt >(FC___L_ -1), >(FC___LR -1)
  .byt >(FC__R__ -1), >(FC__R_R -1)
  .byt >(FC__RL_ -1), >(FC__RLR -1)
  .byt >(FC_L___ -1), >(FC_L__R -1)
  .byt >(FC_L_L_ -1), >(FC_L_LR -1)
  .byt >(FC_LR__ -1), >(FC_LR_R -1)
  .byt >(FC_LRL_ -1), >(FC_LRLR -1)

FC_____:
SavePosition:
  lda PlayerPXL
  sta PlayerNonSolidPXL
  lda PlayerPXH
  sta PlayerNonSolidPXH
  lda PlayerPYL
  sta PlayerNonSolidPYL
  lda PlayerPYH
  sta PlayerNonSolidPYH
  rts
FC__RL_:
FC_L__R:
FC_LR_R:
FC_LRL_:
  rts

FC_LRLR:
  lda PlayerNonSolidPXL
  sta PlayerPXL
  lda PlayerNonSolidPXH
  sta PlayerPXH
  lda PlayerNonSolidPYL
  sta PlayerPYL
  lda PlayerNonSolidPYH
  sta PlayerPYH
  rts

FC_L_LR:
  jsr FC___LR
  jmp FC_L_L_
FC__RLR:
  jsr FC___LR
  jmp FC__R_R

FC__R__:
  jsr BumpBlocksAbove
FC__R_R:
  lda #0
  sta PlayerVXL
  sta PlayerVXH
  lda #$8f
  sta PlayerPXL

  lda PlayerDir
  bne NoClimb
  lda #KEY_RIGHT
  sta ForceControllerBits
  lda BlockUR
  cmp #Metatiles::GROUND_CLIMB_L
  bne NoClimb
DoClimb:
    lda #<-1
    sta PlayerVYH
    lda #<-$40
    sta PlayerVYL
    lda #10
    sta PlayerJumpCancelLock
    lsr
    sta PlayerWalkLock
    lda #15
    sta ForceControllerTime
NoClimb:
  rts

FC_L___:
  jsr BumpBlocksAbove
FC_L_L_:
  lda #0
  sta PlayerVXL
  sta PlayerVXH
  sta PlayerPXL
  inc PlayerPXH
  lda PlayerDir
  beq NoClimb
  lda #KEY_LEFT
  sta ForceControllerBits
  lda BlockUL
  cmp #Metatiles::GROUND_CLIMB_R
  beq DoClimb
  rts

FC_LR__:
  lda #0
  sta PlayerVYH
  sta PlayerVYL

  jsr BumpBlocksAbove
  lda #SFX::BUMP
  jmp PlaySoundDebounce

BumpBlocksAbove: ; handle bumping into stuff
  lda PlayerJumping
  rtseq

  ; left
  lda PlayerPXH
  jsr BumpOneBlockAbove

  ; right
  lda PlayerPXL
  add #$70
  lda PlayerPXH
  adc #0
  jmp BumpOneBlockAbove

BumpOneBlockAbove:
  ldy PlayerPYH
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  and #M_BEHAVIOR
  sta TempVal ; store the behavior bits
  ldy PlayerPYH ; reload the Y position
  cmp #M_BRICKS
  jeq DoBreakBricks

  lda TempVal ; load the behavior bits again
  cmp #M_SPECIAL_CEILING
  jeq OpenPrize
  rts

FC___L_:
FC____R:
FC___LR:
  jsr SavePosition
  lsr PlayerOnLadder

  ; Should probably check for special ground,
  ; but so far spikes are the only type of it
  lda BlockLL
  cmp #Metatiles::SPIKES
  beq @Spikes
  lda BlockLR
  cmp #Metatiles::SPIKES
  beq @Spikes
  bne @NoSpikes
@Spikes:
  jsr HurtPlayer
@NoSpikes:

  ; Fall through a platform
  ldx BlockLL
  lda MetatileFlags,x
  ldx BlockLR
  cmp MetatileFlags,x
  bne NotFallthrough
    and #<~M_POST_PROCESS
    cmp #M_SOLID_TOP|M_FALLABLE_LEDGE
    bne NotFallthrough
      lda PlayerDownTimer
      cmp #8
      bcc NotFallthrough
        lda #KEY_DOWN
        sta ForceControllerBits
        lda #2
        sta ForceControllerTime
        rts
  NotFallthrough:

  ; Get on ladder from above
  lda BlockLL
  cmp #Metatiles::LADDER_TOP
  bne :+
  lda BlockLR
  cmp #Metatiles::LADDER_TOP
  bne :+
    lda PlayerDownTimer
    cmp #4
    bcc :+
     lda #KEY_DOWN
     sta ForceControllerBits
     lda #2
     sta ForceControllerTime
     rts
  :

  inc PlayerOnGround
  lda keydown
  and #KEY_B
  sta PlayerWasRunning

  lda #0
  sta PlayerVYH
  sta PlayerVYL

  lda PlayerPYL
  bmi :+
    dec PlayerPYH
  :

  lda #$80
  sta PlayerPYL

OfferJump:
  lda keynew
  and #KEY_A
  beq :+
    lda #0
    sta PlayerOnLadder
    lda #<(-$50)
    sta PlayerVYL
    lda #>(-$50)
    sta PlayerVYH
    inc PlayerJumping
    lda #SFX::JUMP
    jsr PlaySound
  :
  rts
LevelLinkStartYL:
  .byt 0, 0
LevelLinkStartYH:
  .byt 13, 1
BalloonOffsetLo:
  .byt <-$20, <$20
BalloonOffsetHi:
  .byt >-$20, >$20
.endproc
; -----------------------------
; END OF PLAYER HANDLING CODE
; -----------------------------
.proc DisplayPlayer
DrawX = 0
DrawY = 1
Attrib = 2
MiddleOffsetX = 3
DrawX2 = 4
  ; need to do this first even if we skip the drawing, because of PlayerDrawX and PlayerDrawY
  jsr MakeDrawX
  RealYPosToScreenPos PlayerPYL, PlayerPYH, DrawY

  ; skip drawing if off the top of the screen
  ; to do: clip off only the top of the player sprite?
  lda PlayerPYH
  bpl :+
    rts
  :

  ; check if the player's X is out of bounds,
  ; and fix it if it is
  lda DrawX
  cmp #$08
  bcs :+
    lda #$80
    sta PlayerPXL
    lda #0
    sta PlayerVXH
    sta PlayerVXL
    jsr MakeDrawX
  :
  lda DrawX
  cmp #$f0
  bcc :+
    dec PlayerPXH
    lda #$ff
    sta PlayerPXL
    lda #0
    sta PlayerVXH
    sta PlayerVXL
    jsr MakeDrawX
  :

  ; copy to PlayerDrawX and PlayerDrawY which are used for collision detection
  ; PlayerDrawY is also used for the coin display when you get coins
  lda DrawX
  sta PlayerDrawX
  lda DrawY
  sta PlayerDrawY

  ; if the player's invincible, flicker their sprite
  lda PlayerInvincible
  lsr
  bcc :+
    rts
  :

  ; okay now we want to actually draw the player
  lda #0
  sta MiddleOffsetX
  sta Attrib
  sta PlayerTiles+6
  sta PlayerAnimationFrame

  lda PlayerOnLadder
  beq :+
    ldy #$20
    bne CustomFrameBase
  :

  lda PlayerTailAttack
  beq :+
    tax
    lda TailAttackFrame,x
    sta PlayerAnimationFrame
  :

  lda PlayerAnimationFrame
  beq NormalFrame
  tay
  lda #$0f
  sta PlayerTiles+0
  lda #$01
  sta PlayerTiles+1
  lda AnimO,y
  ldx PlayerDir
  beq :+
  neg
: sta MiddleOffsetX
  lda Anim0,y
  sta PlayerTiles+2
  lda Anim1,y
  sta PlayerTiles+3
  lda Anim2,y
  sta PlayerTiles+4
  lda Anim3,y
  sta PlayerTiles+5
  lda Anim4,y
  sta PlayerTiles+6
  jmp NoSpecialAnimation
NormalFrame:
  ldy #$00
CustomFrameBase:
  sty PlayerTiles+0
  iny
  sty PlayerTiles+1
  iny
  sty PlayerTiles+2
  iny
  sty PlayerTiles+3
  iny
  sty PlayerTiles+4
  iny
  sty PlayerTiles+5
EndAnimationFrame:

  lda PlayerOnLadder
  jne NoSpecialAnimation
  lda PlayerJumping
  beq :+
    lda #$0c
    sta PlayerTiles+3
    lda #$08
    sta PlayerTiles+4
    lda #$09
    sta PlayerTiles+5
    jmp NoSpecialAnimation
  :

  lda PlayerOnGround
  beq :+
    lda PlayerDir
    sta PlayerDirForScroll
  :

  lda PlayerOnGround
  bne :+
    lda #$0d
    sta PlayerTiles+2
    lda #$0e
    sta PlayerTiles+3
    lda #$0a
    sta PlayerTiles+4
    lda #$0b
    sta PlayerTiles+5
    jmp NoSpecialAnimation
  :

  ; animate walking
  lda PlayerVXL
  ora PlayerVXH
  beq :+
    lda retraces
    and #%100
    beq :+
      lda #$06
      sta PlayerTiles+4
      lda #$07
      sta PlayerTiles+5
  :
NoSpecialAnimation:

  ; horizontally flip as the player moves up and down the ladder
  lda PlayerOnLadder
  beq :++
    lda keydown
    and #KEY_UP|KEY_DOWN
    beq :+
      lda retraces
      sta PlayerLadderMoveFrame
    :
    lda PlayerLadderMoveFrame
    and #%1000
    beq DoHorizTileFlip
    bne NoHorizTileFlip 
  :

; Draw balloon on top of player, if balloon is being used
  lda PlayerHasBalloon
  beq NoBalloon
  ldx OamPtr

  lda #$5c
  sta OAM_TILE+(4*0),x
  lda #$5d
  sta OAM_TILE+(4*1),x
  lda #OAM_COLOR_1
  sta OAM_ATTR+(4*0),x
  sta OAM_ATTR+(4*1),x

  lda DrawX
  sub #2
  ldy PlayerDir
  beq :+
    add #4
  :
  sta OAM_XPOS+(4*0),x
  sta OAM_XPOS+(4*1),x
  lda DrawY
  sta OAM_YPOS+(4*1),x
  sub #8
  sta OAM_YPOS+(4*0),x

  lda #$00
  sta PlayerTiles+0
  lda #$1f
  sta PlayerTiles+1
  lda #$02
  sta PlayerTiles+2
  lda #$2f
  sta PlayerTiles+3
  txa
  add #8
  sta OamPtr
NoBalloon:

  ; flip horizontally
  lda PlayerDir
  beq :+
DoHorizTileFlip:
    lda #OAM_XFLIP
    sta Attrib
    swapy PlayerTiles+0, PlayerTiles+1
    swapy PlayerTiles+2, PlayerTiles+3
    swapy PlayerTiles+4, PlayerTiles+5
  :
NoHorizTileFlip:
  lda PlayerOnLadder
  beq :+
    lda DrawX
    sub #4
    sta DrawX
    jmp SkipRegularXFlip
  :

  lda PlayerDir
  bne :+
    lda DrawX
    sub #8
    sta DrawX
  :
SkipRegularXFlip:
  lda DrawX
  sta DrawX2

  ldx OamPtr
  ldy #0     ; current sprite
PutSprite:
  lda PlayerTiles,y
  sta OAM_TILE,x

  lda DrawX
  add XPosList,y
  sta OAM_XPOS,x

  lda DrawY
  add YPosList,y
  sta OAM_YPOS,x

  cpy #1
  bne :+
    lda DrawX
    add MiddleOffsetX
    sta DrawX
  :

  lda Attrib
  sta OAM_ATTR,x
  inx
  inx
  inx
  inx
  iny
  cpy #6
  bne PutSprite
  stx OamPtr

  lda PlayerTiles+6
  beq NoExtraTile
  sta OAM_TILE,x
  ldy PlayerDir
  lda DrawX
  add ExtraTileX,y
  sta OAM_XPOS,x
  lda DrawY
  add #16
  sta OAM_YPOS,x
  lda Attrib
  sta OAM_ATTR,x
  inx
  inx
  inx
  inx
  stx OamPtr
NoExtraTile:

  lda CoinShowTimer
  beq NoCoinShow
    dec CoinShowTimer
    lda PlayerDrawY ; PlayerDrawY is offset to the center, so change the offset
    sub #12
    sta OAM_YPOS+(4*0),x
    sta OAM_YPOS+(4*1),x
    sta OAM_YPOS+(4*2),x
    sta OAM_YPOS+(4*3),x

    lda DrawX2
    sub #8
    sta OAM_XPOS+(4*0),x
    add #8
    sta OAM_XPOS+(4*1),x
    add #8
    sta OAM_XPOS+(4*2),x
    add #8
    sta OAM_XPOS+(4*3),x

    lda #0
    sta OAM_ATTR+(4*0),x
    sta OAM_ATTR+(4*1),x
    sta OAM_ATTR+(4*2),x
    sta OAM_ATTR+(4*3),x

    ldy Coins+0
    lda BCD99,y
    pha
    .repeat 4
      lsr
    .endrep
    add #$40
    sta OAM_TILE+(4*2),x
    pla
    and #$0f
    add #$40
    sta OAM_TILE+(4*3),x

    ldy Coins+1
    lda BCD99,y
    pha
    .repeat 4
      lsr
    .endrep
    add #$40
    sta OAM_TILE+(4*0),x
    pla
    and #$0f
    add #$40
    sta OAM_TILE+(4*1),x    

    txa
    add #16
    sta OamPtr
NoCoinShow:
  rts

XPosList: .byt 0, 8, 0, 8, 0,  8
YPosList: .byt 0, 0, 8, 8, 16, 16
ExtraTileX: .byt 16, <-8

Anim0: .byt $02, $10, $13, $15, $19 ;$20
Anim1: .byt $03, $11, $14, $16, $1a ;$21
Anim2: .byt $04, $12, $12, $17, $1b ;$22
Anim3: .byt $05, $05, $05, $18, $1c ;$23
Anim4: .byt $00, $00, $00, $00, $1d ;$24
AnimO: .byt   0,   0,   0,   2,   3 ;  4
TailAttackFrame:
  .byt 1, 1, 2, 2, 3, 3, 4, 4, 4, 3, 3, 2, 2, 1

MakeDrawX:
  RealXPosToScreenPos PlayerPXL, PlayerPXH, DrawX
  rts
; 00 01 | 0f 01 | 0f 01 | 0f 01 | 0f 01     | 0f 01
; 02 03 | 10 11 | 13 14 | 15 16 | 19 1a     | 20 21 
; 04 05 | 12 05 | 12 05 | 17 18 | 1b 1c 1d  | 22 23 24
.endproc

; Adds another coin to the counter, deals with BCD stuff and
; sets a timer to display the counter.
.proc AddCoin
  lda #60
  sta CoinShowTimer
  inc Coins
  lda Coins
  cmp #100
  bne :+
    lda #0
    sta Coins
    inc Coins+1
    lda Coins+1
    cmp #100
      bne :+
      lda #99
      sta Coins+1
  :
  rts
.endproc

.proc DoTailAttack
  lda PlayerAbility
  asl
  tax
  lda AbilityTable+1,x
  pha
  lda AbilityTable+0,x
  pha
  rts

AbilityTable:
  .raddr AbilityNone
  .raddr AbilityBlaster
  .raddr AbilityGlider
  .raddr AbilityBomb
  .raddr AbilityFire
  .raddr AbilityFirework
  .raddr AbilityNice
  .raddr AbilityBoomerang
  .raddr AbilityBall
  .raddr AbilityWater
  .raddr AbilityFan
  .raddr AbilityBurger

LimitObjectAmount:
; limits the number of projectiles to a given amount by aborting if it's already at the limit
  sta 0  ; 0 = limit
  ldx #0
  ldy #0 ; Y = counter for number of player projectiles
: lda ObjectF1,x
  and #<~1
  cmp #Enemy::PLAYER_PROJECTILE*2
  bne :+
  iny ; yes, this is a player projectile
  cpy 0
  bne :+
  pla ; abort
  pla
  rts
: inx
  cpx #ObjectLen
  bne :--
  rts

AbilityNone:
  ldy #PlayerProjectileType::STUN_STAR
  lda keydown
  and #KEY_UP
  beq :+
  ldy #PlayerProjectileType::COPY_ORB
: tya
  jsr MakeShot
  bcc Exit
  lda #$40
  jsr SetXVelocity
  lda #20/4
  sta ObjectTimer,x
Exit:
  rts
AbilityBlaster:
  lda #PlayerProjectileType::BLASTER_SHOT
  jsr MakeShot
  bcc @Exit
  lda #$40
  jsr SetXVelocity
  lda #50/4
  sta ObjectTimer,x
@Exit:
  rts
AbilityGlider:
  lda #4
  jsr LimitObjectAmount
  lda #PlayerProjectileType::LIFE_GLIDER
  jsr MakeShot
  bcc @Exit
  lda keydown
  and #KEY_UP
  sta ObjectF3,x
  lda #140/4
  sta ObjectTimer,x
@Exit:
  rts
AbilityBomb:
  lda #2
  jsr LimitObjectAmount
  lda #PlayerProjectileType::BOMB
  jsr MakeShotWide
  bcc @Exit
  lda #200/4
  sta ObjectTimer,x
  lda keydown
  and #KEY_UP|KEY_DOWN
  sta ObjectF3,x
  and #KEY_UP
  beq :+
    lda #$20
    jsr SetXVelocity
    lda #<-$40
    sta ObjectVYL,x
    lda #255
    sta ObjectVYH,x
    lsr ObjectTimer,x
  :
@Exit:
  rts
AbilityFire:
  lda #2
  jsr LimitObjectAmount
  lda #PlayerProjectileType::FIREBALL
  jsr MakeShotWide
  bcc @Exit
  lda #80/4
  sta ObjectTimer,x
  lda keydown
  and #KEY_UP
  beq :+
    lda #<-$40
    sta ObjectVYL,x
    lda #255
    sta ObjectVYH,x
: lda keydown
  and #KEY_DOWN
  bne :+
    lda #$20
    jsr SetXVelocity
@Exit:
: rts
AbilityFirework:
  lda #1
  jsr LimitObjectAmount
  lda #PlayerProjectileType::FIREWORK_CURSOR
  jsr MakeShot
  bcc @Exit
  lda #120/4
  sta ObjectTimer,x
  lda #$10
  jsr SetXVelocity
@Exit:
  rts
AbilityNice:
  lda #1
  jsr LimitObjectAmount
  lda #PlayerProjectileType::ICE_BLOCK
  jsr MakeShotWide
  bcc @Exit
  lda #80/4
  sta ObjectTimer,x
  lda #$30
  jsr SetXVelocity
@Exit:
  rts
AbilityBoomerang:
  rts
AbilityBall:
  lda #1
  jsr LimitObjectAmount
  lda #PlayerProjectileType::BALL
  jsr MakeShotWide
  bcc @Exit
  lda #80/4
  sta ObjectTimer,x
  lda #$30
  jsr SetXVelocity
@Exit:
  rts
AbilityWater:
  lda #PlayerProjectileType::WATER_BOTTLE
  jsr MakeShotWide
  bcc @Exit
  lda #48/4
  sta ObjectTimer,x

  ; Vary the speeds based on the directions pressed
  lda keydown
  lsr
  lsr
  and #3
  sta 0

  tay
  lda WaterHSpeeds,y  
  jsr SetXVelocity

  ldy 0
  lda WaterVSpeeds,y
  sta ObjectVYL,x
  lda #255
  sta ObjectVYH,x
@Exit:
  rts
; none, down, up, up+down
WaterHSpeeds: .byt $20, $10, $28, $20
WaterVSpeeds: .byt <-$40, <-$30, <-$50, <-$40

AbilityFan:
  lda #3
  jsr LimitObjectAmount
  lda #PlayerProjectileType::TORNADO
  jsr MakeShotWide
  bcc @Exit
  lda #80/4
  sta ObjectTimer,x
  lda #$30
  jsr SetXVelocity
@Exit:
  rts
AbilityBurger:
  lda #2
  jsr LimitObjectAmount
  lda #PlayerProjectileType::BURGER
  jsr MakeShotWide
  bcc @Exit
  lda #80/4
  sta ObjectTimer,x
  lda #$30
  jsr SetXVelocity
@Exit:
  rts

SetXVelocity:
  sta ObjectVXL,x
  tay
  lda #0
  sta ObjectVXH,x
  tya
  ldy PlayerDir
  beq :+
  neg
  sta ObjectVXL,x
  lda #255
  sta ObjectVXH,x
: rts

MakeShotCommon:
  jsr ObjectClearX
  lda 0
  sta ObjectF2,x
  lda PlayerPYH
  adc #0
  sta ObjectPYH,x
  rts

MakeShotWide:
  sta 0
  jsr FindFreeObjectX
  bcs :+
  clc
  rts
: lda #Enemy::PLAYER_PROJECTILE*2
  sta ObjectF1,x
  jsr MakeShotCommon
  lda PlayerPYL
  add #8*16
  sta ObjectPYL,x
  ldy PlayerDir
  beq Right
Left16Wide:
  lda PlayerPXL
  sta ObjectPXL,x
  lda PlayerPXH
  sub #1
  sta ObjectPXH,x
  sec
  rts

MakeShot:
  sta 0
  jsr FindFreeObjectX
  bcs :+
  clc
  rts
: lda PlayerDir
  ora #Enemy::PLAYER_PROJECTILE*2
  sta ObjectF1,x
  jsr MakeShotCommon
  lda PlayerPYL
  add #13*16
  sta ObjectPYL,x
  ldy PlayerDir
  beq Left
Right:
  lda PlayerPXL
  add #$80
  sta ObjectPXL,x
  lda PlayerPXH
  adc #0
  sta ObjectPXH,x
  sec
  rts
Left:
  lda PlayerPXL
  sub #8
  sta ObjectPXL,x
  lda PlayerPXH
  sbc #0
  sta ObjectPXH,x
  sec
  rts
.endproc
