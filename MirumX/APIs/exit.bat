@echo off
if "%exit.window.title%"=="" set "exit.window.title=Exit"
if "%exit.window.height%"=="" set "exit.window.height=14"
if "%exit.window.width%"=="" set "exit.window.width=45"
if "%exit.window.color%"=="" set "exit.window.color=f0"
if "%exit.window.color.ASCII%"=="" set "exit.window.color.ASCII=fd"
if "%exit.window.color.copyrighttext%"=="" set "exit.window.color.copyrighttext=f8"
if "%exit.window.color.linktext%"=="" set "exit.window.color.linktext=f9"

color %exit.window.color%
title %exit.window.title% %window.title.suffix%
mode con: cols=%exit.window.width% lines=%exit.window.height%
call DeleteChar
set "normal=&%API%clr {f0}&<nul set /p =.%DeleteChar%"
set "copyright=&%API%clr {%exit.window.color.copyrighttext%}&<nul set /p ="
set "link=&%API%clr {%exit.window.color.linktext%}&<nul set /p ="
set "ASCII=&%API%clr {%exit.window.color.ASCII%}&<nul set /p ="
<nul set /p = ^
ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ^
Û %ASCII%ÉÍÍÍÍÍÍ»  ÉÍÍÍ»ÉÍÍÍ»  ÉÍÍÍÍÍ»  ÉÍÍÍÍÍÍÍÍ»%normal% Û^
Û %ASCII%º²²²ÉÍÍ¼  È»²²È¼²²É¼  È»²²²É¼  º²É»²²É»²º%normal% Û^
Û %ASCII%º²²²ÈÍÍ»   È»²²²²É¼    º²²²º   ÈÍ¼º²²ºÈÍ¼%normal% Û^
Û %ASCII%º²²²ÉÍÍ¼   É¼²²²²È»    º²²²º      º²²º   %normal% Û^
Û %ASCII%º²²²ÈÍÍ»  É¼²²É»²²È»  É¼²²²È»     º²²º   %normal% Û^
Û %ASCII%ÈÍÍÍÍÍÍ¼  ÈÍÍÍ¼ÈÍÍÍ¼  ÈÍÍÍÍÍ¼     ÈÍÍ¼   %normal% Û^
ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ^
Û    %copyright%MirumX was designed by Samuel Denty,%normal%   Û^
Û              %copyright%¸2016 MirumCode.%normal%             Û^
Û                                           Û^
ßßßÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛßßß^
   Û    %link%http://Mirum.weebly.com/MirumX&%API%clr {f0}%normal%   Û   ^
   ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
pause >nul
