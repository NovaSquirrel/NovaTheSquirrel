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
VWF_BANK = $e
INVENTORY_BANK = $e
THINFONT_BANK = $d
OPTIONS_BANK = $e
SANDBOX_BANK = $d
CREDITS_BANK = $d
ABILITY_HELP_BANK = $d
DABG_BANK = $5
EXTRAS_BANK = $4 ; DABG resources, other games I can fit!

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
.include "../music/famitone/famitone2.s"

.segment "PRG4" ; extras
.include "extras.s"
.segment "PRG5" ; DABG
.incbin "DABG_MAIN.bin"
