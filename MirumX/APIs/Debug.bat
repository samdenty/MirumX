@echo off%@%
goto :MirumXAPI

This API enables the debugging features of MirumX

USAGE:

	Debug type
			^ normal [default] | minimal | complete

:MirumXAPI
if /i "%~1"=="minimal" goto :minimal
if /i "%~1"=="complete" goto :complete
set "debug=on"
set "helpDebug=on"
set "@="
goto :EOF

:minimal
set "debug=on"
set "helpDebug=off"
set "@="
goto :EOF

:complete
set "debug=on"
set "helpDebug=off"
set "@=&prompt лл &echo on"
goto :EOF