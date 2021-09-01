::Roms
set baseImage=roms\Metal Slader Glory (J) (Trans).nes
set newImage=roms\Metal Slader Glory (NEW).nes

::Folders
set projectFolder=%cd%
set SpiroFolder=%cd%\tools\spiro
set XkasFolder=%cd%\tools\xkas

cd "%projectFolder%"

copy "%baseImage%" "%newImage%"

::Write script
"%SpiroFolder%\Spiro.exe" /PathToCyproFolder "%projectFolder%" /Write

::Apply Patches
"%XkasFolder%\xkas.exe" -o "%newImage%" "asm\Metal_Slader.asm"
"%XkasFolder%\xkas.exe" -o "%newImage%" "asm\Metal_Slader_Palettes.asm"
"%XkasFolder%\xkas.exe" -o "%newImage%" "asm\Metal_Slader_Font.asm"
::"%XkasFolder%\xkas+.exe" -o "%newImage%" "asm\Seizure.asm"
::"%XkasFolder%\xkas+.exe" -o "%newImage%" "asm\SlowSpeed.asm"
::"%XkasFolder%\xkas+.exe" -o "%newImage%" "asm\Metal_Slader_Palettes-Password_Orange.asm"

"%newImage%"

::@pause
