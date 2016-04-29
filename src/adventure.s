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
.include "memory.s"
.include "defines.s"
Mapper_MMC1 16
;-------------------------------------------------------------------------------------

LEVELS_BANK1 = $0
LEVELS_BANK2 = $1
LEVELS_BANK3 = $2
LEVELS_BANK4 = $3
MAINLOOP_BANK2 = $9
MAINLOOP_BANK = $a
GRAPHICS_BANK3 = $b
GRAPHICS_BANK2 = $c
GRAPHICS_BANK1 = $d
LEVELPROCESS_BANK = $e
SOUND_BANK = $e
VWF_BANK = $e
DIALOG_BANK = $8

.segment "PRG6" ;
.segment "PRG7" ;
.segment "PRG9" ; extra main loop stuff
.segment "PRGa" ; main loop stuff
.include "metatile.s"
.include "../tools/metatilelist.s"
.include "player.s"
.include "scrolling.s"
.include "metaplayer.s"
.include "object.s"
.include "projectiles.s"
.include "drawsprite.s"
.segment "PRGb" ; compressed graphics
.segment "PRGc" ; compressed graphics
.segment "PRGd" ; compressed graphics
.include "graphics.s"

.segment "PRGe" ; voice samples, dialogs, inventory, VWF engine
.include "quadpcm.s"
.include "vwf_draw.s"
.include "levelprocess.s"
.include "pentlysound.s"
.include "pentlymusic.s"
.include "musicseq.s"
.include "inventoryitems.s"
.include "cutscenedata.s"
.include "levelselect.s"
.segment "PRG8" ; dialog
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
