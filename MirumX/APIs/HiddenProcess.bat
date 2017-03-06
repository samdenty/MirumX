@echo off%@%
goto :MirumXAPI

This API launches executables in a new process, hidden

:MirumXAPI
if "%~1"=="" goto :EOF
if "%~1"=="lAuNcHmE129" goto :LaunchMe
setlocal
set Identifier=%random%[%random%]
start /min "" cmd /q /c "call "%~f0" lAuNcHmE129 "%~1""
:: %API%HideWindow %Identifier%
endlocal
goto :EOF


:LaunchMe
%~2
pause