:: Script to uninstall pfSenseBackup

:: Remove directories
If Exist "%ProgramFiles%\pfSenseBackup" del /f /Q "%ProgramFiles%\pfSenseBackup\pfsense*.exe"
:: If Exist "%ProgramData%\pfSenseBackup" rd /S /Q "%ProgramData%\Auditbeat"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup /f
