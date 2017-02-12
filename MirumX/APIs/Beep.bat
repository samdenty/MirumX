@echo off%@%
if /i not "%GUI.sounds%"=="enable" (timeout /t 1 /nobreak>nul&goto :EOF)
echo.|choice /n>nul 2>&1
goto :EOF