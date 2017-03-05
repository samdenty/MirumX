@echo off
:MirumX_APP
%API%Header Debugger
%API%List "Display variables" "goto :displayvariables"
%ListCommand%
goto :MirumX_APP

:displayvariables
set > displayvariables.tmp
start /wait notepad displayvariables.tmp
del displayvariables.tmp
goto :MirumX_APP