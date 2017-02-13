@echo off
goto :MirumX.API
This APP hides files in pictures
:MirumX.API
%API%Header "File Stegar"
if exist "FileStegar_files" rd /s /q FileStegar_files
md FileStegar_files
set /p "image=Enter image location: "
subst z: FileStegar_files
start /wait explorer Z:
pause
subst /d z:
set /p "save=Enter save location: "
pause
copy /b %image%+%file% %save%
echo Finished!
pause