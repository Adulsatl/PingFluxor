@echo off
REM Switch Port Fluctuation Tracker - Windows Double Click Launcher

REM Change this path to your actual script location
set SCRIPT_PATH=%~dp0switch_port_fluctuation_tracker.sh

REM Run with Git Bash (if installed)
where bash >nul 2>nul
if %errorlevel%==0 (
    bash "%SCRIPT_PATH%"
) else (
    echo "Bash is not installed or not in PATH. Please install Git Bash or WSL."
    pause
)