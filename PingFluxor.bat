@echo off
REM ==========================================
REM  PingFluxor - IP Fluctuation Tracker
REM  Windows Double-Click Launcher (Git Bash)
REM ==========================================

set SCRIPT_PATH=%~dp0switch_port_fluctuation_tracker.sh

REM Check if bash is available in PATH (Git Bash or WSL)
where bash >nul 2>nul

if %errorlevel%==0 (
    echo 🔄 Running PingFluxor...
    bash "%SCRIPT_PATH%"
) else (
    echo ❌ Bash is not installed or not in PATH.
    echo ➤ Please install Git Bash: https://gitforwindows.org/
    pause
)
