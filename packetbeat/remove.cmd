:: Script to uninstall Packetbeat

:: Uninstall the packetbeat service
powershell -ExecutionPolicy UnRestricted -file "%ProgramFiles%\Packetbeat\uninstall-service-packetbeat.ps1"

:: Remove directories
If Exist "%ProgramFiles%\Packetbeat" rd /S /Q "%ProgramFiles%\Packetbeat"
If Exist "%ProgramData%\Packetbeat" rd /S /Q "%ProgramData%\Packetbeat"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Packetbeat /f
