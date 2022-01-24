.proc RunHexEditor
; PutStringImmediate uses 2 and 3
Pointer = ScriptPtr
Row = 4
Bank = 5
ColCount = 6
DisplayAddress = 7 ; and 8

CursorX = TouchTemp
CursorY = TouchTemp+1
RewriteAddress = TouchTemp+2 ; and 3
  jsr WaitVblank
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #0
  sta PPUMASK
  lda #' '
  jsr ClearNameCustom
  lda #GraphicsUpload::CHR_FONT
  jsr DoGraphicUpload
  jsr UploadNovaAndCommon
  jsr WaitVblank
  ; Write palette
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  ldx #0
: lda HexEditorPalette,x
  sta PPUDATA
  inx
  cpx #4
  bne :-

  PositionXY 0, 4, 21
  jsr PutStringImmediate
  .byt "Run as code",0
  PositionXY 0, 4, 22
  jsr PutStringImmediate
  .byt "Serial boot",0
  PositionXY 0, 4, 23
  jsr PutStringImmediate
  .byt "Clear 128 bytes",0
  PositionXY 0, 4, 25
  jsr PutStringImmediate
  .byt "Exit hex editor",0

  lda #<$6000
  sta Pointer+0
  lda #>$6000
  sta Pointer+1
  lda #0
  sta Bank
  sta CursorX
  sta CursorY
  sta DisplayAddress
  sta DisplayAddress+1

RerenderScreen:
  lda #0
  sta Row

.ifdef MAPPER_MMC1
  lda Bank
  asl
  asl
  jsr SetCHRBank
.endif

  lda #$20
  sta PPUADDR
  lda #$44
  sta PPUADDR
  jsr PutStringImmediate
  .byt "Bank ",0
  lda Bank
  ora #'0'
  sta PPUDATA
  lda #':'
  sta PPUDATA
  lda Pointer+1
  jsr PutHex
  lda Pointer+0
  jsr PutHex
  jsr PutStringImmediate
  .byt " - at 6000",0

RerenderRowLoop:
  lda #0
  sta 0

  lda Row
  jsr MulBy32
  add #4+32*4
  sta 1
  bcc :+
    inc 0
  :

  lda 0
  ora #$20
  sta PPUADDR
  lda 1
  sta PPUADDR

  ; Put all the columns
  lda #8
  sta ColCount
  lda Row
  asl
  asl
  asl
  tay
: lda (Pointer),y
  jsr PutHex
  lda #' '
  sta PPUDATA
  iny
  dec ColCount
  bne :-

  ; Sixteen rows
  inc Row
  lda Row
  cmp #16
  bne RerenderRowLoop

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  ; Force palette update
  lda #255
  sta retraces
Forever:
  jsr WaitVblank
  lda #2
  sta OAM_DMA

  PositionXY 0, 18, 2
  lda DisplayAddress+1
  beq :+
    ; Display it
    ldx #'a'
    stx PPUDATA
    ldx #'t'
    stx PPUDATA
    bit PPUDATA
    jsr PutHex
    lda DisplayAddress
    jsr PutHex
    bit PPUDATA
    ldy #0
    lda (DisplayAddress),y
    sta PPUDATA

    ldx RewriteAddress+0
    stx PPUADDR
    ldx RewriteAddress+1
    stx PPUADDR
    jsr PutHex
    jmp :++
  :
    ; Don't display it
    lda #' '
    sta PPUDATA
    sta PPUDATA
    sta PPUDATA
    sta PPUDATA
    sta PPUDATA
    sta PPUDATA
    sta PPUDATA
    sta PPUDATA
    sta PPUDATA
  :

  lda #OBJ_ON|BG_ON
  sta PPUMASK

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  jsr ReadJoy
  jsr KeyRepeat

  lda #0
  sta DisplayAddress
  sta DisplayAddress+1

  ; Find the address under the cursor
  lda CursorY
  beq :+
  cmp #17
  bcs :+
    lda CursorY
    sub #1
    asl
    asl
    asl
    ora CursorX
    adc Pointer
    sta DisplayAddress
    lda Pointer+1
    sta DisplayAddress+1

    ; Also put the address to rewrite
    lda #0
    sta 0
    lda CursorY
    add #3
    jsr MulBy32
    sta RewriteAddress+1
    lda 0
    ora #$20
    sta RewriteAddress+0

    lda CursorX
    asl
    adc CursorX
    adc #4
    ora RewriteAddress+1
    sta RewriteAddress+1
  :

  lda keydown
  and #KEY_A
  jne HoldingA
    lda keynew
    and #KEY_UP
    beq :+
      dec CursorY
      bpl :+
        lda #21-1
        sta CursorY
    :
    lda keynew
    and #KEY_DOWN
    beq :+
      inc CursorY
      lda CursorY
      cmp #21
      bne :+
        lda #0
        sta CursorY
    :

    lda CursorY
    beq IsTopRow

    lda keynew
    and #KEY_LEFT
    beq :+
      dec CursorX
    :
    lda keynew
    and #KEY_RIGHT
    beq :+
      inc CursorX
    :
    lda CursorX
    and #7
    sta CursorX
    jmp NotHoldingA

  IsTopRow:
    lda keynew
    and #KEY_B
    beq :+
      lda Bank
      add #1
      and #3
      sta Bank
      jsr ScreenOff
      jmp RerenderScreen
    :

    lda keynew
    and #KEY_LEFT
    beq @NotLeft
      lda Pointer
      sub #128
      sta Pointer
      subcarry Pointer+1

      lda Pointer+1
      cmp #$5f
      bne :+
        lda #$7f
        sta Pointer+1
        lda Bank
        sub #1
        and #3
        sta Bank
      :

      jsr ScreenOff
      jmp RerenderScreen
    @NotLeft:
    lda keynew
    and #KEY_RIGHT
    beq @NotRight
      lda Pointer
      add #128
      sta Pointer
      addcarry Pointer+1

      lda Pointer+1
      cmp #$80
      bne :+
        lda #$60
        sta Pointer+1
        lda Bank
        add #1
        and #3
        sta Bank
      :

      jsr ScreenOff
      jmp RerenderScreen
    @NotRight:
    jmp NotHoldingA

  HoldingA:
    lda DisplayAddress+1
    beq NotHoldingA
    ldy #0
    lda keynew
    and #KEY_LEFT
    beq :+
      lda (DisplayAddress),y
      sub #$10
      sta (DisplayAddress),y
    :
    lda keynew
    and #KEY_DOWN
    beq :+
      lda (DisplayAddress),y
      sub #$01
      sta (DisplayAddress),y
    :
    lda keynew
    and #KEY_UP
    beq :+
      lda (DisplayAddress),y
      add #$01
      sta (DisplayAddress),y
    :
    lda keynew
    and #KEY_RIGHT
    beq :+
      lda (DisplayAddress),y
      add #$10
      sta (DisplayAddress),y
    :
  NotHoldingA:
 
  ; Menu options at the bottom
  lda CursorY
  cmp #17
  jcc NotPressA
  lda keynew
  and #KEY_A
  jeq NotPressA
    jsr WaitVblank
    PositionXY 0, 10, 27
    jsr PutStringImmediate
    .byt "Are you sure?",0
    lda #0
    sta PPUSCROLL
    sta PPUSCROLL

    ; Wait for a press
  : jsr WaitVblank
    jsr ReadJoy
    lda keynew
    beq :-

    jsr WaitVblank
    PositionXY 0, 10, 27
    ldx #13
    lda #' '
    jsr WritePPURepeated
    lda #0
    sta PPUSCROLL
    sta PPUSCROLL

    lda keynew
    and #KEY_A
    beq NotPressA

    lda CursorY
    cmp #17
    bne Not17 ; Run
      jsr @Run
      jmp NotPressA
    @Run:
      jmp (Pointer)
    Not17:
    cmp #18
    bne Not18 ; Serial boot
      jmp LaunchSerialBoot
    Not18:
    cmp #19
    bne Not19 ; Clear 128 bytes
      ldy #127
      lda #0
    : sta (Pointer),y
      dey
      bpl :-
      jsr ScreenOff
      jmp RerenderScreen
    Not19:
    jmp Reset
  NotPressA:

  ; B = clear byte
  lda DisplayAddress+1
  beq :+
  lda keydown
  and #KEY_B
  beq :+
    ldy #0
    tya
    sta (DisplayAddress),y
  :

  lda #$f8       ; Hide the second sprite initially
  sta OAM_YPOS+4
  ldx CursorY
  lda CursorYPositions,x
  sta OAM_YPOS
  lda #4*8
  sta OAM_XPOS
  lda #$54
  sta OAM_TILE
  sta OAM_TILE+4
  lda #OAM_PRIORITY
  sta OAM_ATTR
  sta OAM_ATTR+4

  lda DisplayAddress+1
  beq NotRAM
    lda CursorX
    asl
    asl
    asl
    sta 0
    asl
    adc 0
    adc #4*8
    sta OAM_XPOS
    adc #8
    sta OAM_XPOS+4
    lda OAM_YPOS
    sta OAM_YPOS+4
  NotRAM:

  jmp Forever

MulBy32:
  .repeat 5
  asl
  rol 0
  .endrep
  rts

CursorYPositions:
  .byt 2*8-1
  .repeat 16, I
    .byt (4*8+8*I)-1
  .endrep
  .byt 21*8-1, 22*8-1, 23*8-1, 25*8-1
HexEditorPalette:
  .byt $30, $0f, $00, $10
.endproc
