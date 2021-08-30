::Folders
set projectFolder=%cd%
set SpiroFolder=%cd%\tools\spiro

cd "%projectFolder%"

::Dump script
"%SpiroFolder%\Spiro.exe" /PathToCyproFolder "%projectFolder%" /DumpScript
@pause