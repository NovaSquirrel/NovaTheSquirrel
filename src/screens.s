.proc ShowTitle
; Turn on NMIs
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_0000
  sta PPUCTRL

; Upload the palette, nametable and graphics
  lda #0
  sta PPUMASK
  lda #$30
  sta LevelBackgroundColor
  lda #GraphicsUpload::TITLE_CHR
  jsr DoGraphicUpload
  lda #GraphicsUpload::TITLE_NAM
  jsr DoGraphicUpload
  lda #GraphicsUpload::TITLE_PAL
  jsr DoGraphicUpload
  ; Clear sprites too
  jsr ClearOAM
  lda #2
  sta OAM_DMA

; Turn on the display and get it ready
  jsr WaitVblank
  lda #BG_ON|OBJ_ON
  sta PPUMASK
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_0000
  sta PPUCTRL
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

DisplayLoop:
  jsr WaitVblank
  jsr ReadJoy
  lda keydown
  and #KEY_START
  bne Exit
  jmp DisplayLoop
Exit:
  jsr WaitVblank
  jsr ReadJoy
  lda keydown
  and #KEY_START
  bne Exit

  ; Disable rendering again
  jsr WaitVblank
  lda #0
  sta PPUMASK
  rts
.endproc

.proc ShowDie
  jsr WaitVblank
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  ; Set the palette to black and red
  ldx #4
: lda #$0f
  sta PPUDATA
  lda #$06
  sta PPUDATA
  lda #$16
  sta PPUDATA
  lda #$26
  sta PPUDATA
  dex
  bne :-
  jsr UpdateScrollRegister

  ; Play the sample
  ; to do: move to using something other than DPCM, so it can be in a different bank
  lda #%100000
  sta DMC_RAW
  lda #13
  sta DMC_FREQ
  lda #(DieSampleEnd-1-DieSample)/16
  sta DMC_LEN
  lda #<(DieSample>>6)
  sta DMC_START
  lda #CH_DPCM
  sta SND_CHN

  ; Wait until the sample finishes playing
: lda SND_CHN
  and #CH_DPCM
  bne :-

  jmp Reset
.endproc

.proc PauseScreen
Counter = 0
IconList = TempSpace ; can use this since the level will be redrawn anyway
  jsr pently_init
  inc pently_music_playing

DrawAgain:
  ; Clear icon list
  ldx #15
  lda #0
: sta IconList,x
  dex
  bpl :-

  ; No swap
  lda #128
  sta InventoryCursorYSwap

; Clear the screen and the background part of the CHR
  jsr WaitVblank
  lda #0
  sta PPUMASK
  jsr ClearBG4kb

  ; Clear attributes
  lda #$23
  sta PPUADDR
  lda #$c0
  sta PPUADDR
  lda #0
  ldx #64
  jsr WritePPURepeated

  lda #GraphicsUpload::INVENTORY_CHR
  jsr DoGraphicUpload
; Change palette
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  tax
: lda InventoryPalette,x
  sta PPUDATA
  inx
  cpx #4
  bne :- 

  ; Write icons and names
  lda #VWF_BANK
  jsr _SetPRG

  ldy #0
: ldx InventoryType,y
  lda InventoryIIcon,x
  sta IconList+3,y
  sty TouchTemp

  ; Write item name
  lda InventoryINameH,x
  pha
  lda InventoryINameL,x
  pha
  jsr clearLineImg
  ldx #0
  pla
  tay
  pla
  jsr vwfPuts
  lda TouchTemp
  add #5
  ldy #0
  jsr copyLineImg

  ldy TouchTemp
  iny
  cpy #InventoryLen
  bne :-

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
DoNametable:
  ; Make random background
  lda #$20
  sta PPUADDR
  lda #$00
  sta PPUADDR
  ldx #0
  jsr MakeBG_Alt
  lda #$22
  sta PPUADDR
  lda #$c0
  sta PPUADDR
  ldx #0
  jsr MakeBG_Alt
; Make a nametable that lets us make whatever
  lda #0
  sta 0
  PositionXY 0, 0, 7
  jsr MakeBG
  lda #0
  ldx #16
  jsr WritePPURepeated
  jsr MakeBG
: jsr MakeBG
  ldx 0
  lda IconList,x
  sta PPUDATA
  lda #0
  sta PPUDATA
  lda 0
  add #2
  asl
  asl
  asl
  asl
  tay
  ldx #14
  jsr WriteIncreasing
  jsr MakeBG
  inc 0
  lda 0
  cmp #14
  bne :-

; Write an item name
  ldy #<PausedString
  lda #>PausedString
  ldx #2
  jsr WriteVWFLine
  ldy #<InventoryString
  lda #>InventoryString
  ldx #4
  jsr WriteVWFLine

; copyLineImg uses vertical writing mode, so switch it back
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL

; Turn rendering back on
  jsr ClearOAM
  jsr WaitVblank
  lda #2
  sta OAM_DMA
  lda #OBJ_ON|BG_ON
  sta PPUMASK
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
; Wait for Start unpress
: jsr ReadJoy
  lda keydown
  and #KEY_START
  bne :-

; Start the menu control loop
Loop:
  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK
  lda #2
  sta OAM_DMA
  jsr ReadJoy

  lda keydown
  and #KEY_A
  jne DoInventoryCode

  lda keynew
  and #KEY_SELECT
  beq NotSelect
    lda InventoryCursorYSwap
    bmi @SetSwap
    ldx InventoryCursorYSwap
    ldy InventoryCursorY
    lda InventoryType,x
    pha
    lda InventoryType,y
    sta InventoryType,x
    pla
    sta InventoryType,y

    lda InventoryLen,x
    pha
    lda InventoryLen,y
    sta InventoryLen,x
    pla
    sta InventoryLen,y
    jmp DrawAgain
@SetSwap:
    lda InventoryCursorY
    sta InventoryCursorYSwap
  NotSelect:

  lda keynew
  and #KEY_UP
  beq :+
    dec InventoryCursorY
    bpl :+
    lda #InventoryLen-1
    sta InventoryCursorY
  :

  lda keynew
  and #KEY_DOWN
  beq :+
    inc InventoryCursorY
    lda InventoryCursorY
    cmp #InventoryLen
    bne :+
    lda #0
    sta InventoryCursorY
  :

  ; Draw cursor
  lda #7*8
  sta OAM_XPOS
  sta OAM_XPOS+4
  lda InventoryCursorY
  asl
  asl
  asl
  add #8*11-1
  sta OAM_YPOS
  lda #$51
  sta OAM_TILE
  sta OAM_TILE+4
  ldx #0
  stx OAM_ATTR+0
  inx
  stx OAM_ATTR+4

  ; draw swap cursor
  lda #<-16
  sta OAM_YPOS+4
  lda InventoryCursorYSwap
  bmi :+
    and #15
    asl
    asl
    asl
    add #8*11-1
    sta OAM_YPOS+4
    lda #1
    sta OAM_ATTR+4
  :

  lda keydown
  and #KEY_START
  jeq Loop

; Wait for unpress
: jsr ReadJoy
  lda keydown
  and #KEY_START
  bne :-

  jmp :+
DoInventoryCode:
  jsr CallInventoryCode
:

  ; Restore old background tiles and palette
  jsr WaitVblank
  lda #0
  sta PPUMASK
  bit PPUSTATUS
  jsr DoLevelUploadList
  jsr ClearOAM
  lda #2
  sta OAM_DMA
  inc NeedLevelRerender
  jmp UpdateScrollRegister

; input: AY (address), X (row)
WriteVWFLine:
  sta TempVal
  stx TempX
  sty TempY
  lda #VWF_BANK
  jsr _SetPRG
  jsr clearLineImg
  ldx #0
  ldy TempY
  lda TempVal
  jsr vwfPuts
  lda TempX
  ldy #0
  jmp copyLineImg

CallInventoryCode:
  ldx InventoryCursorY
  ldy InventoryType,x
  lda InventoryICodeH,y
  pha
  lda InventoryICodeL,y
  pha
  tya
  rts
MakeBG:
  ldx #8
MakeBG_Alt:
: jsr huge_rand
  and #$03
  ora #$18
  sta PPUDATA
  dex
  bne :-
  rts

InventoryPalette:
  .byt $30, $0f, $00, $2a
.endproc
PausedString:
  .byt "P A U S E D",0
InventoryString:
  .byt " - Inventory - ",0
