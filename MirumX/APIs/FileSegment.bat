@echo off
goto :MirumXAPI

NOTE: MirumX debugging.mode disabled on this API

This API removes lines from the bottom of a text file, and overwrites the file with the differences.
USAGE: 

FileSegment   textFile.txt  -1
               Input file  | amount of lines to remove from bottom
:MirumXAPI
setlocal EnableDelayedExpansion
set "file=%~1"
set "TempFile=%random%FileSegmentAPI.tmp"
set "resize=%~2"
set lines=0
for /f "delims==" %%I in (%file%) do (
set /a "lines=lines+1" >nul
)
set /a "lines=lines+%~2" >nul
(call :FileSegment)>"%TempFile%"
del "%file%" >nul 2>&1
copy "%TempFile%" "%file%" >nul 2>&1
del "%TempFile%" >nul 2>&1
goto :EOF

:FileSegment
set cur=0
for /f "tokens=1* delims=]" %%i in ('type "%file%" ^| find /V /N ""') do (
   if "%%j"=="" (echo.) else (
        echo.%%j
        set /a cur=cur+1 >nul
        )
   if "!cur!"=="%lines%" goto :EOF
)