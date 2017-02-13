@echo off%@%
goto :MirumXAPI

This API  loads, installs and uninstalls MirumX apps

USAGE:

	AppEngine   param    appname
			     ^ Load / install / uninstall
			     			^ App to perform action on
:MirumXAPI
if /i "%~1"=="load" (if not "%~2"=="" (call :Load "%~2") else (goto :LoadList))
if /i "%~1"=="install" (goto :installApp)
if /i "%~1"=="uninstall" (goto :uninstallApp)
%API%Header "AppEngine"
%API%List "Load App" "call :LoadList" "Install App" "call :installApp" "Uninstall App" "call :uninstallApp"
%ListCommand%
goto :MirumXAPI

:LoadList
	set listAPI.apps=
	set AppEngine.apps=
	%API%Header "Load App"
	for /f %%a in ('dir /O:-D /B /A:D %MirumX_dir%Apps^|findstr /V /I ".disabled"') do (if exist "%MirumX_dir%Apps\%%a\index.bat" (set "AppEngine.apps=installed"&call :record "%%a"))
	if "%AppEngine.apps%"=="installed" (%API%List %listAPI.apps%) else (goto :Load.noneInstalled)
	%ListCommand%
goto :EOF

:record
	set listAPI.apps=%listAPI.apps% "%~1" "call :Load %~1"
goto :EOF

:Load
	if not exist "%MirumX_dir%Apps\%~1\index.bat" goto :Load.missing
	pushd "%MirumX_dir%Apps\%~1"
	call index.bat
	popd
goto :EOF

:Load.missing
%API%Header "App not found"
echo The app you requested was not found, press any key to continue
pause >nul
goto :EOF

:Load.noneInstalled
%API%Header "No apps installed"
echo You don't have any apps installed, press any key to continue
echo.
echo ERROR:
echo Search directory  = %MirumX_dir%Apps
echo Current directory = %CD%
echo The directory /MirumX/Apps/ is empty or your apps are disabled.
echo     Could not find /MirumX/Apps/*/index.bat
pause >nul
goto :EOF

:installApp
:uninstallApp