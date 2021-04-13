:: Script to uninstall pfSenseBackup

:: Remove directories
If Exist "%ProgramFiles(x86)%\pfSenseBackup\pfSenseBackup.exe" del /F /Q "%ProgramFiles(x86)%\pfSenseBackup\pfsensebackup.exe"
If Exist "%ProgramFiles(x86)%\pfSenseBackup\remove.cmd" del /F /Q "%ProgramFiles(x86)%\pfSenseBackup\remove.cmd"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup /f
