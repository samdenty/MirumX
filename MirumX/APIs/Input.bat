@echo off%@%
goto :MirumXAPI

This API provides user input. It features the SecurInput API from SD-Security, sandboxing all user input before being processed. 
This prevents Batch-file code injection, especially helpful when MirumX is elevated

It also features a hack, that allows spaces before a set /p message

USAGE: 

Input var1 " Please specify value for var1: " "Please enter data for var1" -p
         ^ Indicates which variable the data should be stored to
		      ^ Indicates the Command line message before input
			                                   ^ Indicates the GUI message before input (If not specified, the command line version will be used
																			^ -p specifies that the input should be masked
:MirumXAPI
%API%DeleteChar
set "GUI.inputbox.mask="
set "StringName=%~1"
set "StringText=%~2"
if "%~3"=="" (set "GUI.StringText=%StringText%") else (set "GUI.StringText=%~3")
if /i "%GUI.inputbox.password.mask%"=="enable" (if /i "%~4"=="-p" (set "GUI.inputbox.mask=enable"))
:AskString
if /i "%GUI.inputbox%"=="enable" goto :GUI.InputBox
set "%StringName%="
set /p "%StringName%=.%DeleteChar%%StringText%"
(set %StringName% 2>nul|findstr /r /c:"[&|<>""]"&if not errorlevel 1 (1>&2 echo Do not enter special characters!&goto :AskString)) 1>nul
(set %StringName% 2>nul|findstr "Environment variable %StringName% not defined"&if errorlevel 1 (1>&2 echo Do not leave this field blank!&goto :AskString)) 1>nul
goto :EOF

:GUI.InputBox
set "%StringName%="
if /i not "%GUI.inputbox.mask%"=="enable" (for /f "tokens=*" %%a in ('%API%GUI.input "%GUI.StringText% %window.title.suffix%" "%GUI.StringText%" ""') do (set "%StringName%=%%a")) else (for /f "tokens=*" %%a in ('%API%GUI.input -m "%GUI.StringText% %window.title.suffix%" "%GUI.StringText%" ""') do (set "%StringName%=%%a"))
(set %StringName% 2>nul|findstr /r /c:"[&|<>""]"&if not errorlevel 1 (1>&2 echo Do not enter special characters!&goto :AskString)) 1>nul
(set %StringName% 2>nul|findstr "Environment variable %StringName% not defined"&if errorlevel 1 (1>&2 echo Do not leave this field blank!&goto :AskString)) 1>nul
goto :EOF

:END