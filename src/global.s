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

; Calculates a horizontal and vertical speed from a speed and an angle
; input: A (speed) Y (angle, 0-31)
; output: 0,1 (X position), 2,3 (Y position)
.proc SpeedAngle2Offset
Angle = 4
Speed = 5
  sty Angle
  sta Speed

  lda CosineTable,y    ; Horizontal speed uses cosine
  php                  ; Save the sign bit
  abs                  ; Take the absolute value
  ldy Speed
  jsr mul8             ; Multiply the speed and cosine value
  sty 0
  sta 1
  plp                  ; If it was originally negative, make it negative again
  bpl :+
  neg16 0, 1
:

  ldy Angle
  lda SineTable,y      ; Vertical speed uses sine
  php                  ; Save the sign bit
  abs                  ; Take the absolute value
  ldy Speed
  jsr mul8             ; Multiply the speed and sine value
  sty 2
  sta 3
  plp                  ; If it was originally negative, make it negative again
  bpl :+
  neg16 2, 3
:
  rts
.endproc

; Calculates a horizontal and vertical speed from a speed and an angle
; input: A (speed) Y (angle, 0-31)
; output: 0,1 (X position), 2,3 (Y position)
.proc SpeedAngle2OffsetHalf
Angle = 4
Speed = 5
  sty Angle
  sta Speed

  lda CosineTable,y    ; Horizontal speed uses cosine
  php                  ; Save the sign bit
  abs                  ; Take the absolute value
  lsr
  ldy Speed
  jsr mul8             ; Multiply the speed and cosine value
  sty 0
  sta 1
  plp                  ; If it was originally negative, make it negative again
  bpl :+
  neg16 0, 1
:

  ldy Angle
  lda SineTable,y      ; Vertical speed uses sine
  php                  ; Save the sign bit
  abs                  ; Take the absolute value
  lsr
  ldy Speed
  jsr mul8             ; Multiply the speed and sine value
  sty 2
  sta 3
  plp                  ; If it was originally negative, make it negative again
  bpl :+
  neg16 2, 3
:
  rts
.endproc

; Calculates a horizontal and vertical speed from a speed and an angle
; input: A (speed) Y (angle, 0-31)
; output: 0,1 (X position), 2,3 (Y position)
.proc SpeedAngle2OffsetQuarter
Angle = 4
Speed = 5
  sty Angle
  sta Speed

  lda CosineTable,y    ; Horizontal speed uses cosine
  php                  ; Save the sign bit
  abs                  ; Take the absolute value
  lsr
  lsr
  ldy Speed
  jsr mul8             ; Multiply the speed and cosine value
  sty 0
  sta 1
  plp                  ; If it was originally negative, make it negative again
  bpl :+
  neg16 0, 1
:

  ldy Angle
  lda SineTable,y      ; Vertical speed uses sine
  php                  ; Save the sign bit
  abs                  ; Take the absolute value
  lsr
  lsr
  ldy Speed
  jsr mul8             ; Multiply the speed and sine value
  sty 2
  sta 3
  plp                  ; If it was originally negative, make it negative again
  bpl :+
  neg16 2, 3
:
  rts
.endproc

; quick way to convert the numbers 0 to 99 from binary to decimal
.proc BCD99
  .byt $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19
  .byt $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39
  .byt $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59
  .byt $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $70, $71, $72, $73, $74, $75, $76, $77, $78, $79
  .byt $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99
.endproc

WritePPURepeated16:
  ldx #16
; Write "A" to the PPU "X" times
.proc WritePPURepeated
: sta PPUDATA
  dex
  bne :-
  rts
.endproc

; Changes the player ability and uploads the new graphics for its projectiles
; as well as the ability icon.
; input: A (new ability)
; locals: TempVal, TempVal+1, TempVal+2
.proc ChangePlayerAbility
Pointer = TempVal+0
  pha
  lda #SOUND_BANK
  jsr _SetPRG
  lda #SFX::GET_ABILITY
  jsr pently_start_sound
  pla
WithoutSFX:
  sta PlayerAbility
; Because the graphics will be rewritten, erase all player projectiles.
  ldx #0
  stx PlayerAbilityVar

  ldx #ObjectLen-1
: lda ObjectF1,x
  and #<~1
  cmp #Enemy::PLAYER_PROJECTILE*2
  bne :+
  lda #0
  sta ObjectF1,x
: dex
  bpl :--

; Ability graphics are in the graphics bank
  lda #GRAPHICS_BANK1
  jsr _SetPRG

; Calculate pointer to the ability icon
  lda #0
  sta Pointer+1
  lda PlayerAbility ; 4 tiles * 16 bytes each = 64, so multiply by 64
  .repeat 6
    asl
    rol Pointer+1
  .endrep
  add #<AbilityIcons
  sta Pointer+0
  lda Pointer+1
  adc #>AbilityIcons
  sta Pointer+1

; Write to ability icon in VRAM
  ldy #0
  jsr Copy64FromPointer
  jsr WaitVblank
  lda #>$14c0
  sta PPUADDR
  lda #<$14c0
  sta PPUADDR
  jsr UploadTilesAndUpdateScroll

; Calculate pointer to ability tiles
  ldx PlayerAbility
  lda AbilityLengths,x
  beq NoExtraTiles
  ; don't store length since we're always copying 128 tiles

  lda #0
  sta Pointer+1
  lda AbilityOffsets,x ; multiply by 16
  .repeat 4
    asl
    rol Pointer+1
  .endrep
  add #<AbilityGfx
  sta Pointer+0
  lda Pointer+1
  adc #>AbilityGfx
  sta Pointer+1

; Write projectile tiles
  ldy #0
  jsr Copy64FromPointer
  jsr WaitVblank
  lda #>$1700
  sta PPUADDR
  lda #<$1700
  sta PPUADDR
  jsr UploadTilesAndUpdateScroll

  jsr Copy64FromPointer
  jsr WaitVblank
  lda #>$1700+64
  sta PPUADDR
  lda #<$1700+64
  sta PPUADDR
  jsr UploadTilesAndUpdateScroll
NoExtraTiles:

; Restore the old bank
  jmp SetPRG_Restore

; Copy 64 bytes (4 tiles) into the UploadTileSpace
Copy64FromPointer:
  ldx #0
: lda (Pointer),y
  sta UploadTileSpace,x
  iny
  inx
  cpx #64
  bne :-
  rts

; Do one round of the updates
UploadTilesAndUpdateScroll:
  jsr UploadFourTiles
  jmp UpdateScrollRegister
.endproc
ChangePlayerAbilityWithoutSFX = ChangePlayerAbility::WithoutSFX

; Updates PPUSCROLL and PPUCTRL to account for ScrollX
; locals: 0
.proc UpdateScrollRegister
  lda BackgroundBoss
  bne OverrideScroll
  lda ScrollX+1
  sta 0
  lda ScrollX
  .repeat 4
    lsr 0
    ror
  .endrep
  sta PPUSCROLL
  lda #0
  sta PPUSCROLL
  lda PlaceBlockInLevel ; if in block placing mode, sprites use background tiles
  and #%01000000
  bne BGSprites
  lda 0
  and #1 ; bit 0 is most significant bit of scroll
  ora #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  rts
BGSprites:
  lda 0
  and #1 ; bit 0 is most significant bit of scroll
  ora #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_0000
  sta PPUCTRL
  rts
OverrideScroll:
  lda BackgroundBossScrollX
  sta PPUSCROLL
  lda BackgroundBossScrollY
  sta PPUSCROLL
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  rts
.endproc

; Damages the player
.proc HurtPlayer
  lda PlayerHealth
  beq :+
  lda PlayerInvincible
  bne :+
  dec PlayerHealth
  lda #SFX::HURT
  sta NeedSFX
  lda #160
  sta PlayerInvincible
: rts
.endproc

; Does a collision check on two rectangles
; input: TouchTopA/B, TouchLeftA/B, TouchWidthA/B, TouchHeightA/B
; output: carry (rectangles are overlapping)
.proc ChkTouchGeneric
  ; http://atariage.com/forums/topic/71120-6502-killer-hacks/page-3?&#entry1054049
; X positions
  lda TouchWidthB
  sub #1
  sta TouchTemp
  add TouchWidthA
  sta TouchTemp2  ; carry now clear

  lda TouchLeftA
  sbc TouchLeftB ; Note will subtract n-1
  sbc TouchTemp  ;#SIZE2-1
  adc TouchTemp2 ;#SIZE1+SIZE2-1 ; Carry set if overlap
  bcc No

; Y positions
  lda TouchHeightB
  sub #1
  sta TouchTemp
  add TouchHeightA
  sta TouchTemp2   ; carry now clear

  lda TouchTopA
  sbc TouchTopB  ; Note will subtract n-1
  sbc TouchTemp  ;#SIZE2-1
  adc TouchTemp2 ;#SIZE1+SIZE2-1 ; Carry set if overlap
  bcc No

  sec
  rts
No:
  clc
  rts
.endproc

.ifdef REAL_COLLISION_TEST
; Does a collision check on two objects, based on their real positions and not just screen positions
; input: x (object 1), y (object 2), TouchWidthA/B, TouchHeightA/B (widths/height measured subpixels)
; output: carry (objects are overlapping)
.proc ChkTouchObjects
TempPos = TouchTemp    ; \ freely usable because only the other collision routine uses these
TempLength = TouchTopA ; /
; rect1.x < rect2.x + rect2.width
; fail if: rect1.x >= rect2.x + rect2.width
  lda ObjectPXL,y
  add TouchWidthB
  sta TempPos+0
  lda ObjectPXH,y
  adc TouchWidthB2
  sta TempPos+1

  lda ObjectPXH,x
  cmp TempPos+1
  bcc :+
  bne No
  lda ObjectPXL,x
  cmp TempPos+0
  bcs No
:

; rect1.x + rect1.width > rect2.x
; fail if: rect2.x >= rect1.x + rect1.width
  lda ObjectPXL,x
  add TouchWidthA
  sta TempPos+0
  lda ObjectPXH,x
  adc TouchWidthA2
  sta TempPos+1

  lda ObjectPXH,y
  cmp TempPos+1
  bcc :+
  bne No
  lda ObjectPXL,y
  cmp TempPos+0
  bcs No
:

; rect1.y < rect2.y + rect2.height
; fail if: rect1.y >= rect2.y + rect2.height
  lda ObjectPYL,y
  add TouchHeightB
  sta TempPos+0
  lda ObjectPYH,y
  adc TouchHeightB2
  sta TempPos+1

  lda ObjectPYH,x
  cmp TempPos+1
  bcc :+
  bne No
  lda ObjectPYL,x
  cmp TempPos+0
  bcs No
:

; rect1.height + rect1.y > rect2.y
; fail if: rect2.y >= rect1.height + rect1.y
  lda ObjectPYL,x
  add TouchHeightA
  sta TempPos+0
  lda ObjectPYH,x
  adc TouchHeightA2
  sta TempPos+1

  lda ObjectPYH,y
  cmp TempPos+1
  bcc :+
  bne No
  lda ObjectPYL,y
  cmp TempPos+0
  bcs No
:

Yes:
  sec
  rts
No:
  clc
  rts
.endproc
.endif

; Read the controller and update keydown
.proc ReadJoy
  lda keydown
  sta keylast

  ; Reset the controller by writing a 1 and then a 0
  lda #1
  sta keydown
  sta JOY1
  lda #0
  sta JOY1

  ; Loop for the first controller byte
: lda JOY1
  and #$03 ; Shift in a bit if either of the two bottom bits
  cmp #1   ; are 1. The Famicom can use either bit.
  rol keydown
  bcc :-

  ; Don't read a second byte if it's NES
  lda SNESController
  beq Finish

SNES:
  lda keydown+1
  sta keylast+1

  lda #1
  sta keydown+1
  ; Loop for the second controller byte
: lda JOY1
  and #$03 ; Shift in a bit if either of the two bottom bits
  cmp #1   ; are 1. The Famicom can use either bit.
  rol keydown+1
  bcc :-

  lda keylast+1
  eor #255
  and keydown+1
  sta keynew+1

Finish:
  ; keynew lists keys that are pressed but weren't pressed last frame
  lda keylast
  eor #255
  and keydown
  sta keynew
  rts
.endproc

; Only read 8 bits from the controller
.proc ReadJoy8bits
  lda #1
  sta 0
: lda JOY1
  and #$03 ; Shift in a bit if either of the two bottom bits
  cmp #1   ; are 1. The Famicom can use either bit.
  rol 0
  bcc :-
  lda 0
  rts
.endproc

; delay until the next vblank by waiting for NMI to change retraces
.proc WaitVblank
  lsr LagFrame
  lda retraces
: cmp retraces
  beq :-
  rts
.endproc

; clear the nametable (including attributes)
.proc ClearName
  lda #$3f ; clear tile
Custom:
  ldx #$20
  ldy #$00
  stx PPUADDR
  sty PPUADDR
AddressSet:
  ldx #64
  ldy #4
: sta PPUDATA
  inx
  bne :-
  dey
  bne :-
;Clear the attributes
  ldy #64
  lda #0
: sta PPUDATA
  dey
  bne :-
  sta PPUSCROLL
  sta PPUSCROLL
  rts
.endproc
ClearNameCustom = ClearName::Custom

; clear the second (right) nametable
.proc ClearNameRight
  lda #$3f
Custom:
  ldx #$24
  ldy #$00
  stx PPUADDR
  sty PPUADDR
  jmp ClearName::AddressSet
.endproc
ClearNameRightCustom = ClearNameRight::Custom

; Wait for any key to be pressed
.proc WaitForKey
: jsr WaitVblank
  jsr ReadJoy
  lda keydown
  beq :-
  lda keylast
  bne :-
  rts
.endproc

; ORA BitSelect,x to turn on bit x
.proc BitSelect
 .byt %00000001
 .byt %00000010
 .byt %00000100
 .byt %00001000
 .byt %00010000
 .byt %00100000
 .byt %01000000
 .byt %10000000
.endproc

; AND BitCancel,x to turn off bit x
; might actually be unused
.proc BitCancel
 .byt %11111110
 .byt %11111101
 .byt %11111011
 .byt %11110111
 .byt %11101111
 .byt %11011111
 .byt %10111111
 .byt %01111111
.endproc

; For a bit array stored as a sequence of bytes,
; finds the byte a particular bit is stored in and gives a mask for manipulating just that bit
; input: Y (bit number)
; output: Y (index), A (mask)
; locals: TempVal+1
.proc IndexToBitmap
  tya
UseA:
  pha
  lsr
  lsr
  lsr
  sta TempVal+1
  pla
  and #7
  tay
  lda BitSelect,y
  ldy TempVal+1
  rts
.endproc
IndexAToBitmap = IndexToBitmap::UseA

; sets the Y position for every sprite to an offscreen value
.proc ClearOAM
  lda #$f8
  ldy #0
  sty OamPtr
: sta OAM_YPOS,y
  iny
  iny
  iny
  iny
  bne :-
  rts
.endproc

; figures out which sprite slot has the currently needed graphics
; and sets A to the base tile for that slot.
; input: A (graphic number, from the graphics list)
; output: A (base tile)
.proc DetectSpriteSlot
  cmp SpriteTileSlots+0
  beq Slot0
  cmp SpriteTileSlots+1
  beq Slot1
  cmp SpriteTileSlots+2
  beq Slot2
  cmp SpriteTileSlots+3
  beq Slot3
  ; Not present, but at least make it easily detectable so the enemy
  ; can use a global graphic instead
  lda #$00
  rts
Slot0:
  lda #$80
  rts
Slot1:
  lda #$a0
  rts
Slot2:
  lda #$c0
  rts
Slot3:
  lda #$e0
  rts
.endproc

.if 0
; Same as DetectSpriteSlot, but the input is in Y
; and if it fails then it tries the input in A.
; From when there used to be two graphic slots per sprite type.
DetectSpriteSlot2:
  cpy SpriteTileSlots+0
  beq DetectSpriteSlot::Slot0
  cpy SpriteTileSlots+1
  beq DetectSpriteSlot::Slot1
  cpy SpriteTileSlots+2
  beq DetectSpriteSlot::Slot2
  cpy SpriteTileSlots+3
  beq DetectSpriteSlot::Slot3
  bne DetectSpriteSlot
.endif

; Sets LevelBlockPtr to the start of a given column in the level, then reads a specific row
; input: A (column), Y (row)
; output: LevelBlockPtr is set, also A = block at column,row
.proc GetLevelColumnPtr
  pha
  lda #$06 ; level map starts at $6000
  sta LevelBlockPtr+1
  pla
  asl
  rol LevelBlockPtr+1
  asl
  rol LevelBlockPtr+1
  asl
  rol LevelBlockPtr+1
  asl
  rol LevelBlockPtr+1
  sta LevelBlockPtr+0
  lda (LevelBlockPtr),y
  rts
.endproc

; Random number generator, consists of two LFSRs that get used together for a high period
; http://codebase64.org/doku.php?id=base:two_very_fast_16bit_pseudo_random_generators_as_lfsr
; output: A (random number)
.proc huge_rand
.proc rand64k
  lda random1+1
  asl
  asl
  eor random1+1
  asl
  eor random1+1
  asl
  asl
  eor random1+1
  asl
  rol random1         ;shift this left, "random" bit comes from low
  rol random1+1
.endproc
.proc rand32k
  lda random2+1
  asl
  eor random2+1
  asl
  asl
  ror random2         ;shift this right, random bit comes from high - nicer when eor with random1
  rol random2+1
.endproc
  lda random1           ;mix up lowbytes of random1
  eor random2           ;and random2 to combine both 
  rts
.endproc
 
; Sets a sound to be played later
; input: A (sound effect number)
.proc PlaySound
  sta NeedSFX
  rts
.endproc

; Play a sound, as long as it's not too close to the most recently played sound
; input: A (sound effect number)
.proc PlaySoundDebounce
  sta TempXSwitch ; safe temporary variable
  lda SoundDebounce
  bne :+
  lda TempXSwitch
  sta NeedSFX
  lda #10
  sta SoundDebounce
: rts
.endproc

; extract the X position from (LevelBlockPtr),y
; input: LevelBlockPtr
; output: A (column number)
; locals: 0
.proc GetBlockX
  lda LevelBlockPtr+0
  sta 0
  lda LevelBlockPtr+1
  .repeat 4
    lsr
    ror 0
  .endrep
  lda 0
  rts
.endproc

; Queues a change to the level to happen after a timer goes off.
; input: A (new block), LevelBlockPtr,y (block to change), 0 (timer length/4)
; output: carry (success)
.proc DelayChangeBlock
  sty TempY
  pha

  ; find a free slot
  ldy #0
: lda DelayedMetaEditIndexHi,y
  beq EmptySlot
  iny
  cpy #MaxDelayedMetaEdits ; keep going, unless we get to the end of the list
  bne :-

  ; no free slot
  ldy TempY
  pla
  clc
  rts
EmptySlot:
  ; Y = the empty slot

  ; pack the pointer and Y position together
  lda LevelBlockPtr+1
  sta DelayedMetaEditIndexHi,y
  lda TempY
  ora LevelBlockPtr+0
  sta DelayedMetaEditIndexLo,y
  ; write the timer and new block type
  lda 0
  sta DelayedMetaEditTime,y
  pla ; get the type back
  sta DelayedMetaEditType,y

  ; and the routine will exit with A still keeping its contents
  ldy TempY
  sec
  rts
.endproc

; Changes a block in the level immediately and queues a PPU update.
; input: A (new block), LevelBlockPtr,y (block to change)
; output: carry (success)
; locals: 0, 1, 2, 3, LevelDecodePointer, LevelSpritePointer
.proc ChangeBlock
SaveX = 0 
SaveY = 1
Temp = 2
TempSlot = 3
LeftPointer = LevelDecodePointer  ; reuse pointers
RightPointer = LevelSpritePointer

  sty SaveY       ; save X and Y so the routine calling this doesn't have to
  stx SaveX
  sta (LevelBlockPtr),y ; Do the actual write
  tax             ; X = block type, to index into metatile info tables

  ; First, determine if the block is even onscreen?
  ; Start by getting the metatile column
  lda LevelBlockPtr
  sta Temp
  lda LevelBlockPtr+1
  .repeat 4
    lsr
    ror Temp
  .endrep
  ; Temp = metatile column of the block

  lda ScrollX+1
  and #<~1       ; clear bottom bit
  sub #5         ; go back two 32 pixel chunks (plus one for less than or equal)
  bcc @FineLeft
  cmp Temp
  bcc @FineLeft
  jmp Exit
@FineLeft:

  lda ScrollX+1
  and #<~1       ; clear bottom bit
  add #21        ; go forward 10 32 pixel chunks, plus one (for right side of chunk)
  bcs @FineRight
  cmp Temp
  bcs @FineRight
  jmp Exit
@FineRight:

  ; OKAY so the block is actually on the screen, so update nametable

  ; Find a slot for the block update,
  ; starting from the end
  ldy #MaxNumBlockUpdates-1
: lda BlockUpdateA1,y
  beq :+          ; empty slot found
  dey
  bpl :-
;  no free slots, return with carry clear
  ldy SaveY
  ldx SaveX
  clc
  rts 
:
  ; queue the block update
  ; needs the bank set to MAINLOOP_BANK

  lda MetatileUL,x
  sta BlockUpdateT1,y
  lda MetatileUR,x
  sta BlockUpdateT2,y
  lda MetatileLL,x
  sta BlockUpdateT3,y
  lda MetatileLR,x
  sta BlockUpdateT4,y

  ; use a lookup table to find the PPU addresses for the block updates
  ldx SaveY ; Y index into the level
  lda LevelBlockPtr+0
  lsr
  lsr
  lsr
  and #%11110
  ora PPURowAddrLo,x
  sta BlockUpdateA2,y
  lda PPURowAddrHi,x
  sta Temp

  ; use $2000 or $2400 as a base depending on the screen number
  ldx #$20
  lda LevelBlockPtr+1
  and #1
  beq :+
     ldx #$24
: txa
  ora Temp
  sta BlockUpdateA1,y
  ora #$03 ; get attribute table base
  sta Temp ; save for the attribute table update

  ; calculate the bottom row from the top row
  lda BlockUpdateA2,y
  add #32
  sta BlockUpdateB2,y
  lda BlockUpdateA1,y
  adc #0
  sta BlockUpdateB1,y

  ; update the attribute square too
  ; but first find a slot for that (maybe find and update identical slots later?)
  ldy #0
: lda TileUpdateA1,y
  beq :+   ; found a free slot
  iny
  cpy #MaxNumTileUpdates 
  bne :-   ; keep going
  jmp Exit ; no slots? don't bother updating the attribute table
:

  ; Calculate attribute address and value
  lda Temp
  sta TileUpdateA1,y

  ; set up the two pointers
  lda LevelBlockPtr+0
  and #%11101111
  sta LeftPointer+0
  ora #%00010000
  sta RightPointer+0
  lda LevelBlockPtr+1
  sta LeftPointer+1
  sta RightPointer+1

  ; xxxx0000 <--- low byte of block pointer
  ; 0000yyyy <--- Y coordinate, in SaveY
  ; 11yyyxxx <--- attribute table format
  lda SaveY
  asl            ; 000yyyy0
  asl            ; 00yyyy00
  and #%00111000 ; 00yyy000
  ora #%11000000 ; 11yyy000
  sta Temp
  lda LevelBlockPtr
  lsr            ; 0xxxx000
  lsr            ; 00xxxx00
  lsr            ; 000xxxx0
  lsr            ; 0000xxxx
  lsr            ; 00000xxx
  ora Temp       ; 11yyyxxx
  sta TileUpdateA2,y

  sty TempSlot
  lda SaveY
  and #<~1 ; round to 32 pixel square
  tay
  lda (LeftPointer),y
  tax
  lda MetatilePalettes,x
  and #%00000011
  sta Temp
  ; top right corner of attribute byte
  lda (RightPointer),y
  tax
  lda MetatilePalettes,x
  and #%00001100
  ora Temp
  sta Temp
  iny
  ; bottom left corner of attribute byte
  lda (LeftPointer),y
  tax
  lda MetatilePalettes,x
  and #%00110000
  ora Temp
  sta Temp
  ; top right corner of attribute byte
  lda (RightPointer),y
  tax
  lda MetatilePalettes,x
  and #%11000000
  ora Temp
  ldy TempSlot
  sta TileUpdateT,y

Exit:
  sec             ; success
  ldx SaveX
  ldy SaveY
  rts
.endproc

; tables of the PPU addresses for every other row on the first screen
PPURowAddrHi:
.repeat 15, I
  .byt >($2000+I*64)
.endrep
PPURowAddrLo:
.repeat 15, I
  .byt <($2000+I*64)
.endrep

; Clears the last chunk of the background graphics
.proc ClearDynamicVRAM
  lda #>$0c00
  sta PPUADDR
  lda #<$0c00
  sta PPUADDR
  lda #0
  tax
  ldy #4
: sta PPUDATA
  dex
  bne :-
  dey
  bne :-
  rts
.endproc

; Clears out the sprite graphics (second 4KB of CHR RAM)
.proc ClearSprite4kb
  lda #>$1000
  sta PPUADDR
  lda #<$1000
  sta PPUADDR
  lda #0
SkipAddr:
  tax
  ldy #4*4
: sta PPUDATA
  dex
  bne :-
  dey
  bne :-
  rts
.endproc

; Clears out the first 4KB of CHR RAM
.proc ClearBG4kb
  lda #0
  sta PPUADDR
  sta PPUADDR
  jmp ClearSprite4kb::SkipAddr
.endproc

; Copies a string to StringBuffer for displaying
; input: AY (pointer to a null-terminated string to copy)
; locals: 0, 1
.proc CopyToStringBuffer
  sty 0
  sta 1
  ldy #0
: lda (0),y
  sta StringBuffer,y
  beq :+ ; exit if a zero is reached
  iny
  bne :- ; treated like an unconditional branch
: rts
.endproc

.proc CopyFromSavedInventory
  txa
  pha
  ; Copy inventory
  ldx #InventoryLen-1
: lda InventorySavedType,x
  sta InventoryType,x
  lda InventorySavedAmount,x
  sta InventoryAmount,x
  dex
  bpl :-
  pla
  tax
  rts
.endproc

.proc CopyToSavedInventory
  lda PuzzleMode
  bne Exit
  ; Copy inventory
  ldx #InventoryLen-1
: lda InventoryType,x
  sta InventorySavedType,x
  lda InventoryAmount,x
  sta InventorySavedAmount,x
  dex
  bpl :-
Exit:
  lda Coins+0
  sta SavedCoins+0
  lda Coins+1
  sta SavedCoins+1
  rts
.endproc

; A = level to start
.proc StartLevel
;  lda SavedAbility
;  sta PlayerAbility

  jsr ReseedRandomizer

  ; Copy options to physics variables
  ldx SavedAcceleration
  lda AccelSpeeds,x
  sta NovaAccelSpeed
  lda DecelSpeeds,x
  sta NovaDecelSpeed
  ldx SavedRunSpeed
  lda RunSpeedsL,x
  sta NovaRunSpeedL
  lda RunSpeedsR,x
  sta NovaRunSpeedR

  lda SavedCoins+0
  sta Coins+0
  lda SavedCoins+1
  sta Coins+1

  jsr CopyFromSavedInventory

  ; Erase per-level inventory
  lda #0
  ldx #InventoryLen-1
: sta InventoryPerLevelType,x
  sta InventoryPerLevelAmount,x
  dex
  bpl :-

  ; Copy the level select number to the checkpoint number
  lda StartedLevelNumber
  sta CheckpointLevelNumber
FromCheckpoint:
  lda #4
  sta PlayerHealth
  sta MakeCheckpoint
  jsr WaitVblank
  lda #0
  sta PPUMASK
  sta PlayerVXL
  sta PlayerVXH
  sta PlayerVYL
  sta PlayerVYH

; Decompress Nova tiles and common sprite tiles
  jsr UploadNovaAndCommon

; Finally decompress the level and start the game engine
  lda CheckpointLevelNumber
  jsr DecompressLevel
  jmp MainLoopInit

AccelSpeeds: .byt 2,        4
DecelSpeeds: .byt 4,        8
RunSpeedsL:  .byt <-(4*16), <-(3*16)
RunSpeedsR:  .byt 4*16,     3*16
.endproc
StartLevel_FromCheckpoint = StartLevel::FromCheckpoint

; Uploads graphics for Nova as well as the common sprite tiles
.proc UploadNovaAndCommon
  lda #GRAPHICS_BANK1
  jsr _SetPRG
  lda #<SPNova
  ldy #>SPNova
  jsr DecompressCHR

  lda #<SPCommon
  ldy #>SPCommon
  jsr DecompressCHR

  jsr WaitVblank
  ; Write palette for Nova and common
  lda #$3f
  sta PPUADDR
  lda #$11
  sta PPUADDR
  lda #$12
  sta PPUDATA
  lda #$2a
  sta PPUDATA
  lda #$30
  sta PPUDATA

  lda #$3f
  sta PPUADDR
  lda #$15
  sta PPUADDR
  lda #$2d
  sta PPUDATA
  lda #$3d
  sta PPUDATA
  lda #$30
  sta PPUDATA

  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR

  lda PlayerAbility
  beq :+
  lda PlayerAbility
  jsr ChangePlayerAbilityWithoutSFX
:
  jmp SetPRG_Restore
.endproc

WriteIncreasing16:
  ldx #16
; Write increasing bytes to PPU
; input: Y (thing to write), X (count)
.proc WriteIncreasing
: sty PPUDATA
  iny
  dex
  bne :-
  rts
.endproc

; Looks for an item in the inventory
; input: A (item to look for)
; output: carry (set if item found), X (item index)
; preserves A
.proc InventoryHasItem
  ldx #InventoryLenFull-1
: cmp InventoryType,x
  beq :+
  dex
  bpl :-
  clc ; no
  rts
: sec ; yes
  rts
.endproc

; Removes one item from a slot
; inputs: X (item slot to take one from)
.proc InventoryTakeItem
  dec InventoryAmount,x
  bpl :+
    lda #0
    sta InventoryType,x
    sta InventoryAmount,x
  :
  rts
.endproc

; Gives an item only if you don't have any of it yet
; inputs: A (item to give)
.proc InventoryGiveIfDontHave
  jsr InventoryHasItem
  bcc InventoryGiveItem
  clc
  rts
.endproc

; Puts an item into a blank slot
; inputs: A (item to give)
; outputs: carry (item was given)
; locals: TempVal+2, TempVal+3
.proc InventoryGiveItem
ItemType = TempVal+2
SecondPageItem = TempVal+3
  sta ItemType

; Does this item go in the second page?
  ldx #0
  stx SecondPageItem
: lda SecondPageItems,x
  beq NoRegular
  inx
  cmp ItemType
  bne :-
; Yes
  inc SecondPageItem
  ldx #InventoryLenFull-1
  bne :+ ; skip setting it to InventoryLen-1
NoRegular:
  ; Reload the item type
  lda ItemType

; See if the item is already in the list
  ldx #InventoryLen-1
: ldy InventoryType,x
  cpy ItemType
  bne :+
  ; Item found
  lda InventoryAmount,x
  cmp #98
  bcs Fail
  inc InventoryAmount,x
  sec
  rts
: ; Item not found, keep looking
  dex
  bpl :--

; (If it's a per-level item, put it on the second inventory page)
  ldx SecondPageItem
  bne FindBlankSecondarySlot
; If item isn't in the list, put it in the first blank slot
  ldx #0
: ldy InventoryType,x
  beq Empty
  inx
  cpx #InventoryLen
  bne :-
Fail:
  clc ; No free slots
  rts

FindBlankSecondarySlot: ; Find a slot on the second page
  ldx #InventoryLen
: ldy InventoryType,x
  beq Empty
  inx
  cpx #InventoryLenFull
  bne :-
  clc ; No free slots
  rts

Empty: ; Empty slot, put in item
  sta InventoryType,x
  lda #0
  sta InventoryAmount,x
  sec
  rts

SecondPageItems:
  .byt InventoryItem::RED_KEY, InventoryItem::GREEN_KEY, InventoryItem::BLUE_KEY
  .byt InventoryItem::FIRE_BOOTS, InventoryItem::SUCTION_BOOTS, InventoryItem::ICE_SKATES, InventoryItem::FLIPPERS
  .byt InventoryItem::BLOCK, InventoryItem::SPRING
  .byt InventoryItem::ARROW_LEFT, InventoryItem::ARROW_DOWN, InventoryItem::ARROW_RIGHT, InventoryItem::ARROW_UP
  .byt InventoryItem::ARROW_LEFT_METAL, InventoryItem::ARROW_DOWN_METAL, InventoryItem::ARROW_RIGHT_METAL, InventoryItem::ARROW_UP_METAL
  .byt InventoryItem::WOOD_BOX, InventoryItem::METAL_BOX
  .byt InventoryItem::MINE_TRACK, InventoryItem::MINE_TRACK_JUMP, InventoryItem::MINE_TRACK_BUMP
  .byt 0
.endproc

; Writes a zero terminated string to the screen
; (by Ross Archer)
.proc PutStringImmediate
    DPL = $02
    DPH = $03
    pla             ; Get the low part of "return" address
                    ; (data start address)
    sta DPL
    pla 
    sta DPH         ; Get the high part of "return" address
                    ; (data start address)
                    ; Note: actually we're pointing one short
PSINB:
    ldy #1
    lda (DPL),y     ; Get the next string character
    inc DPL         ; update the pointer
    bne PSICHO      ; if not, we're pointing to next character
    inc DPH         ; account for page crossing
PSICHO:
    ora #0          ; Set flags according to contents of accumulator
                    ;    Accumulator
    beq PSIX1       ; don't print the final NULL 
    sta PPUDATA     ; write it out
    jmp PSINB       ; back around
PSIX1:
    inc DPL
    bne PSIX2
    inc DPH         ; account for page crossing
PSIX2:
    jmp (DPL)       ; return to byte following final NULL
.endproc

.proc ReseedRandomizer
; Set some random seeds
  ldx retraces
  stx random1+0
  inx
  stx random1+1
  inx
  stx random2+0
  inx
  stx random2+1
  rts
.endproc

; Triggers a teleport stored at column A
; inputs: A (column to read the teleport from)
.proc DoTeleport
  stx TempX
  tax
  lsr BackgroundBoss ; change if there's more than one

  ; 0Y XX    - X and Y only
  ; 1Y XX LL - X and Y with level number
  ; 20 AA AA - start dialog
  ; 21 AA    - just switch to level
  inc NeedLevelRerender
  inc JustTeleported
  lda ColumnBytes,x    ; Read the flag to check for special handling
  cmp #$21
  beq NewLevel
  cmp #$20
  beq DoDialogInstead
  and #$10
  beq NoLevelChange
    lda ColumnBytes+2,x
    sta LevelNumber
    inc NeedLevelReload
    inc MakeCheckpoint
    inc IsNormalDoor
NoLevelChange:
  lda ColumnBytes+0,x    ; Read the Y position plus the flag
  and #15                ; (but only use the flag)
  sta PlayerPYH
  lda ColumnBytes+1,x    ; Read the X position
  sta PlayerPXH
  lda #0
  sta PlayerPXL
  ldx TempX

  ; If cutscenes are enabled, check if we're teleporting onto a dialog trigger
  lda CutscenesEnabled
  beq :+
  lda PlayerPXH
  ldy PlayerPYH
  jsr GetLevelColumnPtr
  cmp #Metatiles::STORY_DIALOG_TRIGGER
  bne :+
  lda #0
  sta NeedLevelRerender
:

  rts
NewLevel:
  lda ColumnBytes+1,x
  sta LevelNumber
  inc NeedLevelReload
  inc MakeCheckpoint
  ldx TempX
  rts
DoDialogInstead:
  lda ColumnBytes+1,x
  sta ScriptPtr+0
  lda ColumnBytes+2,x
  sta ScriptPtr+1
  inc NeedDialog
  ldx TempX
  rts
.endproc

; inputs: A (item number), Y (Y position)
.proc MakeFloatingTextAtBlock
  sty TempVal+1 ; Save Y position
  pha           ; And item number

  ; Build the address needed in InventoryShortName
  lda #0
  sta 9
  lda #INVENTORY_BANK
  jsr _SetPRG
  pla
  .repeat 3
    asl
    rol 9
  .endrep
  ; Add offset to the address
  sta 8
  add #<InventoryShortName
  sta 8
  lda 9
  adc #>InventoryShortName
  sta 9

  ; Copy the name in
  ldy #7
: lda (8),y
  sta 0,y
  dey
  bpl :-

  ; Render the string
  lda #THINFONT_BANK
  jsr _SetPRG
  jsr RenderThinString

  jsr FindFreeObjectY
  bcc Exit ; no slots free
  lda #Enemy::POOF*2
  sta ObjectF1,y
  lda #PoofSubtype::FLOAT_TEXT
  sta ObjectF2,y
  jsr GetBlockX
  sub #1            ; Offset left 8 pixels
  sta ObjectPXH,y
  lda TempVal+1
  sta ObjectPYH,y
  lda #$80          ; Offset left 8 pixels
  sta ObjectPXL,y
  lda #0
  sta ObjectPYL,y
  sta ObjectTimer,y
Exit:
  jmp SetPRG_Restore
.endproc

; Adds another coin to the counter, deals with BCD stuff and
; sets a timer to display the counter.
.proc AddCoin
  ; don't add any coins if you're at 9999
  lda Coins+1
  cmp #99
  bne :+
  lda Coins+0
  cmp #99
  bne :+
    rts
  :

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

; ---------------- Object related stuff -------------------
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

; Finds a free object slot, if there is one
; output: X (object slot), carry (success)
.proc FindFreeObjectX
  pha
  ldx #ObjectLen-1
: lda ObjectF1,x
  beq Found
  dex
  bpl :-
NotFound:
  pla
  clc
  rts
Found:
  lda #255
  sta ObjectIndexInLevel,x
  pla
  sec
  rts
.endproc

; Finds a free object slot, if there is one
; and sets the new object's type, also using the
; value for priority and handling running out of slots
; input: A (new object's type)
; output: X (object slot), carry (success)
; locals: TempXSwitch, TempY
.proc FindFreeObjectForTypeX
NewType = TempXSwitch
  sta NewType
  sty TempY

; Look for a free slot
  ldx #ObjectLen-1
: lda ObjectF1,x
  beq Success
  dex
  bpl :-

; Not found, so deal with this according to the priority
NotFound:
  jsr GetPriority
  ; If secondary (zero), fail
  beq Failure

; Second Loop. Look for secondary priority object to overwrite
  ldx #ObjectLen-1
: lda ObjectF1,x
  lsr
  tay
  lda ObjFlags,y
  and #ObjFlag::PRIORITY_BITS
  beq Success
  dex
  bpl :-

; No secondary objects. Is this an essential object?
  jsr GetPriority
  cmp #ObjFlag::ESSENTIAL
  bne Failure ; nope

; THIRD loop, overwrite any non-essential objects
  ldx #ObjectLen-1
: lda ObjectF1,x
  lsr
  tay
  lda ObjFlags,y
  and #ObjFlag::PRIORITY_BITS
  cmp #ObjFlag::ESSENTIAL
  bne Success
  dex
  bpl :-
; Otherwise, drop into Failure

; Exit with clear carry
Failure: ; without PLA
  ldy TempY
  clc
  rts

; Found a free slot, write the object type
Success:
  ldy TempY
  lda #255
  sta ObjectIndexInLevel,x
  lda NewType
  sta ObjectF1,x
  sec
  rts

; Gets the object type's priority bits
; (Honestly, if we have 16 sprites onscreen, fast code here
;  isn't going to help, so it's okay to recalculate this)
GetPriority:
  lda NewType
  lsr
  tax
  lda ObjFlags,x
  and #ObjFlag::PRIORITY_BITS
  rts
.endproc

; Finds a free object slot, if there is one
; output: Y (object slot), carry (success)
.proc FindFreeObjectY
  pha
  ldy #ObjectLen-1
: lda ObjectF1,y
  beq Found
  dey
  bpl :-
NotFound:
  pla
  clc
  rts
Found:
  lda #255
  sta ObjectIndexInLevel,y
  pla
  sec
  rts
.endproc

; Adds an offset to the X and Y coordinates of an object
; inputs: A (offset in subpixels)
; locals: 0
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

; Subtracts an offset from the X and Y coordinates of an objects
; inputs: A (offset in subpixels)
; locals: 0
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

; Copies an enemy's position into its velocity, for objects
; that do not use velocity but need to hold onto a position
; (like explosions, that need a center)
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

.proc EnemyPosToVelY
  lda ObjectPXL,x
  sta ObjectVXL,y
  lda ObjectPXH,x
  sta ObjectVXH,y
  lda ObjectPYL,x
  sta ObjectVYL,y
  lda ObjectPYH,x
  sta ObjectVYH,y
  rts
.endproc

; --------------- end of object related stuff ----------------

; Turns a flying arrow to face a new direction
; inputs: Y (new direction, out of left, down, up, right)
.proc ArrowChangeDirection
  lda #0
  sta ObjectPXL,x
  sta ObjectPYL,x

  lda FlyingArrowVX,y
  sta ObjectVXL,x
  sex
  sta ObjectVXH,x

  lda FlyingArrowVY,y
  sta ObjectVYL,x
  sex
  sta ObjectVYH,x

  lda #30
  sta ObjectTimer,x

  lda #SFX::ARROW_SHOOT
  jmp PlaySound
FlyingArrowVX:
  .byt <(-$28), 0, 0, <($28)
FlyingArrowVY:
  .byt 0, <($28), <(-$28), 0
.endproc

; Writes four tiles of information to the PPU
.proc UploadFourTiles
  .repeat 32, I
    lda UploadTileSpace+I+0
    sta PPUDATA
  .endrep
OnlyTwoTiles:
  .repeat 32, I
    lda UploadTileSpace+I+32
    sta PPUDATA
  .endrep
  lda #0
  sta UploadTileAddress+1
  rts
.endproc
UploadTwoTiles = UploadFourTiles::OnlyTwoTiles

.proc HitToggleSwitch
.ifdef NEW_TOGGLE_BEHAVIOR
  lda #SFX::TELEPORT
  jsr PlaySound

  ; Swap the graphics
  lda ToggleBlockEnabled
  eor #64
  sta ToggleBlockEnabled
  lda #2
  sta ToggleBlockUpload

  ; Toggle the actual solidity
  lda MetatileFlags+Metatiles::TOGGLE_BLOCK_ON
  eor #M_SOLID_ALL+M_SOLID_TOP
  sta MetatileFlags+Metatiles::TOGGLE_BLOCK_ON
  lda MetatileFlags+Metatiles::TOGGLE_BLOCK_OFF
  eor #M_SOLID_ALL+M_SOLID_TOP
  sta MetatileFlags+Metatiles::TOGGLE_BLOCK_OFF
.else
  jsr WaitVblank
  lda #0
  sta PPUMASK
; Swap the level tiles
  lda #<$6000
  sta 0
  lda #>$6000
  sta 1
  ldy #0
Convert:
  lda (0),y
  cmp #Metatiles::TOGGLE_BLOCK_ON   ; on -> off
  bne :+
    lda #Metatiles::TOGGLE_BLOCK_OFF
    sta (0),y
    bne :++
: cmp #Metatiles::TOGGLE_BLOCK_OFF  ; off -> on
  bne :+
    lda #Metatiles::TOGGLE_BLOCK_ON
    sta (0),y
: iny
  bne Convert
  inc 1
  lda 1
  cmp #$70
  bne Convert

  ; not sure why I do this GetLevelColumnPtr actually?
  lda PlayerPXH
  ldy PlayerPYH
  jsr GetLevelColumnPtr
  lda #1
  sta NeedLevelRerender
.endif
  rts
.endproc

.proc InitPaletteWrites
; clear the palette buffer
  lda LevelBackgroundColor
  ldx #(4*8)-1
: sta Attributes,x
  dex
  bpl :-

  ; Write Nova's palette and the default palette to the buffer
  lda #$12
  sta Attributes+(4*4)+1
  lda #$2a
  sta Attributes+(4*4)+2
  lda #$30
  sta Attributes+(4*4)+3

  lda #$2d
  sta Attributes+(4*5)+1
  lda #$3d
  sta Attributes+(4*5)+2
  lda #$30
  sta Attributes+(4*5)+3
  rts
.endproc

.proc FlushPaletteWrites
; upload the palette all in one go
  jsr WaitVblank
  lda #$3f
  sta PPUADDR
  ldx #$00
  stx PPUADDR
: lda Attributes,x
  sta PPUDATA
  inx
  cpx #4*8
  bne :-
  rts
.endproc

; Decompresses text with dictionary compression
; inputs: CompressedTextPointer, X (output buffer index)
; outputs: StringBuffer, X (output buffer index), A (terminator byte)
; locals: 0, 1
.proc DecompressText
Next:
  ldy #0
  lda (CompressedTextPointer),y  ; Read from the pointer
  inc16 CompressedTextPointer    ; Step the pointer ahead one byte

  cmp #$20 ; 0x00-0x1F stops decompression
  bcc Exit
  cmp #$80 ; 0x80-0xFF are dictionary words
  bcs DictionaryWord

  ; Directly write a byte to the string buffer
  sta StringBuffer,x
  inx
  bne Next ; Unconditional since no string is longer than 255 chars

Exit:
  rts

DictionaryWord:
  ; Read a pointer from the dictionary table
  sub #$80
  tay
  lda CutsceneDictionaryTable+0,y
  sta 0
  lda CutsceneDictionaryTable+128,y
  sta 1

  ; Copy the word over
  ldy #0
: lda (0),y
  php        ; Save the negative flag
  and #127   ; Strip off the ending flag if it was there
  sta StringBuffer,x

  inx        ; \ Step both buffers ahead a byte
  iny        ; /
  plp
  bpl :-     ; Positive = not the last character
  bmi Next   ; Negative = last character, return to reading the script
.endproc

; Print the results of DecompressText to the nametable
.proc PrintDecompressedText
  lda #0
  sta StringBuffer,x
  tax ; X = 0
: lda StringBuffer,x
  beq Exit
  sta PPUDATA
  inx
  bne :- ; unconditional
Exit:
  rts
.endproc

; Checks if the toggle switch cooldown timer is nonzero
; and allows a switch if so, resetting the timer to 60.
.proc ToggleSwitchCooldown
  lda ToggleSwitchCooldownTimer
  beq :+
    clc
    rts
  :
  lda #60
  sta ToggleSwitchCooldownTimer
  sec
  rts
.endproc

; Checks if the non-toggle switch (cloner, teleporter) cooldown timer is nonzero
; and allows a switch if so, resetting the timer to 60.
.proc SwitchCooldown
  lda SwitchCooldownTimer
  beq :+
    clc
    rts
  :
  lda #60
  sta SwitchCooldownTimer
  sec
  rts
.endproc
