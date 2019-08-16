:: Script to uninstall Filebeat

:: Uninstall the filebeat service
powershell -ExecutionPolicy UnRestricted -file "%ProgramFiles%\Filebeat\uninstall-service-filebeat.ps1"

:: Remove directories
If Exist "%ProgramFiles%\Filebeat" rd /S /Q "%ProgramFiles%\Filebeat"
If Exist "%ProgramData%\Filebeat" rd /S /Q "%ProgramData%\Filebeat"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Filebeat /f
