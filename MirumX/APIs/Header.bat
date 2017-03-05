@echo off%@%
goto :MirumXAPI

This API provides the header bar for MirumX, it can be customized.
USAGE: 

Header "Example Page" "Window title"
         ^ Indicates the title of the page, that appears in the console and on the window title bar
         				^ Optional: Set a different name for the Window title


:MirumXAPI
cls
if "%~2"=="" (title %~1 %window.title.suffix%) else (title %~2 %window.title.suffix%)
mode con: cols=%window.width% lines=%window.height%
color %window.color%
if defined Auth_u (goto :WithStatus)
:: Hack to get 100%+1 length, *wraps* the text to 100%+1 long
echo ^
лллллпппппппппппплллллпппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппп^
ў ў ў   MirumX   ў ў ў          %~1 &echo ^
лллллммммммммммммлллллмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм &rem Don't remove extra white space at the end
goto :EOF

:WithStatus
%API%StrLength "%~1"
set /a available=%window.width%-(%StrLength%+33) >nul
%API%StrLength Auth_u
set /a paddingNeeded=(%available%-%StrLength%)-2 >nul
%API%Padding %paddingNeeded%
:: Hack to get 100%+1 length, *wraps* the text to 100%+1 long
echo ^
лллллпппппппппппплллллпппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппппп^
ў ў ў   MirumX   ў ў ў          %~1%Padding%[%Auth_u%] &echo ^
лллллммммммммммммлллллмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм &rem Don't remove extra white space at the end
goto :EOF