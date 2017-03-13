@echo off%@%
goto :MirumX.source

---------------------------------------------
- Welcome to MirumX, an open-source project -
---------------------------------------------


:MirumX.source
if /i "%API.CrashHelper.status%"=="running" (goto :MirumX.core)
:::::::::::    MirumX bootloader MUST REMAIN STABLE!!    :::::::::
		::::::::::::::::::::::::-DEBUGGER-::::::::::::::::::::::::
			::call MirumX\APIs\Debug minimal
			::call MirumX\APIs\Debug normal
			::call MirumX\APIs\Debug complete
		::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		MirumX\APIs\Timer /q
		set "path=%path%;%~dp0MirumX\APIs"
		set "API=call API.bat "
		call :SelfCheck
		pushd "%~dp0MirumX\"
		set "MirumX_file=%~nx0"&set "MirumX=%~f0"&set "MirumX_ext=%~x0"&set "MirumX_folder=%~dp0"&set "MirumX_dir=%~dp0MirumX\"&set "MirumX_switches=%*"
		%API%CrashHelper
		:MirumX.core

:boot.sequence
:: Import the configuration into memory
	for /F "eol=[ delims=" %%A in (main.settings) do set "%%A">nul 2>&1
:: Loading Screen
	mode con: cols=%loading.width% lines=%loading.height%
	if /i "%window.pos%"=="enable" (%API%Window Gpos %window.pos.x% %window.pos.y%)
	color %loading.color%
	title %loading.title% %window.title.suffix%
	%echo%^
	€ﬂﬂﬂﬂﬂﬂﬂﬂﬂ€          ^
	€ Loading €ﬂﬂﬂﬂ€ﬂ€ﬂ€ﬂ^
	€‹‹‹‹‹‹‹‹‹€    ﬂ ﬂ ﬂ
%API%Boot
%API%HiddenProcess "%API%Log"
if /i not "%API.Timer%"=="disable" (%API%BootTimer /stop)
if /i not "%API.Cleanup%"=="disable" (%API%HiddenProcess "%API%Cleanup")
goto :Home

:: Screens
	:Home
	if "%fromboot%"=="yes" (%API%Header "Home [%BootTime% %BootTime.format%]" Home) else (%API%Header "Home" Home)
	set "fromboot=no"
	dir /b /ad "Data\Profiles\*"|>nul findstr "^" && (if defined Auth_U (set AdvAuthMsg=out) else (set AdvAuthMsg=in)) || (set AdvAuthMsg=up)
	%API%List "Sign %AdvAuthMsg%" "%API%AdvAuth auto" Apps "%API%AppEngine" Crash "|" Exit "%terminate%"
	%API%Back "goto :Home"
	%ListCommand%
	goto :home

:: Priority scripts to be run independently from MirumX main directory
	:SelfCheck
	if not exist "MirumX\" goto :downloadMirumX
	if not exist "MirumX\main.settings" (set "ErrorReason=Main configuration file is missing (MirumX\main.settings)"&set "ErrorReason.minimal=Settings corrupt"&goto :SelfCheck.Error)
	if not exist "MirumX\APIs" (set "ErrorReason=MirumX code library is missing (MirumX\APIs)"&set "ErrorReason.minimal=MirumX APIs missing"&goto :SelfCheck.Error)
	goto :EOF

:SelfCheck.Error
cls
mode con: cols=100 lines=30
color 0b
title %ErrorReason.minimal% - MirumX
echo ^
€€€€€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€€€€€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ^
˛ ˛ ˛   MirumX   ˛ ˛ ˛          %ErrorReason.minimal% &echo ^
€€€€€‹‹‹‹‹‹‹‹‹‹‹‹€€€€€‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹ &rem Don't remove extra white space at the end
echo test
pause
goto :EOF


:downloadMirumX
cls
mode con: cols=100 lines=30
color 0b
title Welcome to MirumX
echo ^
€€€€€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€€€€€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ^
˛ ˛ ˛   MirumX   ˛ ˛ ˛          Welcome to MirumX &echo ^
€€€€€‹‹‹‹‹‹‹‹‹‹‹‹€€€€€‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹ &rem Don't remove extra white space at the end
echo                            Welcome to MirumX, downloading required files...
pause
goto :EOF


	:exit
	exit 200