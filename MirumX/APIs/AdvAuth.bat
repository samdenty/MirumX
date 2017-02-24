@echo off%@%
goto :MirumXAPI

This API provides an encrypted user system for MirumX

:MirumXAPI
setlocal
%API%DeleteChar
if /i "%~1"=="login" goto login
if /i "%~1"=="signup" goto signup
goto login


:login
%API%Header "AdvAuth V2.1.5.0A sign in" "AdvAuth sign in"
echo €ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€
echo €              Please enter your credentials to sign in               €
echo €         Or enter a username ^& password to create an account         €
echo €‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€
echo.
call :Auth_u
echo.
call :Auth_p
if not exist "Data\Profiles\%Auth_u%\" (set "error=1"&goto :login.fail) else (if not exist "Data\Profiles\%Auth_u%\profile.en" (set "error=2"&goto :login.fail))
(%API%Crypt -d -p "%Auth_p%" -o "Data\Profiles\%Auth_u%\profile.tmp" "Data\Profiles\%Auth_u%\profile.en")>nul 2>&1&&goto :login.success||set "error=3"&&goto :login.fail
goto :login.fail

:signup
echo  Welcome to AdvAuth V2.1.5.0A
echo.
call :Auth_u
echo.
call :Auth_p


:login.success
if not exist "Data\Profiles\%Auth_u%\profile.tmp" goto :login.fail
endlocal&set "Auth_u=%Auth_u%"

%API%Header "Signed in as [%Auth_u%]" "Signed in"
echo.
echo                     €ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€
echo                     €             You are now signed in to MirumX            €
echo                     €                     Please wait...                     €
echo                     €‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€
for /F "eol=[ skip=3 delims=" %%A in (Data\Profiles\%Auth_u%\profile.tmp) do (set "%%A">nul 2>&1)
endlocal&set "Auth_u=%Auth_u%"
timeout /nobreak 1 >nul
goto :EOF


:Auth_u
set "Auth_u="
echo  €ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€
echo  € Enter your username €
echo  €‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€
%API%Input Auth_u " €˛ " "Enter username:"
goto :EOF

:Auth_p
set "Auth_p="
echo  €ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€
echo  € Enter your password €
echo  €‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€
%API%Input Auth_p " €˛ " "Enter password:" -p
goto :EOF

:login.fail
echo.&echo.
if "%error%"=="1" goto :login.fail.1
if "%error%"=="2" goto :login.fail.2
if "%error%"=="3" goto :login.fail.3
goto :login.fail.3
:login.fail.1
echo €ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€
echo € The specified account doesn't exist €
echo €‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€
goto :login.retry
:login.fail.2
echo €ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€
echo € Account configuration missing! ('Data\Profiles\\profile.en') €
echo €‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€
goto :login.retry
:login.fail.3
echo €ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€
echo € Password incorrect €
echo €‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€
goto :login.retry

:login.retry
%API%List "Try again" "goto :login" "Sign up" "goto :Signup" "Cancel" "goto :EOF"
%ListCommand%
goto :login

:Signup
