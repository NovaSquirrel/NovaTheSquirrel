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

; Changes the player ability and uploads the new graphics for it
; input: A (new ability)
; locals: TempVal, TempVal+1, TempVal+2
.proc ChangePlayerAbility
Pointer = TempVal
Length = TempVal+2
  sta PlayerAbility
  jsr WaitVblank
  lda #%11100001 ; dim
  sta PPUMASK
  lda #SFX::GET_ABILITY
  sta NeedSFX
WithoutSFX:
; Because the graphics will be rewritten, erase any projectiles using the old graphics
  ldx #0
  stx PlayerAbilityVar
: lda ObjectF1,x
  and #<~1
  cmp #Enemy::PLAYER_PROJECTILE*2
  bne :+
  lda #0
  sta ObjectF1,x
: inx
  bne :--

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
  lda #>$14c0
  sta PPUADDR
  lda #<$14c0
  sta PPUADDR
  ldy #0
: lda (Pointer),y
  sta PPUDATA
  iny
  cpy #64
  bne :-

; Calculate pointer to ability tiles
  ldx PlayerAbility
  lda AbilityLengths,x
  beq NoExtraTiles
  asl
  asl
  asl
  asl
  sta Length

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
  lda #>$1700
  sta PPUADDR
  lda #<$1700
  sta PPUADDR
  ldy #0
: lda (Pointer),y
  sta PPUDATA
  iny
  cpy Length
  bne :-
NoExtraTiles:

  jsr UpdateScrollRegister
  jsr WaitVblank
  lda #0
  sta PPUMASK
; Restore the old bank
  jmp SetPRG_Restore
.endproc
ChangePlayerAbilityWithoutSFX = ChangePlayerAbility::WithoutSFX

; Updates PPUSCROLL and PPUCTRL to account for ScrollX
; locals: 0
.proc UpdateScrollRegister
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
  lda 0
  and #1 ; bit 0 is most significant bit of scroll
  ora #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  rts
.endproc

; Finds a free object slot, if there is one
; output: X (object slot), carry (success)
.proc FindFreeObjectX
  pha
  ldx #0
: lda ObjectF1,x
  beq Found
  inx
  cpx #ObjectLen
  bne :-
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
; output: Y (object slot), carry (success)
.proc FindFreeObjectY
  pha
  ldy #0
: lda ObjectF1,y
  beq Found
  iny
  cpy #ObjectLen
  bne :-
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
  sta TouchTemp2  ; carry now set

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
  sta TouchTemp2   ; carry now set

  lda TouchTopA
  sbc TouchTopB   ; Note will subtract n-1
  sbc TouchTemp  ;#SIZE2-1
  adc TouchTemp2 ;#SIZE1+SIZE2-1 ; Carry set if overlap
  bcc No

  sec
  rts
No:
  clc
  rts
.endproc

; read the controller and update keydown
.proc ReadJoy
  lda keydown
  sta keylast
  lda #1
  sta keydown
  sta JOY1
  lda #0
  sta JOY1
  : lda JOY1
    and #$03
    cmp #1
    rol keydown
    bcc :-
  lda keylast
  eor #255
  and keydown
  sta keynew
  rts
.endproc

; delay until the next vblank by waiting for NMI to change retraces
.proc WaitVblank
  lda retraces
: cmp retraces
  beq :-
  rts
.endproc

; clear the nametable
.proc ClearName
  lda #$3f ; clear tile
Custom:
  ldx #$20
  ldy #$00
  stx PPUADDR
  sty PPUADDR
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

; AND BitCancel,x to turn on bit x
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
  ; not present, so the graphics are gonna be wrong anyway
  ; and there's little point in trying to do error detection
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

; Same as DetectSpriteSlot, but the input is in Y
; and if it fails then it tries the input in A
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
; locals: 0, 1, 2, 3
.proc ChangeBlock
SaveX = 0 
SaveY = 1
Address = 2
Temp = 3
  sty SaveY
  stx SaveX
  sta (LevelBlockPtr),y

  sty SaveY       ; we need Y later when we calculate the PPU address
  tax             ; will use X to fetch the tiles needed afterwards

; find a slot for the block update
  ldy #0
  sty Address+1
: lda BlockUpdateA1,y
  beq :+          ; empty slot found
  iny
  cpy #MaxNumBlockUpdates
  bne :-
  ldy SaveY
  ldx SaveX
  clc
  rts ;  no free slots, handle it how you want
:
  ; queue the PPU update

  ; switch to the bank with all the tile IDs
  ; maybe unnecessary since if we call this routine we're probably there already
  lda #MAINLOOP_BANK
  jsr _SetPRG

  lda MetatileUL,x
  sta BlockUpdateT1,y
  lda MetatileUR,x
  sta BlockUpdateT2,y
  lda MetatileLL,x
  sta BlockUpdateT3,y
  lda MetatileLR,x
  sta BlockUpdateT4,y

  ; restore the bank back to the one we were in
  lda PRGBank
  jsr _SetPRG

  ; Y is still the block update index

  ; calculate the PPU address
  ldx SaveY ; index for PPURowAddrHi/Lo
  lda LevelBlockPtr+0
  lsr
  lsr
  lsr
  and #%11110
  ora PPURowAddrLo,x
  sta Address+0
  lda Address+1
  ora PPURowAddrHi,x
  sta Address+1

  ldx #$20
  lda LevelBlockPtr+1
  and #1
  beq :+
     ldx #$24
: txa
  ora Address+1
  sta BlockUpdateA1,y
  lda Address+0
  sta BlockUpdateA2,y

  ; move down 1 row
  lda BlockUpdateA2,y
  add #32
  sta BlockUpdateB2,y
  lda BlockUpdateA1,y
  adc #0
  sta BlockUpdateB1,y

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

; Clears out the sprite graphics
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

; Plays a sound, handles bank switching
; input: A (sound number)
.proc PlaySoundAuto
  pha
  lda #SOUND_BANK
  jsr _SetPRG
  pla
  jsr pently_start_sound
  jmp SetPRG_Restore
.endproc

; Plays music, handles bank switching
; input: A (music number)
.proc PlayMusicAuto
  pha
  lda #SOUND_BANK
  jsr _SetPRG
  pla
  jsr pently_start_music
  jmp SetPRG_Restore
.endproc

.proc CopyFromSavedInventory
  ; Copy inventory
  ldx #InventoryLen*2-1
: lda InventorySaved,x
  sta InventoryType,x
  dex
  bpl :-
  rts
.endproc

; A = level to start
.proc StartLevel
  pha
  sta StartedLevelNumber
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
  lda #0
  sta ScriptFlags+0 ; clear first 16 flags
  sta ScriptFlags+1
  sta PuzzleMode
  pla
FromCheckpoint:
  pha
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
  pla
; Finally decompress the level and start the game engine
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
; output: carry (set if item found)
; preserves A
.proc InventoryHasItem
  ldx #InventoryLen-1
: cmp InventoryType,x
  beq :+
  dex
  bpl :-
  clc ; no
  rts
: sec ; yes
  rts
.endproc

; Gives an item only if you don't have any of it yet
; inputs: A (item to give)
.proc InventoryGiveIfDontHave
  jsr InventoryHasItem
  bcc InventoryGiveItem
  jmp InventoryGiveItem
  clc
  rts
.endproc

; Puts an item into a blank slot
; inputs: A (item to give)
; outputs: carry (item was given)
.proc InventoryGiveItem
  sta TempVal+2
; See if the item is already in the list
  ldx #InventoryLen-1
: ldy InventoryType,x
  cpy TempVal+2
  bne :+
  ; Item found
  inc InventoryAmount,x
  rts
: ; Item not found, keep looking
  dex
  bpl :--

; If item isn't in the list, put it in the first blank slot
  ldx #0
: ldy InventoryType,x
  beq Empty
  inx
  cpy #InventoryLen
  bne :-
  clc ; No free slots
  rts

Empty: ; Empty slot, put in item
  sta InventoryType,x
  lda #1
  sta InventoryAmount,x
  sec
  rts
.endproc

; Writes a zero terminated string to the screen
.proc PutStringImmediate
	DPL = $02
	DPH = $03
	pla					; Get the low part of "return" address
                        ; (data start address)
	sta     DPL     
	pla 
	sta     DPH         ; Get the high part of "return" address
                        ; (data start address)
						; Note: actually we're pointing one short
PSINB:	ldy #1
	lda (DPL),y         ; Get the next string character
	inc DPL             ; update the pointer
	bne PSICHO          ; if not, we're pointing to next character
	inc DPH             ; account for page crossing
PSICHO:	ora #0          ; Set flags according to contents of 
                        ;    Accumulator
	beq     PSIX1       ; don't print the final NULL 
	sta PPUDATA         ; write it out
	jmp     PSINB       ; back around
PSIX1:	inc     DPL     ; 
	bne     PSIX2       ;
	inc     DPH         ; account for page crossing
PSIX2:	jmp     (DPL)   ; return to byte following final NULL
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
