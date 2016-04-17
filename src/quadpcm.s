.pushseg
.segment "PRGeSamp"
ciBlocksLeft = ciBufEnd
.align 256
.proc quadpcm_playPages
ciBits = 2
thisSample = 3
lastSample = 4
deEss = 5
  lda #64
  sta thisSample
  sta lastSample

nextPage:
  ; start page
  ldy #0
  lda (ciSrc),y
  sta deEss
  inc ciSrc
  ; waste some time  
  ldx #3
pageWaste:
  dex
  bne pageWaste
  lda $0100

playByte:
  ; Fetch byte
  ldy #0
  lda (ciSrc),y
  inc ciSrc
  sta ciBits
  and #$0F
  jsr decode1
  ; waste time between samples
  ldx #11
midByteWaste:
  dex
  bne midByteWaste
  lda ciBits
  ; Fetch upper nibble
  lda ciBits
  lsr a
  lsr a
  lsr a
  lsr a
  jsr decode1
  ; next byte
  lda ciSrc
  bne notWrap
  ; go to next page
  inc ciSrc+1
  dec ciBlocksLeft
  bne nextPage
  rts
notWrap:
  ; waste some time
  ldx ciBits
  ldx #8
notWrapDelay:
  dex
  bne notWrapDelay
  jmp playByte

decode1:
  ; decode sample
  tax
  lda quadpcm_deltas,x
  clc
  adc lastSample
  and #$7F
  sta thisSample
  ; interpolation
  clc
  adc lastSample
  lsr a
  eor deEss
  sta $4011
  ; end sample period
  ldx #19
endPeriodWait:
  dex
  bne endPeriodWait
  lda (ciSrc,x)
  lda thisSample
  sta lastSample
  sta $4011
  rts
.endproc

.proc quadpcm_play_die
  lda #<die_qdp
  sta ciSrc
  lda #>die_qdp
  sta ciSrc+1
  lda #>(die_qdp_end - die_qdp)
  sta ciBlocksLeft
  jmp quadpcm_playPages
.endproc

.proc quadpcm_play_bummer
  lda #<bummer_qdp
  sta ciSrc
  lda #>bummer_qdp
  sta ciSrc+1
  lda #>(bummer_qdp_end - bummer_qdp)
  sta ciBlocksLeft
  jmp quadpcm_playPages
.endproc

die_qdp:
  .incbin "../tools/die.qdp"
die_qdp_end:

bummer_qdp:
  .incbin "../tools/bummer.qdp"
bummer_qdp_end:

.align 16
quadpcm_deltas:
  .byt 0,1,4,9,16,25,36,49
  .byt 64,<-49,<-36,<-25,<-16,<-9,<-4,<-1
.popseg
