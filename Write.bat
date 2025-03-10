::Roms
set baseImage=roms\Metal Slader Glory (J) (Trans).nes
set newImage=roms\Metal Slader Glory (NEW).nes

::Folders
set projectFolder=%cd%
set spiroFolder=%cd%\tools\spiro
set XkasFolder=%cd%\tools\xkas

cd "%projectFolder%"

copy "%baseImage%" "%newImage%"

::Write script
"%SpiroFolder%\Spiro.exe" /ProjectDirectory "%projectFolder%" /Write /Verbose

::Apply Patches
"%XkasFolder%\xkas.exe" -o "%newImage%" "asm\main.asm"
"%XkasFolder%\xkas.exe" -o "%newImage%" "asm\palettes.asm"
"%XkasFolder%\xkas.exe" -o "%newImage%" "asm\font.asm"
::"%XkasFolder%\xkas.exe" -o "%newImage%" "asm\seizure.asm"
::"%XkasFolder%\xkas.exe" -o "%newImage%" "asm\palettes - password orange.asm"

"%newImage%"

::@pause
