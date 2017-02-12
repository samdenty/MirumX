@echo off%@%
goto :MirumXAPI

This API gets the Drive serial, and the specified Windows version

Returns variables:
%version%      : The Windows version number, eg. 6.1
%operatingsys% : The Windows version in words, eg. Windows 7
%serial%       : The drive serial, eg. 912A-9D10

:MirumXAPI
for /f "skip=1 delims=" %%a in ('vol') do set serial=%%a
set serial=%serial:~-9,9%
for /f "tokens=4-5 delims=. " %%i in ('ver') do set version=%%i.%%j
if "%version%"=="10.0" set operatingsys=Windows 10&goto :EOF
if "%version%"=="6.4" set operatingsys=Windows 10 Preview&goto :EOF
if "%version%"=="6.3" set operatingsys=Windows 8&goto :EOF
if "%version%"=="6.1" set operatingsys=Windows 7&goto :EOF
if "%version%"=="6.0" set operatingsys=Windows Vista&goto :EOF
if "%version%"=="5.2" set operatingsys=Windows Server 2003&goto :EOF
if "%version%"=="5.1" set operatingsys=Windows XP&goto :EOF
if "%version%"=="5.00" set operatingsys=Windows 2000&goto :EOF
if "%version%"=="4.90" set operatingsys=Windows ME&goto :EOF
if "%version%"=="4.10" set operatingsys=Windows 98&goto :EOF
if "%version%"=="4.00" set operatingsys=Windows 95&goto :EOF
set operatingsys=Windows Version %version%
goto :EOF