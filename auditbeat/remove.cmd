:: Script to uninstall Auditbeat

:: Uninstall the auditbeat service
powershell -ExecutionPolicy UnRestricted -file "%ProgramFiles%\Auditbeat\uninstall-service-auditbeat.ps1"

:: Remove directories
If Exist "%ProgramFiles%\Auditbeat" rd /S /Q "%ProgramFiles%\Auditbeat"
If Exist "%ProgramData%\Auditbeat" rd /S /Q "%ProgramData%\Auditbeat"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Auditbeat /f
