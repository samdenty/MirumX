@echo off%@%
goto :MirumXAPI

This API reads configuration files

USAGE:
	Read settingsfile
			^ location of file to be read

:MirumXAPI

for /F "eol=[ skip=3 delims=" %%A in (%~1) do (set "%%A">nul 2>&1)