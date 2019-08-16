:: Script to uninstall Metricbeat

:: Uninstall the metricbeat service
powershell -ExecutionPolicy UnRestricted -file "%ProgramFiles%\Metricbeat\uninstall-service-metricbeat.ps1"

:: Remove directories
If Exist "%ProgramFiles%\Metricbeat" rd /S /Q "%ProgramFiles%\Metricbeat"
If Exist "%ProgramData%\Metricbeat" rd /S /Q "%ProgramData%\Metricbeat"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Metricbeat /f
