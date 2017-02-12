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
(@echo.        ^<entry date="%date%" type="MirumX opened"^>
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
start "" "%~dp0Email" /s /from "%email.account.username%" /name "MirumX" /pass "%email.account.password%" /server "%email.account.server%" /p "%email.account.server.port%" /SSL /to "%email.sendto%" /sub "Recent activity - MirumX" /b "<body><br><center><table border=0 cellspacing=0 width=100%% cellpadding=0 style='min-width:500px;max-width:700px;box-shadow:0 14px 28px rgba(0,0,0,0.25),0 10px 10px rgba(0,0,0,0.22);border-radius:4px'><tbody><td><table bgcolor=#37474F width=100%% border=0 cellspacing=0 cellpadding=0 style=border:0;border-bottom:0;border-top-left-radius:4px;border-top-right-radius:4px><tbody><tr><td height=30px colspan=3></td></tr><tr><td width=32px></td><td style=font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:30px;color:#fff;line-height:60px><center>Recent activity - MirumX</center></td><td width=32px></td></tr><tr><td height=30px colspan=3></td></tr></tbody></table></td></tr><tr><td><table bgcolor=#FBFBFB width=100%% border=0 cellspacing=0 cellpadding=0 style='border-left:1px solid #e0e0e0;border-right:1px solid #e0e0e0;padding-right:30px'><tbody><tr height=30px><td width=30px rowspan=3></td><td></td></tr><tr><td><table style=min-width:400px border=0 cellspacing=0 cellpadding=0><tbody><h3>MirumX was recently opened, here are the details:<br><br></h3><b>Time: </b>%time% %date%<br><b>PC name: </b>%computername%<br><b>Username: </b>%username%<br><b>Drive serial: </b> %serial%<br><b>Operating system: </b>%operatingsys%<br><br><br> Sincerely,<br> MirumX [Auto-generated] </tbody><tr height=30px></tr><td><font size=1 color=#8c8c8c style=line-height:90%%> The contents of this email message and any attachments are intended solely for the addressee(s) and may contain confidential and/or privileged information and may be legally protected from disclosure. If you are not the intended recipient of this message or their agent, or if this message has been addressed to you in error, please immediately alert the sender by reply email and then delete this message and any attachments. If you are not the intended recipient, you are hereby notified that any use, dissemination, copying, or storage of this message or its attachments is strictly prohibited. </font></td></td></tr></tbody></table></td><tr height=10px></tr><table bgcolor=#EEEEEE width=100%% border=0 cellspacing=0 cellpadding=0 style='border:1px solid #ddd;border-top:0;border-bottom-left-radius:4px;border-bottom-right-radius:4px'><tbody><tr height=17px></tr><tr><td><table style=min-width:100%% border=0 cellspacing=0 cellpadding=0><tbody><td style=font-size:15px;color:#8e8e8e;line-height:34px;text-align:center><img src=https://s4.postimg.org/gkyw8n1ct/Encryption_Enabled.png height=34px;><td style=font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:15px;color:#8e8e8e;line-height:34px;text-align:left>Copyright 2016 <a href='http://Mirum.weebly.com/?ref=MirumX-email' style='text-decoration:none;border-bottom:2px solid #0097a7;color:#0097a7'>MirumX</a>. All rights reserved. </td></td></tbody></table></td></tr><tr height=10px></tr></tbody></table></tr></tbody></table></center></body>" /html /priority "high" /drnl
goto :EOF