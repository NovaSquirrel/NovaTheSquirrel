; Names are based on
; http://nesdevwiki.org/index.php/NES_PPU
; http://nesdevwiki.org/index.php/2A03

; PPU registers
PPUCTRL     = $2000
NT_2000     = $00
NT_2400     = $01
NT_2800     = $02
NT_2C00     = $03
MSB_XSCROLL = $01
MSB_YSCROLL = $02
VRAM_RIGHT  = $00 ; writes/reads to PPUDATA increment PPUADDR
VRAM_ACROSS = $00
VRAM_DOWN   = $04 ; writes/reads to PPUDATA add 32 to PPUADDR
OBJ_0000    = $00
OBJ_1000    = $08
OBJ_8X8     = $00
OBJ_8X16    = $20
BG_0000     = $00
BG_1000     = $10
VBLANK_NMI  = $80

PPUMASK     = $2001
LIGHTGRAY   = $01
BG_OFF      = $00
BG_CLIP     = $08
BG_ON       = $0A
OBJ_OFF     = $00
OBJ_CLIP    = $10
OBJ_ON      = $14
INT_RED     = %00100000
INT_GREEN   = %01000000
INT_BLUE    = %10000000

PPUSTATUS      = $2002
SPR_OVERFLOW   = %00100000
SPR_HIT        = %01000000
VBLANK_STARTED = %10000000

OAMADDR   = $2003
OAMDATA   = $2004
PPUSCROLL = $2005
PPUADDR   = $2006
PPUDATA   = $2007

; Pulse channel registers
SQ1_VOL   = $4000
SQ1_SWEEP = $4001
SQ1_LO    = $4002
SQ1_HI    = $4003
SQ2_VOL   = $4004
SQ2_SWEEP = $4005
SQ2_LO    = $4006
SQ2_HI    = $4007

SQ_1_8      = $00  ; 1/8 duty (sounds sharp)
SQ_1_4      = $40  ; 1/4 duty (sounds rich)
SQ_1_2      = $80  ; 1/2 duty (sounds hollow)
SQ_3_4      = $C0  ; 3/4 duty (sounds like 1/4)
SQ_HOLD     = $20  ; halt length counter
SQ_CONSTVOL = $10  ; 0: envelope decays from 15 to 0; 1: constant volume
SWEEP_OFF   = $08

; Triangle channel registers
TRI_LINEAR = $4008
TRI_LO     = $400A
TRI_HI     = $400B

TRI_HOLD = $80

; Noise channel registers
NOISE_VOL = $400C
NOISE_LO  = $400E
NOISE_HI  = $400F

NOISE_HOLD = SQ_HOLD
NOISE_CONSTVOL = SQ_CONSTVOL
NOISE_LOOP = $80

; DPCM registers
DMC_FREQ  = $4010
DMC_RAW   = $4011
DMC_START = $4012
DMC_LEN   = $4013

; OAM DMA unit register
; Writing $xx here causes 256 bytes to be copied from $xx00-$xxFF
; to OAMDATA
OAM_DMA = $4014
OAMDMA  = $4014

; Sound channel control and status register
SND_CHN       = $4015
CH_SQ1   = %00000001
CH_SQ2   = %00000010
CH_TRI   = %00000100
CH_NOISE = %00001000
CH_ALL   = %00001111  ; all tone generators, not dpcm
CH_DPCM  = %00010000

JOY1 = $4016
JOY2 = $4017
APUCTRL       = $4017
APUCTRL_5STEP = $80
APUCTRL_NOIRQ = $40

OAM_COLOR_0 =  %00000000
OAM_COLOR_1 =  %00000001
OAM_COLOR_2 =  %00000010
OAM_COLOR_3 =  %00000011
OAM_PRIORITY = %00100000
OAM_XFLIP    = %01000000
OAM_YFLIP    = %10000000

OAM_YPOS = $200
OAM_TILE = $201
OAM_ATTR = $202
OAM_XPOS = $203

KEY_RIGHT = %00000001
KEY_LEFT  = %00000010
KEY_DOWN  = %00000100
KEY_UP    = %00001000
KEY_START = %00010000
KEY_SELECT= %00100000
KEY_B     = %01000000
KEY_A     = %10000000
KEY_SNES_A = %10000000
KEY_SNES_X = %01000000
KEY_SNES_L = %00100000
KEY_SNES_R = %00010000

; and now macros ----------------------------------------------------------

.feature leading_dot_in_identifiers
.macpack generic
.macpack longbranch

; Meant to be an easy replacement for .repeat and .endrepeat
; when you're trying to save space. Uses a zeropage memory location
; instead of a register as a loop counter so as not to disturb any
; registers.
; Times - Number of times to loop ( may be a memory location )
; Free  - Free zeropage memory location to use
.macro .dj_loop Times, Free
  .scope
    DJ_Counter = Free
    lda Times
    sta Free
DJ_Label:
.endmacro
.macro .end_djl
  NextIndex:
    dec DJ_Counter
    jne DJ_Label
  .endscope
.endmacro

; These use increments (useless)
.macro .ij_loop Times, Free
  .scope
    DJ_Times = Times
    DJ_Counter = Free
    lda #0
    sta Free
DJ_Label:
.endmacro
.macro .end_ijl
  NextIndex:
    inc DJ_Counter
    lda DJ_Counter
    cmp Times
    jne DJ_Label
  .endscope
.endmacro

; swap using X
.macro swapx mema, memb
  ldx mema
  lda memb
  stx memb
  sta mema
.endmacro

; swap using Y
.macro swapy mema, memb
  ldy mema
  lda memb
  sty memb
  sta mema
.endmacro

; swap using just A + stack
.macro swapa mema, memb
  lda mema
  pha
  lda memb
  sta mema
  pla
  sta memb
.endmacro

; swap array,x and array,y
.macro swaparray list
  lda list,x
  pha
  lda list,y
  sta list,x
  pla
  sta list,y
.endmacro

; Imitation of z80's djnz opcode.
; Can be on A, X, Y, or a zeropage memory location
; Label - Label to jump to
; Reg   - Counter register to use: A,X,Y or memory location
.macro djnz Label, Reg
  .if (.match({Reg}, a))
    sub #1
  .elseif (.match({Reg}, x))
    dex
  .elseif (.match({Reg}, y))
    dey
  .else
    dec var
  .endif
  bne Label
.endmacro

; Working with X,Y is much more fun than working with PPU addresses
; give it an X and Y position, as well as a nametable number (0-3),
; and if you want to save the address to a 16-bit zeropage address
; ( big endian ) you can give an additional argument.
; NT - Nametable number (0-3)
; PX - X position in tiles
; PY - Y position in tiles
; Var - Variable to store address in (optional)
.macro PositionXY NT, PX, PY, Var
	.scope
		t0 = $2000 + (NT * 1024)	; Nametable data starts at $2000 
		t1 = PX                 ; and each nametable is 1024 bytes in size
		t2 = PY * 32			; Nametable rows are 32 bytes large
		t3 = t0 + t1 + t2
        .ifblank Var        ; Are we going to be writing this directly to PPUADDR?
          lda #>t3
          sta $2006
          lda #<t3
          sta $2006
        .else               ; Are we going to be storing this to a pointer in zeropage instead?
          lda #>t3
          sta Var+0
          lda #<t3
          sta Var+1
        .endif
	.endscope
.endmacro

.macro .nyb InpA, InpB		; Makes a .byt storing two 4 bit values
	.byt ( InpA<<4 ) | InpB
.endmacro

.macro .raddr This          ; like .addr but for making "RTS trick" tables with
 .addr This-1
.endmacro

.macro neg
  eor #255
  add #1
.endmacro

.macro abs ; absolute value
.local @Skip
  bpl @Skip
  neg
@Skip:
.endmacro

.macro sex ; sign extend
.local @Skip
  ora #$7F
  bmi @Skip
  lda #0
@Skip:
.endmacro

.macro neg16 lo, hi
  sec             ;Ensure carry is set
  lda #0          ;Load constant zero
  sbc lo          ;... subtract the least significant byte
  sta lo          ;... and store the result
  lda #0          ;Load constant zero again
  sbc hi          ;... subtract the most significant byte
  sta hi          ;... and store the result
.endmacro

.macro neg16x lo, hi
  sec             ;Ensure carry is set
  lda #0          ;Load constant zero
  sbc lo,x        ;... subtract the least significant byte
  sta lo,x        ;... and store the result
  lda #0          ;Load constant zero again
  sbc hi,x        ;... subtract the most significant byte
  sta hi,x        ;... and store the result
.endmacro

.macro inc16 variable
.local @Skip
  inc variable+0
  bne @Skip
  inc variable+1
@Skip:
.endmacro

.macro dec16 variable
.local @Skip
  lda variable+0
  bne @Skip
  dec variable+1
@Skip:
  dec variable+0
.endmacro

.macro pushaxy
  pha
  txa
  pha
  tya
  pha
.endmacro

.macro pullaxy
  pla
  tay
  pla
  tax
  pla
.endmacro

.macro pushax
  pha
  txa
  pha
.endmacro

.macro pullax
  pla
  tax
  pla
.endmacro

.macro pushay
  pha
  tya
  pha
.endmacro

.macro pullay
  pla
  tay
  pla
.endmacro

.macro addcarry to
.local @Skip
  bcc @Skip
  inc to
@Skip:
.endmacro

.macro subcarry to
.local @Skip
  bcs @Skip
  dec to
@Skip:
.endmacro

.macro addcarryx to
.local @Skip
  bcc @Skip
  inc to,x
@Skip:
.endmacro

.macro subcarryx to
.local @Skip
  bcs @Skip
  dec to,x
@Skip:
.endmacro

.macro countdown counter
.local @Skip
  lda counter
  beq @Skip
    dec counter
@Skip:
.endmacro

; --- conditional return ---
.macro rtseq
.local @Skip
  bne @Skip
  rts
@Skip:
.endmacro

.macro rtsne
.local @Skip
  beq @Skip
  rts
@Skip:
.endmacro

.macro rtscc
.local @Skip
  bcs @Skip
  rts
@Skip:
.endmacro

.macro rtscs
.local @Skip
  bcc @Skip
  rts
@Skip:
.endmacro

.macro rtspl
.local @Skip
  bmi @Skip
  rts
@Skip:
.endmacro

.macro rtsmi
.local @Skip
  bpl @Skip
  rts
@Skip:
.endmacro

.macro unpack lo, hi
  pha
  and #15
  sta lo
  pla
  lsr
  lsr
  lsr
  lsr
  sta hi
.endmacro

.macro unpackx lo, hi
  pha
  and #15
  sta lo,x
  pla
  lsr
  lsr
  lsr
  lsr
  sta hi,x
.endmacro

.macro unpacky lo, hi
  pha
  and #15
  sta lo,y
  pla
  lsr
  lsr
  lsr
  lsr
  sta hi,y
.endmacro

.macro skip2
  .byt $2c ; BIT absolute
.endmacro

.macro asr ; Arithmetic shift left
  cmp #$80
  ror
.endmacro

.macro notcarry ; toggles carry
 rol
 eor #1
 ror
.endmacro
