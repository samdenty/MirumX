@echo off%@%
goto :MirumXAPI

This API provides the header bar for MirumX, it can be customized.
USAGE: 

Header "Example Page"
         ^ Indicates the title of the page, that appears in the console and on the window title bar

:MirumXAPI
cls
title %~1 %window.title.suffix%
mode con: cols=%window.width% lines=%window.height%
color %window.color%
:: Hack to get 100%+1 length, *wraps* the text to 100%+1 long
echo ^
€€€€€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€€€€€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ^
˛ ˛ ˛   MirumX   ˛ ˛ ˛          %~1 &echo ^
€€€€€‹‹‹‹‹‹‹‹‹‹‹‹€€€€€‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹ &rem Don't remove extra whitespace at the end
goto :EOF