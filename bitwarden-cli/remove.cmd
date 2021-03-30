:: Script to uninstall Bitwarden CLI

:: Remove directories
If Exist "%ProgramFiles%\Bitwarden CLI" rd /S /Q "%ProgramFiles%\Bitwarden CLI"

:: Remove from Machine PATH
:: setx /M PATH "%PATH:%%ProgramFiles%%\Bitwarden CLI;=%"
:: setx /M PATH "%PATH:C:\Program Files\Bitwarden CLI;=%"

:: Remove registry entries
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Bitwarden-CLI /f
