@echo off%@%
goto :MirumXAPI

This API allows easier debugging of MirumX
:MirumXAPI
set "echo=<nul set /p ="
:: Below runs before the API has executed

if "%debug%"=="on" (
	:: Set the window size big enough to read text
	mode|findstr 9988>nul||mode con: cols=9988 lines=9988
	if "%helpDebug%"=="on" (
		%echo% [API: Press any key to load '%~1'] &pause >nul
	) else (
		%echo% [API: Loading '%~1']
	)
)

call APIs\%*

:: Below runs after the API has been successfully executed
if "%debug%"=="on" (
	:: Set the window size big enough to read text
	mode|findstr 9988>nul||mode con: cols=9988 lines=9988
	if "%helpDebug%"=="on" (
		%echo% [API: Unloaded '%~1' successfully, press any key] &pause >nul
	) else (
		%echo% [API: Unloaded '%~1' successfully]
	)
)