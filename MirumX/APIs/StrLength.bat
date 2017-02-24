@echo off%@%
goto :MirumXAPI

This API calculates the length of a string, useful for dynamic styling and centering of content
Variable is stored as %StrLength%
USAGE: 

	StrLength string
               ^ variable / "text string"
Examples:

	StrLength var1
	StrLength "This text is 31 characters long"
:MirumXAPI
%API%StrLen %*
set "StrLength=%errorlevel%"