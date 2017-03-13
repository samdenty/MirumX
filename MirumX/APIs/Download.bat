@echo off%@%
goto :MirumXAPI

This API downloads files from the internet

USAGE:

	Download url file

:MirumXAPI
(if exist "%~2" (del "%~2"))>nul 2>&1
"%~dp0aria2" "%~1" -o "%~2" --download-result=hide --console-log-level=error --enable-color=false&echo.