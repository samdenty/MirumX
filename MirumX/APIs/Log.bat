@echo off%@%
goto :MirumXAPI

This API provides logging support for MirumX. It supports XML logs, and email reporting.
USAGE: 
		Log
:MirumXAPI
if not exist "APIs" pushd ..
if /i "%log.disk%"=="disable" (if /i "%log.email%"=="disable" (goto :EOF))

call "%~dp0\SysInfo"
if /i not "%log.disk%"=="disable" (call :disk)
if /i not "%log.email%"=="disable" (call :email)
goto :EOF

:genLog
(echo ^<?xml version="1.0" encoding="UTF-8" standalone="no"?^>
echo.    ^<MirumX^>)> "Data\MirumX_log.xml"
goto :SkipRewrite

:Disk
if not exist "Data\" md Data
if not exist "Data\MirumX_log.xml" (goto:genLog)
call "%~dp0\FileSegment" Data\MirumX_log.xml -1
:SkipRewrite
(@echo.        ^<entry date="%date%"^>
@echo.             ^<time^>%time%^</time^>
@echo.             ^<date^>%date%^</date^>
@echo.             ^<computername^>%computername%^</computername^>
@echo.             ^<username^>%username%^</username^>
@echo.             ^<operatingsys^>%operatingsys%^</operatingsys^>
@echo.             ^<serial^>%serial%^</serial^>
@echo.        ^</entry^>
@echo.    ^</MirumX^>)>> "Data\MirumX_log.xml"
goto :EOF

:Email
echo ^
"%~dp0Email" 
/s 
/HTML=true 
/from "%email.account.username%" 
/pass "%email.account.password%" 
/server "%email.account.server%" 
/p "%email.account.server.port%" 
/SSL /to "%email.sendto%" 
/sub "MirumX Log" 
/b "<font color=#000>Hi, this is an automated Email from MirumX.<font color='#393939'> MirumX was recently accessed at %time% on %date%.<br><br><b>Additional info:</b><br>PC Name          : %computername%<br>PC Username      : %username%<br>Drive serial     : %serial%<br>Operating system : %operatingsys%">D:\t.txt
pause
goto :EOF