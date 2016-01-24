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

; palettes get their own byte
M_PAL_0 = %00000000
M_PAL_1 = %01010101
M_PAL_2 = %10101010
M_PAL_3 = %11111111

.enum
M_EMPTY           ; no special behaviors
M_FALLABLE_LEDGE  ; ledges you can fall through
M_WATER           ; any sort of water
M_SPECIAL_MISC    ; coins, springs
M_SPECIAL_WALL    ; locks, pushable blocks
M_SPECIAL_CEILING ; ? blocks
M_SPECIAL_GROUND  ; spikes
M_ICE             ; slip on if you're in puzzle mode. also thaws to fire
M_BRICKS          ; breakable bricks
M_LAVA            ;
; must not have more than 32 entries
.endenum

M_SOLID_ALL =      %10000000 ; this block is solid on all sides
M_SOLID_TOP =      %01000000 ; this block is solid only on the top
M_POST_PROCESS =   %00100000 ; this block needs to be preprocessed
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
Pointer = 0
PPUAddrHigh = 7
  lda #0
  sta PPUMASK

  jsr ClearOAM
  lda #2
  sta OAM_DMA
 
  lda #<LevelMap
  sta Pointer+0
  lda #>LevelMap
  sta Pointer+1
  lda #$20
  sta PPUAddrHigh
  jsr RenderLevelScreen

  inc Pointer+1
  lda #$24
  sta PPUAddrHigh
  jsr RenderLevelScreen

  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  rts
.endproc

.proc RenderLevelScreen ; NOT the version used in FHBG, DABG and Sliding Blaster for once
Pointer = 0
PPUColumn = 2
RowCounter  = 3
ColCounter  = 4
Temp1 = 5
Temp2 = 6
PPUAddrHigh = 7
  ; initialize pointers
  lda #0
  sta PPUColumn

  ; clear attributes
  ; A is still zero
  tax
: sta Attributes,x
  inx
  cpx #64
  bne :-

  ldx #16
  stx ColCounter
  dex ;X = 15
  stx RowCounter

  ; set PPU to vertical writes
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL

  ; --------- render columns ---------
  ldy #0
Loop1Init:
  lda PPUAddrHigh
  sta PPUADDR
  lda PPUColumn
  inc PPUColumn
  sta PPUADDR
Loop1:
  lda (Pointer),y
  tax
  lda MetatileUL,x
  sta PPUDATA
  lda MetatileLL,x
  sta PPUDATA
  iny ; next block
  dec RowCounter
  bne Loop1

  tya ; move back to top
  sub #15
  tay

  lda #15
  sta RowCounter
  lda PPUAddrHigh
  sta PPUADDR
  lda PPUColumn
  inc PPUColumn
  sta PPUADDR
Loop2:
  lda (Pointer),y
  tax
  lda MetatileUR,x
  sta PPUDATA
  lda MetatileLR,x
  sta PPUDATA

  ; write attribute table entry for this block
  tya
  pha ; save Y
  and #%1110
  asl
  asl
  sta Temp1
  tya ; xxxx....
  lsr ; .xxxx...
  lsr ; ..xxxx..
  lsr ; ...xxxx.
  lsr ; ....xxxx
  lsr ; .....xxx
  ora Temp1
  sta Temp1

  ; calculate which metatile in attribute byte to write
  tya
  and #$01
  asl
  sta Temp2
  tya
  and #$10
  lsr
  lsr
  lsr
  lsr
  ora Temp2
  tay

  lda ANDMask,y
  and MetatilePalettes,x
  ldy Temp1
  ora Attributes,y
  sta Attributes,y
  pla ; restore Y
  tay

  iny ; next block
  dec RowCounter
  bne Loop2

  iny
  lda #15
  sta RowCounter
  dec ColCounter
  jne Loop1Init

  ; set PPU to horizontal writes
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL

  ; write attribute table
  lda PPUAddrHigh
  ora #3
  sta PPUADDR
  lda #$c0
  sta PPUADDR
  ldx #0
: lda Attributes,x
  sta PPUDATA
  inx
  cpx #64
  bne :-
  rts
ANDMask:
  .byt %00000011, %00001100, %00110000, %11000000
.endproc
