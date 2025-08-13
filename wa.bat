@echo off
setlocal

rem Exact or partial title to match
set "TITLE=Warning"

rem Path to nircmd in the same folder as this script
set "MYDIR=%~dp0"

echo Waiting for window with title containing: "%TITLE%"
:wait
tasklist /v /fo list | findstr /i "%TITLE%" >nul
if errorlevel 1 (
    timeout /t 1 >nul
    goto wait
)

echo Window found! Activating and pressing Enter...
"%MYDIR%nircmd.exe" win activate title "%TITLE%"
"%MYDIR%nircmd.exe" sendkey enter press

pause
