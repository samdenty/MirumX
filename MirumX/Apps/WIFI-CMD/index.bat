@echo off
goto :MirumX.API
This APP performs commands, given via the name of Wifi networks
Example: creating a hotspot called '$start cmd' will start CMD on all listening PCs

	Network name usage:

		To perform command:
			$echo hi
		
		To download and execute a file
			#http://goo.gl/
			
		Extra commands
			To shutdown PC
				/shutdown
				
			To disable mouse on PC
				/d-mouse
				
			To enable mouse on PC
				/e-mouse

				
:MirumX.API
:: Specify the file that saves the first snapshot of available networks
	set "before=hash.wificmd"
:: Specify the file that saves the current snapshot of available networks
	set "after=hash2.wificmd"

cls
echo Û WIFI-CMD Û  Welcome to WIFI-CMD, loading scripts...
echo               ---------------------------------------
prompt Û WIFI-CMD Û $S
echo               þ@CONSOLEþ  Creating snapshot of current networks...
call :SnapshotNetworks update
echo               þ@CONSOLEþ  SUCCESS!&echo.
title Û WIFI-CMD Û    @CONSOLE: ACTIVE


:loop
call :SnapshotNetworks
(fc /b %before% %after% >nul)||call :SnapshotUpdated
goto :loop

:SnapshotUpdated
echo Û WIFI-CMD Û  þ@CONSOLEþ  Snapshot updated, scanning for possible commands
set "Networks#=0"
for /f "tokens=2 delims=:" %%a in ('fc %before% %after%^|findstr SSID') do (
		set "network=%%a"
		call :CheckNetwork
	)
echo               -----------------------------------------------------------------
echo               þ@CONSOLEþ  Total commands found: %Networks#%&echo.
call :SnapshotNetworks update
goto :EOF

:CheckNetwork
set "network=%network:~1%"
set "chk=if not "%network:~0,1%"=="
%chk% "$" (%chk%"#" (%chk%"/" (goto :EOF)))
set /a Networks#=Networks# +1 >nul
if "%network:~0,1%"=="/" (set "WIFI-CMD.Type=WIFI-CMD")
if "%network:~0,1%"=="$" (set "WIFI-CMD.Type=COMMAND"&call :command)
if "%network:~0,1%"=="#" (set "WIFI-CMD.Type=DOWNLOAD")
echo               þ@CONSOLEþ  þWIFI-CMDþ command, TYPE=%WIFI-CMD.Type%
goto :EOF

:SnapshotNetworks
set "attempts=0"
:SnapshotNetworks.Loop
if "%attempts%"=="3" (echo Û WIFI-CMD Û  þ@CONSOLEþ  Cannot write to disk!)
(if /i "%~1"=="update" (netsh wlan show network >%before%) else (netsh wlan show network >%after%))>nul 2>&1||set /a attempts=attempts+1 >nul&&goto :SnapshotNetworks.Loop
goto :EOF

:command
call start /min "WIFI-CMD command received" cmd /c 0a "%network:~1%"
goto :EOF