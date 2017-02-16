@echo off%@%
goto :MirumXAPI

This API allows dynamic resizing of the current window

USAGE:

	Resize		type   type   value
				  ^ "add" / "remove" / "set" / "get"
						^ "width" / "height"
						       ^ number (variable)

			Values are stored in %height% %width%

               EXAMPLES:

					Resize add width 1
					Resize remove height 10
					Resize set height 30
					Resize get

:MirumXAPI


FOR /F "tokens=2 delims=:" %%a IN ('mode^|findstr "Lines"') DO (set "height=%%a")
FOR /F "tokens=2 delims=:" %%a IN ('mode^|findstr "Columns"') DO (set "width=%%a")
set "height=%height: =%"&set "width=%width: =%"
if /i "%~1"=="set" goto :set
if /i "%~1"=="add" goto :add
if /i "%~1"=="remove" goto :remove
goto :EOF

:set
if /i "%~2"=="height" (mode con: cols=%width% lines=%~3)
if /i "%~2"=="width" (mode con: cols=%~3 lines=%height%)
goto :EOF

:add
if /i "%~2"=="height" goto :add.height
if /i "%~2"=="width" goto :add.width
goto :EOF

:remove
if /i "%~2"=="height" goto :remove.height
if /i "%~2"=="width" goto :remove.width
goto :EOF

:add.height
set /a "height=height + %~3" >nul
mode con: cols=%width% lines=%height%
goto :EOF

:add.width
set /a "width=width + %~3" >nul
mode con: cols=%width% lines=%height%
goto :EOF

:remove.height
set /a "height=height - %~3" >nul
mode con: cols=%width% lines=%height%
goto :EOF

:remove.width
set /a "width=width - %~3" >nul
mode con: cols=%width% lines=%height%
goto :EOF