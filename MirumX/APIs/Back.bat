@echo off%@%
goto :MirumXAPI

This API checks whether a back command was sent via "%API%List" and performs a command if it was

USAGE:
			Back command
					^ command to be performed when back requested

:MirumXAPI

if "%ListCommand%"=="goto :EOF" (set "ListCommand=%~1")