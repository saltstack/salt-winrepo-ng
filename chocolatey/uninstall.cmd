:: Where is this script running from
set DIR=%~dp0

:: Run the powershell script that will uninstall Chocolatey
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -file %DIR%uninstall.ps1
