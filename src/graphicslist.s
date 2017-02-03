; p... bbbb
; |    ++++- bank, 0-15
; +--------- 1 if this is a palette

IS_GRAPHIC = %00000000 ; compressed graphics
IS_PALETTE = %10000000 ; palette colors
;banks available: GRAPHICS_BANK1, GRAPHICS_BANK2, GRAPHICS_BANK3

GraphicsList:
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <BGCommon,     >BGCommon
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <BGGrassy,     >BGGrassy
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <SPWalker,     >SPWalker
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <SPCannon,     >SPCannon
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <SPFire,       >SPFire
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <SPKing,       >SPKing
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <SPGeorge,     >SPGeorge
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <SPExplode,    >SPExplode
  .byt GRAPHICS_BANK1|IS_PALETTE, <PalGrassy,    >PalGrassy
  .byt GRAPHICS_BANK1|IS_PALETTE, <PalBummer,    >PalBummer
  .byt GRAPHICS_BANK1|IS_PALETTE, <PalFrozen,    >PalFrozen
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <BGCutscene,   >BGCutscene
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <BGGrassyBG,   >BGGrassyBG
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <BGChip,       >BGChip
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <TitleCHR,     >TitleCHR
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <TitleNAM,     >TitleNAM
  .byt GRAPHICS_BANK1|IS_PALETTE, <PalTitle,     >PalTitle
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <InventoryCHR, >InventoryCHR
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <SPSun,        >SPSun
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <NPCCHR,       >NPCCHR
  .byt GRAPHICS_BANK1|IS_PALETTE, <PalEnemy1,    >PalEnemy1
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <BGFrozenFG,   >BGFrozenFG
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <BGFrozenBG,   >BGFrozenBG
  .byt GRAPHICS_BANK1|IS_PALETTE, <PalEnemy2,    >PalEnemy2
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <BGBummer,     >BGBummer
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <LevelSelCHR,  >LevelSelCHR
  .byt GRAPHICS_BANK1|IS_PALETTE, <PalLevelSel,  >PalLevelSel
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <SPRonald,     >SPRonald
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <SPMines,      >SPMines
  .byt GRAPHICS_BANK1|IS_GRAPHIC, <CHRFont,      >CHRFont
  .byt GRAPHICS_BANK2|IS_GRAPHIC, <BGTropical,   >BGTropical
  .byt GRAPHICS_BANK2|IS_GRAPHIC, <BGSuburbs,    >BGSuburbs
  .byt GRAPHICS_BANK2|IS_GRAPHIC, <BGHannah,     >BGHannah
  .byt GRAPHICS_BANK1|IS_PALETTE, <AltGrassy1,   >AltGrassy1
  .byt GRAPHICS_BANK1|IS_PALETTE, <AltGrassy2,   >AltGrassy2
  .byt GRAPHICS_BANK2|IS_GRAPHIC, <SPSchemeTeam, >SPSchemeTeam
  .byt GRAPHICS_BANK2|IS_GRAPHIC, <SPHannah,     >SPHannah
  .byt GRAPHICS_BANK2|IS_GRAPHIC, <SPLife,       >SPLife
  .byt GRAPHICS_BANK1|IS_PALETTE, <PalEnemy3,    >PalEnemy3
; Uploads graphics from GraphicsList
; input: A (graphic number)
DoGraphicUpload:
  pha
  lda #0
  sta 0
  pla
; Uploads graphics from GraphicsList, but with an offset
; input: A (graphic number), 0 (offset)
.proc DoGraphicUpload_Off
Temp = 1
Pointer = 2
  sta Temp
  pushaxy

  ; multiply by 3 since every entry is 3 bytes long
  lda Temp
  asl      ; change if GraphicsList grows to over 85 entries
  add Temp
  tax

  ; now get the bank number and switch to the proper bank
  lda GraphicsList+0,x
  sta Temp ; save the flags+bank byte
  and #15
  jsr _SetPRG
  ; get the pointer too
  lda GraphicsList+1,x
  sta Pointer+0
  lda GraphicsList+2,x
  sta Pointer+1

  ; if the most significant bit is set, it's a palette, not graphics
  lda Temp
  bpl NotPalette
    ; set the PPU address
    ; the first byte of the palette data specifies the palette start and palette length
    ldy #0
    lda #$3f
    sta PPUADDR
    lda (Pointer),y
    pha
    lsr
    lsr
    and #%011100
    sta PPUADDR ; address is set
    pla
    and #15     ; get just the length, from the bottom half
    sta Temp
    ; write the palette colors in
  : lda LevelBackgroundColor
    sta PPUDATA
    .repeat 3
      iny
      lda (Pointer),y
      sta PPUDATA
    .endrep
    dec Temp
    bpl :-
    ; don't do the graphics decompression, these aren't graphics
    ; we still need to pullaxy though
    jmp NotCompressedGraphics
NotPalette:
  CompressedGraphics:
    lda Pointer+0
    ldy Pointer+1
    ldx 0
    jsr DecompressCHR_Off
NotCompressedGraphics:

  jsr SetPRG_Restore
  pullaxy
  rts
.endproc

; Decompresses a graphics file
; input: YA (address of the graphics)
DecompressCHR: ; no offset used
  ldx #0

; Decompresses a graphics file with an offset
; input: YA (address of the graphics), X (offset in rows)
.proc DecompressCHR_Off
; offset used, destination row has X added to it
ChunksLeft = 3
  ; write pointer to info
  sta 0
  sty 1

  ldy #2
  lda (0),y
  sta ChunksLeft
  ; write high PPU address byte
  dey
  txa
  add (0),y   ; 16 tiles = 256 bytes, so we can just add to the high byte
  sta PPUADDR

  ; write low PPU address byte
  dey
  lda (0),y
  sta PPUADDR

  ; move pointer to the actual data
  lda 0
  add #3
  sta ciSrc+0
  lda 1
  adc #0       ; carry over to the next page if needed
  sta ciSrc+1

  lda #0
  sta ciBufStart
  lda #128
  sta ciBufEnd
ChunksLoop:
  jsr unpb53_some
  ldx #0
: lda PB53_outbuf,x
  sta PPUDATA
  inx
  cpx #128
  bne :-
  dec ChunksLeft
  bne ChunksLoop
  jmp ClearOAM
.endproc
