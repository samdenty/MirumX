@echo off%@%
goto :MirumXAPI

This API provides an encrypted user system for MirumX

USAGE:
	AdvAuth param
			  ^ [signin / signup / auto ]
			      ^ Displays a signin screen
			               ^ Displays a sign up screen
			             		    ^ Displays the appropriate screen depending on environment

:MirumXAPI
set "AdvAuth.version=V2.1.5.0A"
setlocal
%API%DeleteChar
if /i "%~1"=="signin" goto signin
if /i "%~1"=="login" goto signin
if /i "%~1"=="signup" goto signup
if /i "%~1"=="auto" goto auto
goto signin

:auto
dir /b /ad "Data\Profiles\*"|>nul findstr "^" && (if defined Auth_U (goto :signout) else (goto :signin)) || (goto :signup)
goto :signin

:signout
endlocal&set "Auth_u="
%API%Header "Signed out"
echo                     ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
echo                     Û             You are now signed out of MirumX           Û
echo                     Û                     Please wait...                     Û
echo                     ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
goto :EOF

:signin
%API%Header "AdvAuth %AdvAuth.version% sign in" "AdvAuth sign in"
echo ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
echo Û              Please enter your credentials to sign in               Û
echo Û         Or enter a username ^& password to create an account         Û
echo ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
echo.
call :Auth_u
echo.
call :Auth_p
if not exist "Data\Profiles\%Auth_u%\" (set "error=1"&goto :signin.fail) else (if not exist "Data\Profiles\%Auth_u%\profile.en" (set "error=2"&goto :signin.fail))
(%API%Crypt -d -p "%Auth_p%" -o "Data\Profiles\%Auth_u%\profile.tmp" "Data\Profiles\%Auth_u%\profile.en")>nul 2>&1&&goto :signin.success||set "error=3"&&goto :signin.fail
goto :signin.fail

:signup
%API%Header "AdvAuth %AdvAuth.version% sign in" "AdvAuth sign in"
echo ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
echo Û                          Create an account                          Û
echo Û                Enter the username ^& password you want               Û
echo ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
echo.
call :Auth_u
echo.
call :Auth_p
goto :Signup


:signin.success
if not exist "Data\Profiles\%Auth_u%\profile.tmp" goto :signin.fail
for /F "eol=[ skip=3 delims=" %%A in (Data\Profiles\%Auth_u%\profile.tmp) do (set "%%A">nul 2>&1)
(del Data\Profiles\%Auth_u%\profile.tmp) >nul 2>&1
%API%Vault /decrypt2 "%Auth_u%" "%Auth_p%"
:signin.message.success
%API%Header "Signed in as [%Auth_u%]" "Welcome %user.name%"
echo.
echo                     ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
echo                     Û             You are now signed in to MirumX            Û
echo                     Û                     Please wait...                     Û
echo                     ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
endlocal&set "Auth_u=%Auth_u%"
timeout /nobreak 2 >nul
goto :EOF


:Auth_u
set "Auth_u="
echo  ÛßßßßßßßßßßßßßßßßßßßßßÛ
echo  Û Enter your username Û
echo  ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
%API%Input Auth_u " Ûþ " "Enter username:"
goto :EOF

:Auth_p
set "Auth_p="
echo  ÛßßßßßßßßßßßßßßßßßßßßßÛ
echo  Û Enter your password Û
echo  ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
%API%Input Auth_p " Ûþ " "Enter password:" -p
goto :EOF

:signin.fail
echo.&echo.
if "%error%"=="1" goto :signin.fail.1
if "%error%"=="2" goto :signin.fail.2
if "%error%"=="3" goto :signin.fail.3
goto :signin.fail.3
:signin.fail.1
echo ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
echo Û The specified account doesn't exist Û
echo ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
goto :signin.retry
:signin.fail.2
echo ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
echo Û Account configuration missing! ('Data\Profiles\\profile.en') Û
echo ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
goto :signin.retry
:signin.fail.3
echo ÛßßßßßßßßßßßßßßßßßßßßÛ
echo Û Password incorrect Û
echo ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
goto :signin.retry

:signin.retry
%API%List "Try again" "goto :signin" "Sign up" "goto :Signup" "Cancel" "goto :EOF"
%ListCommand%
goto :signin

:Signup
%API%Header "Sign up - AdvAuth" "Sign up"
md "Data\Profiles\%Auth_u%"||echo Failed!&&pause >nul&&goto :eof
pushd "Data\Profiles\%Auth_u%"
%API%Input user.name "What is your name  ? "
%API%Input user.email "What is your email ? "
:: DEFAULT USER PROFILE LAYOUT & VARIABLES
(	echo [AdvAUTH %AdvAuth.version%]
	echo This file contains an account record for %Auth_u%. DO NOT DELETE
	echo 
	echo 	[Account information]
	echo 		user.name=%user.name%
	echo 		user.email=%user.email%
	echo 	[Account permissions]
	echo 		user.status=normal
) > "profile.tmp"
(%API%Crypt -e -p "%Auth_p%" -o "profile.en" "profile.tmp")>nul 2>&1
(del profile.tmp)>nul 2>&1
md Vault.{ff393560-c2a7-11cf-bff4-444553540000}
(echo Welcome to your MirumX Data Vault! Place any files into this folder)> "Vault.{ff393560-c2a7-11cf-bff4-444553540000}\README.txt"
%API%Vault /encrypt "%Auth_u%" "%Auth_p%"
rd /s /q Vault.{ff393560-c2a7-11cf-bff4-444553540000}
goto :signin.message.success