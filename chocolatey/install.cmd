:: Installs Chocolatey
set DIR=%~dp0%

:: Download install.ps1
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('https://chocolatey.org/install.ps1','install.ps1'))"

:: Run Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%DIR%install.ps1' %*"

:: Get version
For /F "Tokens=*" %%I in ('C:\ProgramData\Chocolatey\choco.exe --version') Do Set chocolateyVersion=%%I

:: Make Registry Entries
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Chocolatey" /v DisplayName /d "Chocolatey" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Chocolatey" /v DisplayVersion /d %chocolateyVersion% /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Chocolatey" /v Publisher /d "Installed by Salt" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Chocolatey" /v URLUpdateInfo /d "https://chocolatey.org" /f

:: Copy uninstall to Chocolatey install dir
If Exist C:\ProgramData\Chocolatey (
    type %DIR%uninstall.cmd > C:\ProgramData\Chocolatey\uninstall.cmd
    type %DIR%uninstall.ps1 > C:\ProgramData\Chocolatey\uninstall.ps1
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Chocolatey" /v UninstallString /d "C:\ProgramData\Chocolatey\uninstall.cmd" /f
)
If Exist C:\Chocolatey (
    type %DIR%uninstall.cmd > C:\Chocolatey\uninstall.cmd
    type %DIR%uninstall.ps1 > C:\Chocolatey\uninstall.ps1
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Chocolatey" /v UninstallString /d "C:\Chocolatey\uninstall.cmd" /f
)
