; Princess Engine
; Copyright (C) 2014-2016 NovaSquirrel
;
; This program is free software: you can redistribute it and/or
; modify it under the terms of the GNU General Public License as
; published by the Free Software Foundation; either version 2 of the
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

.proc PostProcessLevel
Pointer = 0
LeftPointer = 2
RightPointer = 4
RowCount = 6
BoundaryLeft = 7
BoundaryRight = 8
Temp1 = 9
Temp2 = 10

  ; initialize pointers
  lda #<$6000
  sta Pointer+0
  lda #>$6000
  sta Pointer+1

  lda #<$6010
  sta RightPointer+0
  lda #>$6010
  sta RightPointer+1

  lda #<$5ff0 ; open bus, (LeftPointer) will return a 2
  sta LeftPointer+0
  lda #>$5ff0
  sta LeftPointer+1

ScreenLoop:
  ldy #0

  ; load boundaries
  lda Pointer+1
  and #$0f
  tax
  lda ScreenFlags+0,x
  and #SCREEN_BOUNDARY
  sta BoundaryLeft
  lda ScreenFlags+1,x
  and #SCREEN_BOUNDARY
  sta BoundaryRight

RowLoopStart:
  lda #15
  sta RowCount
RowLoop:
  lda (Pointer),y
  tax
  lda MetatileFlags,x
  and #M_POST_PROCESS
  beq NoPostProcess
    tya ; Save Y. Y doesn't need to be preserved
    pha

    txa ; copy block type back to A
    ldx #0
  : cmp ListOfProcessTiles,x
    beq :+
    inx
    bne :-
  : jsr Launch

    pla
    tay
NoPostProcess:
  iny
  dec RowCount
  bne RowLoop

  iny ; next column
  bne RowLoopStart ; unless we're at the rightmost column again

; next screen, update pointers
  lda Pointer+1 ; are we at the last screen in the level?
  and #$0f
  cmp LevelSize
  bcs Exit

  inc Pointer+1
  inc RightPointer+1

  lda Pointer
  sub #16
  sta LeftPointer
  lda Pointer+1
  sbc #0
  sta LeftPointer+1

  jmp ScreenLoop
Exit:
  rts

Launch:
  lda ListOfProcessAddrHi,x
  pha
  lda ListOfProcessAddrLo,x
  pha
  rts

ListOfProcessTiles:
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::WATER_MAIN
  .byt Metatiles::SOLID_LEDGE_M
  .byt Metatiles::FALLTHROUGH_LEDGE_M
  .byt Metatiles::DOOR_TOP
  .byt Metatiles::EXIT_DOOR_TOP
  .byt Metatiles::CLOUD_M
  .byt Metatiles::LADDER
  .byt Metatiles::BG_FLOWER_1
  .byt Metatiles::BG_BUSH_BOT
  .byt Metatiles::BG_TRUNK_L
ListOfProcessAddrLo:
  .byt <(ProcessGround-1)
  .byt <(ProcessRock-1)
  .byt <(ProcessWater-1)
  .byt <(ProcessSolidLedge-1)
  .byt <(ProcessFallthroughLedge-1)
  .byt <(ProcessDoorTop-1)
  .byt <(ProcessDoorTop-1)
  .byt <(ProcessCloud-1)
  .byt <(ProcessLadder-1)
  .byt <(ProcessFlower-1)
  .byt <(ProcessBushBot-1)
  .byt <(ProcessTrunkL-1)
ListOfProcessAddrHi:
  .byt >(ProcessGround-1)
  .byt >(ProcessRock-1)
  .byt >(ProcessWater-1)
  .byt >(ProcessSolidLedge-1)
  .byt >(ProcessFallthroughLedge-1)
  .byt >(ProcessDoorTop-1)
  .byt >(ProcessDoorTop-1)
  .byt >(ProcessCloud-1)
  .byt >(ProcessLadder-1)
  .byt >(ProcessFlower-1)
  .byt >(ProcessBushBot-1)
  .byt >(ProcessTrunkL-1)
ProcessBushBot:
  dey
  lda (Pointer),y
  bne :+
  lda #Metatiles::BG_BUSH_TOP
  sta (Pointer),y
: rts
ProcessTrunkL:
  ; Make right side
  lda (RightPointer),y
  bne :+
  lda #Metatiles::BG_TRUNK_R
  sta (RightPointer),y
: dey
  ; Make treetop
  lda (Pointer),y
  bne :+
  lda #Metatiles::BG_TREETOP_LL
  sta (Pointer),y
  lda #Metatiles::BG_TREETOP_LR
  sta (RightPointer),y
  dey
  lda #Metatiles::BG_TREETOP_UL
  sta (Pointer),y
  lda #Metatiles::BG_TREETOP_UR
  sta (RightPointer),y
: rts
ProcessFlower:
  jsr huge_rand
  and #3
  add (Pointer),y
  sta (Pointer),y
  rts
ProcessLadder:
  dey
  lda (Pointer),y
  iny
  cmp #Metatiles::LADDER
  beq YesLadder
  cmp #Metatiles::LADDER_TOP
  beq YesLadder
  lda #Metatiles::LADDER_TOP
  sta (Pointer),y
YesLadder:
  rts

ProcessCloud:
  lda (LeftPointer),y
  cmp #Metatiles::CLOUD_L
  beq :+
  cmp #Metatiles::CLOUD_M
  beq :+
    lda #Metatiles::CLOUD_L
    sta (Pointer),y
  :
  lda (RightPointer),y
  cmp #Metatiles::CLOUD_M
  beq :+
    lda #Metatiles::CLOUD_R
    sta (Pointer),y
  :
  rts

ProcessGround:
  lda #0
  sta Temp1
  dey
  lda (Pointer),y
  jsr IsGround
  iny
  lda (LeftPointer),y
  jsr IsGround
  lda (RightPointer),y
  jsr IsGround
  iny
  lda (Pointer),y
  jsr IsGround
  dey
  ldx Temp1
  cpx #15
  beq ExtraGround
  lda GroundLUT,x
  sta (Pointer),y
  rts

ExtraGround:
  lda #0
  sta Temp1
  dey
  lda (LeftPointer),y
  jsr IsGround
  lda (RightPointer),y
  jsr IsGround
  iny
  ldx Temp1
  lda ExtraGroundTable,x
  sta (Pointer),y
  rts
ExtraGroundTable:
  .byt Metatiles::GROUND_INNER_BOTH
  .byt Metatiles::GROUND_INNER_LEFT
  .byt Metatiles::GROUND_INNER_RIGHT
  .byt Metatiles::GROUND_MIDDLE_M

ProcessRock:
  lda #0
  sta Temp1
  dey
  lda (Pointer),y
  jsr IsRock
  iny
  lda (LeftPointer),y
  jsr IsRock
  lda (RightPointer),y
  jsr IsRock
  iny
  lda (Pointer),y
  jsr IsRock
  dey
  ldx Temp1
  lda RockLUT,x
  sta (Pointer),y
  rts

GroundLUT:                            ; ULRD
  .byt Metatiles::GROUND_NARROW_TOP   ; 0000
  .byt Metatiles::GROUND_NARROW_TOP   ; 0001
  .byt Metatiles::GROUND_TOP_L        ; 0010
  .byt Metatiles::GROUND_TOP_L        ; 0011
  .byt Metatiles::GROUND_TOP_R        ; 0100
  .byt Metatiles::GROUND_TOP_R        ; 0101
  .byt Metatiles::GROUND_TOP_M        ; 0110
  .byt Metatiles::GROUND_TOP_M        ; 0111
  .byt Metatiles::GROUND_NARROW_SIDES ; 1000
  .byt Metatiles::GROUND_NARROW_SIDES ; 1001
  .byt Metatiles::GROUND_MIDDLE_L     ; 1010
  .byt Metatiles::GROUND_MIDDLE_L     ; 1011
  .byt Metatiles::GROUND_MIDDLE_R     ; 1100
  .byt Metatiles::GROUND_MIDDLE_R     ; 1101
  .byt Metatiles::GROUND_MIDDLE_M     ; 1110
  .byt Metatiles::GROUND_MIDDLE_M     ; 1111

RockLUT:                     ; ULRD
  .byt Metatiles::ROCK_MID_M ; 0000 ?
  .byt Metatiles::ROCK_MID_M ; 0001 ?
  .byt Metatiles::ROCK_MID_M ; 0010 ?
  .byt Metatiles::ROCK_TOP_L ; 0011
  .byt Metatiles::ROCK_MID_M ; 0100 ?
  .byt Metatiles::ROCK_TOP_R ; 0101
  .byt Metatiles::ROCK_MID_M ; 0110 ?
  .byt Metatiles::ROCK_TOP_M ; 0111
  .byt Metatiles::ROCK_MID_M ; 1000 ?
  .byt Metatiles::ROCK_MID_M ; 1001 ?
  .byt Metatiles::ROCK_BOT_L ; 1010
  .byt Metatiles::ROCK_MID_L ; 1011
  .byt Metatiles::ROCK_BOT_R ; 1100
  .byt Metatiles::ROCK_MID_R ; 1101
  .byt Metatiles::ROCK_BOT_M ; 1110
  .byt Metatiles::ROCK_MID_M ; 1111

IsFallthroughLedge:
  cmp #Metatiles::FALLTHROUGH_LEDGE_L
  bcc NoItIsnt
  cmp #Metatiles::FALLTHROUGH_LEDGE_S+1
  bcs NoItIsnt
  sec
  rol Temp1
  rts
IsSolidLedge:
  cmp #Metatiles::SOLID_LEDGE_L
  bcc NoItIsnt
  cmp #Metatiles::SOLID_LEDGE_S+1
  bcs NoItIsnt
  sec
  rol Temp1
  rts
IsGround:
  cmp #Metatiles::GROUND_TOP_L
  bcc NoItIsnt
  cmp #Metatiles::GROUND_CLIMB_R+1
  bcs NoItIsnt
  sec
  rol Temp1
  rts
NoItIsnt:
  clc
  rol Temp1
  rts
IsRock:
  cmp #Metatiles::ROCK_TOP_L
  bcc NoItIsnt
  cmp #Metatiles::ROCK_BOT_R+1
  bcs NoItIsnt
  sec
  rol Temp1
  rts

ProcessWater:
  dey
  lda (Pointer),y
  cmp #Metatiles::WATER_MAIN
  beq TopIsWater
  cmp #Metatiles::WATER_TOP
  beq TopIsWater
  cmp #Metatiles::WATER_BELOW_SOMETHING
  beq TopIsWater
; not water, check if it's solid or not
  tax
  lda MetatileFlags,x
  iny
  and #M_SOLID_ALL
  bne :+
    lda #Metatiles::WATER_TOP
    sta (Pointer),y
    rts
  :
  lda #Metatiles::WATER_BELOW_SOMETHING
  sta (Pointer),y
TopIsWater:
  rts

ProcessSolidLedge:
  lda #0
  sta Temp1
  lda (LeftPointer),y
  jsr IsSolidLedge
  lda (RightPointer),y
  jsr IsSolidLedge
  ldx Temp1
  lda SolidLedges,x
  sta (Pointer),y
  rts
SolidLedges:
  .byt Metatiles::SOLID_LEDGE_S
  .byt Metatiles::SOLID_LEDGE_L
  .byt Metatiles::SOLID_LEDGE_R
  .byt Metatiles::SOLID_LEDGE_M

ProcessFallthroughLedge:
  lda #0
  sta Temp1
  lda (LeftPointer),y
  jsr IsFallthroughLedge
  lda (RightPointer),y
  jsr IsFallthroughLedge
  ldx Temp1
  lda FallLedges,x
  sta (Pointer),y
  rts
FallLedges:
  .byt Metatiles::FALLTHROUGH_LEDGE_S
  .byt Metatiles::FALLTHROUGH_LEDGE_L
  .byt Metatiles::FALLTHROUGH_LEDGE_R
  .byt Metatiles::FALLTHROUGH_LEDGE_M

ProcessDoorTop:
  iny
  lda #Metatiles::DOOR_BOTTOM
  sta (Pointer),y
  rts
.endproc

.if 0
.proc MakeBackground
Pointer = 0
ColCounter = 2
Height = 3
  lda #<$6000
  sta Pointer+0
  lda #>$6000
  sta Pointer+1
  lda #0
  sta ColCounter
  lda #4
  sta Height
LoopStart:
  ldx #3

Loop:
  jsr huge_rand
  and #3
  sub #1
  add Height
  and #15
  tay
  lda (Pointer),y
  beq MakeIntoDither
  cmp #Metatiles::SKY_DITHER_1
  bcc NoIncrement
  cmp #Metatiles::SKY_DITHER_4
  bcs NoIncrement
Increment:
.ifp02
  add #1
  sta (Pointer),y
.else
  isc (Pointer),y
.endif
NoIncrement:
  dex
  bne Loop

: jsr huge_rand
  and #3
  cmp #3
  bcs :-
  sub #1
  add Height
  and #15
  sta Height

  lda Pointer
  add #16
  sta Pointer
  bcc :+
    inc Pointer+1
  :
  dec ColCounter
  bne LoopStart
  rts
MakeIntoDither:
  lda #Metatiles::SKY_DITHER_1
  sta (Pointer),y
  jmp NoIncrement
.endproc
.endif

.proc MakeBackground
  Column = 0
  lda #0
  sta Column
Loop:
  jsr huge_rand
  and #3
  add #9
  add Column
  bcs Exit
  cmp #256-3-9
  bcs Exit
  sta Column

  lda Column
  jsr GetLevelColumnPtr

  ; pick a row
  jsr huge_rand
  lsr
  and #3
  tay

  ; insert the cloud metatiles
  lda (LevelBlockPtr),y
  bne :+
  lda #Metatiles::CLOUD_L
  sta (LevelBlockPtr),y
: jsr NextColumn
  lda (LevelBlockPtr),y
  bne :+
  lda #Metatiles::CLOUD_M
  sta (LevelBlockPtr),y
: jsr NextColumn
  lda (LevelBlockPtr),y
  bne :+
  lda #Metatiles::CLOUD_R
  sta (LevelBlockPtr),y
: bne Loop

Exit:
  rts

NextColumn:
  tya
  add #16
  tay
  rts
.endproc
