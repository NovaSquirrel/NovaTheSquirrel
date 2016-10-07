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
.include "ns_nes.s"
.include "defines.s"
Mapper_MMC1 16
.include "memory.s"
;-------------------------------------------------------------------------------------

LEVELS_BANK1 = $0
LEVELS_BANK2 = $1
LEVELS_BANK3 = $2
LEVELS_BANK4 = $3
DIALOG_BANK = $7
MAINLOOP_BANK = $9
OBJECT_BANK = $8
GRAPHICS_BANK3 = $a
GRAPHICS_BANK2 = $b
GRAPHICS_BANK1 = $c
VOICE_BANK = $d
LEVELPROCESS_BANK = $e
SOUND_BANK = $e
VWF_BANK = $e
INVENTORY_BANK = $e
THINFONT_BANK = $d

.segment "PRG6" ;
.segment "PRG7" ;
.segment "PRG8" ; object bank
.include "object.s"
.include "enemy.s"
.include "drawsprite.s"
.include "projectiles.s"
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

.segment "PRGe" ; dialogs, inventory, VWF engine
.include "vwf_draw.s"
.include "levelprocess.s"
.include "pentlysound.s"
.include "pentlymusic.s"
.include "musicseq.s"
.include "inventoryitems.s"
.include "cutscenedata.s"
.include "levelselect.s"
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
.include "cutscene.s"
.include "screens.s"

; ---------------------
.segment "PRG0" ; levels
.include "levels.s"
.segment "PRG1" ; levels
.segment "PRG2" ; levels
.segment "PRG3" ; levels
.segment "PRG4" ; levels
.segment "PRG5" ; levels
