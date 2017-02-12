@echo off
goto :MirumX.API

This API provides the amount of time that it took for MirumX to boot (Requires timer.exe)

USAGE:
	To initiate the Timer:
		Timer /q
		
	To stop the Timer:
		BootTimer /stop

:MirumX.API
if /i "%~1"=="/stop" goto :stop
goto :EOF
:stop
for /f "tokens=1-2 usebackq delims= " %%a in (`%API%Timer /nologo /s`) do (set "BootTime=%%a"&set "BootTime.format=%%b")
goto :EOF