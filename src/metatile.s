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

; palettes get their own byte
M_PAL_0 = %00000000
M_PAL_1 = %01010101
M_PAL_2 = %10101010
M_PAL_3 = %11111111

.enum
M_EMPTY           ; no special behaviors
M_FALLABLE_LEDGE  ; ledges you can fall through
M_WATER           ; any sort of water
M_SPECIAL_MISC    ; doors, springs
M_SPECIAL_WALL    ; locks, pushable blocks
M_SPECIAL_CEILING ; ? blocks
M_SPECIAL_GROUND  ; spikes
M_ICE             ; thaws to fire
M_BRICKS          ; breakable bricks
M_LAVA            ;
M_COLLECTIBLE     ; coins
M_MINETRACK       ; regular horizontal track
; must not have more than 32 entries
.endenum

M_SOLID_ALL =      %10000000 ; this block is solid on all sides
M_SOLID_TOP =      %01000000 ; this block is solid only on the top
M_POST_PROCESS =   %00100000 ; this block needs to be postprocessed
M_BEHAVIOR =       %00011111 ; mask for the block's behavior only

; MetatilePalettes, MetatileFlags
; MetatileUL, MetatileUR, MetatileLL, MetatileLR

.proc IsBlockSolid
  sty TempVal+2
  tay
  lda MetatileFlags,y
  ldy TempVal+2
  and #M_SOLID_ALL
  rts
.endproc

.proc RenderLevelScreens
  lda #0
  sta PPUMASK
  sta IsScrollUpdate

  ; Clear block updates
  ldx #4
: sta TileUpdateA1,x
  sta BlockUpdateA1,x ; overruns a little but it's OK
  dex
  bpl :-

  ; Clear sprites
  jsr ClearOAM
  lda #2
  sta OAM_DMA
 
  ; Immediately set the correct scroll value
  lda PlayerPXL
  sta ScrollX+0
  lda PlayerPXH
  sub #8
  bcs :+
    lda #0
    sta ScrollX+0
: sta ScrollX+1

  ; Check for scroll locks and adjust for them
  ; Get the screen first
  lda PlayerPXH
  lsr
  lsr
  lsr
  lsr
  tax
  lda PlayerPXH
  and #$0f
  cmp #8
  bcs @OnRight
@OnLeft:
  lda PlayerPXH
  cmp ScrollX+1
  beq @OnSkip
  lda ScreenFlags+0,x
  lsr
  bcc @OnSkip
    lda PlayerPXH
    and #$f0
    sta ScrollX+1
    lda #0
    sta ScrollX+0
  jmp @OnSkip
@OnRight:
  lda ScreenFlags+1,x
  lsr
  bcc @OnSkip
    lda ScrollX+1
    and #$f0
    sta ScrollX+1
    lda #0
    sta ScrollX+0
@OnSkip:

  lda JustTeleported
  beq DidntTeleport
.scope
  Low = 14
  High = 15
  ; Object stuff ----
  ; Clear objects
  lda #0
  sta JustTeleported
  ldy #ObjectLen-1
: sta ObjectF1,y
  dey
  bpl :-

  lda CarryingPickupBlock
  beq NoPickupBlock
  jsr FindFreeObjectY
  bcc NoSlotForPickupBlock ; should never fail because objects were just cleared
  lda #Enemy::POOF*2
  sta ObjectF1,y
  lda PlayerPXH
  sta ObjectPXH,y
  lda PlayerPYH
  sta ObjectPYH,y
  lda #PoofSubtype::CARRYABLE_BLOCK
  sta ObjectF2,y
  bne NoPickupBlock
NoSlotForPickupBlock:
  lda #0
  sta CarryingPickupBlock
NoPickupBlock:

  ; Try to spawn enemies
  ; - get low column
  lda ScrollX+1
  sub #4
  bcs :+
    lda #0
  :
  sta Low
  ; - get high column
  lda ScrollX+1
  add #25
  bcc :+
    lda #255
  :
  sta High
  ; Now look through the list
  ldy #0
EnemyLoop:
  lda SpriteListRAM,y
  cmp #255
  beq Exit
  cmp Low
  bcc Nope
  cmp High
  bcs Nope
  jsr TryMakeSprite
Nope:
  iny
  iny
  iny
  bne EnemyLoop
Exit:
.endscope
DidntTeleport:

  lda BackgroundBoss
  jne RenderBackgroundBoss

  ; Start writing chunks
  lda ScrollX+1
  lsr
  sub #2
  sta 15  ; Current chunk
  lda #13
  sta 14  ; Counter
: lda 15
  jsr RenderLevel32Wide
  inc 15
  dec 14
  bne :-

  jmp UpdateScrollRegister
.endproc

; Render a 32 pixel wide chunk
; Very similar to the scrolling code
; input: A (level chunk number)
; locals: 2, 3, 4, 5, 6, 7, more
.proc RenderLevel32Wide
LPointer = ScrollLevelPointer
; ThirtyUpdateAddr ; big endian
LevelIndex = 2 ; index for (ScrollLevelPointer),y
AttrIndex = 3
Chunk = 4
Temp = 5
RPointer = 6
  sta Chunk

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL

  ; Multiply to get the level pointer
  lda #6>>1 ; this 6 will get shifted over to become $60
            ; so that the pointer starts from $6000
  sta LPointer+1
  lda Chunk
  .repeat 5
    asl
    rol LPointer+1
  .endrep
  sta LPointer
  ; Make another pointer that's one column to the right
  ora #16
  sta RPointer+0
  lda LPointer+1
  sta RPointer+1

  ; Make the PPU address
  lda Chunk
  asl
  asl
  and #31
  sta ThirtyUpdateAddr+1
  lda Chunk
  and #%1000 ; becomes 0 or 4
  lsr
  ora #$20   ; $20xx or $24xx
  sta ThirtyUpdateAddr+0

; -------------------------------
; START OF ATTRIBUTE TABLE CODE
; -------------------------------
  ldy #0        ; Start at the top of the column
  sty AttrIndex ; and start of the attributes array
LoopAttr:
  ; top left corner of attribute byte
  lda (LPointer),y
  tax
  lda MetatilePalettes,x
  and #%00000011
  sta Temp
  ; top right corner of attribute byte
  lda (RPointer),y
  tax
  lda MetatilePalettes,x
  and #%00001100
  ora Temp
  sta Temp
  iny
  ; bottom left corner of attribute byte
  lda (LPointer),y
  tax
  lda MetatilePalettes,x
  and #%00110000
  ora Temp
  sta Temp
  ; top right corner of attribute byte
  lda (RPointer),y
  tax
  lda MetatilePalettes,x
  and #%11000000
  ora Temp
  iny

  ; store the attribute byte we just built
  ldx AttrIndex
  sta AttributeWriteD,x
  inx
  stx AttrIndex
  cpx #8
  bne LoopAttr

  ; make attribute addresses
  lda Chunk
  and #7
  sta Temp
  ldx #3
: lda AttributeAddrsLo,x
  ora Temp
  sta AttributeWriteA2,x
  dex
  bpl :-

  ; Make high address for all the attribute writes,
  ; which will be on the same nametable as the tile updates
  lda ThirtyUpdateAddr+0
  ora #3
  sta AttributeWriteA1

  ; Write attributes
  .repeat 4, I
    lda AttributeWriteA1
    sta PPUADDR
    lda AttributeWriteA2+I
    sta PPUADDR
    lda AttributeWriteD+I
    sta PPUDATA
    lda AttributeWriteD+I+4
    sta PPUDATA
  .endrep
; -------------------------------
; END OF ATTRIBUTE TABLE CODE
; -------------------------------

  jsr UpdateScrollBufferLeft
  jsr Write30
  jsr UpdateScrollBufferRight
  jsr Write30
  lda RPointer+0
  sta LPointer+0
  jsr UpdateScrollBufferLeft
  jsr Write30
  jsr UpdateScrollBufferRight
  jmp Write30

Write30:
  ldx #0
  lda ThirtyUpdateAddr+0
  sta PPUADDR
  lda ThirtyUpdateAddr+1
  sta PPUADDR
: lda ThirtyUpdateTile,x
  sta PPUDATA
  inx
  cpx #30
  bne :-
  inc ThirtyUpdateAddr+1
  rts
AttributeAddrsLo:
  .byt $c0, $c8, $d0, $d8
.endproc

.proc RenderBackgroundBoss
  lda #0
  sta PPUMASK
  sta IsScrollUpdate

  bit PPUSTATUS
  jsr ClearName
  jsr ClearNameRight

  ; Go through the list of strips
  ; to draw Jack Stone onscreen
  ldy #0
Loop:
  lda Strips+0,y
  beq Done
  sta PPUADDR
  lda Strips+1,y
  sta PPUADDR
  ldx Strips+3,y
  lda Strips+2,y
  ; Push to the next strip
  iny
  iny
  iny
  iny
  sty 0 ; save Y for the next loop iteration
  tay

  jsr WriteIncreasing

  ldy 0
  bne Loop
Done:
  rts

Strips:
  .dbyt $2000+(20*32+28)
  .byt $80, 3
  .dbyt $2000+(21*32+28)
  .byt $90, 3
  .dbyt $2000+(22*32+28)
  .byt $a0, 3
  .dbyt $2000+(23*32+28)
  .byt $b0, 3
  .dbyt $2000+(24*32+27)
  .byt $83, 5
  .dbyt $2000+(25*32+27)
  .byt $93, 5
  .dbyt $2000+(26*32+27)
  .byt $a3, 5
  .dbyt $2000+(27*32+27)
  .byt $b3, 5
  .dbyt $2000+(28*32+28)
  .byt $88, 3
  .dbyt $2000+(29*32+28)
  .byt $98, 3
  ; attribute bytes
  .dbyt $23ef
  .byt %10101010, 1
  .dbyt $23f6
  .byt %11111111, 1
  .dbyt $23f7
  .byt %11111111, 1
  .dbyt $23ff
  .byt %11111111, 1
  .byt 0
.endproc
