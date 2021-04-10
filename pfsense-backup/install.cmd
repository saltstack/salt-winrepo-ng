:: Installs pfSenseBackkup
:: Get the passed URL
set "downURL=%~1"
set "progFILE=%~2"
set "progVER=%~3"
set "progARCH=%~4"
set "instFILE=%DIR%%progFILE%"
set DIR=%~dp0%

:: Download Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('%downURL%','%progFILE%'))"

:: Create Directory
IF %progARCH% EQU "x64" %systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "New-Item -Type Directory -Path \"$env:ProgramFiles(x86)\pfSenseBackup\" -Verbose -Force"
IF %progARCH% EQU "x32" %systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "New-Item -Type Directory -Path \"$env:ProgramFiles\pfSenseBackup\" -Verbose -Force"


:: Run Installer
IF %progARCH% EQU "x64" %systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Copy-Item -Path \"$env:instFILE\" -Destination \"$env:ProgramFiles(x86)\pfSenseBackup\" -Verbose -Force"
IF %progARCH% EQU "x32" %systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Copy-Item -Path \"$env:instFILE\" -Destination \"$env:ProgramFiles\pfSenseBackup\" -Verbose -Force"

:: Add to Machine Path
IF %progARCH% EQU "x64" %systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -File "set-new-path64.ps1"
IF %progARCH% EQU "x32" %systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -File "set-new-path32.ps1"


:: Make Registry Entries - add important version entry that original installer does NOT provide
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" /v DisplayVersion /d %progVER% /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" /v Publisher /d "Installed by Salt" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" /v URLUpdateInfo /d "https://github.com/KoenZomers/pfSenseBackup/releases" /f

