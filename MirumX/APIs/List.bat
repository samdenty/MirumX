@echo off%@%
goto :MirumXAPI

This API provides a dynamic script for navigation menus, 
USAGE: 

	List  "Go Home"     "goto :home"        "Go away"     "goto :away" 
			^Option 1    ^Action for 1       ^Option 2     ^Action for 2
		
Once the list API has been called, it will write the specified command for the specified option to the variable.
You can execute this command by putting %ListCommand% after calling this API. Eg.

	List "Say Hi" "echo hi" "Say yoyo" "echo yoyo" "Say WOW" "echo WOW!"
	%ListCommand%

:MirumXAPI
setlocal
set number=1
echo €ﬂﬂﬂ€ﬂ
:List
if "%~1" == "" (goto EOFList) else (if "%~2" == "" goto :EOFList)
call :Record "%~1" "%~2"
shift
shift
goto List

:Record
set "@List#%number%?=%~2"
echo € %number% € %~1
set /a number=number+1 >nul
goto :eof


:EOFList
echo €‹‹‹€‹
echo ﬂ
:SkipStyling
%API%Input lst "˛ " "Enter your choice:"
if "%lst%"=="0" goto :FuncBack
if not defined lst call :NoInput&goto :EOFLIST
if not defined @List#%lst%? call :Invalid&goto :SkipStyling
for /f "tokens=2 delims=?" %%a in ('set @List#%lst%?') do (set "ListCommand=%%a")
endlocal&set "ListCommand=%ListCommand:~1%"
goto :EOF

:FuncBack
set "ListCommand=goto :EOF"
endlocal&set "ListCommand=%ListCommand%"
goto :EOF

:Invalid
echo € Invalid option, please pick a number from above and try again
%API%Beep
goto :EOF

:NoInput
echo € Input is required! try again
goto :EOF