@echo off%@%
goto :MirumXAPI

This API waits a specified amount time, variable to the speed of the PC's core
USAGE: 

Wait 100
     ^This number performs 100 loops, and then terminates
:MirumXAPI
:wait
set waitNum=0
set waitFor=%1
if "%waitfor%"=="0" set waitfor=1
:waitLoop
set /a "waitnum=%waitnum%" +1 >nul
if "%waitnum%"=="%waitFor%" goto :EOF
goto waitLoop