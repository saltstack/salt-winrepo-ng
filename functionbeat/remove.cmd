:: Script to uninstall Functionbeat

:: Remove directories
If Exist "%ProgramFiles%\Functionbeat" rd /S /Q "%ProgramFiles%\Functionbeat"
If Exist "%ProgramData%\Functionbeat" rd /S /Q "%ProgramData%\Functionbeat"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Functionbeat /f
