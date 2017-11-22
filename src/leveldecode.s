; Princess Engine
; Copyright (C) 2014-2017 NovaSquirrel
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
.include "leveldecodeobjects.s"

.enum LevelHeader
  MUSIC_FLAGS1
;ad.mmmmm
;|| +++++- music
;|+------- if 1, player starts facing left
;+-------- if 1, use alternate buffer for collected bits
  XPOS
;xxxxxxxx
;++++++++- X position the player starts on
  YPOS_SCREENS
;ssssyyyy
;||||++++- Y position the player starts at
;++++----- number of screens in the level
  SPRITE_SLOT_1
;tttttttt sprite tileset 1
  SPRITE_SLOT_2
;tttttttt sprite tileset 2
  SPRITE_SLOT_3
;tttttttt sprite tileset 3
  SPRITE_SLOT_4
;tttttttt sprite tileset 4
  LEVEL_POINTER_LO
  LEVEL_POINTER_HI
  SPRITE_POINTER_LO
  SPRITE_POINTER_HI
  BACKGROUND_COLOR
.endenum
;uuuuuuuu - list of uploads to make for background tiles, palettes or whatever
;11111111 - ending with 255
;gets written to LevelUploadList

;abcdefgh ijklmnoL - boundaries between screens horizontally
;if L: specify links for top and bottom
;????nnnn
;||||++++- number of screens to change
;++++----- other flags that haven't been assigned anything
;ttttbbbb
;||||++++- bottom screen link
;++++----- top screen link

;Level data:
;TTTTTTTT XXXXYYYY [SSSSSSSS]
;T - Object type (0-255)
;Y - Y position absolute (0-15)
;X - X position relative (0-15)
;S - Settings byte, if needed
;
;Level commands
;1111TTTT [SSSSSSSS]
;T - 0 finished with the level
;    1 set X to S
;    2 write 1 column byte at current column
;    3 write 2 column bytes starting at this column
;    4 write 3 column bytes starting at this column
;    5 current X -= 16
;    6 current X += 16
;    7 run special command S:

.proc DecompressLevel ; A = level number
LevelBank = 15 ; figure out what to put in here later; for now it's just gonna be LEVELS_BANK1
  sta LevelNumber
  tax
  lda #SOUND_BANK
  jsr SetPRG
  jsr pently_init

  lda PuzzleMode
  beq :+
    lda PuzzleModeAbilityBackup
    sta PlayerAbility
    ora #128
    sta NeedAbilityChange
    inc NeedAbilityChangeNoSound
    lda #0
    sta PuzzleMode
    jsr CopyFromSavedInventory
  :

  ; Using Y for these loops because X needs to be preserved for a bit later
  lda #0
  ldy #LevelZeroWhenLoad_End-LevelZeroWhenLoad_Start-1
: sta LevelZeroWhenLoad_Start,y
  dey
  bpl :-

  ; Clear FirstSpriteOnScreen list too
  ldy #15
  lda #255
: sta FirstSpriteOnScreen,y
  dey
  bpl :-

  lda #LEVELS_BANK1 ; first level bank has list of level information
  jsr SetPRG
  ; get the bank for this level
  ldy LevelNumber
  lda LevelBanks,y
  and #31
  sta LevelBank ; store the bank number

; get the start of the level header
  lda MasterLevelListL,x
  sta LevelHeaderPointer+0
  lda MasterLevelListH,x
  sta LevelHeaderPointer+1

; clear out the level buffer ($6000-$6fff)
  lda #<$6000
  sta 0
  ldx #>$6000
  stx 1
  lda #0
  sta LevelDecodeXPos
  tay
: sta (0),y
  iny
  bne :-
  inx
  stx 1
  cpx #$70
  bne :-

; Reset the column bytes
  ldx #0
  txa
: sta ColumnBytes,x
  inx
  bne :-

; Switch to the bank actually containing the level data, to read it
  lda LevelBank
  jsr SetPRG

; now read the header
  ldy #0
  lda (LevelHeaderPointer),y
  pha
  pha
  and #31
  sta LevelMusic
  pla
  and #%01000000
  cmp #%01000000
  lda #0
  adc #0
  sta PlayerDir
  pla
  and #%10000000
  sta CollectedBitsIndex

; read starting player X position
  iny
  lda (LevelHeaderPointer),y
  ldx IsNormalDoor
  bne :+
  sta PlayerPXH
: lda #$40
  sta PlayerPXL

; read starting player Y position and number of screens
  iny
  lda (LevelHeaderPointer),y
  pha
  ldx IsNormalDoor
  bne :+
  and #15
  sta PlayerPYH
: pla
  .repeat 4
    lsr
  .endrep
  sta LevelSize
  lda #$80
  sta PlayerPYL

; read the four sprite slots and level and sprite pointers
  ldx #0 ; also writes LevelDecodePointer and LevelSpritePointer and LevelBackgroundColor
: iny
  lda (LevelHeaderPointer),y
  sta SpriteTileSlots,x
  inx
  cpx #9
  bne :-

; read the list of graphics to upload, ending with -1
  ldx #0
: iny
  lda (LevelHeaderPointer),y
  sta LevelUploadList,x
  inx
  cmp #<-1
  bne :-

  lda #1
  sta ScreenFlags+0    ; first screen has left boundary
  sta ScreenFlagsDummy ; last screen has right boundary

; read level boundaries
  iny
  ldx #0
  lda (LevelHeaderPointer),y
: asl
  rol ScreenFlags+1,x
  inx
  cpx #8 ; move onto the next byte after we're done with the first
  bne :+
    iny
    lda (LevelHeaderPointer),y
  :
  cpx #15
  beq :+
  bne :--
:

  ; now the link bit is the most significant bit
  asl
  bcc NoLinks

  ; Start at screen zero
  ldx #0
LinkLoop:
  ; Get next byte in the header (number of screens to change)
  iny
  lda (LevelHeaderPointer),y
  and #15
  sta 0
  inc 0

  ; Read the up and down bytes
  ; (repeated for each time it's used, but it doesn't matter)
  iny
: lda (LevelHeaderPointer),y
  unpackx LevelLinkDown, LevelLinkUp
  inx
  dec 0
  bne :-

  cpx #16
  bcc LinkLoop
NoLinks:

; decompress background graphics
; and sprites
  jsr DoLevelUploadListAndSprites

  ; display a "now loading" or whatever
  ; currently it says Loading
  ; also display the level number
  jsr ClearName
  jsr ClearNameRight
  jsr ClearOAM
  lda #19*8
  sta OAM_XPOS
  lda #15*8-1
  sta OAM_YPOS
  lda StartedLevelNumber
  and #7
  add #$41
  sta OAM_TILE
  lda #OAM_COLOR_1
  sta OAM_ATTR
  lda #2
  sta OAM_DMA

  lda #>($1000 - 64)
  sta PPUADDR
  lda #<($1000 - 64)
  sta PPUADDR
  ldx #0
: lda LoadingCHR,x
  sta PPUDATA
  inx
  cpx #64
  bne :-
  ; write to nametable
  PositionXY 0, 14, 15
  ldx #$fc
  stx PPUDATA
  inx
  stx PPUDATA
  inx
  stx PPUDATA
  inx
  stx PPUDATA
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  jsr WaitVblank
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #BG_ON|OBJ_ON
  sta PPUMASK

  lda LevelBank
  jsr SetPRG

.if 0
  ; find the end of the sprite list
  ldy #0
  sty CurSpriteIndex
: lda (LevelSpritePointer),y
  sta SpriteListRAM,y
  cmp #255
  beq :+
  iny
  iny
  iny
  bne :-
: sty LastSpriteIndex
.endif

  ; copy the sprite list in
  ; To do: stop when we reach the end of the list
  ldy #0
  sty LevelVariable ; zero this too
: lda (LevelSpritePointer),y
  sta SpriteListRAM,y
  iny
  bne :-

  .scope
  ; Find the first sprite on each screen
  ldy #0
@Loop:
  lda SpriteListRAM,y
  cmp #255 ; 255 marks the end of the list
  beq @Exit
  ; Get screen number
  lsr
  lsr
  lsr
  lsr
  tax
  ; Write sprite number to the list, if the
  ; screen doesn't already have a sprite set for it
  lda FirstSpriteOnScreen,x
  cmp #255
  bne :+
  tya
  sta FirstSpriteOnScreen,x
:
  iny
  iny
  iny
  bne @Loop
@Exit:
  .endscope

  jsr LevelDecodeLoop

  lda #15
  sta LevelSize
  lda #LEVELPROCESS_BANK
  jsr SetPRG
  jsr PostProcessLevel

  ; add arrows to mark links
  ldx #15
ArrowLoop:
  lda LevelLinkUp,x
  beq @NotUp
  ldy #0
  jsr PutArrows
@NotUp:
  lda LevelLinkDown,x
  beq @NotDown
  ldy #13
  jsr PutArrows
@NotDown:
  dex
  bpl ArrowLoop
  rts

; Draw arrows on screens that have links on the top and/or bottom sides of the screen
PutArrows:
  txa
  ora #$60
  sta LevelBlockPtr+1
  lda #0
  sta LevelBlockPtr+0

; now write a screen width of arrows
  lda #16
  sta 0   ; Initialize counter

  tya
  cpy #1 ; Select up arrows or down arrows 
  lda #0
  adc #Metatiles::BG_UP_ARROW  
  sta 1

  ; Make two rows
@ArrowRowLoop:
  ; Top row
  lda (LevelBlockPtr),y
  cmp BackgroundMetatile
  bne :+
  lda 1
  sta (LevelBlockPtr),y
: iny
  ; Bottom row
  lda (LevelBlockPtr),y
  cmp BackgroundMetatile
  bne :+
  lda 1
  sta (LevelBlockPtr),y
: dey

  ; Next column
  pha
  lda LevelBlockPtr
  add #$10
  sta LevelBlockPtr
  pla
  dec 0
  bne @ArrowRowLoop

  lda #0
  sta IsNormalDoor
  rts
.endproc

.proc LevelDecodeLoop
: jsr LevelDecodeCommand
  jmp :-
.endproc

DoLevelUploadListAndSprites:
  jsr UploadSpriteSlots
.proc DoLevelUploadList
  jsr WaitVblank
  jsr InitPaletteWrites

; background and palettes
  ldy #0
: tya
  lda LevelUploadList,y
  cmp #255
  beq :+
  jsr DoGraphicUpload
  iny
  bne :-
:

  jmp FlushPaletteWrites
.endproc

.proc UploadSpriteSlots
; sprites
  ldy #0
: tya
  asl
  sta 0
  lda SpriteTileSlots,y
  jsr DoGraphicUpload_Off
  iny
  cpy #4
  bne :-
  rts
.endproc

LoadingCHR:
.incbin "chr/loading.chr"

.proc LevelDecodeCommand
ObjectType = DecodeObjectType
ObjectXY = DecodeObjectXY
  ldy #0
  lda (LevelDecodePointer),y
  cmp #$f0
  bcs SpecialCommand

  ; IDs below $f0 are regular commands
NormalCommand:

  sta ObjectType
  iny
  lda (LevelDecodePointer),y ; read XY byte too
  sta ObjectXY
  lsr ; get X nybble only
  lsr
  lsr
  lsr
  add LevelDecodeXPos
  sta LevelDecodeXPos
  pha
  lda ObjectXY
  and #15
  sta ObjectXY
  tay
  pla
  jsr GetLevelColumnPtr

  lda #2
  jsr IncreasePointerBy ; skip pointer over type byte and XY byte
  ; pointer is now at the optional settings byte, if it exists

  lda ObjectType
  asl
  tay
  sty 0
  ldx ObjectTypesTable+0,y
  lda DecodeObjectTypesAddressesH,x
  pha
  lda DecodeObjectTypesAddressesL,x
  pha
  lda ObjectTypesTable+1,y ; read byte specified for this command
  ldy #0                   ; point Y at the optional settings byte again
  rts

SpecialCommand:
  inc16 LevelDecodePointer ; skip over special command type byte
  ; Y is still zero, A is still type byte
  and #$0f
  asl
  tax
  lda SpecialCommandTable+1,x
  pha
  lda SpecialCommandTable+0,x
  pha
  rts
SpecialCommandTable:
  .raddr SpecialFinished
  .raddr SpecialSetX
  .raddr SpecialWrite1Column
  .raddr SpecialWrite2Column
  .raddr SpecialWrite3Column
  .raddr SpecialXMinus16
  .raddr SpecialXPlus16
  .raddr SpecialConfig

SpecialConfigTable:
  .raddr SpecialConfigEnablePuzzle
  .raddr SpecialConfigMakeBackgrounds
  .raddr SpecialConfigStartDialog

SpecialConfigMakeBackgrounds:
  lda (LevelDecodePointer),y
  unpack 1, 0
  lda 0
  sec
  adc 1
  sta 1
  ; 0 = starting page
  ; 1 = ending page
  iny
  lda (LevelDecodePointer),y
  asl
  tax
  jsr IncreasePointerBy2

  ; Push the routine for the background type
  lda BackgroundRoutines+1,x
  pha
  lda BackgroundRoutines+0,x
  pha
  rts

BackgroundRoutines:
  .raddr BGClouds
  .raddr BGCloudsEverywhere
  .raddr MakeFrozenBackground
  .raddr BGStars

BGStars:
  lda #<StarryBackground
  sta LevelRoutine+0
  lda #>StarryBackground
  sta LevelRoutine+1
  rts

MakeFrozenBackground:
  lda #Metatiles::FROZEN_BACKGROUND
  sta BackgroundMetatile

  lda #0
  tay
  sta 0
  lda #$60
  sta 1
fill_loop:
  lda (0),y
  bne :+
  lda #Metatiles::FROZEN_BACKGROUND
  sta (0),y
: iny
  bne fill_loop
  inc 1
  lda 1
  cmp #$70
  bne fill_loop
  rts

SpecialConfigStartDialog:
  lda CutscenesEnabled
  beq SkipDialog

  ; Don't reshow dialogs already shown once
  lda LevelNumber
  cmp IntroShownAlready
  beq SkipDialog
  sta IntroShownAlready
ShowDialogAnyway:
  inc NeedDialog
  ldy #0
  lda (LevelDecodePointer),y
  sta ScriptPtr
  iny
  lda (LevelDecodePointer),y
  sta ScriptPtr+1
SkipDialog:
  jmp IncreasePointerBy2

SpecialConfigEnablePuzzle:
  lda #1
  sta PuzzleMode

  ; Clear the current inventory
  ldx #InventoryEnd-InventoryType-1
  lda #0
: sta InventoryType,x
  dex
  bpl :-

  lda PlayerAbility
  sta PuzzleModeAbilityBackup

  ; Write the current ability
  lda (LevelDecodePointer),y ; keep the ability if the level decides to do so
  cmp #AbilityType::LAST
  beq :+
  ora #128
  sta NeedAbilityChange
  inc NeedAbilityChangeNoSound
: jsr IncreasePointerBy1

  ; Write a new inventory specifically for this level
  ldx #0
@Loop:
  ; if most significant bit clear, it's an item
  ; if most significant bit set, it's an item amount
  lda (LevelDecodePointer),y
  beq IncreasePointerBy1
  bpl @NormalInventoryItem
  and #127
  sta InventoryAmount-1,x ; -1, because x is the next free item slot, not the item we just added
  bpl @WasInventoryAmount ; unconditional since we just cleared the high bit
@NormalInventoryItem:
  sta InventoryType,x
  lda #0
  sta InventoryAmount,x
  inx
@WasInventoryAmount:
  jsr IncreasePointerBy1
  jmp @Loop

; Special config command
SpecialConfig:
  lda (LevelDecodePointer),y
  asl
  tax
  inc16 LevelDecodePointer
  lda SpecialConfigTable+1,x
  pha
  lda SpecialConfigTable+0,x
  pha
  rts
IncreasePointerBy2:
  lda #2
  bne IncreasePointerBy
IncreasePointerBy1:
  lda #1
IncreasePointerBy:
  add LevelDecodePointer+0
  sta LevelDecodePointer+0
  bcc :+
    inc LevelDecodePointer+1
: rts
SpecialSetX:
  lda (LevelDecodePointer),y
  sta LevelDecodeXPos
  jmp IncreasePointerBy1
SpecialWrite1Column:
  lda LevelDecodeXPos
  tax
  lda (LevelDecodePointer),y
  sta ColumnBytes,x
  jmp IncreasePointerBy1
SpecialWrite2Column:
  lda LevelDecodeXPos
  tax
  lda (LevelDecodePointer),y
  sta ColumnBytes,x
  iny
  lda (LevelDecodePointer),y
  sta ColumnBytes+1,x
  jmp IncreasePointerBy2
SpecialWrite3Column:
  lda LevelDecodeXPos
  tax
  lda (LevelDecodePointer),y
  sta ColumnBytes,x
  iny
  lda (LevelDecodePointer),y
  sta ColumnBytes+1,x
  iny
  lda (LevelDecodePointer),y
  sta ColumnBytes+2,x
  lda #3
  jmp IncreasePointerBy
SpecialXMinus16:
  lda LevelDecodeXPos
  sub #16
  sta LevelDecodeXPos
  rts
SpecialXPlus16:
  lda LevelDecodeXPos
  add #16
  sta LevelDecodeXPos
  rts
SpecialFinished:
  pla
  pla
  rts
.endproc

IncreaseDecodePointerBy = LevelDecodeCommand::IncreasePointerBy

.proc DO_CustomBlockSingle
  lda (LevelDecodePointer),y
  ldy DecodeObjectXY
  sta (LevelBlockPtr),y
  lda #1
  jmp IncreaseDecodePointerBy
.endproc

.proc DO_CustomBlockRectangle
  lda (LevelDecodePointer),y
  sta DecodeObjectBlock
  iny
  lda (LevelDecodePointer),y
  jsr DecodeWriteRectangleConvert
  lda #2
  jmp IncreaseDecodePointerBy
.endproc

.proc DO_BlockSingle
  ldy DecodeObjectXY
  sta (LevelBlockPtr),y  
  rts
.endproc

.proc DO_BlockRectangle
  sta DecodeObjectBlock
  lda (LevelDecodePointer),y
  jsr DecodeWriteRectangleConvert
  lda #1
  jmp IncreaseDecodePointerBy
.endproc

.if 0 ; not useful
.proc DO_BlockExtraWide
  sta DecodeObjectBlock
  lda (LevelDecodePointer),y
  sta DecodeObjectWidth
  lda #0
  sta DecodeObjectHeight
  jsr DecodeWriteRectangle
  lda #1
  jmp IncreaseDecodePointerBy
.endproc

.proc DO_BlockExtraTall
  sta DecodeObjectBlock
  lda (LevelDecodePointer),y
  sta DecodeObjectHeight
  lda #0
  sta DecodeObjectWidth
  jsr DecodeWriteRectangle
  lda #1
  jmp IncreaseDecodePointerBy
.endproc
.endif

.proc DO_BlockWideList
  sta 0
  lda (LevelDecodePointer),y
  pha
  lsr
  lsr
  lsr
  lsr
  sta DecodeObjectWidth
  pla
  and #15
  add 0
  tax
  lda ObjectTypesList,x
  sta DecodeObjectBlock
  lda #0
  sta DecodeObjectHeight
  jsr DecodeWriteRectangle
  lda #1
  jmp IncreaseDecodePointerBy
.endproc

.proc DO_BlockRectList
  sta 0
  lda (LevelDecodePointer),y
  pha
  lsr
  lsr
  lsr
  lsr
  sta DecodeObjectHeight
  pla
  and #15
  add 0
  tax
  lda ObjectTypesList,x
  sta DecodeObjectBlock
  iny
  lda (LevelDecodePointer),y
  sta DecodeObjectWidth
  jsr DecodeWriteRectangle
  lda #2
  jmp IncreaseDecodePointerBy
.endproc

.proc DO_BlockTallList
  sta 0
  lda (LevelDecodePointer),y
  pha
  lsr
  lsr
  lsr
  lsr
  sta DecodeObjectHeight
  pla
  and #15
  add 0
  tax
  lda ObjectTypesList,x
  sta DecodeObjectBlock
  lda #0
  sta DecodeObjectWidth
  jsr DecodeWriteRectangle
  lda #1
  jmp IncreaseDecodePointerBy
.endproc

DecodeWriteRectangleConvert:
  pha
  lsr
  lsr
  lsr
  lsr
  sta DecodeObjectWidth
  pla
  and #15
  sta DecodeObjectHeight
; Writes a rectangle to the level buffer
; inputs: DecodeObjectType, DecodeObjectXY, DecodeObjectBlock, DecodeObjectWidth, DecodeObjectHeight
; locals: 5, TempSpace+0..TempSpace+4
.proc DecodeWriteRectangle
  inc DecodeObjectWidth ; increase width and height by 1
  inc DecodeObjectHeight
ColumnLoop:
  lda DecodeObjectHeight ; save height
  sta 5

  ldy DecodeObjectXY
  lda DecodeObjectBlock
RowLoop:
  sta (LevelBlockPtr),y
  iny
  dec 5
  bne RowLoop

  ; next column
  lda LevelBlockPtr
  add #16
  sta LevelBlockPtr
  bcc :+
    inc LevelBlockPtr+1
: dec DecodeObjectWidth
  bne ColumnLoop
  rts
.endproc

.proc DO_RectangleSeries
CurrentXY = 0
Width = 1
Height = 2
TempHeight = 3
  sta DecodeObjectBlock
PointLoop:
  ; read the X and Y
  ldy #0
  lda (LevelDecodePointer),y
  inc16 LevelDecodePointer
  cmp #$ff ; if $ff is read, we're done
  rtseq

  ; unpack into the X and Y
  pha
  lsr
  lsr
  lsr
  lsr
  sta Width
  inc Width ; width is 1-16
  pla
  and #15
  sta Height  ; zero height is valid, no adjustment needed

  ; fill the rectangle column by column
ColumnLoop:
  lda Height
  sta TempHeight
  beq SkipFill ; zero height won't write anything

  ; fill column
  ldy DecodeObjectXY ; base Y
  lda DecodeObjectBlock
: sta (LevelBlockPtr),y
  dey
  dec TempHeight
  bne :-
SkipFill:

  ; move to the next column
  lda LevelBlockPtr
  add #16
  sta LevelBlockPtr
  bcc :+
    inc LevelBlockPtr+1
:
  ; are we done with the rectangle yet?
  dec Width
  bne ColumnLoop

  jmp PointLoop
.endproc

; --------- backgrounds, move to another bank maybe? ----------
.proc BGClouds
StartPage = 0
EndPage   = 1
Column    = 0
RowChooseMask = 2
AttemptsLeft = 3

  lda #3
  bne NotCloudsEverywhere
CloudsEverywhere:
  lda #15
NotCloudsEverywhere:
  sta RowChooseMask

  ; Multiply start page and end page out into actual column numbers
  lda StartPage
  asl
  asl
  asl
  asl
  sta Column
  lda EndPage
  asl
  asl
  asl
  asl
  sta EndPage
Loop:
  ; Pick a random column relative to this one
  jsr huge_rand
  and #3
  add #9
  add Column
  bcs Exit
  ldy EndPage
  beq :+
  cmp EndPage
  bcs Exit
:
  cmp #256-3-9 ; ??
  bcs Exit
  sta Column

  ; Attempt to place the cloud down
  lda #4
  sta AttemptsLeft
TryAgain:
  lda Column
  jsr GetLevelColumnPtr

  ; pick a row
  jsr huge_rand
  lsr
  and RowChooseMask
  tay

  ; Test to see if this column and row works
  lda (LevelBlockPtr),y
  bne Bad
  jsr NextColumn
  lda (LevelBlockPtr),y
  bne Bad
  jsr NextColumn
  lda (LevelBlockPtr),y
  bne Bad
  ; Good, so go backwards and put those back in!
  lda #Metatiles::CLOUD_R
  sta (LevelBlockPtr),y
  jsr PrevColumn
  lda #Metatiles::CLOUD_M
  sta (LevelBlockPtr),y
  jsr PrevColumn
  lda #Metatiles::CLOUD_L
  sta (LevelBlockPtr),y
  jmp Loop

Bad:
  inc Column
  lda Column
  cmp #$f8
  bcs Exit

  dec AttemptsLeft
  bne TryAgain
  jmp Loop

Exit:
  rts

NextColumn:
  tya
  add #16
  tay
  rts
PrevColumn:
  tya
  sub #16
  tay
  rts
.endproc
BGCloudsEverywhere = BGClouds::CloudsEverywhere
