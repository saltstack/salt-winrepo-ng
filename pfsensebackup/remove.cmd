:: Script to uninstall pfSenseBackup


:: Stop the program
taskkill /F /T /IM pfsensebackup.exe


:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup /f


:: Remove directories
If Exist "%ProgramFiles(x86)%\pfSenseBackup\pfSenseBackup.exe" del /F /Q "%ProgramFiles(x86)%\pfSenseBackup\pfsensebackup.exe"
If Exist "%ProgramFiles(x86)%\pfSenseBackup\remove.cmd" del /F /Q "%ProgramFiles(x86)%\pfSenseBackup\remove.cmd"
