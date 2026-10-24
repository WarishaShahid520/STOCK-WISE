@echo off
cd /d "%~dp0"
echo ==== StockWise starting ====
where python >nul 2>nul
if errorlevel 1 (
  echo Python is not installed. Install Python 3.10+ from python.org and tick "Add python.exe to PATH".
  pause
  exit /b 1
)
if not exist venv (
  echo Creating virtual environment...
  python -m venv venv
)
call venv\Scripts\activate.bat
echo Installing libraries (first run takes a minute)...
pip install -q -r requirements.txt
if errorlevel 1 (
  echo Could not install libraries. Check your internet connection.
  pause
  exit /b 1
)
flask --app run init-db
if not exist instance\seeded.flag (
  flask --app run seed-db
  echo done> instance\seeded.flag
)
start "" http://127.0.0.1:5000
echo Server running. Close this window or press Ctrl+C to stop.
flask --app run run
pause
