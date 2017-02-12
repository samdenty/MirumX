@echo off%@%
goto :MirumXAPI

This API provides a dynamic script for navigation menus with checkboxes
USAGE for displaying list menu: 

	Switch /list "Enable test1" test1 "Enable test2"  test2 "Enable test3" test3
		           ^Option 1            ^Option 2             ^Option 3
				                 ^Option 1 ID          ^Option 2 ID         ^Option 3 ID
		
Once the switch API has been called, you then need to check whether it was selected or not 
You can do this by:

	Switch /check test1 "echo checked" "echo Not checked"
	
To set a switch for an action perform
    Switch /switch test1 /on
	              ^ID  ^action (/on,/off,/invert  default: /invert)
				  
Example script

	@echo off
	if exist "file" (Switch /switch test1 /on)
	Switch /list "Enable test1" test1 "Enable test2" test2
	Switch /check test1 "echo Enabled" "del file&echo Disabled"
	
:MirumXAPI
setlocal
if /i "%~1"=="/check" (goto :CheckSwitch)
if /i "%~1"=="/switch" (goto :Switch)
if /i not "%API.List.wrapping%"=="disable" (
	if "%API%"=="" (set "API=call ")
	call :CountParameters %*
)
shift
set number=1
echo €%spc2%ﬂﬂﬂﬂﬂ€ﬂ
:List
call :Record "%~1" "%~2"
shift&shift
if "%~2"=="" (goto :EOFList) else (goto List)

:Record
set "@List#%number%?=%~2"
if /i not "%API.List.wrapping%"=="disable" (
    if %number% LSS 1000 set "spc=%number%%spacing3%"
	if %number% LSS 100 set "spc=%number%%spacing2%"
	if %number% LSS 10 set "spc=%number%%spacing1%"
) else (
	set "spc=%number%"
)
for /f "tokens=1-2 delims==" %%a in ('set %~2 2^>nul') do set "SwitchStatus=%%b">nul 2>&1
if /i "%SwitchStatus%"=="@SwitchAPI@.off" (echo €[˛] %spc% € %~1) else (echo €[ ] %spc% € %~1)
set /a number=number+1 >nul
goto :eof


:EOFList
echo €%spc3%‹‹‹‹‹€‹
echo ﬂ
:SkipStyling
%API%Input lst "˛ " "Enter your choice:"
if not defined lst call :NoInput&goto :EOFLIST
if not defined @List#%lst%? call :Invalid&goto :SkipStyling
for /f "tokens=2 delims=?" %%a in ('set @List#%lst%?') do (set "ListCommand=%%a")
endlocal&set "ListCommand=%ListCommand:~1%"
goto :EOF

:Invalid
echo € Invalid option, please pick a number from above and try again
%API%Beep
goto :EOF

:NoInput
echo € Input is required! try again
goto :EOF

:Switch
set "SwitchName=%~2"
set "SwitchType=%~3"
if not defined SwitchType (call :InvertSwitch&goto :EOF)
if /i "%SwitchType%"=="/invert" (call :InvertSwitch&goto :EOF)
if /i "%switchType%"=="/on" (set "%SwitchName%=@SwitchAPI@.on") else (if /i "%switchType%"=="/off" set "%SwitchName%=@SwitchAPI@.off")
goto :EOF
:InvertSwitch
for /f "tokens=1-2 delims==" %%a in ('set %SwitchName% 2^>nul') do set "SwitchStatus=%%b">nul 2>&1
if /i "%SwitchStatus%"=="@SwitchAPI@.off" (set "%SwitchName%=@SwitchAPI@.on") else (set "%SwitchName%=@SwitchAPI@.off")
goto :EOF

:CheckSwitch
set "SwitchName=%~2"
set "SwitchOn.action=%~3"
set "SwitchOff.action=%~4"
for /f "tokens=1-2 delims==" %%a in ('set %SwitchName% 2^>nul') do set "SwitchStatus=%%b">nul 2>&1
if /i "%SwitchStatus%"=="@SwitchAPI@.off" (if defined SwitchOff.action (%SwitchOff.action%)) else (if defined SwitchOn.action (%SwitchOn.action%))
goto :EOF

:CountParameters
set "Params=0"
:CountLoop
if "%~1"=="" (goto :EOFCountParameters)
set /a Params=%Params%+1 >nul
shift
goto :CountLoop
:EOFCountParameters
set /a "Params=(Params - 1) / 2" >nul
if %Params% GEQ 100 (set "spacing1=  "&set "spacing2= "&set "spc2=ﬂﬂﬂ"&set "spc3=‹‹‹")
if %Params% LSS 100 (set "spacing1= "&set "spacing2="&set "spc2=ﬂﬂ"&set "spc3=‹‹")
if %Params% LSS 10 (set "spacing1="&set "spacing2="&set "spc2=ﬂ"&set "spc3=‹")
goto :EOF
