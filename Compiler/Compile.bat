@echo off
(if exist "MirumX.bat" (del MirumX.bat))>nul 2>&1
(if exist "..\MirumX.exe" (del ..\MirumX.exe))>nul 2>&1
(copy ..\MirumX.bat MirumX.bat)>nul 2>&1
(if exist "MirumX.exe" (del MirumX.exe))>nul 2>&1
compile.exe -bat "MirumX.bat" -save "MirumX.exe" -icon "MirumX.ico" -company "MirumCode" -productname "MirumX" -internalname "MirumX" -description "Open-source batch application system" -copyright "MirumCode 2017"||echo Failed!&pause&exit
pushd ..\
(copy Compiler\MirumX.exe MirumX.exe)>nul
pause