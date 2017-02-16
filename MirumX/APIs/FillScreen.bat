@echo off%@%
goto :MirumXAPI

This API fills the width of the screen with a specified character
USAGE:

	FillScreen character
				^ single character to fill the screen / "repeat" - repeats the echo from variable

:MirumXAPI
if /i "%~1"=="repeat" goto :printFinal
set "character=%~1"
set "printChar="
set "loop=0"
%API%Resize get

:PrintCharacter
set "printChar=%printChar%%character%"
set /a "loop=loop+1" >nul
if "%loop%"=="%width%" goto :printFinal
goto :PrintCharacter

:printFinal
if "%printChar%"=="" goto :EOF
<nul set /p =%printChar%
goto :EOF