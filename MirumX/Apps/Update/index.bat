@echo off%@%
goto :MirumXAPI

This API waits a specified amount time, variable to the speed of the PC's core
USAGE: 

Wait 100
     ^This number performs 100 loops, and then terminates
:MirumXAPI
%API%Header "MirumX Updater"
::echo Downloading updates...
::%API%download "http://github.com/samdenty99/MirumX/archive/master.zip" "update.zip"
echo Downloaded update successfully, installing...
(if exist "Update\" (rd /s /q update))>nul 2>&1
(%API%Zip x update.zip)>nul 2>&1
pushd MirumX-master
set "update_dir=%cd%"
pushd MirumX
(rd /s /q Apps)>nul 2>&1
(rd /s /q Data)>nul 2>&1
(del main.settings)>nul 2>&1
popd
popd
pushd "%MirumX_folder%"
(if exist "MirumX_new" (rd /s /q MirumX_new))>nul 2>&1
(xcopy MirumX MirumX_new\)>nul 2>&1
