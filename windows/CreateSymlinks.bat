@echo off
rmdir %APPDATA%\Code\User
mklink /D /J "%APPDATA%\Code\User" "%~dp0vscode\User"
pause