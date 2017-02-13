@echo off%@%
goto :MirumXAPI

This app hosts a webserver

:MirumXAPI
%API%Header Mini Webserver
echo Specify a port to use (8080, 80):
%API%Input port "þ " "Host webserver on what port?"
if "%port%"=="" set port=80
call start "Mini-Webserver" cmd /c "mode con: cols=50 lines=7&color 0a&cls&echo.&echo   Mini-Webserver is running on port %port%&echo  Close this window the stop the server&echo.&echo          http://127.0.0.1:%port%&webserver "Mini Webserver" "%port%""
timeout 2 >nul
explorer "Mini Webserver"
start http://127.0.0.1:%port%