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
.segment "VECTORS"	; NMI vector is at $FFFA, reset at $FFFC, IRQ at $FFFE
    .addr NMI   ; run at the start of vblank
	.addr Reset ; run when the NES boots or resets
	.addr IRQ   ; configurable
.code

NMI:
  inc retraces
DefaultIRQ:
  rti
IRQ:
  jmp (IRQAddress)
DoNothing:
  rts

.proc Reset
  sei
  cld
  ldx #0	      ; Turn off PPU
  stx PPUCTRL
  stx PPUMASK
  stx SND_CHN     ; Turn off sound too
  dex             ; Now, X = $ff
  txs             ; Initialize the stack pointer to $ff
  jsr InitMapper  ; run the mapper-specific init code

; Wait for PPU to stabilize
  bit PPUSTATUS   ; see http://forums.nesdev.com/viewtopic.php?f=2&t=3958

: lda PPUSTATUS   ; Wait a PPU frame
  bpl :-

; Clear out RAM 
; clear RAM while waiting for next frame
  inx ; x goes from $ff to $00
  txa
: sta $000,x
  sta $100,x
  sta $300,x
  sta $400,x
  sta $500,x
  sta $600,x
  sta $700,x
  inx
  bne :-

; Set an interrupt handler that's just an RTI
  lda #<DefaultIRQ
  sta IRQAddress+0
  lda #>DefaultIRQ
  sta IRQAddress+1

; Clear out a chunk of on-cart RAM
; When savefiles are implemented this will have to be adjusted
  lda #<$6000
  sta 0
  ldx #>$6000
  stx 1
  tay
: sta (0),y
  iny
  bne :-
  inx
  stx 1
  cpx #$74 ; stop at $7400
  bne :-

: lda PPUSTATUS   ; Wait a PPU frame
  bpl :-

; Now after two frames the PPU is warmed up, so set up PPU stuff

  ; Write the initial sprite palettes
  lda #$3f
  sta PPUADDR
  lda #$10
  sta PPUADDR
  ldx #0
: lda #$30    ; Background will just get overwritten later
  sta PPUDATA
  .repeat 3
  lda DemoPalette,x
  sta PPUDATA
  inx
  .endrep
  cpx #4*3
  bcc :-

  jsr ShowTitle

; Set some random seeds
  ldx retraces
  stx random1+0
  inx
  stx random1+1
  inx
  stx random2+0
  inx
  stx random2+1

; Sample testing inventory
  lda #InventoryItem::HEALTH_RESTORE
  sta InventoryType+0
  lda #InventoryItem::ABILITY_GLIDER
  sta InventoryType+1
  lda #InventoryItem::ABILITY_BURGER
  sta InventoryType+2
  lda #InventoryItem::GREEN_KEY
  sta InventoryType+3
  lda #InventoryItem::BLOCK
  sta InventoryType+4
  lda #InventoryItem::ICE_SKATES
  sta InventoryType+5
  lda #1
  sta InventoryLen+0
  sta InventoryLen+1
  sta InventoryLen+2
  sta InventoryLen+3
  sta InventoryLen+4
  sta InventoryLen+5

; Decompress Nova tiles and common sprite tiles
  jsr UploadNovaAndCommon

; Turn on NMI and make sprites use $1xxx in CHR RAM
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL

; Decompress the first level
  lda #0
  jsr DecompressLevel

  jmp MainLoopInit
.endproc

.proc DemoPalette
  .byt $12, $2a, $30
  .byt $2d, $3d, $30
  .byt $06, $16, $36
  .byt $02, $12, $32
.endproc

.proc InitMapper
  ; UNROM needs no intialization
  .ifdef MAPPER_MMC1
    lda #$80    ; reset mapper
    sta $8000
    lda #%01110 ; vertical mirroring, UNROM style
    jsr SetControl
    lda #0
    .repeat 5
      sta $a000 ; clear CHR register
    .endrep
  .endif
  .ifdef MAPPER_MMC3
    lda #0
    sta $e000 ; disable interrupts
    sta $a000 ; vertical mirroring
    lda #128
    sta $a001 ; enable PRG RAM

    ; Initialize the CHR registers even though we're using CHR RAM
    ldx #0 ; X = register number
    stx $8000
    ldy #0 ; Y = register value
    sty $8001

    inx
    stx $8000
    ldy #2
    sty $8001

    inx
    ldy #4
  : stx $8000
    sty $8001
    inx
    iny
    cpx #6
    bne :-
  .endif
  .ifdef MAPPER_ACTION53
    lda #$81 ; set outer bank to last
    sta $5000
    lda #$ff
    sta $8000

    lda #$80
    sta $5000
        ; ..GGPSMM
    lda #%00111110 ; 256KB game, vertical mirroring, UNROM-style switching
    sta $8000

    lda #$01 ; further mapper writes will go to PRG bank register
    sta $5000
  .endif
  rts

.endproc

; restores the program bank after a _SetPRG
SetPRG_Restore:
  lda PRGBank
; input: A = the new bank to put at $8000-$bfff
; output: the bank is changed
.proc SetPRG
  sta PRGBank
Temporary:
  .ifdef MAPPER_UNROM
    stx TempXSwitch
    tax
    lda Table,x
    sta Table,x
    ldx TempXSwitch
    rts
  Table:
    .byt 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
  .endif
  .ifdef MAPPER_MMC1
    sta $e000
    .repeat 4
      lsr a
      sta $e000
    .endrep
    rts
  .endif
  .ifdef MAPPER_MMC3
    stx TempXSwitch
    asl       ; MMC3 uses 8KB banks, so multiply by 2
    tax
    lda #6    ; switch bank at $8000
    sta $8000
    stx $8001
    inx
    lda #7    ; switch bank at $a000
    sta $8000
    stx $8001
    ldx TempXSwitch
    rts
  .endif
  .ifdef MAPPER_ACTION53
    sta $8000
    rts
  .endif
.endproc
_SetPRG = SetPRG::Temporary

.ifdef MAPPER_MMC1
.proc SetControl
  sta $8000
.repeat 4
  lsr a
  sta $8000
.endrep
  rts
.endproc
.endif
