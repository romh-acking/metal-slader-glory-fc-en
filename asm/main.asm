arch nes.cpu

define Bank31Restore			$9CE5
define Bank31Bankswitch			$989F
define PasswordText8x16Setup	$87BE
define LastBankRestore			$F017
define LastBankBankswitch		$F16C
define BtleSumSpecControlCode1	$67
define BtleSumSpecControlCode2	#$67
define BattleSumTxtId			$180

define VoiceCounterMask			#$01
define MouthMask				#$01

define CustVoiceCounter			$02

//==============================
//PARENT SECTOR
//==============================
//==============================
//BANK 00
//==============================
banksize $4000
bank 00
//==============================
//Timing screen
//==============================
//Pointer
org $0135 // 0x0135
db $70, $00, $10
//Data
bank 56
org $1010 // 0xE1010
incbin "asm/tilemap/timing screen data 1.bin"

//==============================
//BANK 16
//==============================
banksize $4000 //Start 0x40000
bank 16

//==============================
//Ch2: Vivace Fullscreen music end wait removal (Script Engine)
//(Childless)
//==============================
org $1FF5 //;0x41FF5
db $ea

//==============================
//Ch7: Final blow music change
//==============================
org $3ab2 // 0x43ab2
db $B8
db $01,$20
db $82
db $02,$7D,$06
db $B6
db $4E,$16,$0A

//==============================
//BANK 18
//==============================
banksize $4000 //Start 0x48000
bank 18

//==============================
//Ch6: Azusa bedroom
//==============================
// "About Azusa" => "Azusa"
org $00490 // 0x00048490
dw $0063

//==============================
//Password chr bank change
//(Childless)
// Change what CHR bank to load in password screen
//==============================
//Bank ID 1
org $171A // 0x4971A
db $80
//Bank ID 2
org $171D // 0x4971D
db $80
//==============================
//Ch 2: Yayoi kickout music end wait removal (Script Engine)
//(Childless)
//==============================
org $2DD4 //0x4add4
db $00 //Originally $f7

//==============================
//BANK 19
//==============================
banksize $4000 //Start 0x4C000
bank 19
//==============================
//Game over text (Childless)
//==============================
org $0CC0 // 0x4CCC0
incbin "asm/tilemap/game over text data.bin"
//==============================
//Password white text
//(Childless)
//==============================
org $24FC // 0x4E4FC
db $FE
org $2503 // 0x4E503
incbin "asm/tilemap/white text data 2.bin"
org $2531 // 0x4E531
incbin "asm/tilemap/white text data 3.bin"

//==============================
//Ch 2: Pilot reveal pause removal (Script Engine)
//(Childless)
//==============================
org $12A2 //0x4D2A2
db $00

//==============================
// Ch 5
// Tower "Knock" => "Check"
// Option change (Script Engine)
//==============================
org $3023 //0x4F023
db $b2
org $33BD //0x4F3BD
db $b2
org $342D //0x4F42D
db $b2
//==============================
//Ch7: Battle Summary C (Script Engine)
//==============================
//If you remove this, remove this
//at line #2772:
//"They're(LINE)coming right for us!(LINE)"
//#$4d134
org $1134; fill $85, $00 //blank out everything

//==============================
//BANK 20
//==============================
banksize $4000
bank 20
//==============================
// Ch 5
// Tower "Knock" => "Check"
// Option change (Continued)
//==============================
org $00EE //0x500EE
db $b2
org $0140 //0x50140
db $b2
org $0192 //0x50192
db $b2
org $053F //0x5053F
db $b2
org $0C03 //0x50C03
db $b2

//==============================
//Password leftover lines fix
//(Childless)
//==============================
org $12C3 // 0x512C3
db $FD
org $12D4 // 0x512D4s
db $FD

//==============================
//BANK 29
//==============================
banksize $4000 // 0x78000
bank 29
//==============================
//Blinking text palettes A
//==============================
org $2D03 // ;0x76D03
JMP BlinkingTextPalettes

//==============================
//BANK 30
//==============================
banksize $4000
bank 30
//==============================
//Choice number fix 2 A
//==============================
org $26C8 // 0x7A6C8
JSR ChoiceNumberFix2
NOP
NOP
//==============================
//Choice number fix 1 A
//==============================
org $26D0 // 0x7A6D0
JSR ChoiceNumberFix1
//==============================
//Password shadow fix A
//==============================
org $2B71 // 0x7AB71
JSR PasswordShadowFix
//==============================
//Remove autolinebreaking
//(Top dialogue box)
//==============================
org $2E26 // 0x7AE26
NOP
NOP
NOP
//==============================
//Scrolling text speed A
//==============================
org $2E36 // 0x7AE36
JMP ScrollingTextSpeed
//==============================
//Upper textbox 8x16 font A
//==============================
org $2E69 // 0x7AE69
JSR UpperTextbox8x16
NOP
//==============================
//Input code range: hyphen fix
//crash fix
//WARNING: THIS IS A CRASH FIX
//==============================
org $2F10 // 0x7AF10
JSR HyphenCrashFix
//==============================
//No indent
//(Top dialogue box)
//(Childless)
//==============================
org $2F78 // 0x7AF78
LDA #$00
org $304F // 0x7B04F
LDA #$00
//==============================
//No auto-linebreak
//(Top dialogue box)
//(Childless)
//==============================
org $2FDA // 0x7AFDA
LDA #$01
//==============================
//Text speed
//(Top dialogue box) A
//==============================
org $3A12; fill $05, $ea
org $3A12 // 0x7BA12
JMP TextSpeedReport
//==============================
//Emergency countdown fix
//==============================
org $30EC // 0x7B0EC
db $9F
//==============================
//Emergency countdown period fix
//==============================
org $312E // 0x7B12E
db $fa
//==============================
//Portrait shadows fix A
//==============================
org $31F4 // 0x7B1F4
JSR PortraitShadowFix
//==============================
//Missing portrait tile fix
//(Childless)
//==============================
//Tadashi
org $368F // 0x7B68F
db $FE
//Elina
org $3762 // 0x7B762
db $FE
//==============================
//Skip voice A
//==============================
org $39BB // 0x7B9BB
JSR SkipVoice
//==============================
//Max B speed A
//==============================
JMP MaxBSpeed
//==============================
//Skip voice (Top dialogue box) A
//==============================
org $3A07 // 0x7BA07
JSR SkipVoiceReport

//==============================
//Mouth flap adjust
//==============================
//Characters won't move their
//mouth during ellipsis and long 
//hyphen
//>1E:9986: B1 1C     LDA ($1C),Y @ $9BB0 = #$22
//The old mouth values for !,?,etc are there for 
//stuff on the top row, but those
//characters will never be spoken 
//So I'll leave them alone.

// INSaeijs

org $3C50 // 0x0007BC50
incbin "asm/mouth/table - lo.bin"
incbin "asm/mouth/table - hi.bin"

//==============================
//Scrolling text speed C (when linebreaks are used)
//==============================
org $7309D // 0x7B09D-908D
JMP $9F9F

//==============================
//Scrolling text speed D 
//==============================
org $73FAF //0x7BFAF
ScrollingTextSpeedD:
INC $045A
INC $045A
JMP $9090

//==============================
// Menu expansion
//==============================
//Original
//db $42,$28,$82,$28,$C2,$28,$02,$29,$C2,$29,$02,$2A,$42,$2A,$82
//I actually hate having to shift everything to the left;
//It doesn't align with the dialogue.

org $2A3D //0x7AA3D
db $41 //Option #01 (nothing on right)
db $28
db $81 //Option #02 (nothing on right)
db $28
db $C1 //Option #03 (nothing on right)
db $28
db $01 //Option #04 (nothing on right)
db $29
db $C1 //Option #01/#05
db $29
db $01 //Option #02/#06
db $2A
db $41 //Option #03/#07
db $2A
db $81 //Option #04/#08

//1E:86F1: BD 2D 8A  LDA $8A2D,X @ @8A2D = $42

//==============================
// Menu row blanking expansion
//==============================
org $260F // 0x7A5FF
lda #$20

//==============================
//Slow Mouth A
//==============================
org $73A2b; fill $0B, $ea
org $73A2b //0x7BA2b
jmp SlowMouth

//==============================
//BANK 31
//==============================
banksize $4000 //0x7C000
bank 31
//==============================
//Password selection codes A
//==============================
org $07CB //0x7C7CB
JMP SelectionCodesSetup
//==============================
//Password screen text 8x16
//==============================
PasswordText8x16Setup:
JSR {Bank31Bankswitch}
JSR PasswordText8x16
RTS
NOP
NOP
NOP
NOP
NOP
NOP
org $085D // 0x7C85D
CMP #$1A      
db $F0, $2C //BEQ +2C
CMP #$1F
//==============================
//Password orange text
//(Childless)
//==============================
org $091B // 0x7C91B
incbin "asm/tilemap/orange text data 1.bin"
org $09B3 // 0x7C9B3
incbin "asm/tilemap/orange text data 2.bin"
//==============================
//Input code range fix 2
//==============================
org $0B2D // 0x7CB2D
JSR {Bank31Bankswitch}
JSR InputCodeRangeFix2Setup
NOP
//==============================
//Input code range fix 3
//==============================
org $0B53 // 0x7CB53
JSR {Bank31Bankswitch}
JSR InputCodeRangeFix2Setup
NOP
//==============================
//Input code range fix
//==============================
org $0CCE // 0x7CCCE
db $CA, $CB, $CC, $CD, $CE, $CF
db $D0, $D1, $D2, $D3, $D4, $D5
db $D6, $D7, $D8, $D9, $DA, $DB
db $DC, $DD, $DE, $DF, $E0, $E1
db $E2, $E3
//==============================
//Immediate choice number fix
//==============================
//Night
org $0F95 // 0x7CF95
db $21, $31, $22, $32
//Night 2
org $0FA0 // 0x7CFA0
db $21, $31
org $0FA4
db $22, $32
//Day
org $0FAF // 0x7CFAF
db $21, $31, $22, $32, $FE
org $0FBE // 0x7CFBE
db $21, $31
org $0FC2 // 0x7CFC2
db $22, $32
//SPECIAL INSTANCE		  
org $0FE4 // 0x7CFE4
db $21, $31, $22, $32

//==============================
//No auto-linebreak (General)
//(Childless)
//==============================
org $1272 // 0x7D272
NOP
NOP
NOP
//==============================
//No auto-linebreak (War Story)
//(Bottom Text) (Childless)
//Inserted by FCandChill
//Some patches in here are mine
//too.
//==============================
org $1294 // 0x7D294
NOP
NOP
NOP
//==============================
//8x16 font
//==============================
org $1301 // 0x7D301
JMP Setup8x16
NOP
//==============================
//8x16 font scroll fix
//==============================
org $1481 // 0x7D481
JSR FontScrollFixSetup8x16
RTS
//==============================
//Bank 31 bankswitch
//==============================
org $18AF // 0x7D8AF
Bank31Bankswitch:
LDA #$F0     
STA $5115
RTS
NOP
NOP
//==============================
//Text speed A
//==============================
org $18DB // 0x7D8DB
JSR {Bank31Bankswitch}
JSR TextSpeedSetup
NOP
//==============================
//Ch7: Battle Summary A
//==============================
//org $2E07; fill $24, $ea
//org $2E07 //0x7EE07
//tay
//LDA #$F0
//STA $5115
//JSR BattleSummary
//tya

//==============================
//Skip indent after linebreak
//(Childless)
//==============================
org $18FB // 0x7D8FB
JMP $98A7
//==============================
//Input code range: hyphen fix 2
//WARNING: THIS COULD
//POTENTIALLY CRASH THE GAME
//7/2020: Actually, I don't
//remember what was this for,
//so I'll comment it
//==============================
//org $192C // 0x7D92C
//db $0C
//==============================
//No auto-linebreak fullscreen
//(Childless)
//==============================
org $19E3 // 0x7D9E3
NOP
NOP
NOP
//==============================
//Password screen text 8x16
//==============================
org $1A0C // 0x7DA0C
JSR {PasswordText8x16Setup}
NOP
NOP
//==============================
//No indent fullscreen
//(Childless)
//==============================
org $1B15 // 0x7DB15
NOP
NOP
//==============================
//Password text speed A
//==============================
org $1B46 // 0x7DB46
JSR TextSpeedPasswordSetup
NOP
//==============================
//Password screen (and V-MH selection) cursor speed
//==============================
org $2809 // 0x7E809
//db $12
//==============================
//8X16 choice text fix A
//==============================
org $3168 // 0x7F168
JSR ChoiceText8x16Setup
NOP
NOP
//==============================
// Ch7: Correct quote to AZUSA password
//==============================
org $BE6 //0x7CBE6
ldy #$AB
lda #$BB

//============================================================
//CHILD SECTOR
//============================================================
//==============================
//BANK 29
//==============================
banksize $4000
bank 29

//==============================
//Blinking text palettes B
//==============================
org $39DC ; base $99CC
BlinkingTextPalettes:
//"Vivace" fix
PHA
LDA #$0F
STA $5D56
PLA

//Forget what this does
STA $0400,x
INX

lda $90
CMP #$78
BEQ ProcessBlinkyShadow
CMP #$2D
BEQ ProcessBlinkyShadow
CMP #$90
BEQ ProcessBlinkyShadow
CMP #$58
BEQ ProcessBlinkyShadow

RTS

ProcessBlinkyShadow:
//Pink text
tya
pha
ldy $95

lda $90
CMP #$2D
beq BG_PinkGrey
CMP #$78
beq BG_PinkBlack
CMP #$90
beq BG_GreenBlack
CMP #$58
beq BG_GameOver
rts

BG_PinkGrey:
lda t_PinkShadow_GreyBG,y
jmp done
BG_PinkBlack:
lda t_PinkShadow_BlackBG,y
jmp done
BG_GreenBlack:
lda t_GreenShadow_BlackBG,y
jmp done
BG_GameOver:
lda t_GameOverShadow,y

done:
STA $0400,x
pla
tay

RTS

t_PinkShadow_GreyBG: //$AE2D's shadows
//Original
//db $00,$70,$00,$05,$15,$25,$25,$25,$25,$25,$25,$25,$25,$25,$15,$05,$00
db $00,$70,$00,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$00

t_PinkShadow_BlackBG: //$AB78's shadows
//Original
//db $0F,$72,$0F,$05,$15,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$15,$05
db $0F,$72,$0F,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$15,$05

t_GreenShadow_BlackBG: //$AB90's shadows
//Original
//db $0F,$0F,$0A,$1A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$1A,$0A,$41
db $0F,$0F,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$41

t_GameOverShadow: //$AC58's shadows
//Original
//db $82,$10,$00,$0D,$00,$10,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$41
db $82,$10,$00,$0D,$00,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$41

//==============================
//BANK 30
//==============================
banksize $4000
bank 30
//==============================
//Password shadow fix B
//==============================
org $3E50 ; base $9E40
PasswordShadowFix:
LDA $18
STY $FD
ADC $FD
CMP #$A1
BNE ExitShadowFix
LDA $19
CMP #$AE
BNE ExitShadowFix
//Backups
STY $FE
STX $FF
//???
LDA #$00
STA $A8
LDA #$2F
STA $A7
//Vertical line to buffer
LDA #$04
STA $0300
LDA #$0B
STA $0301
LDA #$20
STA $0302
LDA #$7E
STA $0303
LDX #$00
LDA #$FF
Loop1:
STA $0304,x
INX
CPX #$0B
BNE Loop1
//Horizontal line to buffer
LDA #$00
STA $030F
LDA #$1C
STA $0310
LDA #$21
STA $0311
LDA #$A3
STA $0312
LDX #$00
LDA #$FF
Loop2:
STA $0313,x
INX
CPX #$20
BNE Loop2
//Restore Y, X and A
LDX $FF
LDY $FE
ExitShadowFix:
LDA ($18),y
STA ($1A),y
DEY
RTS

//==============================
//Scrolling text speed B
//==============================
ScrollingTextSpeed:
INC $045A
INC $045A
JMP $8E29
//==============================
//Text speed (Top dialogue box) B
//==============================
TextSpeedReport:
lda $4b
CMP #$01
BEQ exit
LSR
LSR
exit:
JMP $E1DD
//==============================
//Portrait shadows fix
//==============================
PortraitShadowFix:
CPY #$02
BCS DontWrite1
LDA $0419
BEQ DontWrite2
LDA #$01
STA $04A3,y
RTS
DontWrite2:
LDA ($1A),y
DontWrite1:
STA $04A3,y
RTS
//==============================
//Skip voice B
//==============================
SkipVoice:
txa
pha

//Check if current character to write isn't a space
//if it is, don't increment our counter
ldx $10
lda $04A9,x
cmp #$FE
beq dontIncrement
INC {CustVoiceCounter}
dontIncrement:

pla
tax

LDA {CustVoiceCounter}
AND {VoiceCounterMask}
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
AND {VoiceCounterMask}
BEQ ExitSkipVoiceReport
RTS
ExitSkipVoiceReport:
JMP $9A44
//==============================
//Max B speed B
//==============================
MaxBSpeed:
//Skip routine if we're not pressing B
LDA $062D
//This byte determines whether or not you can power
//through the dialogue with B.
AND $5D18
BEQ LoadOriginalSpeed

LoadMaxSpeed:
LDA #$00
JMP $99B8

//Speed provided by text speed patches
LoadOriginalSpeed:
LDA $2E
JMP $99B1

//==============================
//Choice number fix 1
//==============================
ChoiceNumberFix1:
CMP #$10
BEQ ExitNumberFix
CMP #$FE
BEQ ExitNumberFix
CLC
ADC #$10
ExitNumberFix:
STA $04A9,y
RTS
//==============================
//Choice number fix 2
//==============================
ChoiceNumberFix2:
LDA $8A4D,x
CMP #$10
BNE ExitNumberFix2
LDA #$FE
ExitNumberFix2:
STA $04A8,y
RTS
//==============================
//Upper textbox 8x16
//==============================
UpperTextbox8x16:
LDA $0481,y
CMP #$C0
BCS ReallyEmptyTile
CMP #$20
BCC ReallyEmptyTile
SEC
SBC #$10
JMP Exit8x16UpperTextbox
ReallyEmptyTile:
LDA #$FE
Exit8x16UpperTextbox:
STA $58
STA $049E
RTS
//==============================
//Hyphen crash fix B
//==============================
HyphenCrashFix:
LDA $0483,y
CMP #$0C
BNE SkipHyphenCrashFix
LDA #$0C
SkipHyphenCrashFix:
RTS
//==============================
//Slow Mouth B
//==============================
SlowMouth:
LDA {CustVoiceCounter}
AND {MouthMask}
BEQ OpenMouth
jmp $9A26

OpenMouth:
LDA $07ED,x
AND #$3F
ORA $07B1
STA $07ED,x
jmp $9A26

//==============================
//BANK 31
//==============================
banksize $4000
bank 31
//==============================
//Bank30Bankswitch
//==============================
org $0003 ; base $9FF3 //0x7C003
Bank30Bankswitch:
LDA #$F0
STA $5115
RTS
//==============================
//Choice Text 8x16 setup
//(fixed position due to
//last bank origin)
//==============================
//0x7C009
JSR Bank30Bankswitch
JSR ChoiceText8x16
RTS
//==============================
//Password text speed setup
//==============================
org $1FD0 ; base $9FC0
TextSpeedPasswordSetup:
STA $2E
JSR {Bank31Bankswitch}
JSR TextSpeedPassword
RTS
//==============================
//8x16 font setup
//==============================
Setup8x16:
JSR {Bank31Bankswitch}
JSR Font8x16
LDA $0469,y
JMP $9322
//==============================
//8x16 scroll fix setup
//==============================
FontScrollFixSetup8x16:
LDA $12
AND #$01
BNE SkipScroll
JSR {Bank31Bankswitch}
JSR FontScrollFix8x16
SkipScroll:
RTS
//==============================
//Password selection codes setup
//==============================
SelectionCodesSetup:
JSR {Bank31Bankswitch}
JSR SelectionCodes
RTS
SelectionCodesJumpOut:
JSR {LastBankRestore}
JMP $8779
//==============================
//Text speed setup
//==============================
TextSpeedSetup:
JSR TextSpeed
RTS
//==============================
//Input code range fix 2 setup
//==============================
InputCodeRangeFix2Setup:
JSR InputCodeRangeFix2
LDA $FF
RTS
//==============================
//Choice Text 8x16 setup
//(fixed position due to
//last bank parent)
//==============================
org $2009 ; base $9FF9 //0x7E009
ChoiceText8x16Setup:
JSR {Bank31Bankswitch}
JSR ChoiceText8x16
RTS
//==============================
//BANK 38 (Extension of bank 31)
//==============================
bank 56
org $0010 ; base $A000 //0xE0000
//==============================
//8x16 font
//There's a bug present in the
//original version (i.e
//immediate choices) that shows
//the dakuten/handakuten line
//before the bottom line scrolls
//down completely, making that
//line merge incorrectly with
//the bottom one for 2 frames
//per line.
//==============================
Font8x16:
LDA $0469,y
CMP #$C0
BCS Exit
CMP #$20
BCC Exit
SEC
SBC #$10
STA $27
LDA #$00
STA $FF
Exit:
JMP {LastBankRestore}
//==============================
//8x16 scroll fix
//==============================
FontScrollFix8x16:
LDY $FF
LDX #$00
loop:
LDA $0557,y
CMP #$C0
BCS LoadEmptyTile
CMP #$20
BCC LoadEmptyTile
SEC
SBC #$10
JMP WriteVramBuffer
LoadEmptyTile:
LDA #$FE
WriteVramBuffer:
STA $04A8,x
INX
INY
CPX #$1C
BNE loop
STY $FF
JMP {LastBankRestore}
//==============================
//Password selection codes B
//==============================
SelectionCodes:
LDA $14
AND #$F0
CMP #$10
BNE ExitSelectionCodes
LDA $14
CMP #$FC
BEQ ExitSelectionCodes
INC $12
INY
LDA $12
CMP #$03
BEQ ExitSelectionCodes
JMP SelectionCodesJumpOut
ExitSelectionCodes:
JMP {LastBankRestore}
//==============================
//Text speed  B
//==============================
TextSpeed:
LDA $046D,y
AND #$0F
LSR
LSR
STA $2E
JMP {LastBankRestore}
//==============================
//Password text 8x16 B
//==============================
PasswordText8x16:
LDA $04A9
CMP #$C0
BCS LoadVeryEmptyTile
CMP #$20
BCC LoadVeryEmptyTile
SEC
SBC #$10
JMP ExitPasswordText8x16
LoadVeryEmptyTile:
LDA #$FE
ExitPasswordText8x16:
STA $04A8
JMP {LastBankRestore}
//==============================
//8x16 Choice text B
//==============================
ChoiceText8x16:
LDA $0469,y
CMP #$C0
BCS SkipSpace
CMP #$20
BCC SkipSpace
///////////////////////////////////
//"Let's debug*" exception handling
//Check star character
CMP #$AE
BNE SkipException
//Check CHR bank
LDA $0450
CMP #$80
BNE SkipException
JMP SkipSpace
SkipException:
///////////////////////////////////
SEC
SBC #$10
JMP Exit8x16ChoiceText
SkipSpace:
LDA #$FE
Exit8x16ChoiceText:
STA $04A8,x
JMP {LastBankRestore}
//==============================
//Unfortunately, 02 is the max
//speed before utter silence
//Text speed password B
//==============================
TextSpeedPassword:
LDA $2E
AND #$0F
LSR
STA $2E
JMP {LastBankRestore}
//==============================
//Input code range fix 2
//==============================
InputCodeRangeFix2:
LDX $16
LDY #$00
LDA $0558,x
CMP #$0C
BNE SkipAddOn
CLC
ADC #$A0
SkipAddOn:
STA $FF
JMP {LastBankRestore}

//==============================
//Ch7: Battle Summary B
//==============================


//;0x5CAA = Controls the enemies that come for you

//Table stored in RAM at $A0C6
t_Level_2_1:
db $02,$02,$08,$02,$00,$01,$05,$00,$01,$02,$FF,$FF,$FF,$FF,$FF,$FF
t_Level_2_2:
db $02,$02,$09,$00,$00,$01,$08,$02,$00,$04,$FF,$FF,$FF,$FF,$FF,$FF
t_Level_2_3:
db $FF,$02,$09,$00,$FF,$01,$05,$00,$01,$00,$FF,$FF,$FF,$FF,$FF,$FF
t_Level_3_1:
db $02,$02,$09,$00,$FF,$01,$08,$02,$00,$01,$FF,$FF,$FF,$FF,$FF,$FF
t_Level_3_2:
db $03,$02,$04,$02,$01,$01,$09,$00,$00,$03,$FF,$FF,$FF,$FF,$FF,$FF
t_Level_3_3:
db $02,$02,$08,$02,$00,$01,$09,$00,$00,$05,$FF,$FF,$FF,$FF,$FF,$FF
t_Level_3_4:
db $FF,$02,$08,$02,$FF,$01,$05,$00,$01,$00,$FF,$FF,$FF,$FF,$FF,$FF

//;    Level 2:
//;        1st enemy: 1 E.P.F., 1 POD, and missles!
//;        2nd enemy: 2 PODs and missiles!
//;        3rd enemy: 1 E.P.F.
//;    Level 3:
//;        1st enemy: 1 POD and missles!
//;        2nd enemy: 1 E.P.F., 1 POD, and an E.Ball!
//;        3rd enemy: 2 PODs and missiles!
//;        4th enemy: 1 E.P.F.

BattleSummary:
tya
cpy {BtleSumSpecControlCode2}
bne ProcessControlCode
lda #$C6
sta $18
lda #$A0
sta $19

lda #$00
sta {BattleSumTxtId}

ldy #$00
ldx #$00

compareLoop:
LDA ($18),y
cmp $5CAC,x	//stores the current enemy you see onscreen
bne failed

iny
inx

cpx #$0a
bne compareLoop

match:
jmp $A16C
failed:
lda {BattleSumTxtId}
asl
asl
asl
asl
tay

ldx #$00
inc {BattleSumTxtId}
clc
bcc compareLoop

done:
ldy #$00
ldx #$00
lda #$4e

ProcessControlCode:
LSR
LSR
LSR
LSR
LSR
AND #$06
TAX
TYA
ASL
ASL
TAY

LDA $8004,x
STA $18
LDA $8005,x
STA $19
LDA ($18),y
STA $13
AND #$C0
LSR
LSR
LSR
LSR
LSR
LSR
TAX
JMP {LastBankRestore}

db "Fan translation team hidden credits:                                   "
db "                                                                       "
db "--Main Team--                                                          "
db "FCandChill: Initial ASM work, utilities, localizer, proofreader, manual"
db "Her-saki: Advanced ASM work, font, initial translation                 "
db "TheMajinkZenki: SNES translation                                       "
db "                                                                       "
db "--Support--                                                            "
db "tashi: Character identification                                        "
db "Matatabi#8541: Onspot translation checks                               "
db "danke#6948: Onspot translation checks, localization feedback           "
db "kartes: Maker of the script dumper tool in RHDN's abandoned section    "
db "Pennywise#4430: Localization feedback                                  "
db "kaio#4229: Localization feedback                                       "
db "HGwells628#6941: Localization feedback                                 "
db "Aerdan#3244: Localization feedback                                     "
db "Kajitani-Eizan#9804: Localization feedback                             "
db "Gideon-BAR-Web#7436: Localization feedback                             "
db "Kadalyn#2959 (YasaSheep): Manual feedback                              "
db "inactive#4484: Was there                                               "
db "mictlantecuhtle, bikerspade: iNES 2.0 request                          "
db "                                                                       "
db "--NES Beta Testers--                                                   "
db "cccmar#6676: Typos, suggestions, onspot translations                   "
db "blueskyrunner#6087: Typos, suggestions                                 "
db "marklincadet#0878: Typos, suggestions                                  "
db "ppltoast#5820: Beta tester                                             "
db "jekuthiel#9153: Real hardware tester                                   "
db "MrNorbert1994#5955: Header fix                                         "
db "Satoshi_Matrix#4487: Suggested a slow speed patch                      "
db "ParadiseAlive#3928: Was there                                          "
db "xWhyohwhyx#4581: Was there                                             "
db "                                                                       "
db "For non-profit                                                         "
