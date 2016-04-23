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

DemoCutscene:
  .byt SCR::SCENE, 1
  .byt SCR::SAY, CHAR::NOVA|SCR::SPEAKER_0
  .byt "Sample text"
  .byt SCR::NEWLINE
  .byt SCR::NEWLINE
  .byt SCR::TRANSITION
  .byt SCR::SAY, CHAR::NOVA|SCR::SPEAKER_0
  .byt "This is a demo script"
  .byt SCR::NEWLINE
  .byt "and it seems to be working"
  .byt SCR::SAY, CHAR::NOVA|SCR::SPEAKER_0
  .byt "This is a demo"
  .byt SCR::END_SCRIPT

.proc StartCutscene
  lda #<DemoCutscene
  sta ScriptPtr+0
  lda #>DemoCutscene
  sta ScriptPtr+1

  lda PRGBank ; we'll return to the original bank when we're done
  pha

  lda #SOUND_BANK
  jsr SetPRG
  jsr pently_init
  inc pently_music_playing

  jsr WaitVblank
  ldx #0
  stx PPUMASK
  jsr ClearOAM
  lda #2
  sta ScriptPageEnded
  sta OAM_DMA

; Clear cutscene related variables
  ldx #0
  txa
: sta TempSpace,x
  inx
  cpx #30
  bne :-

; Clear background half of VRAM
  jsr ClearBG4kb

; Upload graphics
  lda #GraphicsUpload::BG_CUTSCENE
  jsr DoGraphicUpload
  lda #GraphicsUpload::NPC_CHR
  jsr DoGraphicUpload

; Set up nametable
  lda #CUTSCENE_BANK
  jsr SetPRG

  jsr CutsceneInit

; Run script
  jsr ScriptLoopInit
  jsr ClearOAM

; Clean up and restore gameplay graphics
  lda #0
  sta PPUMASK
  lda #2
  sta OAM_DMA
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  jsr ClearName
  jsr DoLevelUploadList
  jsr UploadNovaAndCommon
  inc NeedLevelRerender
  jsr UpdateScrollRegister
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
  jmp ScriptLoop
.endproc

.proc ScriptRenderOff
  jsr WaitVblank
  lda #0
  sta PPUMASK
  rts
.endproc

.proc ScriptRenderOn
  jsr WaitVblank
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #BG_ON|OBJ_ON
  sta PPUMASK
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  rts
.endproc

.proc ScriptLoopInit
  lda #<ScriptBRK
  sta IRQAddress+0
  lda #>ScriptBRK
  sta IRQAddress+1
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

  cmp #$20
  bcc IsCommand
  ; If not command, just add the character or word to the current line
  cmp #$80
  bcs IsDictionaryWord
  ldx CutsceneBufIndex
  inc CutsceneBufIndex
  sta StringBuffer,x
  bne ScriptLoop

IsDictionaryWord:
  ; Get table index
  sub #$80
  asl
  tay
  lda #VWF_BANK
  jsr _SetPRG

  ; Find word address
  lda CutsceneDictionary+0,y
  sta 0
  lda CutsceneDictionary+1,y
  sta 1
  ldx CutsceneBufIndex

  ; Copy the word
  ldy #0
: lda (0),y
  beq :+
  sta StringBuffer,x
  inx
  iny
  bne :-
: ; Save new BufIndex
  stx CutsceneBufIndex

  jsr SetPRG_Restore
  jmp ScriptLoop

IsCommand:
  ; Terminate StringBuffer
  ldx CutsceneBufIndex
;  beq SkipDraw
  pha
  lda #0
  sta StringBuffer,x
  jsr ScriptRenderOff
  jsr clearLineImg
  ldx CutsceneRenderCol
  jsr vwfPutsBuffer
  stx CutsceneRenderCol
  ldy #0
  lda CutsceneRenderRow
  add #4
  jsr copyLineImg
  pla
  ldy #0 ; reset Y to zero
  sty CutsceneBufIndex
SkipDraw:

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
  .raddr NewLine    ;
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
  .raddr ShowChoice ; xx - choice set 
  .raddr ShowScene  ; xx - scene number
  .raddr Transition ;

; Command, ends the script
EndScript:
  jmp DoEndPage

; Command, does a transition effect
Transition:
  jsr DoEndPage
  jsr WaitVblank

  ldy #0
@Loop:
  jsr WaitVblank
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  lda FadeColors,y
  sta PPUDATA
  ldx #4
: jsr WaitVblank
  dex
  bne :-
  iny
  cpy #8
  bne @Loop

  inc ScriptPageEnded
  jmp ScriptLoop
FadeColors:
  .byt $10, $00, $0f, $0f, $00, $10, $30

; Command, ends the page
EndPage:
  jsr DoEndPage
  jmp ScriptLoop

DoEndPage:
  lda #CUTSCENE_BANK
  jsr SetPRG
  lda #2
  sta OAM_DMA
  jsr ScriptRenderOn
: jsr WaitVblank
  jsr ReadJoy
  lda keynew
  and #KEY_A
  beq :-
  jsr ScriptRenderOff

  lda #CUTSCENE_BANK
  jsr SetPRG

  ; Clear VWF space
  jsr clearLineImg
  lda #4
: ldy #0
  pha
  jsr copyLineImg
  pla
  add #1
  cmp #10
  bne :-

  lda #0
  sta CutsceneRenderCol
  sta CutsceneRenderRow
  rts

; Command, moves to the next line
NewLine:
  lda #0
  sta CutsceneRenderCol
  inc CutsceneRenderRow
  jmp ScriptLoop

; Command, switch to a different scene
ShowScene:
  asl
  asl
  tax
  jsr ScriptRenderOff
  lda #CUTSCENE_BANK
  jsr SetPRG

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  ; Read the four characters
  ldy #0
@Read:
  lda SceneInfoTable+0,x
  pha
  and #31
  sta CutsceneCharacter,y
  pla
  lsr
  lsr
  lsr
  lsr
  lsr
  sta CutsceneCharPos,y
  inx
  iny
  cpy #4
  bne @Read

  jsr ClearOAM

  ; Set up the four characters
  ldy #0
@SetUp:
  lda CutsceneCharacter,y
  jeq @SkipMe
  asl
  asl
  sta 0 ; 0 = character id *4
  tax
  ; Set palette address
  lda #$3f
  sta PPUADDR
  tya
  asl
  asl
  sta 1 ; 1 = character slot *4
  ora #$11
  sta PPUADDR
  ; Write palette
  lda CharacterInfoTable+1,x
  sta PPUDATA
  lda CharacterInfoTable+2,x
  sta PPUDATA
  lda CharacterInfoTable+3,x
  sta PPUDATA

  ; Write to OAM
  lda 1
  asl ;*8
  asl ;*16
  asl ;*32
  tax ; X = sprite index
  lda #21*8-1
  sta OAM_YPOS+(4*0),x
  sta OAM_YPOS+(4*1),x
  lda #22*8-1
  sta OAM_YPOS+(4*2),x
  sta OAM_YPOS+(4*3),x
  lda #23*8-1
  sta OAM_YPOS+(4*4),x
  sta OAM_YPOS+(4*5),x
  sty TempY
  lda CutsceneCharPos,y
  and #3
  tay
  lda SpriteXPositions,y
  sta OAM_XPOS+(4*0),x
  sta OAM_XPOS+(4*2),x
  sta OAM_XPOS+(4*4),x
  add #8
  sta OAM_XPOS+(4*1),x
  sta OAM_XPOS+(4*3),x
  sta OAM_XPOS+(4*5),x
  ldy TempY
  tya
  sta OAM_ATTR+(4*0),x
  sta OAM_ATTR+(4*1),x
  sta OAM_ATTR+(4*2),x
  sta OAM_ATTR+(4*3),x
  sta OAM_ATTR+(4*4),x
  sta OAM_ATTR+(4*5),x
  lda CutsceneCharacter,y
  asl
  sta 2
  asl
  add 2
  ; find a better solution than this mess?
  sta OAM_TILE+(4*0),x
  add #1
  sta OAM_TILE+(4*1),x
  add #1
  sta OAM_TILE+(4*2),x
  add #1
  sta OAM_TILE+(4*3),x
  add #1
  sta OAM_TILE+(4*4),x
  add #1
  sta OAM_TILE+(4*5),x

  ; Do flipping
  ; (currently messy)
  lda CutsceneCharPos,y
  and #4
  beq @NoFlip
  inc OAM_TILE+(4*0),x
  dec OAM_TILE+(4*1),x
  inc OAM_TILE+(4*2),x
  dec OAM_TILE+(4*3),x
  inc OAM_TILE+(4*4),x
  dec OAM_TILE+(4*5),x
  tya
  ora #OAM_XFLIP
  sta OAM_ATTR+(4*0),x
  sta OAM_ATTR+(4*1),x
  sta OAM_ATTR+(4*2),x
  sta OAM_ATTR+(4*3),x
  sta OAM_ATTR+(4*4),x
  sta OAM_ATTR+(4*5),x
@NoFlip:

@SkipMe:
  iny
  cpy #4
  jne @SetUp

  jmp IncreaseBy1

SpriteXPositions:
  .byt 8*8+4, 12*8+4, 16*8+4, 20*8+4

; Command, show preset choices
ShowChoice:
  jmp IncreaseBy1

SwitchSpeaker:
  pha
  and #31
  sta CutsceneCurFace ; face and name
  pla
  lsr
  lsr
  lsr
  lsr
  lsr
  sta CutsceneCurSpeaker
  lda #0
  sta CutsceneRenderRow
  sta CutsceneRenderCol
  sta CutsceneBufIndex

  ; Don't draw face or name if sign or nothing
  lda CutsceneCurFace
  cmp #2
  bcs @YesCharacter

  ; Erase old face
  lda #$20
  sta PPUADDR
  lda #$E0
  sta PPUADDR
  ldx #32*3
  lda #0
  jmp WritePPURepeated
@YesCharacter:

  ; Write name
  lda #CUTSCENE_BANK
  jsr SetPRG
  lda CutsceneCurFace ; Get index into table
  asl
  asl
  tax
  lda CharacterInfoTable,x
  tax
  ldy #0
: lda CharacterNameData,x
  sta StringBuffer,y
  inx
  iny
  cmp #0
  bne :-

  ; Write name to CHR
  jsr clearLineImg
  ldx #0
  jsr vwfPutsBuffer
  ldy #0
  lda #3
  jsr copyLineImg

  ; Write to nametable
  lda #$21
  sta PPUADDR
  lda #$28
  sta PPUADDR
  ldy #$30
  ldx #13
  jsr WriteIncreasing
  ; Write face to nametable too
  ldy #$26
  ldx #3
  jsr WriteIncreasing
  lda #$21
  sta PPUADDR
  lda #$15
  sta PPUADDR
  ldy #$23
  ldx #3
  jsr WriteIncreasing
  lda #$20
  sta PPUADDR
  lda #$f5
  sta PPUADDR
  ldy #$20
  ldx #3
  jsr WriteIncreasing

  ; Decompress face
  lda #72
  ldy CutsceneCurFace
  dey
  dey
  jsr mul8
  sty 0
  sta 1

  ; Add to base
  lda 0
  add #<FaceData
  sta 0
  lda 1
  adc #>FaceData
  sta 1

  ;Set to start of second row
  lda #$02
  sta PPUADDR
  ldy #0
  sty PPUADDR

  lda #9
  sta 2 ; loop counter
@TileLoop:
  ldx #8
: lda (0),y
  sta PPUDATA
  iny
  dex
  bne :-
  ldx #8
  lda #0
  jsr WritePPURepeated
  dec 2
  bne @TileLoop
  rts

EraseOldTail:
  ; Erase any old bubble tail
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #$22
  sta PPUADDR
  lda #$28
  sta PPUADDR
  lda #2
  jsr WritePPURepeated16
  lda #$22
  sta PPUADDR
  lda #$48
  sta PPUADDR
  lda #0
  jsr WritePPURepeated16
  lda #$22
  sta PPUADDR
  lda #$68
  sta PPUADDR
  lda #0
  jmp WritePPURepeated16

DoBalloonTail:
  sta 0
  ldy CutsceneCurSpeaker
  lda CutsceneCharPos,y
  and #3
  asl
  asl
  sta 1
  jsr EraseOldTail

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000 | VRAM_DOWN
  sta PPUCTRL
  ; Write the balloon's tail (as two columns)
  lda #>($2000+32*17+9)
  sta PPUADDR
  lda #<($2000+32*17+9)
  add 1
  sta PPUADDR
  ldy 0
  sty PPUDATA
  iny
  sty PPUDATA
  iny
  sty PPUDATA
  lda #>($2000+32*17+10)
  sta PPUADDR
  lda #<($2000+32*17+10)
  add 1
  sta PPUADDR
  lda 0
  add #3
  tay
  sty PPUDATA
  iny
  sty PPUDATA
  rts

EndPageIfNeeded:
  pha
  lda ScriptPageEnded
  bne :+
  jsr DoEndPage
: lda #0
  sta ScriptPageEnded  
  pla
  rts

; Command, switch speaker and style
Say:
  jsr EndPageIfNeeded
  jsr SwitchSpeaker
  lda #6
  jsr DoBalloonTail
  jmp IncreaseBy1

; Command, switch speaker and style
Think:
  jsr EndPageIfNeeded
  jsr SwitchSpeaker
  lda #11
  jsr DoBalloonTail
  jmp IncreaseBy1

; Command, switch speaker and style
Narrate:
  jsr EndPageIfNeeded
  jsr EraseOldTail
  jsr SwitchSpeaker
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
  ldx #$37
  stx PPUDATA

; clear nametable
  lda #0
  jsr ClearNameCustom

; Top row of ground
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

; Bottom row of ground
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

; Write attribute table bytes for ground
  lda #>($2400-16)
  sta PPUADDR
  lda #<($2400-16)
  sta PPUADDR
  lda #%10101010
  ldx #16
: sta PPUDATA
  dex
  bne :-

; Set up nametable with increasing bytes to display VWF text
  lda #>($2000+32*11+8)
  sta PPUADDR
  lda #<($2000+32*11+8)
  sta PPUADDR
  lda #6
  sta 0
  ldy #$40
NametableLoop:
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

  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  rts
.endproc

.popseg
