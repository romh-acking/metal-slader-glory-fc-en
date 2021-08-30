arch nes.cpu

//===========================
//Title screen palette
//===========================
banksize $4000
bank 05
//Credits 1
//0x17597
org $3597
db $0C, $30, $30
//Title screen
//0x1759A
org $359A
db $05
//0x175A0
org $35A0
db $0B, $30, $30

//===========================
//"Sweet dreams" palette
//===========================
banksize $4000
bank 12
//0x31FF8
org $1FF8
db $30, $00, $0F //Catty
db $30, $04, $0F
db $30, $01, $0F
db $30, $39, $0F
//===========================
//Password screen palette fix
//===========================
banksize $4000
bank 15
//0x3C003
org $0003
db $0F, $31

//===========================
//Death screen
//===========================
banksize $4000
bank 19
//0x4CC4E
org $0C4E
db $30, $0F, $00

//===========================
//Ending palettes
//===========================
banksize $4000
bank 20
//0x5287B
org $287B
db $30, $04, $0F
db $30, $01, $0F
db $30, $18, $0F
//=================================
//Password table sprite palette fix
//=================================
//0x52EBD
org $2EBD
//db $36, $26, $0B
//===========================
//??? fix
//===========================
banksize $4000
bank 31
//0x7F2A7
org $32A7
db $25, $0F, $00
//===========================
//??? fix
//===========================
banksize $4000
bank 31
//0x7F286
org $3286
db $31, $0F, $00
db $39, $0F, $00
//===========================
//??? fix
//===========================
banksize $4000
bank 20
//0x525F6
org $25F6
db $31, $0F, $00
db $39, $0F, $00

//=======================
//Dialogue palettes (Day mode)
//=======================
banksize $4000
bank 31
//0x7F22F
org $322F
//Elina
db $34, $0F, $00
//Tadashi
db $31, $0F, $00
//Azusa
db $39, $0F, $00
//=======================
//Dialogue palettes (Night mode)
//=======================
//0x7F244
org $3244
//Catty - Enkai
db $30, $0C, $0F
//Elina
db $30, $04, $0F
//Tadashi
db $30, $01, $0F
//Azusa
db $30, $18, $0F
//============================
//Dialogue palettes (Labyrinth mode)
//============================
//0x7F25C
org $325C
//Catty - Enkai
db $37, $07, $0F
//Elina
db $35, $05, $0F
//Tadashi
db $36, $06, $0F
//Azusa
db $37, $07, $0F
//============================
//Choice palettes (Day mode)
//============================
//0x7F2A4
org $32A4
//Unselected front
db $30, $0F, $00
//Selected front
db $25, $0F, $00
//Unselected back
db $10, $0F, $00
//Selected back
db $34, $0F, $00
//============================
//Choice palettes (Night mode)
//============================
//0x7F2BC
org $32BC
//Unselected front
db $30, $05, $0F
//Selected front
db $35, $05, $0F
//Unselected back
db $30, $05, $0F
//Selected back
db $35, $05, $0F
//============================
//Choice palettes (Red mode)
//============================
//0x7F2D4
org $32D4
//Unselected front
db $30, $07, $0F
//Selected front
db $35, $05, $0F
//Unselected back
db $30, $07, $0F
//Selected back
db $36, $06, $0F
//=================================
//Immediate choice palette fix (Day mode)
//=================================
//0x7F22D
org $322D
db $0F                       //Will load black instead of white (in $041A)
//=================================
//Immediate choice palette fix (Night mode)
//=================================
//0x7CF3F
org $0F3F
LDA $041A                     //Will load blue instead of white