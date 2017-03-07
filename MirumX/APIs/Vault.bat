@echo off%@%
goto :MirumXAPI

This API provides an encrypted user system for MirumX

USAGE:
	Vault /type username password
			^ encrypt | decrypt | decrypt2 (Mounts as drive as well)
					^ username of profile to encrypt/decrypt
							^ password of profile to encrypt/decrypt

:MirumXAPI
if not exist "%MirumX_dir%Data\Profiles\%~2" goto :EOF
pushd "%MirumX_dir%Data\Profiles\%~2"
if /i "%~1"=="/decrypt" goto :decrypt
if /i "%~1"=="/decrypt2" goto :decrypt2
if /i "%~1"=="/encrypt" goto :encrypt
if /i "%~1"=="/disallow" goto :disallow.access
goto :EOF

:encrypt
(%API%zip a vault.en .\Vault.{ff393560-c2a7-11cf-bff4-444553540000}\* -p"%~3")>nul
popd
goto :EOF

:disallow.access
for /f "tokens=*" %%a in ('subst^|findstr ff393560') do (set "subst=%%a")
if defined subst (subst /d %subst:~0,2%)
popd
goto :EOF


:decrypt
(if exist "Vault.{ff393560-c2a7-11cf-bff4-444553540000}" rd /s /q Vault.{ff393560-c2a7-11cf-bff4-444553540000})>nul 2>&1
md Vault.{ff393560-c2a7-11cf-bff4-444553540000}
pushd Vault.{ff393560-c2a7-11cf-bff4-444553540000}
(%API%zip e ..\vault.en -p"%~2")>nul
popd
attrib +h +s Vault.{ff393560-c2a7-11cf-bff4-444553540000}
popd
goto :EOF

:decrypt2
(if exist "Vault.{ff393560-c2a7-11cf-bff4-444553540000}" rd /s /q Vault.{ff393560-c2a7-11cf-bff4-444553540000})>nul 2>&1
md Vault.{ff393560-c2a7-11cf-bff4-444553540000}
pushd Vault.{ff393560-c2a7-11cf-bff4-444553540000}
(%API%zip e ..\vault.en -p"%~2")>nul
popd
attrib +h +s Vault.{ff393560-c2a7-11cf-bff4-444553540000}
subst M: Vault.{ff393560-c2a7-11cf-bff4-444553540000}
%API%HiddenProcess "call start explorer M:\"
popd
goto :EOF