@echo off
color 07
if "%MirumX_folder%" == "" set "MirumX_folder=%cd%"
set "cmd++=goto cmdCommand"
set "echo=<nul set /p ="
cls
:cmd
title terminal.sds
%echo% MirumX &call :color 0a "Terminal Mode"&%echo% . [&call :color 0f "Version 1.4.1000"&%echo% ]&echo.
echo MirumCode¸ 2017, All Rights Reserved.
:cmdCommand
echo.
:cmdCommand2
if "%cd:~-1%"=="\" (set "Directory=%cd%") else (set "Directory=%cd%\")
set "cmdCommand="
%echo% %directory%&call :color 0d "$Terminal"&set /p "cmdCommand=>"
if not defined CmdCommand (goto :CmdCommand2)
set "CMDCmd=%cmdCommand:"=%"
if /i "%CMDCmd:~0,5%" == "%%API%%" %API%%CMDCmd:~5%&goto :cmdcommand
if /i "%CMDCmd%" == "cmd" goto :cmd
if /i "%CMDCmd%" == "wincmd" cmd&goto :cmdCommand
if /i "%CMDCmd%" == "clear" cls&goto :cmdCommand
if /i "%CMDCmd%" == "back" goto :EOF
if /i "%CMDCmd%" == "help" call :help&goto :cmdCommand
if /i "%CMDCmd%" == "sds" goto :EOF
if /i "%CMDCmd%" == "sd-security" goto :EOF
if /i "%CMDCmd%" == "clscon" goto :clscon
if /i "%CMDCmd%" == "exit" goto :EOF
call :color 0b "CMD OUTPUT("&echo.&%cmdCommand%
goto :cmdCommand
:help
%echo% SD-Security &call :color 0a "Terminal Mode"&%echo% . Built-in help page:&echo.&echo.
echo SD-Terminal overrides some of the default commands (eg. cmd, help, exit etc.)
echo to perform a overriden command, prefix it with a space eg. 'exit' = ' exit'
echo.
echo SD-Terminal uses multiple colors, to provide an easy to read format. To disable
echo the multiple colors API, simply 'set disableColor=yes'.
goto :EOF
:clscon
color 07
mode con: cols=%window.width% lines=%window.height%
cls&goto :cmd
:Color
if /i "%disableColor%" == "yes" %echo% %~2&goto :EOF
if not exist "C:\windows\system32\findstr.exe" %echo% %~2&goto :EOF
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & for %%b in (1) do rem"') do (set "DEL=%%a")
pushd %temp%
<nul set /p ".=%DEL%" > "%~2"
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