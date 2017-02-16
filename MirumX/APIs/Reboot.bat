@echo off%@%
goto :MirumXAPI

This API reboots MirumX, by getting access to the MirumX core via "%API%CrashHelper"

USAGE:

	Reboot param
			^ "new" / "keep"
			new :  start a new session, don't keep any variables
			keep:  keep all the current variables when rebooting - NOT IMPLEMENTED YET

:MirumXAPI
if /i "%~1"=="new" (exit 300)
if /i "%~1"=="keep" (exit 301)