@echo off
cd /D "%~dp0"
set "python_script=%~1"
if exist py310\Scripts\pip.exe goto :run

:setup
echo "setup pip"
call py310\python.exe py310\get-pip.py --no-warn-script-location
goto :run

:run
echo Running %python_script%
@REM Double-click to execute main.py by default, or drag and drop a .py script to execute it
if "%python_script%" == "" (
    call py310\python.exe main.py
) else (
    call py310\python.exe "%python_script%"
)

pause
exit /b