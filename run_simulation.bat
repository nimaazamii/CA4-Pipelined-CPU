@echo off
setlocal
cd /d "%~dp0"

where iverilog >nul 2>nul
if errorlevel 1 (
    echo ERROR: Icarus Verilog was not found in PATH.
    echo Install Icarus Verilog and reopen this terminal.
    pause
    exit /b 1
)

if not exist build mkdir build
iverilog -g2012 -s TB -o build\simulation.vvp *.v
if errorlevel 1 (
    echo Compilation failed. Review the messages above.
    pause
    exit /b 1
)

vvp build\simulation.vvp
pause
