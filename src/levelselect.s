; Princess Engine
; Copyright (C) 2016-2018 NovaSquirrel
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
.proc ShowLevelSelect
CurLevel = 9
CurrentAngle = 10
TempAngle = 11
IsSpinning = 12
NovaDirection = 13
IconNum = 14
WorldTimes8 = 15

  ldx #255 ; reinitialize stack pointer just in case
  txs

  ; Make the inventory have the correct information
;  lda SavedAbility
;  sta PlayerAbility
  jsr CopyFromSavedInventory

; Stop any music that was playing
  jsr StopSoundFar ; uses a trampoline

; Initialize PPU stuff
  jsr WaitVblank
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_0000
  sta PPUCTRL
  lda #0
  sta PPUMASK
  jsr ClearOAM
  lda #2
  sta OAM_DMA

  lda #$0f
  jsr ClearNameCustom

; Upload graphics and palette
  jsr ClearBG4kb
  lda #GraphicsUpload::CHR_LEVELSEL
  jsr DoGraphicUpload
  jsr WaitVblank
  lda #$0f
  sta LevelBackgroundColor
  lda #GraphicsUpload::PAL_LEVELSEL
  jsr DoGraphicUpload
; Write text
  ldx #4
  lda #>Instructions1
  ldy #<Instructions1
  jsr vwfPutsAtRow
  ldx #5
  lda #>Instructions2
  ldy #<Instructions2
  jsr vwfPutsAtRow

  ; Write last row with the world number
  lda #>Instructions4
  ldy #<Instructions4
  jsr CopyToStringBuffer
  lda StartedLevelNumber ; World
  lsr
  lsr
  lsr
  add #'1'
  sta StringBuffer+11
  jsr clearLineImg
  ldx #0
  jsr vwfPutsBuffer
  ldy #0
  lda #7
  jsr copyLineImg

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_0000
  sta PPUCTRL

; Write text in middle
  lda #$21
  sta PPUADDR
  lda #$ac
  sta PPUADDR
  ldy #$40
  ldx #9
  jsr WriteIncreasing
  lda #$21
  sta PPUADDR
  lda #$cc
  sta PPUADDR
  ldy #$50
  ldx #9
  jsr WriteIncreasing
  lda #$21
  sta PPUADDR
  lda #$ec
  sta PPUADDR
  ldy #$70
  ldx #9
  jsr WriteIncreasing

; Turn the screen on now
  jsr WaitVblank
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_0000
  sta PPUCTRL
  lda #0
  sta PPUSCROLL
  lda #<-5
  sta PPUSCROLL
  lda #OBJ_ON|BG_ON
  sta PPUMASK

; Get ready for main loop
  lda StartedLevelNumber
  and #%000111
  sta CurLevel
  asl
  asl
  eor #255 ; Negate
  sec
  adc #24
  and #31
  sta CurrentAngle
  lda #0
  sta NovaDirection
  sta IsSpinning
  lda #255
  sta IntroShownAlready

  lda StartedLevelNumber
  and #%111000
  sta WorldTimes8
  lsr
  lsr
  lsr
  sta CurWorld

; Main loop
Loop:
  jsr WaitVblank
  lda #2
  sta OAM_DMA
  jsr ReadJoy
  jsr ClearOAM

  lda IsSpinning
  jne NoKeyCheck
  lda keynew
  and #KEY_B
  jne ShowMainMenu

  lda keynew
  and #KEY_A
  beq :+
    .ifndef DEBUG
      lda WorldTimes8
      ora CurLevel
      jsr IndexAToBitmap
      and LevelAvailable,y
      beq :+
    .endif
    lda CurLevel
    ora WorldTimes8
    sta StartedLevelNumber
    jmp ShowPreLevel
  :
.if 0
  lda keynew
  and #KEY_START
  beq :+
    lda LevelCleared
    bpl :+
    jsr WaitVblank
    lda #0
    sta PPUMASK
    lda WorldTimes8
    ora CurLevel
    sta StartedLevelNumber
    jsr UploadNovaAndCommon
;    inc LevelSelectInventory
;    jmp PauseScreen
    jmp ShowShop
  :
.endif
  lda keynew
  and #KEY_LEFT
  beq :+
    lda #1
    sta NovaDirection
    dec CurLevel
    jmp EndSpinStart
  :
  lda keynew
  and #KEY_UP
  beq :+
    ldy CurWorld
    cpy #7
    beq :+ ; Can't go past last world
    lda LevelAvailable+1,y
    beq :+ ; Can't go past last available world
    lda StartedLevelNumber
    add #8
    and #%111000
    sta StartedLevelNumber
    jmp ShowLevelSelect
  :
  lda keynew
  and #KEY_DOWN
  beq :+
    lda CurWorld ; Can't go before first world
    beq :+
    lda StartedLevelNumber
    sub #8
    and #%111000
    sta StartedLevelNumber
    jmp ShowLevelSelect
  :
  lda keynew
  and #KEY_RIGHT
  beq :+
    lsr NovaDirection
    inc CurLevel
EndSpinStart:
    lda #4
    sta IsSpinning
    lda CurLevel
    and #7
    sta CurLevel
  :
  jmp YesKeyCheck
NoKeyCheck:
  ; Currently spinning? Then change the angle
  ; every other frame
  lda retraces
  lsr
  bcc YesKeyCheck
  dec IsSpinning
  lda CurrentAngle
  ldy NovaDirection
  add AngleChangeForDir,y
  sta CurrentAngle
YesKeyCheck:

; Draw Nova sprite
  ldx #0
  lda NovaDirection
  asl
  asl
  asl
  asl
  tay
: lda NovaSprite,y
  sta $200,x
  iny
  inx
  cpx #16
  bne :-
  stx OamPtr

  ; animate the Nova sprite
  lda IsSpinning
  beq NotSpinningDontAnimate
  lda retraces
  lsr
  and #3
  tay
  lda OAM_TILE+(4*0)
  add NovaSpriteFrames,y
  sta OAM_TILE+(4*0)
  lda OAM_TILE+(4*1)
  adc NovaSpriteFrames,y
  sta OAM_TILE+(4*1)
  lda OAM_TILE+(4*2)
  adc NovaSpriteFrames,y
  sta OAM_TILE+(4*2)
  lda OAM_TILE+(4*3)
  adc NovaSpriteFrames,y
  sta OAM_TILE+(4*3)
NotSpinningDontAnimate:

  lda CurrentAngle
  sta TempAngle
  lda #0
  sta IconNum
  lda #8
  sta 6
DrawLoop:
  lda TempAngle
  pha
  add #4
  sta TempAngle
  pla
  and #31
  tax
  jsr DrawLevelIcon
  inc IconNum

  dec 6
  bne DrawLoop

  jmp Loop

; Pre-calculated sprite data to put right in OAM
NovaSprite:
  ; Facing right
  .byt 32, $10, 0, 120-2
  .byt 32+8, $11, 0, 120-2
  .byt 32, $12, 0, 128-2
  .byt 32+8, $13, 0, 128-2
  ; Facing left
  .byt 32, $12, OAM_XFLIP, 120+2
  .byt 32+8, $13, OAM_XFLIP, 120+2
  .byt 32, $10, OAM_XFLIP, 128+2
  .byt 32+8, $11, OAM_XFLIP, 128+2
NovaSpriteFrames:
  .byt 0, 4, 0, 8
AngleChangeForDir:
  .byt <-1, 1

; inputs: X (angle)
DrawLevelIcon:
  lda #$2c ; default to unavailable icon
  sta 0
  ldy OamPtr
  lda CosineTable,x
  sta 1
  add #(256/2)-8
  sta OAM_XPOS+(4*0),y
  sta OAM_XPOS+(4*1),y
  add #8
  sta OAM_XPOS+(4*2),y
  sta OAM_XPOS+(4*3),y
  jsr Lda1AsrAsrNegAdd1
  add #(256/2)-4
  sta OAM_XPOS+(4*4),y

  lda SineTable,x
  sta 1
  add #(240/2)-8
  sta OAM_YPOS+(4*0),y
  sta OAM_YPOS+(4*2),y
  add #8
  sta OAM_YPOS+(4*1),y
  sta OAM_YPOS+(4*3),y
  jsr Lda1AsrAsrNegAdd1
  add #(240/2)-4
  sta OAM_YPOS+(4*4),y

  ; Look up the right attributes and tiles to use
  pushay

  lda #0
  sta 2

  lda IconNum
  ora WorldTimes8
  jsr IndexAToBitmap
  pha ; save mask to reuse it
  pha
  and LevelCleared,y
  cmp #1
  rol 2
  pla
  and LevelAvailable,y
  cmp #1
  rol 2

  pla ; if the collectible item was obtained, it overrides the icon
  and LevelCleared,y
  and CollectibleBits,y
  beq :+
    lda #2
    sta 2
  :

  lda 2 ; Tile is this value * 4 + $20 
  tay
  asl
  asl
  ora #$20
  sta 0

  lda IconPalettes,y
  sta 2

  pullay

  lda 2
  sta OAM_ATTR+(4*0),y
  sta OAM_ATTR+(4*1),y
  sta OAM_ATTR+(4*2),y
  sta OAM_ATTR+(4*3),y
  ; Attribute for number
  lda #OAM_COLOR_3
  sta OAM_ATTR+(4*4),y

  ; Write tiles
  lda 0
  sta OAM_TILE+(4*0),y
  add #1
  sta OAM_TILE+(4*1),y
  adc #1
  sta OAM_TILE+(4*2),y
  adc #1
  sta OAM_TILE+(4*3),y
  lda IconNum
  add #2
  sta OAM_TILE+(4*4),y
  tya
  add #4*5
  sta OamPtr
  rts

IconPalettes:
  .byt OAM_COLOR_3, OAM_COLOR_1, OAM_COLOR_2, OAM_COLOR_2

Lda1AsrAsrNegAdd1:
  lda 1
  asr
  asr
  eor #255
  sec ; +1 for the negate
  adc 1
  rts

Instructions1:
  .byt "- Level Select -",0
Instructions2:
  .byt "  A: Start level",0
Instructions3:
  .byt " Start: Items/Shop",0
Instructions4:
  .byt "   ( World 1 )",0
.endproc
