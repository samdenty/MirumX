@echo off
goto :MirumX.source

---------------------------------------------
- Welcome to MirumX, an open-source project -
---------------------------------------------


:MirumX.source
if /i "%API.CrashHelper.status%"=="running" (goto :MirumX.core)
:: CrashHelper API priority commands	
		set "API=call APIs\"
		call :SelfCheck
		pushd MirumX\
		set "MirumX_file=%~nx0"&set "MirumX=%~0"&set "MirumX_ext=%~x0"&set "MirumX_folder=%~dp0"&set "MirumX_switches=%*"
		APIs\CrashHelper
		:MirumX.core
		%API%Timer /q

:boot.sequence
:: Import the configuration into memory
	for /F "eol=[ delims=" %%A in (main.settings) do set "%%A">nul 2>&1

:: Loading Screen
	mode con: cols=%loading.width% lines=%loading.height%
	color %loading.color%
	title %loading.title% %window.title.suffix%
%echo%^
€ﬂﬂﬂﬂﬂﬂﬂﬂﬂ€          ^
€ Loading €ﬂﬂﬂﬂ€ﬂ€ﬂ€ﬂ^
€‹‹‹‹‹‹‹‹‹€    ﬂ ﬂ ﬂ

%API%Boot
%API%Log
if /i not "%API.Timer%"=="disable" (%API%BootTimer /stop)
if /i not "%API.Cleanup%"=="disable" (%API%Cleanup)
goto :Home


:Home
%API%Header "Home"
echo %BootTime% %BootTime.format%
%API%List "Sign in" "%API%AdvAuth login" exit "%terminate%"
%ListCommand%
%terminate%

:goto
if "%~2"=="" (if "%back.window%"=="" (set "back.window=:Home")) else (set "back.window=%~2")
if "%~1"=="" (goto :Home) else (goto %~1)

:back
if "%back.window%"=="" (goto :Home) else (goto %back.window%)

:SelfCheck
if not exist "MirumX\" (set "ErrorReason=MirumX folder is missing! (MirumX\)"&goto :SelfCheck.Error)
if not exist "MirumX\main.settings" (set "ErrorReason=Main configuration file is missing (MirumX\main.settings)"&goto :SelfCheck.Error)
if not exist "MirumX\APIs" (set "ErrorReason=MirumX code library is missing (MirumX\APIs)"&goto :SelfCheck.Error)
goto :EOF

:SelfCheck.Error
echo Cannot Initiate MirumX! Reason: %ErrorReason%. Put code here to continue anyway
pause 
goto :eof

:exit
exit 200