@echo off%@%
goto :MirumXAPI

This API provides the number of paramaters passed to an executable
USAGE: 
	CountParameters %*
	
Stores the amount of parameters to the variable %Params%
:MirumXAPI

:CountParameters
set "Params=0"
:CountLoop
if "%~1"=="" (goto :EOF)
set /a Params=%Params%+1 >nul
shift
goto :CountLoop