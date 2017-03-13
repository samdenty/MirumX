@echo off
color 07
if "%MirumX_folder%" == "" set "MirumX_folder=%cd%"
set "cmd++=goto cmdCommand"
set "echo=<nul set /p ="
cls
:cmd
title MirumX TERMINAL
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set DeleteChar=%%A
if not defined DeleteChar (call :noDeleteChar&goto :cmdCommand)
echo ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
%echo% Û &call :color 0f "MirumX" &call :color 0e " Terminal Mode"&call :color 0a " [Version 1.6.1.100]"&%echo% .%DeleteChar% Û&echo.
echo ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ&echo.
call :color 0f "  MirumCode¸"&call :color 07 " 2017, All Rights Reserved."&echo.
call :color 08 "       Welcome to MirumX TERMINAL type"&call :color 07 " 'help'"&call :color 08 " for help"&echo.
:cmdCommand
echo.
:cmdCommand2
if "%cd:~-1%"=="\" (set "Directory=%cd%") else (set "Directory=%cd%\")
set "cmdCommand="
%echo% %directory%&call :color 0d "$"&set /p "cmdCommand=>"
if not defined CmdCommand (goto :CmdCommand2)
set "CMDCmd=%cmdCommand:"=%"
set "case=if /i "%CMDCmd%" =="
%case% "cmd" 			goto :cmd
%case% "wincmd" 		cmd&goto :cmdCommand
%case% "clear" 			cls&goto :cmdCommand
%case% "back"	 		goto :EOF
%case% "0" 				goto :EOF
%case% "help" 			goto :help
%case% "clscon" 		goto :clscon
%case% "exit" 			goto :EOF
if /i "%CMDCmd:~0,5%" == "%%API%%" (goto :API)
call :color 0b "CMD OUTPUT("&echo.&%cmdCommand%
goto :cmdCommand
:API
%API%%CMDCmd:~5%
goto :cmdcommand
:help
echo To load a MirumX API, simply use %%API%%. For example:
echo.
echo     %%API%%Beep
echo     %%API%%Header "hello world"
echo     %%API%%Fillscreen @
goto :cmdCommand
:clscon
color 07
mode con: cols=%window.width% lines=%window.height%
cls&goto :cmd
:Color
if /i "%disableColor%" == "yes" %echo% %~2&goto :EOF
if not exist "C:\windows\system32\findstr.exe" %echo% %~2&goto :EOF
pushd %temp%
<nul set /p ".=%DeleteChar%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
popd
goto :EOF
:AskString
set "StringName=%*"
set "StringName=%StringName:"=%"
set /p %StringName%
for /f "tokens=1" %%a in ('echo %StringName%') do set "StringName=%%a"&goto AskStringNext
:end