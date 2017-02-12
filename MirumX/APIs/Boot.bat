@echo off%@%
:: Enables or disables API.developermode
	if /i "%API.developermode%"=="enable" (set "@=&@echo on"&prompt $$) else (set "@=")
goto :EOF