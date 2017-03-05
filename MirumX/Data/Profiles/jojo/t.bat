@echo off
for /f "USEBACKQ tokens=1 skip=1 delims= " %%a in (t.txt) do (set var=%%a)
echo %var%
pause