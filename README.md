[//]: <> (This readme is in the markdown format. Please preview in a markdown parser.)

# Metal Slader Glory FC: English Translation

## About
This repository contains source code for patches and tools to compile an English translation of Metal Slader for the Famicom.

The translation project was originally managed with older versions of the tools supplied here. Files were everywhere, the script was stored in multiple XML files, the code looked bad, etc. For a release of this translation's source code, I thought using the newer forks would be more suitable. A script viewer coded in JavaScript is in the works, but for this release, I thought a Windows form program was more appropriate.

## Support the Creator
Apparently, a prequel to this game was intended to be released on the 64DD but was cancelled. If you want the series to continue, consider showing your appreciation for it to the game's creator, Yoshimiru. You can do this by buying some Metal Slader Glory merch from his store and giving him a follow on Twitter:

Store: [https://mc-berrys.booth.pm/](https://mc-berrys.booth.pm/)

Twitter: [https://twitter.com/yoshimiru_SS/](https://twitter.com/yoshimiru_SS/)

He sells books detailing the games' development, including the 64DD prequel. You can't find scans of these books anywhere online.

## Folders

* asm
	* Contains the asm files which are to be compiled with xkas
    * There's also asm patch files that are commented out in the Write.bat script.
        * `Seizure.asm`: Reduces the color contrast for scenes with intense flashing. I'm not 100% sure if this patch will prevent seizures.
        * `SlowSpeed.asm`: Reduces the text speed. The mouth speed was never sped back up. Additionally, certain scene's music cues will be off. Consider this incomplete.
        * `Metal_Slader_Palettes-Password_Orange.asm`: This increase the contrast on the password screen's highlighting. In the words of jekuthiel:
            > (Just looked at BETA3 on real hardware + CRT.)
            > 1) Greyscale vertical lines are not a problem on NES via composite.  Colored ones are.  So changing the color of a letter to that red highlight color causes it to look "gappy".  In your defense, this is also a problem in the original Japanese version of the game.  However, because the English alphabet has a lot more vertical lines in it, the effect is magnified.  This may or may not have been the kind of thing that Hal would've caught if they had done the localization themselves.
            > 2) The dark red makes the letter very hard to read against the dark green background.
         	* ***In other words, this patch is a must if you're playing on actual hardware.***
* lua
    * Some lua scripts.
        * Mouth: This was used to debug the asm patch that slows the mouths down after implementing the patch to increase the text speed.
        * Text Id Displayer: Does what the name implies
* roms
	* Use this to store your roms
	* Apply the beat patch named Expand.bps
		* Dumps online commonly have an incorrect header which indicate the game uses a battery backup when it does not. Change 0x6 from $52 to $50 to correct this. The header should be as follows before patching:
		* `4E 45 53 1A 20 40 50 08 00 00 0A 09 00 00 00 00`
* script
	* Contains the dump script in Script.json. It contains the Japanese script and the English translation.
	* You can also store xlsx backups of the script here.
* tables
	* Contains table files
		* Files prefixed with "CHR" specify byte to character mapping.
		* Files prefixed with "Dictionary" specify dictionary mapping. A dictionary can be mapped to multiple character values.
		* Files prefixed with "SquishyText" do some find and replace functions
			* "SquishyText - New.tbl" replaces character patterns to be in one tile. For example, "ll" is converted to the character "[ll]".
			* "SquishyText - Original.tbl" merges the dakuten and handakuten diacritics into the Japanese characters to form a single character. The game is weird about diactrics. For one, the diactrics appear before the character they belong to. Also, dictionaries can contain diactrics that aren't associated with a character in the dictionary itself. This means we can't simply specify "が" in a table file, but apply the conversation after the script has been dumped.
* tools
	* cyproAce
		* A script editor 
	* spiro
		* Script dumper and inserter
	* xkas
		* Applies the assembly patches

## Manual
Check out the repo [metal-slader-glory-fc-en-manual](https://github.com/romh-acking/metal-slader-glory-fc-en-manual) for manual resources. It contains two versions of the manual: one with all the Japanese text blanked out and one that is typesetted.
Much thanks to ozidual from Gaming Alexandria for providing the scans of the manual. Check out the original scans here:
[https://www.gamingalexandria.com/wp/2020/07/metal-slader-glory/](https://www.gamingalexandria.com/wp/2020/07/metal-slader-glory/)

## Instructions
The tools are coded in C#. You'll have to mess with Wine if you want them to run in Linux. You'll also have to rewrite the bat files, which aren't complicated at all.

* If you want to dump the script for whatever reason (the Japanese and English script are already included in this repository), you can dump it by executing the bat file "Dump.bat" by double clicking it.
* To generate an NES rom file with the translation and patches included:
    * Apply the Expand.bps patch to a Japanese rom, rename the result to "Metal Slader Glory (J) (Trans).nes", and place it in the roms folder. (This should probably be handled by xkas...)
    * Execute the bat file "Write.bat" by double clicking it.

## Changelog
* 2021 August 30th: 1.0
    * Initial release

## Credits

### Main Team
* FCandChill
    * Initial ASM work
    * Utilities
    * Localizer
    * Proofreader
    * Manual
* Her-saki
    * Advanced ASM work
    * Font
    * Initial translation

### Support
* kartes
    * Maker of the script dumper tool in RHDN's abandoned section
* tashi
    * Character identification
* Matatabi#8541
    * Onspot translation checks
* danke#6948
    * Onspot translation checks
    * Localization feedback
* Pennywise#4430
    * Localization feedback
* kaio#4229
    * Localization feedback
* HGwells628#6941
    * Localization feedback
* Aerdan#3244
    * Localization feedback
* Kajitani-Eizan#9804
    * Localization feedback
* Gideon|Web#7436
    * Localization feedback
* Kadalyn#2959 (YasaSheep):
    * Manual feedback
* inactive#4484
    * Was there

### Beta Testers
* ccmar#6676
    * Typos
    * Suggestions
    * Onspot translations
* blueskyrunner#6087
    * Typos
    * Suggestions
* marklincadet#0878
    * Typos
    * Suggestions
* ppltoast#5820
    * Suggestions
* jekuthiel#9153
    * Real hardware tester
* MrNorbert1994#5955
    * Header fix
* Satoshi_Matrix#4487
    * Suggestions
* ParadiseAlive#3928
    * Was there
* xWhyohwhyx#4581
    * Was there
