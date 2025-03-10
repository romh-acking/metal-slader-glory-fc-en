arch nes.cpu

//jekuthiel:
//(Just looked at BETA3 on real hardware + CRT.)
//1) Greyscale vertical lines are not a problem on NES via composite.  Colored ones are.  So changing the color of a letter to that red highlight color causes it to look "gappy".  In your defense, this is also a problem in the original Japanese version of the game.  However, because the English alphabet has a lot more vertical lines in it, the effect is magnified.  This may or may not have been the kind of thing that Hal would've caught if they had done the localization themselves.
//2) The dark red makes the letter very hard to read against the dark green background.

banksize $4000
bank 20
//Password select highlighting (higher contrast)
//0x52EBD
org $2EBD
db $10
