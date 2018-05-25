; Princess Engine
; Copyright (C) 2018 NovaSquirrel
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

.proc ShowCredits
Pointer = LevelDecodePointer
SECTION = 1
FOR     = 2
NAME    = 3

PPUPointer = 2
Already    = 4
  ; Load the font in
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  jsr WaitVblank
  bit PPUSTATUS
  lda #0
  sta PPUMASK
  sta Already
  lda #GraphicsUpload::CHR_FONT
  jsr DoGraphicUpload
  ; Erase the first tile
  ; (should "fix" a problem I saw in the credits
  ; where it shifted the scroll for a frame,
  ; showing "garbage". Now it'll just be blank)
  lda #$00
  sta PPUADDR
  sta PPUADDR
  ldx #16
: sta PPUDATA
  dex
  bne :-

  ; Copy the palette
  ldx #0
  lda #$3f
  sta PPUADDR
  stx PPUADDR
: lda Palette,x
  sta PPUDATA
  inx
  cpx #16
  bne :-

  lda #<CreditsData
  sta Pointer+0
  lda #>CreditsData
  sta Pointer+1

; ------------
Loop:
  jsr WaitVblank

  ldy #0
  lda (Pointer), y
  inc16 Pointer
  tax
  jeq DoFinished
  dex
  beq DoSection
  dex
  beq DoFor

DoName:
  lda PPUPointer
  and #<~31
  ora #8
  add #64 ; skip two rows down
  sta PPUPointer
  addcarry PPUPointer+1
  jmp PrintString

DoFor:
  lda PPUPointer
  and #<~31
  ora #4
  add #64 ; skip two rows down
  sta PPUPointer
  addcarry PPUPointer+1
  jmp PrintString

DoSection:
  lda Already ; if this isn't the first one, pause before clearing the screen
  beq :+
    jsr PauseABit
  :

  lda #0
  sta PPUMASK
  lda #<$2102
  sta PPUPointer+0
  lda #>$2102
  sta PPUPointer+1
  lda #' '
  sta Already ; nonzero, so it works fine for the flag
  jsr ClearNameCustom
  jsr WaitVblank
  lda #BG_ON
  sta PPUMASK
  ; fall into PrintString

PrintString:
  ldy #0
: jsr WaitVblank
  lda (Pointer),y
  beq @Done
  pha
  lda PPUPointer+1
  sta PPUADDR
  lda PPUPointer+0
  sta PPUADDR
  pla
  sta PPUDATA
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  inc16 PPUPointer
  inc16 Pointer ; go past this character
  jmp :-
@Done:
  inc16 Pointer ; skip over the null terminator
FinishCommand:
  jmp Loop

DoFinished:
  jsr PauseABit
  rts

PauseABit:
  ldx #240
@KeepPausing:
  jsr WaitVblank
  jsr ReadJoy
  lda keynew
  and #KEY_START
  beq :+
    pla
    pla
    rts
  :
  dex
  bne @KeepPausing
  rts

Palette:
  .byt $30, $0f, $00, $10
  .byt $30, $16, $00, $10
  .byt $30, $01, $00, $10
  .byt $30, $0f, $00, $10

CreditsData:
  .byt SECTION, "Nova the Squirrel",0
  .byt FOR,     "A platformer for the NES",0
  .byt NAME,    "by NovaSquirrel",0

  .byt SECTION, "CODE",0
  .byt FOR,     "Princess Engine",0
  .byt FOR,     "ft2pently music tool",0
  .byt NAME,    "NovaSquirrel",0

  .byt SECTION, "LIBRARIES",0
  .byt FOR,     "Pently music engine",0
  .byt FOR,     "pb53 compression tools",0
  .byt FOR,     "quadpcm compression",0
  .byt NAME,    "Tepples",0

  .byt SECTION, "LIBRARIES",0
  .byt FOR,     "Variable-width font code",0
  .byt NAME,    "Tepples",0
  .byt NAME,    "Blargg",0

  .byt SECTION, "DESIGN",0
  .byt FOR,     "General game design",0
  .byt FOR,     "Enemy design",0
  .byt FOR,     "Level design",0
  .byt FOR,     "Boss design",0
  .byt NAME,    "NovaSquirrel",0
  .byt SECTION, "DESIGN",0
  .byt FOR,     "Sound effects",0
  .byt FOR,     "Pixel art",0
  .byt FOR,     "Story and writing",0
  .byt NAME,    "NovaSquirrel",0

  .byt SECTION, "DESIGN",0
  .byt FOR,     "Music",0
  .byt NAME,    "To be added",0

  .byt SECTION, "DESIGN",0
  .byt FOR,     "Some enemy graphics",0
  .byt FOR,     "(Plodder, Owl, Sneaker)",0
  .byt FOR,     "Explosion sound effect",0
  .byt NAME,    "Tepples", 0

  .byt SECTION, "DESIGN",0
  .byt FOR,     "Title screen adapted",0
  .byt FOR,     "from art by",0
  .byt NAME,    "StrawberryPocky07",0

  .byt SECTION, "CHARACTERS",0
  .byt FOR,     "Most characters",0
  .byt NAME,    "NovaSquirrel",0

  .byt FOR,     "Sherwin",0
  .byt NAME,    "FL4SHK",0

  .byt SECTION, "CHARACTERS",0
  .byt FOR,     "Cameos",0
  .byt NAME,    "Eclipse",0
  .byt NAME,    "Itimar",0
  .byt NAME,    "John",0
  .byt NAME,    "Kee",0
  .byt SECTION, "CHARACTERS",0
  .byt FOR,     "Cameos",0
  .byt NAME,    "Lia",0
  .byt NAME,    "MolSno",0
  .byt NAME,    "Remy",0

  .byt SECTION, "SPECIAL THANKS",0
  .byt FOR,     "Tools",0
  .byt NAME,    "ca65",0
  .byt NAME,    "YY-CHR",0
  .byt NAME,    "Mesen",0
  .byt NAME,    "FCEUX",0
  .byt NAME,    "PowerPak",0

  .byt SECTION, "SPECIAL THANKS",0
  .byt NAME,    "nesdev.com",0

  .byt SECTION, "THANK YOU",0
  .byt NAME,    "For playing",0
  .byt NAME,    "Nova the Squirrel!",0

  .byt 0
.endproc
