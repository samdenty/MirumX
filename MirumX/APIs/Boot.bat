@echo off%@%
:: Specifies that the boot sequence has just occurred (Usage: Home Screen)
set "fromboot=yes"

:: Enables or disables API.developermode
	if /i "%API.developermode%"=="enable" (set "@=&@echo on"&prompt $$) else (set "@=")
goto :EOF