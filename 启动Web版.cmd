@echo off
cd /d "%~dp0web"
set HOST=0.0.0.0
if "%PORT%"=="" set PORT=8080
set "BUNDLED_NODE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe"
if exist "%BUNDLED_NODE%" (
  "%BUNDLED_NODE%" server.js
) else (
  node server.js
)
pause
