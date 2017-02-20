@echo off%@%
goto :MirumXAPI

This API provides multi-line color

USAGE
		Color colorcode "text"
				^Colorcode (eg. 0A, B6)
						 ^ The text to be displayed, eg:
						 hello
						 "Hello World 214134"

:MirumXAPI

%API%ColorShow /%~1 "%~2"