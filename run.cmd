@echo off
chcp 65001 >nul
setlocal

cd /d "%~dp0"

set "VENV_DIR=.venv"
set "PYTHON_BIN=%VENV_DIR%\Scripts\python.exe"

where py >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    set "PYTHON_CMD=py -3"
) else (
    set "PYTHON_CMD=python"
)

if not exist "%PYTHON_BIN%" (
    echo Creating virtual environment in %VENV_DIR%...
    %PYTHON_CMD% -m venv "%VENV_DIR%"
)

"%PYTHON_BIN%" -m pip --version >nul 2>nul
if errorlevel 1 (
    echo Recreating virtual environment because pip is invalid...
    rmdir /s /q "%VENV_DIR%"
    %PYTHON_CMD% -m venv "%VENV_DIR%"
)

if not exist "%PYTHON_BIN%" (
    echo Error: virtual environment was not created correctly.
    exit /b 1
)

echo Upgrade pip
"%PYTHON_BIN%" -m pip install --upgrade pip

echo Installing dependencies with pip...
"%PYTHON_BIN%" -m pip install -r requirements.txt

echo Starting application with Waitress...
"%PYTHON_BIN%" -m waitress --host 0.0.0.0 --port 5191 app:app

endlocal
