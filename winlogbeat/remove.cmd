:: Script to uninstall Winlogbeat

:: Uninstall the winlogbeat service
powershell -ExecutionPolicy UnRestricted -file "%ProgramFiles%\Winlogbeat\uninstall-service-winlogbeat.ps1"

:: Remove directories
If Exist "%ProgramFiles%\Winlogbeat" rd /S /Q "%ProgramFiles%\Winlogbeat"
If Exist "%ProgramData%\Winlogbeat" rd /S /Q "%ProgramData%\Winlogbeat"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Winlogbeat /f
