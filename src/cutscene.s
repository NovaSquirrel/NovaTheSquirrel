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
.proc StartCutscene
  lda PRGBank ; we'll return to the original bank when we're done
  pha
  jsr WaitVblank
  ldx #0
  stx PPUMASK
  jsr ClearOAM
  lda #2
  sta OAM_DMA
; clear background half of VRAM
  lda #0
  sta PPUADDR
  sta PPUADDR
  tax
  ldy #16
: sta PPUDATA
  inx
  bne :-
  dey
  bne :-

  lda #GraphicsUpload::BG_CUTSCENE
  jsr DoGraphicUpload

  lda #CUTSCENE_BANK
  jsr SetPRG
  jsr CutsceneInit

  ldy #<HelloString
  lda #>HelloString
  jsr CopyToStringBuffer

  jsr ClearDynamicVRAM
  jsr clearLineImg
  ldx #0
  ldy #<StringBuffer
  lda #>StringBuffer
  jsr vwfPuts
  ldy #<$0200
  lda #>$0200
  jsr copyLineImg
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL

  jsr WaitVblank
  lda #OBJ_ON|BG_ON
  sta PPUMASK
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
: jmp :-

  jsr WaitVblank
  lda #0
  sta PPUMASK
  jsr DoLevelUploadList
  jsr WaitVblank

  pla ; restore old bank
  lda PRGBank
  jsr _SetPRG
  rts
.endproc

.proc ScriptBRK ; BRK handler
  pla ; discard flags
  pla ; low
  sta ScriptPtr+0
  pla ; high
  sta ScriptPtr+1

  ; decrement the return handler
  lda ScriptPtr+0
  bne :+
  dec ScriptPtr+1
: dec ScriptPtr+0
.endproc

.proc ScriptLoopInit
  lda #<ScriptBRK
  sta IRQAddress+1
  lda #>ScriptBRK
  sta IRQAddress+0
  lda #0
  sta ScriptIf
.endproc
; this space needs to be empty
.proc ScriptLoop
  ldy #0
  ; Get script byte
  lda (ScriptPtr),y

  ; Increment script pointer
  inc16 ScriptPtr

  ; Call the cutscene command
  asl
  tax
  lda ScriptCommands+1,x
  pha
  lda ScriptCommands+0,x
  pha

  ; Load the next byte, just in case it's a parameter
  lda (ScriptPtr),y
  rts
.endproc

.proc ScriptIncreasePointerBy
  add ScriptPtr+0
  sta ScriptPtr+0
  bcc :+
    inc ScriptPtr+1
: jmp ScriptLoop
.endproc

.proc ScriptCommands
  .raddr EndScript  ;
  .raddr EndPage    ;
  .raddr Delay      ; xx - delay time
  .raddr RunAsm     ;
  .raddr Poke       ; aa aa vv - address, value
  .raddr FlagOn     ; ff - flag
  .raddr FlagOff    ; ff - flag
  .raddr FlagToggle ; ff - flag
  .raddr IfOn       ; ff - flag
  .raddr IfOff      ; ff - flag
  .raddr IfItem     ; ii - item
  .raddr IfNotItem  ; ii - item
  .raddr IfChoice   ; nn - choice num
  .raddr Goto       ; aa aa - address
  .raddr Call       ; aa aa - address
  .raddr Return     ;
  .raddr Say        ; \  .ssccccc
  .raddr Think      ;  |  ||+++++- character (0-31). determines name and face
  .raddr Narrate    ; /   ++------ slot (0-3)

; Command, ends the script
EndScript:
  ; clean up the script engine and return to the game
  rts

; Command, ends the page
EndPage:
  jsr WaitForKey
  lda keydown
  and #KEY_A
  beq EndPage
  jmp ScriptLoop

; Command, switch speaker and style
Say:
  jmp IncreaseBy1

; Command, switch speaker and style
Think:
  jmp IncreaseBy1

; Command, switch speaker and style
Narrate:
  jmp IncreaseBy1

ConditionalGotoCall:
  pha
  lda ScriptIf
  lsr
  bcs @Skip
  lsr ; Disable the current if chain
  sta ScriptIf
  pla
  rts
@Skip:
  lsr ; Disable the current if chain
  sta ScriptIf
  pla ; the PHA in ConditionalGotoCall
  pla ; \ jsr ConditionalGotoCall
  pla ; /
  jmp IncreaseBy2

; Command, jumps
Goto:
  jsr ConditionalGotoCall
  pha ; Save low byte of new pointer
  ; Get the high byte of the new pointer and set the current pointer to it
  iny
  lda (ScriptPtr),y
  sta ScriptPtr+1
  pla
  sta ScriptPtr+0
  jmp ScriptLoop

; Command, calls subroutine
Call:
  jsr ConditionalGotoCall
  pha ; Save low byte of new pointer

  lda ScriptPtr+0 ; Save current position (plus 2) in return address
  add #2
  sta ScriptReturn+0
  lda ScriptPtr+1
  adc #0
  sta ScriptReturn+1

  ; Get the high byte of the new pointer and set the current pointer to it
  iny
  lda (ScriptPtr),y
  sta ScriptPtr+1
  pla
  sta ScriptPtr+0
  jmp ScriptLoop

; Command, returns from subroutine
Return:
  lda ScriptReturn+0
  sta ScriptPtr+0
  lda ScriptReturn+1
  sta ScriptPtr+1
  jmp ScriptLoop

; Command, delays X frames
Delay:
  tax
: jsr WaitVblank
  dex
  bne :-
  jmp IncreaseBy1

; Command, starts running inline asm
RunAsm:
  jmp (ScriptPtr)

; Command, write a pointer
Poke:
  jsr GetPointer
  lda (ScriptPtr),y ; read value to poke
  ldy #0
  sta (0),y             ; store the read value
  jmp IncreaseBy3

; Command, increment a pointer
;Increment:
;  jsr GetPointer
;  lda (0),y
;  add #1
;  sta (0),y
;  jmp IncreaseBy2

; Reads two bytes and writes them to 0 and 1 for pointer use
GetPointer:
  sta 0
  iny
  lda (ScriptPtr),y
  sta 1
  iny  
  rts

; An if statement was false, so mark the whole thing false
IfFalse:
  lda #3
  sta ScriptIf
  jmp IncreaseBy1

; Command, check if flag is on
IfOn:
  tay
  jsr InitIf
  jsr IndexToBitmap
  and ScriptFlags,y
  beq IfFalse
  jmp IncreaseBy1

; Command, check if flag is off
IfOff:
  tay
  jsr InitIf
  jsr IndexToBitmap
  and ScriptFlags,y
  bne IfFalse
  jmp IncreaseBy1

; Command, check if player has item
IfItem:
  tax
  jsr InitIf
  txa
  jsr InventoryHasItem
  bcc IfFalse
  jmp IncreaseBy1

; Command, check if player doesn't have item
IfNotItem:
  tax
  jsr InitIf
  txa
  jsr InventoryHasItem
  bcs IfFalse
  jmp IncreaseBy1

; Command, check if choice is the specified one
IfChoice:
  tax
  cmp ScriptChoice
  bne IfFalse
  jmp IncreaseBy1

; Carry is set if the item number (in the accumulator) is found
InventoryHasItem:
  ldx #InventoryLen-1
: cmp InventoryType,x
  beq :+
  dex
  bpl :-
  clc ; no
  rts
: sec ; yes
  rts

; If ScriptIf is 0, it's set to 2, meaning execute anyway
; If it's 3 it's kept 3, meaning don't execute
InitIf:
  lda ScriptIf
  ora #2
  sta ScriptIf
  rts

; Command, turn a flag on
FlagOn:
  jsr GetFlag
  ora ScriptFlags,y
  sta ScriptFlags,y
  jmp IncreaseBy1

; Command, turn a flag off
FlagOff:
  jsr GetFlag
  eor #255
  and ScriptFlags,y
  sta ScriptFlags,y
  jmp IncreaseBy1

; Command, toggle a flag
FlagToggle:
  jsr GetFlag
  eor ScriptFlags,y
  jmp IncreaseBy1

IncreaseBy3:
  lda #3
  skip2
IncreaseBy2:
  lda #2
  skip2
IncreaseBy1:
  lda #1
  jmp ScriptIncreasePointerBy

; input: A (flag number)
; output: Y (flag index), A (mask used to manipulate that flag)
GetFlag:
  tay
  jmp IndexToBitmap
.endproc

HelloString:
  .byt "Sample text to test this with!",0

.pushseg
.segment "PRGe"
.proc CutsceneInit
; initialize palette
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  lda #$30
  ldx #$0f
  ; palette 1
  sta PPUDATA
  stx PPUDATA
  sta PPUDATA
  stx PPUDATA
  ; palette 2
  sta PPUDATA
  sta PPUDATA
  stx PPUDATA
  stx PPUDATA
  ; palette 3
  sta PPUDATA
  ldx #$1a
  stx PPUDATA
  ldx #$2a
  stx PPUDATA
  ldx #$26
  stx PPUDATA

; clear nametable
  lda #$20
  sta PPUADDR
  lda #$00
  sta PPUADDR
  tax
  ldy #4
  lda #0
: sta PPUDATA
  inx
  bne :-
  dey
  bne :-

; top of ground
  lda #>($2000+32*24+6)
  sta PPUADDR
  lda #<($2000+32*24+6)
  sta PPUADDR
  lda #$18
  sta PPUDATA
  lda #$16
  ldx #18
  jsr WritePPURepeated
  lda #$1a
  sta PPUDATA

; bottom of ground
  lda #>($2000+32*25+6)
  sta PPUADDR
  lda #<($2000+32*25+6)
  sta PPUADDR
  lda #$19
  sta PPUDATA
  lda #$17
  ldx #18
  jsr WritePPURepeated
  lda #$1b
  sta PPUDATA

; ground attribute
  lda #>($2400-16)
  sta PPUADDR
  lda #<($2400-16)
  sta PPUADDR
  lda #%10101010
  ldx #16
: sta PPUDATA
  dex
  bne :-

; set up nametable
  lda #>($2000+32*11+8)
  sta PPUADDR
  lda #<($2000+32*11+8)
  sta PPUADDR
  lda #6
  sta 0
  ldy #$20
NametableLoop:
  ldy #$20
  ldx #16
: sty PPUDATA
  iny
  dex
  bne :-
; --------
  ldx #16
  lda #0
: sta PPUDATA
  dex
  bne :-
; --------
  dec 0
  bne NametableLoop

  lda #>($2000+32*10+7)
  sta PPUADDR
  lda #<($2000+32*10+7)
  sta PPUADDR
  lda #$01
  sta PPUDATA
  lda #$02
  ldx #16
  jsr WritePPURepeated
  lda #$03
  sta PPUDATA

  lda #>($2000+32*17+7)
  sta PPUADDR
  lda #<($2000+32*17+7)
  sta PPUADDR
  lda #$04
  sta PPUDATA
  lda #$02
  ldx #16
  jsr WritePPURepeated
  lda #$05
  sta PPUDATA

  lda #VRAM_DOWN
  sta PPUCTRL
  lda #>($2000+32*11+7)
  sta PPUADDR
  lda #<($2000+32*11+7)
  sta PPUADDR
  lda #$15
  ldx #6
  jsr WritePPURepeated
  ; ---
  lda #>($2000+32*11+7+17)
  sta PPUADDR
  lda #<($2000+32*11+7+17)
  sta PPUADDR
  lda #$15
  ldx #6
  jsr WritePPURepeated

  ; write the balloon's tail
  lda #>($2000+32*17+9)
  sta PPUADDR
  lda #<($2000+32*17+9)
  sta PPUADDR
  ldy #$06
  sty PPUDATA
  iny
  sty PPUDATA
  iny
  sty PPUDATA
  lda #>($2000+32*17+10)
  sta PPUADDR
  lda #<($2000+32*17+10)
  sta PPUADDR
  ldy #$09
  sty PPUDATA
  iny
  sty PPUDATA

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  rts
.endproc

SpeechBubblePPUAddrLo:
.repeat 8, I
  .byt <($2000+32*11+7+32*I)
.endrep

.proc WriteSpeechBubbleHorizLine
  lda #$02
StartSixteen:
  .repeat 16
    sta PPUDATA
  .endrep
  rts
.endproc

WriteSpeechBubbleSixteen = WriteSpeechBubbleHorizLine::StartSixteen

.proc WriteSpeechBubbleRow
  lda #$15
  sta PPUDATA
  .repeat 16
    sty PPUDATA
    iny
  .endrep
  sta PPUDATA
  rts
.endproc
.popseg
