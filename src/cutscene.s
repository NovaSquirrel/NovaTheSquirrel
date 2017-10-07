; Princess Engine
; Copyright (C) 2016-2017 NovaSquirrel
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
.if 0
DemoCutscene:
  .byt SCR::SCENE, 0
  .byt SCR::SAY, CHAR::NOVA|SCR::SPEAKER_0
  .byt $80, $81, $82, $83
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
.endif

.proc StartCutscene
  lda PRGBank ; we'll return to the original bank when we're done
  sta CutsceneOldBank
  tsx
  stx CutsceneOldSP

  lda #SOUND_BANK
  jsr SetPRG
  jsr pently_init
  inc pently_music_playing

  jsr WaitVblank
  ldx #0
  stx NeedDialog
  stx PPUMASK
  jsr ClearOAM
  lda #2
  sta ScriptPageEnded
  sta OAM_DMA

; --------------------------------------------------
; load dictionary addresses into RAM
; --------------------------------------------------
  ; Preload dictionary word starting addresses into RAM
  lda #DIALOG_BANK
  jsr SetPRG

.ifndef HAS_DICTIONARY_TABLE
  ; Load first word into table, and load pointers
  lda #<CutsceneDictionary
  sta ScratchPage+0
  sta 0
  lda #>CutsceneDictionary
  sta ScratchPage+128  
  sta 1

  ldy #0
  ldx #1 ; 1st word
  stx CutsceneIsBlank
MoreDictionary:
  lda (0),y
  bmi DictionaryWordFound
  iny
  bne MoreDictionary
  inc 1
  bne MoreDictionary

DictionaryWordFound:
  inc16 0
  tya
  add 0
  sta ScratchPage+0,x
  lda 1
  adc #0
  sta ScratchPage+128,x
  inx
  cpx #128
  bcc MoreDictionary
CutsceneDictionaryTable = ScratchPage
.endif

; --------------------------------------------------

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
  lda #VWF_BANK
  jsr SetPRG

  jsr CutsceneInit

; Run script
  jsr ScriptLoopInit
SkipTheScript:
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

  lda CutsceneOldBank
  jsr SetPRG

  ; This prevents Start from immediately launching into the inventory
  lda #255
  sta keylast
  lda #0
  sta keydown
  sta keynew
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
.endproc
; this space needs to be empty
.proc ScriptLoop
  lda #DIALOG_BANK
  jsr _SetPRG
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
  lda #0
  sta CutsceneIsBlank
  beq ScriptLoop

IsDictionaryWord:
  sta $5555
  ; Get table index
  sub #$80
  tax
  lda CutsceneDictionaryTable+0,x
  sta 0
  lda CutsceneDictionaryTable+128,x
  sta 1

  lda #0
  sta CutsceneIsBlank

  ; Write word to buffer
  ldx CutsceneBufIndex
  ldy #0
: lda (0),y            ; Read character
  and #127             ; Ignore top bit
  sta StringBuffer,x   ; Write character
  inx

  cpx #128             ; Not sure what's going on here but there's some bug
  bne @NoFix           ; where X goes past the length of the buffer
  ldx #0               ; and overwrites important stuff. This fixes it but
@NoFix:                ; I really should fix the root cause.

  lda (0),y            ; Reread character to check for high bit
  bmi @Done
  iny
  bne :-
@Done:
  stx CutsceneBufIndex
  jmp ScriptLoop

IsCommand:
  ; Terminate StringBuffer
  ldx CutsceneBufIndex
  beq NopeNothingToDraw
  pha
  lda #VWF_BANK
  jsr _SetPRG
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
NopeNothingToDraw:

  ; Call the cutscene command
  asl
  tax
  lda ScriptCommands+1,x
  pha
  lda ScriptCommands+0,x
  pha

  lda #DIALOG_BANK
  jsr _SetPRG
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
  .raddr Say        ; \  .ssccccc
  .raddr Think      ;  |  ||+++++- character (0-31). determines name and face
  .raddr Narrate    ; /   ++------ slot (0-3)
  .raddr ShowScene  ; xx - scene number
  .raddr Transition ;
  .raddr NoSkip     ;
  .raddr MonoText   ; aa aa - text pointer
; Command, disables skipping the dialog
NoSkip:
  inc CutsceneNoSkip
  jmp ScriptLoop

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
  lda #$3f
  sta PPUADDR
  lda #$00
  sta PPUADDR
  ldx #2
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

; Command, ends the script
EndScript:
  lda ScriptPageEnded
  bne :+
  jsr DoEndPage ; must be a JSR, not a JMP
: rts

DoEndPage:
  lda #VWF_BANK
  jsr SetPRG
  lda #2
  sta OAM_DMA
  jsr ScriptRenderOn
: jsr WaitVblank
  jsr ReadJoy

  lda CutsceneNoSkip
  bne @NoSkip
  lda keynew
  and #KEY_START
  beq @NoSkip
  ; If Start is pressed and the dialog is skippable, end the script
  ldx CutsceneOldSP
  txs
  jmp StartCutscene::SkipTheScript
@NoSkip:
  lda keynew
  and #KEY_A
  beq :-
@Done:
  jsr ScriptRenderOff

  lda #VWF_BANK
  jsr SetPRG

  ; Clear VWF space
  jsr clearLineImg
  lda #4
  sta CutsceneIsBlank
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
  lda CutsceneRenderRow
  cmp #6
  beq EndPage
  jmp ScriptLoop

; Command, switch to a different scene
ShowScene:
  pha
  lda CutsceneIsBlank
  beq :+
    jsr DoEndPage
  :
  pla
  asl
  asl
  tax
  jsr ScriptRenderOff
  lda #VWF_BANK
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
  jsr WaitVblank

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
  cmp #CHAR::BILL
  beq @BillCustom
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
@BackFromBillCustom:

@SkipMe:
  iny
  cpy #4
  jne @SetUp

  jmp IncreaseBy1

@BillCustom:
  lda #$78
  sta OAM_TILE+(4*0),x
  lda #$79
  sta OAM_TILE+(4*1),x
  lda #$7b
  sta OAM_TILE+(4*2),x
  lda #$7c
  sta OAM_TILE+(4*3),x
  lda #$7e
  sta OAM_TILE+(4*4),x
  lda #$7f
  sta OAM_TILE+(4*5),x
  lda #$7a
  sta OAM_TILE+(4*6),x
  lda #$7d
  sta OAM_TILE+(4*7),x
  lda #$04
  sta OAM_TILE+(4*8),x
  ; Set up the X position and Y positions and attribute
  lda OAM_ATTR+(4*0),x
  sta OAM_ATTR+(4*6),x
  sta OAM_ATTR+(4*7),x
  sta OAM_ATTR+(4*8),x
  lda OAM_XPOS+(4*0),x
  add #16
  sta OAM_XPOS+(4*6),x
  sta OAM_XPOS+(4*7),x
  sta OAM_XPOS+(4*8),x
  lda #21*8-1
  sta OAM_YPOS+(4*6),x
  lda #22*8-1
  sta OAM_YPOS+(4*7),x
  lda #23*8-1
  sta OAM_YPOS+(4*8),x
  jmp @BackFromBillCustom

SpriteXPositions:
  .byt 8*8+4, 12*8+4, 16*8+4, 20*8+4

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
  lda #VWF_BANK
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
  jsr SwitchSpeaker
  jsr EraseOldTail
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

IncreaseBy3:
  lda #3
  skip2
IncreaseBy2:
  lda #2
  skip2
IncreaseBy1:
  lda #1
  jmp ScriptIncreasePointerBy

MonoText:
LevelTextAddress = 8
  sta CompressedTextPointer+0
  iny
  lda (ScriptPtr),y
  sta CompressedTextPointer+1

  lda #$e2
  sta LevelTextAddress+0
  lda #$20
  sta LevelTextAddress+1

MonoTextLoop:
  ldx #0 ; X is the StringBuffer index
  jsr DecompressTextFar
  pha ; save the terminator byte

  jsr WaitVblank
  lda #VBLANK_NMI | NT_2000 | OBJ_8X8 | BG_0000 | OBJ_1000
  sta PPUCTRL
  lda #BG_ON|OBJ_ON
  sta PPUMASK

  lda #0
  sta StringBuffer,x
  tax ; X = 0
: lda StringBuffer,x
  beq :+
  ldy LevelTextAddress+1
  sty PPUADDR
  ldy LevelTextAddress+0
  sty PPUADDR
  inc LevelTextAddress+0
  sta PPUDATA
  lda #0
  sta PPUSCROLL
  sta PPUSCROLL
  jsr WaitVblank
  inx
  bne :- ; unconditional
:

  ; Go down two rows
  lda LevelTextAddress+0
  and #<~31
  ora #2
  add #64
  sta LevelTextAddress+0
  addcarry LevelTextAddress+1

  pla ; get the terminator byte
  cmp #SCR::END_SCRIPT
  bne MonoTextLoop

  ; ----------------

  ; Wait for a key press
: jsr WaitVblank
  jsr ReadJoy

  lda keynew
  and #KEY_START ; Start = skip everything
  beq @NoSkip
  ldx CutsceneOldSP
  txs
  jmp StartCutscene::SkipTheScript
@NoSkip:
  lda keynew
  and #KEY_A
  beq :-
  
  ; Clear everything
  jsr WaitVblank
  lda #0
  sta PPUMASK
  lda #' '
  jsr ClearNameCustom

  jmp IncreaseBy2
.endproc

.pushseg
.segment "PRGe"
.proc CutsceneInit
; initialize palette
  jsr WaitVblank
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
