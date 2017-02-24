@echo off%@%
goto :MirumXAPI

This API sets a variable to a choosen amount of white space padding
Outputs to %padding%

NOTES:
	To speed up the process, this API checks if the input number is a multiple of 2,3,4,5,6,7,8,9,10. This then speeds up the process by up to 5 times

USAGE:

	Padding length
			  ^ number

Examples:

	Padding 10
		Would result in a variable containing 10 spaces

:MirumXAPI
if not defined DeleteChar (%API%DeleteChar)
set "paddingNum=%~1"
set "padding="
set /a check=(paddingNum/2)*2 >nul
if "%check%"=="%paddingNum%" goto :loop2
set /a check=(paddingNum/3)*3 >nul
if "%check%"=="%paddingNum%" goto :loop3
set /a check=(paddingNum/4)*4 >nul
if "%check%"=="%paddingNum%" goto :loop4
set /a check=(paddingNum/5)*5 >nul
if "%check%"=="%paddingNum%" goto :loop5
set /a check=(paddingNum/6)*6 >nul
if "%check%"=="%paddingNum%" goto :loop6
set /a check=(paddingNum/7)*7 >nul
if "%check%"=="%paddingNum%" goto :loop7
set /a check=(paddingNum/8)*8 >nul
if "%check%"=="%paddingNum%" goto :loop8
set /a check=(paddingNum/9)*9 >nul
if "%check%"=="%paddingNum%" goto :loop9
set /a check=(paddingNum/10)*10 >nul
if "%check%"=="%paddingNum%" goto :loop10

:loop1
set "padding= %padding%"
set /a paddingNum=paddingNum-1 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop1

:loop2
set "padding=  %padding%"
set /a paddingNum=paddingNum-2 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop2

:loop3
set "padding=   %padding%"
set /a paddingNum=paddingNum-3 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop3

:loop4
set "padding=    %padding%"
set /a paddingNum=paddingNum-4 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop4

:loop5
set "padding=     %padding%"
set /a paddingNum=paddingNum-5 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop5

:loop6
set "padding=      %padding%"
set /a paddingNum=paddingNum-6 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop6

:loop7
set "padding=       %padding%"
set /a paddingNum=paddingNum-7 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop7

:loop8
set "padding=        %padding%"
set /a paddingNum=paddingNum-8 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop8

:loop9
set "padding=         %padding%"
set /a paddingNum=paddingNum-9 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop9

:loop10
set "padding=          %padding%"
set /a paddingNum=paddingNum-10 >nul
if "%paddingNum%"=="0" goto :EOF
goto :loop10
:finished