::Folders
set projectFolder=%cd%
set spiroFolder=%cd%\tools\spiro

cd "%projectFolder%"

::Dump script
"%spiroFolder%\Spiro.exe" /ProjectDirectory "%projectFolder%" /DumpScript /Verbose
@pause
