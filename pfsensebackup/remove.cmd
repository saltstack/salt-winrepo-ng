:: Script to uninstall pfSenseBackup

:: Remove directories
If Exist "%ProgramFiles(x86)%\pfSenseBackup\pfSenseBackup.exe" del /f /Q "%ProgramFiles(x86)%\pfSenseBackup\pfsensebackup.exe"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup /f
