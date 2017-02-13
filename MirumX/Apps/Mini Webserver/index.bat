@echo off%@%
goto :MirumXAPI

This app hosts a webserver

:MirumXAPI
%API%Header Mini Webserver
echo Specify a port to use (8080, 80):
%API%Input port "þ " "Host webserver on what port?"
explorer "Mini Webserver"
echo Press CTRL-C to stop Webserver
webserver "Mini Webserver" "%port%"