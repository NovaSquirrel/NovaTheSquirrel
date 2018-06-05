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

.proc RunPlayer
  jsr UpdateStatus
  jmp HandlePlayer
.endproc

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

; Draw the chip for a chip collecting level if needed
  lda ChipsNeeded
  beq :+
  lda #$5f
  sta OAM_TILE,y
  lda #OAM_COLOR_1
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y
  sta OAM_ATTR+(4*2),y
  lda #15
  sta OAM_YPOS+(4*0),y
  sta OAM_YPOS+(4*1),y
  sta OAM_YPOS+(4*2),y
  lda #15+16
  sta OAM_XPOS+(4*0),y
  lda #15+24
  sta OAM_XPOS+(4*1),y
  lda #15+32
  sta OAM_XPOS+(4*2),y

  ldx ChipsNeeded
  lda BCD99,x
  pha
  .repeat 4
    lsr
  .endrep
  add #$40
  sta OAM_TILE+(4*1),y
  pla
  and #$0f
  add #$40
  sta OAM_TILE+(4*2),y

; Move OAM pointer forward
  tya
  add #12
  tay
:

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
SkipTop = TempSpace+3
;BlockMiddle = TempSpace+4 - moved to its own variable
XForMiddle  = TempSpace+5
OldPlayerSwimming = TempSpace+6
BottomCMP = 7
SkipFourCorners = 8
MaxSpeedLeft = 9
MaxSpeedRight = 10
  lda PlayerSwimming
  sta OldPlayerSwimming
  lda #0
  sta PlayerOnGround
  sta SkipTop
  sta FourCorners
  sta SkipFourCorners
  sta PlayerSwimming

  lda ForceControllerTime
  beq :+
    dec ForceControllerTime
    lda keydown
;    and #<~(KEY_LEFT|KEY_RIGHT)
    ora ForceControllerBits
    sta keydown
  :

  lda PlayerWasRunning ; nonzero = B button, only updated when on ground
  beq :+
    lda NovaRunSpeedL ;<-(NOVA_RUN_SPEED*16)
    sta MaxSpeedLeft
    lda NovaRunSpeedR ;NOVA_RUN_SPEED*16
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
    lda PlayerHasBalloon ; (but height limit can be removed)
    bmi :+
    lda PlayerPYH
    cmp #$02
    bcc @LetGo
:   ; Also if they touch something solid above
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
    lda #0
    sta PlayerHasBalloon
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

; Water physics
  ldy BlockMiddle
  lda MetatileFlags,y
  and #M_BEHAVIOR
  cmp #M_WATER
  bne NotWater
    lda #0
    sta PlayerWasRunning
    inc PlayerSwimming

    lda #0
    sta PlayerVYL
    sta PlayerVYH

    lda keydown ; A goes up fast
    and #KEY_A
    beq :+
      lda #<(-$40)
      sta PlayerVYL
      lda #>(-$40)
      sta PlayerVYH
    :
    lda keydown ; up goes up
    and #KEY_UP
    beq :+
      lda #<(-$20)
      sta PlayerVYL
      lda #>(-$20)
      sta PlayerVYH
    :
    lda keydown ; down goes down
    and #KEY_DOWN
    beq :+
      lda #<($20)
      sta PlayerVYL
      lda #>($20)
      sta PlayerVYH
    :
    jsr OfferJump

    jmp PlayerIsntOnLadder
  NotWater:

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
  sta PlayerPYH
SkipApplyGravity:

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
  lda PlayerHasBalloon
  bne :+

  lda #InventoryItem::AUTO_BALLOON
  jsr InventoryHasItem
  bcc DieInPit
  inc PlayerHasBalloon
  jsr RemoveOneItem
  jmp NotOffTopBottom

DieInPit:
  lda #0
  sta PlayerHealth

  jmp NotOffTopBottom
LevelLinkNonzero:
  ; A = item from LevelLinkUp or LevelLinkDown
  asl
  asl
  asl
  asl
  add PlayerPXH
  sta PlayerPXH

  inc NeedLevelRerender
  inc JustTeleported
  lda LevelLinkStartYL,y
  sta PlayerPYL
  lda LevelLinkStartYH,y
  sta PlayerPYH

  ; Clear out the delayed metatile change list
  ldx #MaxDelayedMetaEdits-1
ClearDelayed:
  lda DelayedMetaEditIndexHi,x
  beq @NotPresent
    lda DelayedMetaEditIndexHi,x
    sta LevelBlockPtr+1
    lda DelayedMetaEditIndexLo,x
    sta LevelBlockPtr+0
    lda DelayedMetaEditType,x
    ldy #0
    sta (LevelBlockPtr),y
    tya ; A = 0
    sta DelayedMetaEditIndexHi,x ; Don't need to clear the rest
@NotPresent:
  dex
  bpl ClearDelayed
NotOffTopBottom:

  countdown PlayerJumpCancelLock
  countdown PlayerWalkLock
  countdown PlayerInvincible
  countdown JumpGracePeriod

  lda PlayerLeftRightLock
  beq :+
    lda keydown
    and #<~(KEY_LEFT|KEY_RIGHT)
    sta keydown
    dec PlayerLeftRightLock
  :

.if 0
  ; Mirror ability automatically rapid-fires if you hold down the button
  lda PlayerAbility
  cmp #AbilityType::MIRROR
  bne :+
    lda keydown
    and #KEY_B
    ora keynew
    sta keynew
    lda keylast
    and #<~KEY_B
    sta keylast
  :
.endif

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
  ; shooting while moving left/right okay if explicitly enabled, if on tap run, or if jumping
  lda SavedShootWhileWalking
  bne OkayIfLeftRight
  lda SavedRunStyle
  bne OkayIfLeftRight
  lda PlayerJumping
  bne OkayIfLeftRight
  lda keylast
  and #KEY_B|KEY_LEFT|KEY_RIGHT
  bne :+
OkayIfLeftRight:
  lda keynew+1
  and #KEY_SNES_X | KEY_SNES_A
  bne PressedAOrX
  lda keynew
  and #KEY_B
  beq :+
PressedAOrX:
    lda keydown
    sta AttackKeyDownSnapshot
    lda keydown+1
    sta AttackKeyDownSnapshot+1

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
    jsr EnemyPosToVel
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
    lda #1
    sta PlayerDir
    lda PlayerVXL
    cmp MaxSpeedLeft ; can be either run speed or walk speed
    beq NotLeft
    cmp #<-(NOVA_RUN_SPEED*16)
    beq NotLeft

    lda PlayerVXL
    bne :+
       dec PlayerVXH
  : sub NovaAccelSpeed
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
   sta DownLockFromRideable
  YesDown:

  lda keydown
  and #KEY_RIGHT
  beq NotRight
    lda #0
    sta PlayerDir
    lda PlayerVXL
    cmp MaxSpeedRight ; can be either run speed or walk speed
    beq NotRight
    cmp #NOVA_RUN_SPEED*16
    beq NotRight

    lda PlayerVXL
    add NovaAccelSpeed
    sta PlayerVXL
    bne NotRight
      inc PlayerVXH
NotRight:
NotWalk:

  lda NovaDecelSpeed ; adjust the deceleration speed if you're trying to turn around
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
      sub Temp ; Deceleration speed
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

; if the player is moving too fast for the walk or run, decelerate
   ldy PlayerVXH ; test if the X speed is negative by checking sign of high byte
   bpl :+        ; 
     neg16 PlayerVXL, PlayerVXH ; take absolute value
   :
   lda PlayerVXL
   cmp MaxSpeedRight
   beq NoFixWalkSpeed ; if at or less than the max speed, don't fix
   bcc NoFixWalkSpeed
   sub NovaDecelSpeed ; \
   sta PlayerVXL      ;  decrease by deceleration speed and carry over to the high byte
   subcarry PlayerVXH ; /
NoFixWalkSpeed:
   cpy #128 ; Y still holds old X velocity high byte. check if it was negative before
   bcc :+
     neg16 PlayerVXL, PlayerVXH ; fix the X velocity back to being negative
   :
; walk speed now fixed if needed

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
  cmp #255
  bne :+
    lda #0
    sta BlockUL
    sta BlockUR
    inc SkipTop
    bne TopWasSkipped
  :
  lda PlayerPYH
  bpl :+
    jsr CheckMiddle ; most of this is unused except for checking for ceiling barriers
    jmp SkipFourCornersEntirely
  :
TopWasSkipped:

  lda #M_SOLID_ALL
  sta BottomCMP
  lda PlayerVYH
  bmi :+
    lda #0
    sta PlayerJumping
    lda #M_SOLID_TOP
    sta BottomCMP
  :

  jsr CheckMiddle

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

  lda SkipTop
  bne SkipTheTop
  ; top
  lda PlayerPYL
  add #<(8*16)
  lda PlayerPYH
  adc #>(8*16)
  pha ; save Y index so DoSpecialWall isn't required to preserve it
  tay
  lda PlayerPXH
  jsr GetLevelColumnPtr
  sta BlockUL
  jsr DoCollectible
  tax
  lda MetatileFlags,x
  cmp #$80
  rol FourCorners ; rotate in the solidity bit
  and #<~M_POST_PROCESS ; erase the postprocess bit
  cmp #M_SOLID_ALL|M_SOLID_TOP|M_SPECIAL_WALL
  bne :+
    lda BlockUL
    jsr DoSpecialWall
  :
  pla ; get Y index back
  tay
  lda #$70
  add PlayerPXL            ; right side
  lda PlayerPXH
  adc #0
  jsr GetLevelColumnPtr
  sta BlockUR
  jsr DoCollectible
  tax
  lda MetatileFlags,x
  cmp #$80
  rol FourCorners ; rotate in the solidity bit
  and #<~M_POST_PROCESS ; erase the postprocess bit
  cmp #M_SOLID_ALL|M_SOLID_TOP|M_SPECIAL_WALL
  bne :+
    lda BlockUR
    jsr DoSpecialWall
  :
SkipTheTop:

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
  jsr DoCollectible
  jsr DoSpecialGround
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
  jsr DoCollectible
  jsr DoSpecialGround
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
  cmp #Metatiles::ROPE
  beq :+
  lda BlockLL
  cmp #Metatiles::LADDER
  beq :+
  cmp #Metatiles::LADDER_TOP
  beq :+
  cmp #Metatiles::ROPE
  beq :+
  lda BlockLR
  cmp #Metatiles::LADDER
  beq :+
  cmp #Metatiles::LADDER_TOP
  beq :+
  cmp #Metatiles::ROPE
  beq :+
  lsr PlayerOnLadder
:
 
  ; Don't react to collision if told not to
  ; Currently only used by the spring?
  lda SkipFourCorners
  rtsne

  ; If the player is standing on something, clear PlayerNeedsGround
  lda FourCorners
  and #%0011
  beq :+
    lda #0
    sta PlayerNeedsGround
  :

  lda PlayerRidingSomething
  beq :+
    lda FourCorners
    ora #%0011
    sta FourCorners
  :

  ; now call the right routine
  ldx FourCorners
  lda FourCornersH,x
  pha
  lda FourCornersL,x
  pha
SkipFourCornersEntirely:
  rts

CheckMiddle:
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

  pha
  ; also check for a ceiling barrier
  ldy #0
  lda (LevelBlockPtr),y
  cmp #Metatiles::CEILING_BARRIER
  bne :+
  lda PlayerPYH
  bpl :+
  lda #0
  sta PlayerPYH
  sta PlayerPYL
  sta PlayerVYH
  lda #$40
  sta PlayerVYL
:
  pla
  tay
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
  lda JumpGracePeriod
  beq :+
    jsr OfferJumpFromGracePeriod
  :
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
FC_LR_R:
FC_LRL_:
  rts


UnstuckX:
  .lobytes -1, -1, -1,  0, 0, 1,  1, 1
  .lobytes -2, -2, -2,  0, 0, 2,  2, 2
  .lobytes -3, -3, -3,  0, 0, 3,  3, 3
UnstuckY:
  .lobytes  0, -1,  1, -1, 1, 0, -1, 1
  .lobytes  0, -2,  2, -2, 2, 0, -2, 2
  .lobytes  0, -3,  3, -3, 3, 0, -3, 3
FC__RL_:
FC_L__R:
FC_LRLR:
  ; Attempt to find a position near the player that isn't solid
  ldx #0
  stx PlayerVYL
  stx PlayerVYH
UnstuckLoop:
  lda PlayerPYL
  add #<(16*16)
  lda PlayerPYH
  adc #>(16*16)
  add UnstuckY,x
  cmp #15
  bcs Nope
  tay
  lda #$40
  add PlayerPXL
  lda PlayerPXH
  adc UnstuckX,x
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  bpl FoundOne
Nope:
  inx
  cpx #24
  bne UnstuckLoop
  ; Didn't find a free spot, just push right instead as a last resort
  lda PlayerPXL
  add #$10
  sta PlayerPXL
  addcarry PlayerPXH
FoundOne:
  lda PlayerPYL
  sta PlayerNonSolidPYL
  lda PlayerPYH
  add UnstuckY,x
  sta PlayerNonSolidPYH

  lda PlayerPXL
  sta PlayerNonSolidPXL
  lda PlayerPXH
  add UnstuckX,x
  sta PlayerNonSolidPXH

  .if 0
  lda PlayerNonSolidPXL
  sta PlayerPXL
  lda PlayerNonSolidPXH
  sta PlayerPXH
  lda PlayerNonSolidPYL
  sta PlayerPYL
  lda PlayerNonSolidPYH
  sta PlayerPYH
  .endif

  .if 1
  Difference = 0
; -----------------------------------
  lda PlayerNonSolidPXL
  sbc PlayerPXL
  sta Difference+0
  lda PlayerNonSolidPXH
  sbc PlayerPXH
  ; and divide by 4 for smoothing
  asr
  ror Difference+0
  asr
  ror Difference+0
  sta Difference+1

  lda Difference+0
  adc PlayerPXL
  sta PlayerPXL
  lda Difference+1
  adc PlayerPXH
  sta PlayerPXH
; -----------------------------------
  lda PlayerNonSolidPYL
  sbc PlayerPYL
  sta Difference+0
  lda PlayerNonSolidPYH
  sbc PlayerPYH
  ; and divide by 4 for smoothing
  asr
  ror Difference+0
  asr
  ror Difference+0
  sta Difference+1

  lda Difference+0
  adc PlayerPYL
  sta PlayerPYL
  lda Difference+1
  adc PlayerPYH
  sta PlayerPYH
  .endif
  rts

FC_L_LR:
  jsr FC___LR
  jmp FC_L_L_
FC__RLR:
  jsr FC___LR
  jmp FC__R_R

CheckLR:
  lda PlayerPYL
  add #<(24*16)
  lda PlayerPYH
  adc #>(24*16)
  tay
  lda #$80
  add PlayerPXL
  lda PlayerPXH
  adc #0
  jsr GetLevelColumnPtr
  tax
  lda MetatileFlags,x
  rts

CheckLL:
  lda PlayerPYL
  add #<(24*16)
  lda PlayerPYH
  adc #>(24*16)
  tay
  lda PlayerPXL
  sub #1
  lda PlayerPXH
  sbc #0
  jsr GetLevelColumnPtr
  tax
  lda MetatileFlags,x
  rts

FC__R__:
  jsr BumpBlocksAbove
  lda #0
  sta PlayerVXL
  sta PlayerVXH

  lda PlayerVYH
  bpl :+
  jsr CheckLR
  bmi :+
    lda #0
    sta PlayerVYL
    sta PlayerVYH
  :
  jsr CheckLL
  bmi :+
    lda #$8f
    sta PlayerPXL
  :
  rts

FC__R_R:
  lda #$8f
  sta PlayerPXL
  lda #0
  sta PlayerVXL
  sta PlayerVXH
  rts

FC_L___:
  jsr BumpBlocksAbove
  lda #0
  sta PlayerVXL
  sta PlayerVXH

  lda PlayerVYH
  bpl :+
  jsr CheckLL
  bmi :+
    lda #0
    sta PlayerVYL
    sta PlayerVYH
  :
  jsr CheckLR
  bmi :+
    lda #0
    sta PlayerPXL
    inc PlayerPXH
  :
  rts

FC_L_L_:
  lda #0
  sta PlayerPXL
  inc PlayerPXH
  lda #0
  sta PlayerVXL
  sta PlayerVXH
  rts

FC_LR__:
  lda #0
  sta PlayerVYH
  sta PlayerVYL

  jsr BumpBlocksAbove
  lda PlayerSwimming
  bne :+
  lda #SFX::PLAYER_BUMP
  jmp PlaySoundDebounce
:
  rts
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

  lda NeedCollectibleBitSet ; delayed
  beq :+
    lsr NeedCollectibleBitSet
    ldy StartedLevelNumber
    jsr IndexToBitmap
    ora CollectibleBits,y 
    sta CollectibleBits,y
  :

  ; Fall through a platform
  ; (do the left and right floors have the same flags?)
  ldx BlockLL
  lda MetatileFlags,x
  and #<~M_POST_PROCESS
  sta Temp

  ldx BlockLR
  lda MetatileFlags,x
  and #<~M_POST_PROCESS
  cmp Temp
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

  ; Set "Player on ground" flag
  inc PlayerOnGround

  ; If player started running via tap, keep running
  ; and don't let the B button being unpressed stop it.
  lda RunStartedWithTap
  bne :+
    lda keydown
    and #KEY_B
    sta PlayerWasRunning
  :

  lda SavedRunStyle
  beq RunStyleWasB
RunStyleTap:
  ; Double-tap to run
  countdown TapRunTimer

  ; If you press in a different direction than
  ; when you started running, you're not running
  lda keydown
  and #KEY_LEFT|KEY_RIGHT
;  beq :+
  cmp TapRunKey
  bne RunCancel

  ; If you let go you're no longer running
  lda keydown
  and #KEY_LEFT|KEY_RIGHT
  bne :+
    lda PlayerWasRunning
    beq :+
RunCancel:
      lda PlayerWasRunning
      php
      lda #0
      sta PlayerWasRunning
      sta RunStartedWithTap
      plp
      beq :+
      sta TapRunTimer
  :

  ; Set the timer if you press the button and the timer isn't going
  lda keynew
  and #KEY_LEFT|KEY_RIGHT
  beq :+
    ldy TapRunTimer   ; Is the tap timer going?
    beq @SetTapTimer  ; Nope
    lda #1
    sta PlayerWasRunning
    sta RunStartedWithTap
    bne :+
@SetTapTimer:         ; Start the tap timer
    sta TapRunKey
    lda #15
    sta TapRunTimer
:

RunStyleWasB:

  lda #0
  sta PlayerVYH
  sta PlayerVYL

  lda PlayerRidingSomething
  cmp #2
  beq @SkipSnap
  lda PlayerPYL
  bmi :+
    dec PlayerPYH
  :

  lda #$80
  sta PlayerPYL
@SkipSnap:

OfferJump:
  lda #JUMP_GRACE_PERIOD_LENGTH
  sta JumpGracePeriod
OfferJumpFromGracePeriod:
  lda keynew
  and #KEY_A
  beq :+
    lda #0
    sta PlayerOnLadder
    sta JumpGracePeriod
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

  lda PlayerRidingSomething
  sta PlayerRidingSomethingLast
  lda #0
  sta PlayerRidingSomething

  ; skip drawing if too far off the top of the screen
  lda PlayerPYH
  cmp #255
  beq :+
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

  ldx PlayerTailAttack
  beq :+
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

  ; Animate holding something
  lda CarryingSunKey
  ora CarryingPickupBlock
  beq :+
    lda PlayerOnLadder
    bne :+
    lda #$1f
    sta PlayerTiles+1
    lda #$2f
    sta PlayerTiles+3
  :
EndAnimationFrame:

  ; Animate swimming
  lda PlayerSwimming
  beq :+
    lda retraces
    lsr
    lsr
    lsr
    and #1
    tay
    lda SwimmingFeet1,y
    sta PlayerTiles+4
    lda SwimmingFeet2,y
    sta PlayerTiles+5
    jmp NoSpecialAnimation
  :

  lda PlayerOnLadder
  jne NoSpecialAnimation
  lda PlayerJumping
  beq :+
    lda #$0c
    sta PlayerTiles+3
JumpingTilesForSwimming:
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
    lsr
    lsr
    and #%11
    tay
    lda WalkFrameMR,y
    sta PlayerTiles+3
    lda WalkFrameBL,y
    sta PlayerTiles+4
    lda WalkFrameBR,y
    sta PlayerTiles+5
.if 0 ; old walk animation code
    lda retraces
    and #%100
    beq :+
      lda #$06
      sta PlayerTiles+4
      lda #$07
      sta PlayerTiles+5
.endif
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
    cmp #220        ; don't display if too far off the screen
    bcs NoCoinShow
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
SwimmingFeet1: .byt $8, $a
SwimmingFeet2: .byt $9, $b

; up left and up right always $00, $01
; middle left always $02
WalkFrameMR: .byt $30, $31, $30, $32
WalkFrameBL: .byt $04, $33, $35, $33
WalkFrameBR: .byt $05, $34, $36, $37

MakeDrawX:
  RealXPosToScreenPos PlayerPXL, PlayerPXH, DrawX
  rts
; 00 01 | 0f 01 | 0f 01 | 0f 01 | 0f 01     | 0f 01
; 02 03 | 10 11 | 13 14 | 15 16 | 19 1a     | 20 21 
; 04 05 | 12 05 | 12 05 | 17 18 | 1b 1c 1d  | 22 23 24
.endproc

.proc DoTailAttack
; Make sure nothing overwrites PressedUp or PressedDown or else it will crash the game
PressedUp = 10
PressedDown = 11
  ; Break bricks first
  lda PlayerPYH
  tay
  iny
  ldx PlayerDir
  lda PlayerPXL
  add XOffsetL,x
  lda PlayerPXH
  adc XOffsetH,x
  jsr GetLevelColumnPtr
  sty 0
  tay
  lda MetatileFlags,y
  and #M_BEHAVIOR
  cmp #M_BRICKS
  bne :+
  ldy 0           ; Reload Y position
  jsr DoBreakBricks
  jmp WasBricks
: ; not bricks? try for item block
  cmp #M_SPECIAL_CEILING
  bne :+
  ldy 0           ; Reload Y position
  jsr OpenPrize
:
WasBricks:

  lda AttackKeyDownSnapshot
  and #KEY_UP
  sta PressedUp
  lda AttackKeyDownSnapshot+1
  and #KEY_SNES_X
  ora PressedUp
  sta PressedUp

  lda AttackKeyDownSnapshot
  and #KEY_DOWN
  sta PressedDown
  lda AttackKeyDownSnapshot+1
  and #KEY_SNES_A
  ora PressedDown
  sta PressedDown

  ; Okay, actually do the attack now
  ; Launch the routine for the ability
  lda PlayerAbility
  asl
  tax
  lda AbilityTable+1,x
  pha
  lda AbilityTable+0,x
  pha
  rts

XOffsetL: .byt <($80), <(-$40)
XOffsetH: .byt >($80), >(-$40)

AbilityTable:
  .raddr AbilityNone
  .raddr AbilityBlaster
  .raddr AbilityGlider
  .raddr AbilityBomb
  .raddr AbilityFire
  .raddr AbilityFirework
  .raddr AbilityNice
  .raddr AbilityBoomerang
  .raddr AbilityMirror
  .raddr AbilityWater
  .raddr AbilityFan
  .raddr AbilityBurger

LimitObjectAmount:
; limits the number of projectiles to a given amount by aborting if it's already at the limit
  sta 0  ; 0 = limit

  lda InfiniteProjectileCheat
  beq :+
  rts
:

  ldx #0
  ldy #0 ; Y = counter for number of player projectiles
: lda ObjectF1,x
  and #<~1
  cmp #Enemy::PLAYER_PROJECTILE*2
  bne :+
  iny ; yes, this is a player projectile
  cpy 0
  bne :+
  pla
  pla
  ; if there's too many then just do a regular stun instead
  lda #0
  sta PressedUp
  sta PressedDown
  jmp AbilityNone
: inx
  cpx #ObjectLen
  bne :--
  rts

AbilityNone:
  ldy #PlayerProjectileType::STUN_STAR
  lda PressedUp
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
  lda PressedUp
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
  lda PressedUp
  ora PressedDown
  beq :+
    lsr ObjectTimer,x
    lda #1
    sta ObjectF3,x
  :

  lda PressedUp
  beq :+
    lda #$20
    jsr SetXVelocity
    lda #<-$40
    sta ObjectVYL,x
    lda #255
    sta ObjectVYH,x
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
  lda PressedUp
  beq :+
    lda #<-$40
    sta ObjectVYL,x
    lda #255
    sta ObjectVYH,x
: lda PressedDown
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
  sta ObjectF3,x

  lda PressedUp
  beq :+
  lda #$10
  sta ObjectF3,x
  lda #<-($40)
  sta ObjectVYL,x
  lda #>-($40)
  sta ObjectVYH,x
:

  lda PressedDown       ; down+B: ice ride
  beq :+
;  lda PlayerNeedsGround ; only allow one ice ride before touching the ground
;  bne :+
  jsr RideOnProjectile
:
@Exit:
  rts
AbilityBoomerang:
  lda #2
  jsr LimitObjectAmount
  lda #PlayerProjectileType::BOOMERANG
  jsr MakeShot
  bcc @Exit
  lda #56/4
  sta ObjectTimer,x

  lda PressedUp
  ora PressedDown
  bne @NoXVelocity
  lda #$30
  jsr SetXVelocity
@Exit:
  rts
@NoXVelocity:
  lda PressedUp
  beq :+
  lda #<(-$30)
  sta ObjectVYL,x
  lda #>(-$30)
  sta ObjectVYH,x
: lda PressedDown
  beq :+
  lda #<($30)
  sta ObjectVYL,x
  lda #>($30)
  sta ObjectVYH,x
: rts

AbilityMirror:
  lda #3
  jsr LimitObjectAmount
  lda #PlayerProjectileType::MIRROR
  jsr MakeShot
  bcc @Exit
  lda #20/4 ;40/4
  sta ObjectTimer,x
; Look like the mirror ability in Kirby. Unused because you can't really aim it?
;  jsr huge_rand
;  and #$0f
;  sub #$08
;  sta ObjectVYL,x
;  sex
;  sta ObjectVYH,x

  lda #$30 ;18
  jsr SetXVelocity
@Exit:
  rts
AbilityWater:
  lda #PlayerProjectileType::WATER_BOTTLE
  jsr MakeShotWide
  bcc @Exit
  lda #48/4
  sta ObjectTimer,x

  lda #0
  sta 0
  lda PressedUp
  cmp #1
  rol 0
  lda PressedDown
  cmp #1
  rol 0
  ldy 0

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

  ; Up/down control acceleration
  lda #1
  sta ObjectF4,x
  lda PressedUp
  beq :+
    lda #3
    sta ObjectF4,x
  :
  lda PressedDown
  beq :+
    lda #0
    sta ObjectF4,x
  :

  lda #30/4
  sta ObjectTimer,x
  lda #$2c
  jsr SetXVelocity
@Exit:
  rts
AbilityBurger:
  lda #2
  jsr LimitObjectAmount
  lda #PlayerProjectileType::BURGER
  jsr MakeShotWide
  bcc @Exit
  lda #40/4
  sta ObjectTimer,x

  lda PressedDown           ; down+B: burger ride
  beq :+
  lda PlayerOnLadder
  bne :+
  lda InfiniteProjectileCheat
  bne @BurgerOK
  lda PlayerNeedsGround ; only allow one burger ride before touching the ground
  bne :+
@BurgerOK:
  jsr RideOnProjectile
:
  lda #$30
  jsr SetXVelocity
@Exit:
  rts

RideOnProjectile:
  inc PlayerNeedsGround
  inc DownLockFromRideable

  lda PlayerPYL
  sta 0
  lda PlayerPYH
  sta 1

  ldy PlayerDir
  lda PlayerPXL
  sub @XOffset,y
  sta ObjectPXL,x

  lda PlayerPXH
  sbc #0
  sta ObjectPXH,x

  lda ObjectPYL,x
  sub #$80
  sta PlayerPYL
  lda ObjectPYH,x
  sbc #$01
  sta PlayerPYH

  lda #0
  sta PlayerVYL
  sta PlayerVYH

  ; Don't push into ceilings
  lda PlayerPYL
  add #$80
  lda PlayerPYH
  adc #0
  tay
  lda PlayerPXL
  add #$40
  lda PlayerPXH
  adc #0
  jsr GetLevelColumnPtr
  tay
  lda MetatileFlags,y
  bpl @NotPushedIntoCeiling
    ; restore the Y position
    lda 0
    sta PlayerPYL
    lda 1
    sta PlayerPYH
@NotPushedIntoCeiling:
  rts
@XOffset:
 .byt $70, $10

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
  lda PlayerPYH
  adc #0
  sta ObjectPYH,x
  ldy PlayerDir
  beq Right
Left16Wide:
  lda PlayerPXL
  sta ObjectPXL,x
  lda PlayerPXH
  sub #1
  sta ObjectPXH,x
  inc ObjectF1,x
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
  lda PlayerPYH
  adc #0
  sta ObjectPYH,x
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
  sub #$40
  sta ObjectPXL,x
  lda PlayerPXH
  sbc #0
  sta ObjectPXH,x
  sec
  rts
.endproc
