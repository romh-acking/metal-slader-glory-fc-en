arch nes.cpu



//==============================
//BANK 30
//==============================
banksize $4000
bank 30

//==============================
//Scrolling text speed B
//==============================
org $3EB6 //0x7BEB6
ScrollingTextSpeed:
INC $045A
INC $045A
JMP $8E29

//==============================
//Text speed (Top dialogue box) B
//==============================
TextSpeedReport:
PLA
CMP #$01
BEQ exit
nop
exit:
STA $4B
JMP $9005

//==============================
//Skip voice B
//==============================
org $3EDF
SkipVoice:

txa
pha

//Check if current character to write isn't a space
//if it is, don't increment our counter
ldx $10
lda $04A9,x
cmp #$FE
beq dontIncrement
INC $02
dontIncrement:

pla
tax

LDA $02
AND #$01
BEQ ExitSkipVoice
RTS
ExitSkipVoice:
JMP $9A44
//==============================
//Skip voice (Top dialogue box) B
//==============================
SkipVoiceReport:
INC $05
LDA $05
AND #$03
BEQ ExitSkipVoiceReport
RTS
ExitSkipVoiceReport:
JMP $9A44

//==============================
//BANK 38 (Extension of bank 31)
//==============================
banksize $4000
bank 56
//==============================
//Text speed  B
//==============================
org $0069
TextSpeed:
LDA $046D,y
AND #$0F
lsr
nop
STA $2E
STA $FE





