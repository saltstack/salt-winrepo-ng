:: Remove Environment Variables
reg DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /v ChocolateyInstall
reg DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /v ChocolateyBinRoot
reg DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /v ChocolateyToolsLocation
reg DELETE "HKCU\Environment" /f /v ChocolateyLastPathUpdate

:: Remove from Path
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /v Path /d "%PATH:C:\ProgramData\chocolatey\bin;=%"

:: Remove Registry Entry for Add/Remove Programs
reg DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Chocolatey" /f

:: Remove Chocolatey Directories
If Exist "%ChocolateyBinRoot%" rd /s /q "%ChocolateyBinRoot%"
If Exist "%ChocolateyToolsLocation%" rd /s /q "%ChocolateyToolsLocation%"
If Exist "%ChocolateyInstall%" rd /s /q "%ChocolateyInstall%"

:: Make sure older versions are removed
If Exist "C:\Chocolatey" rd /s /q "C:\Chocolatey"
If Exist "C:\ProgramData\Chocolatey" rd /s /q "C:\ProgramData\Chocolatey"
