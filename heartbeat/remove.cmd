:: Script to uninstall Heartbeat

:: Uninstall the heartbeat service
powershell -ExecutionPolicy UnRestricted -file "%ProgramFiles%\Heartbeat\uninstall-service-heartbeat.ps1"

:: Remove directories
If Exist "%ProgramFiles%\Heartbeat" rd /S /Q "%ProgramFiles%\Heartbeat"
If Exist "%ProgramData%\Heartbeat" rd /S /Q "%ProgramData%\Heartbeat"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Heartbeat /f
