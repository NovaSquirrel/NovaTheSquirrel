; Princess Engine
; Copyright (C) 2014-2018 NovaSquirrel
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
.include "ns_nes.s"
.include "defines.s"
Mapper_MMC1 16
.include "memory.s"
;-------------------------------------------------------------------------------------

LEVELS_BANK1 = $0
LEVELS_BANK2 = $1
LEVELS_BANK3 = $d
OBJECT_BANK2 = $d
DIALOG_BANK = $7
MAINLOOP_BANK = $9
OBJECT_BANK = $8
GRAPHICS_BANK3 = $a
GRAPHICS_BANK2 = $b
GRAPHICS_BANK1 = $c
VOICE_BANK = $d
LEVELPROCESS_BANK = $e
SOUND_BANK = $6
FAMITONE_BANK = $3
PUZZLEGAME_BANK = $3
MOUSE_BANK = $3
VWF_BANK = $e
INVENTORY_BANK = $e
THINFONT_BANK = $d
OPTIONS_BANK = $e
SANDBOX_BANK = $d
CREDITS_BANK = $d
ABILITY_HELP_BANK = $d
DABG_BANK = $5
EXTRAS_BANK = $4 ; DABG resources, other games I can fit!
SPRITEEDIT_BANK = $4
HEXEDITOR_BANK = $7

.code
; Putting this first so that it cannot cross a page boundary
.proc SerialBoot
; https://web.archive.org/web/20120401200051/http://blargg.parodius.com/nes-code/bootloader/usage.html
crc     = <0
temp    = <2
        lda #0
        sta PPUCTRL     ; Disable NMI
        sei             ; Disable interrupts
badcrc:
notsig: ldx #0          ; Number of bytes received
byte:   lda #$01        ; Wait for start bit
start:  bit $4017
        beq start
        ldy #6          ; Delay from start bit to middle of data bit
dbit:   dey
        bne dbit
        ldy #3          ; Delay between data bits
        nop             ; Remove this NOP for PAL timing
        nop
        lsr $4017       ; Read bit
        rol a
        bcc dbit
        cpx #4          ; Verify signature if one of first four bytes
        bcs past
        eor #$E2        ; Handle signature with partial signature before it
        bne not1st
        ldx #0
not1st: eor signature-1,x; Share last zero byte of JMP
        bne notsig
past:   sta 0,x         ; Write after signature verify clears A, so that
        inx             ; CRC gets cleared for later
        bne byte
        txa             ; Calculate CRC-16 of user data
        ldx #5
check:  eor 0,x
        sta crc+1       ; based on Greg Cook's CRC-16 code
        lsr
        lsr
        lsr
        lsr
        tay
        asl
        eor crc
        sta temp
        tya
        eor crc+1
        sta crc+1
        asl
        asl
        asl
        tay
        asl
        asl
        eor crc+1
        sta crc
        tya
        rol
        eor temp
        inx
        bne check
        eor crc         ; Verify checksum
        bne badcrc
        jmp $0007       ; Execute received code
signature:
        .byte $5D^$E2, $CC^$E2, $75^$E2
.endproc
; Waits for and receives byte via serial on second controller port.
; No more than 19 cycles may be spent between calls to this routine,
; or data will be lost.
; Out: A = received byte
; Preserved: X, Y
read_serial:
        lda #1
start:  bit $4017       ; Wait for start bit
        beq start
        lsr
        ror
        nop             ; Remove for PAL timing
dbit:   lsr $4017       ; Read start bit and first 7 data bits
        pha
        pla
        pha
        pla
        nop             ; Remove for PAL timing
        nop
        ror a
        bcs last        ; Loop until carry shifts out
        jmp dbit
last:   nop
        lsr $4017       ; Read final data bit
        ror a
        eor #$FF        ; Un-invert received byte
        rts

.segment "PRG8" ; object bank
.include "object.s"
.include "enemy.s"
.include "drawsprite.s"
.include "projectiles.s"
.segment "PRG6" ; music bank
.include "pentlysound.s"
.include "pentlymusic.s"
.include "musicseq.s"
.segment "PRG9" ; main loop stuff
.include "metatile.s"
.include "../tools/metatilelist.s"
.include "player.s"
.include "scrolling.s"
.include "metaplayer.s"
.include "miscplayer.s" ; various stuff that goes in PRG9 since it's not very full

.segment "PRGa" ; compressed graphics
.segment "PRGb" ; compressed graphics
.include "graphics2.s"
.segment "PRGc" ; compressed graphics
.include "graphics.s"

.segment "PRGd"
.include "quadpcm.s"
.include "thinfont.s"
.include "object2.s"
.include "sandbox.s"
.include "credits.s"
.include "abilityhelp.s"
.include "levels3.s"

.segment "PRGe" ; dialogs, inventory, VWF engine
.include "vwf_draw.s"
.include "levelprocess.s"
.include "inventoryitems.s"
.include "cutscenedata.s"
.include "levelselect.s"
.include "shop.s"
.include "options.s"
.include "prelevel.s"
.include "soundtest.s"

.segment "PRG7" ; dialog
.include "../tools/dialog.s"
.include "hexeditor.s"
.segment "PRGf" ; important stuff
.code

.include "leveldecode.s"
.include "boot.s"
.include "graphicslist.s"
.include "unpb53.s"
.include "main.s"
.include "math.s"
.include "global.s"
.include "trampoline.s"
.include "cutscene.s"
.include "screens.s"
.include "paldetect.s"

; ---------------------
.segment "PRG0" ; levels
.include "levels.s"
.segment "PRG1" ; levels
.include "levels2.s"
.segment "PRG2" ; ???

.segment "PRG3" ; Famitone and old songs
.include "../music/famitone/Original.s"
.include "../music/famitone/novapuzzle.s"
.include "../music/famitone/novapuzzle sfx.s"
.include "../music/famitone/famitone2.s"
.include "puzzlegame.s"
.include "mouse.s"

.segment "PRG4" ; extras
.include "extras.s"
.include "spriteedit.s"
.segment "PRG5" ; DABG
.incbin "DABG_MAIN.bin"

.include "serialvectors.s"
