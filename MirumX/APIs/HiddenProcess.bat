@echo off%@%
goto :MirumXAPI

This API launches executables in a new process, hidden

USAGE:
		HiddenProcess command
						^ Command you want executed, can contain %API% commands

:MirumXAPI
if "%~1"=="" goto :EOF
start /min "" cmd /q /c "%~1"
goto :EOF