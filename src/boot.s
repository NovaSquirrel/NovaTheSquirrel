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
.segment "VECTORS"	; NMI vector is at $FFFA, reset at $FFFC, IRQ at $FFFE
    .addr NMI   ; run at the start of vblank
	.addr Reset ; run when the NES boots or resets
	.addr IRQ   ; configurable
.code

NMI:
  inc retraces
.ifdef NMI_MUSIC
  ; Save accumulator
  pha
  lda LagFrame
  beq NoNMIMusic
  ; Save X and Y
  txa
  pha
  tya
  pha

  ; Save the bank
  lda RealPRGBank
  pha

  ; Save locals
  ldx #0
: lda 0,x
  pha
  inx
  cpx #8
  bne :-

.ifdef MAPPER_MMC1
  lda #$80  ; reset MMC1
  sta $8000
.endif
  ; Update music
  lda #SOUND_BANK
  jsr _SetPRG
  jsr pently_update

  ; Restore locals
  ldx #7
: pla
  sta 0,x
  dex
  bpl :-

  ; Restore the bank
  pla
  jsr _SetPRG

  ; Restore X and Y
  pla
  tay
  pla
  tax

.ifdef NeedNMIInterrupted
  lda #1
  sta NMIInterrupted
.endif
NoNMIMusic:

  ; Restore accumulator
  pla
.endif
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
  ldx #0
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
  cpx #$7e ; stop at $7e00
  bne :-

  ; Initialize the savefile if it's corrupted
  ldx #8
: lda SaveTag,x
  cmp SaveTagString,x
  bne InitSave
  dex
  bpl :-
  jmp NoInitSave
InitSave:
  ; Clear out the save section
  lda #0
  tax
: sta $7e00,x
  sta $7f00,x
  inx
  bne :-

;  ; Mark the first level as available
;  lda #1
;  sta LevelAvailable
  ; Mark the first 8 levels as available
  ; for demo purposes
  lda #255
  sta LevelAvailable
  lda #255
  sta LevelAvailable+1
  lda #255
  sta LevelAvailable+2
  lda #1
  sta LevelAvailable+3

  ; Write tag to SRAM
  ldx #8
: lda SaveTagString,x
  sta SaveTag,x
  dex
  bpl :-
NoInitSave:

: lda PPUSTATUS   ; Wait a PPU frame
  bpl :-

  jsr ShowTitle

  lda #255
  sta IntroShownAlready

;  .ifdef DEBUG
  .if 0
; Sample testing inventory
  lda #InventoryItem::HEALTH_RESTORE
  sta InventorySaved+0
  lda #InventoryItem::ABILITY_GLIDER
  sta InventorySaved+1
  lda #InventoryItem::ABILITY_BOMB
  sta InventorySaved+2
  lda #InventoryItem::ABILITY_BOOMERANG
  sta InventorySaved+3
  .endif

; Turn on NMI and make sprites use $1xxx in CHR RAM
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL

  jmp JumpToLevelSelect
.endproc

SaveTagString: .byt "squirrel", 1

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
  lsr NMIInterrupted ; clear NMIInterrupted
  .ifdef NMI_MUSIC
    sta RealPRGBank
  .endif
NMIVersion:
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
    .ifdef NMI_MUSIC
      lda NMIInterrupted
      beq :+
        lda #$80  ; reset MMC1
        sta $8000
        lda RealPRGBank
        bpl Temporary ; unconditional branch
      :
    .endif
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
    .ifdef NMI_MUSIC
      lda NMIInterrupted
      beq :+
        lda RealPRGBank
        bpl Temporary
      :
    .endif
    rts
  .endif
  .ifdef MAPPER_ACTION53
    sta $8000
    rts
  .endif
.endproc
_SetPRG = SetPRG::Temporary
SetPRGNMI = SetPRG::NMIVersion

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
