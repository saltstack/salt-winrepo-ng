:: Installs Patch My PC Home Updater
:: Get the passed URL
set "downURL=%~1"
set "progFILE=%~2"
set "progVER=%~3"
set "instFILE=%DIR%%progFILE%"
set DIR=%~dp0%

:: Download Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('%downURL%','%progFILE%'))"

:: Create Directory
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "New-Item -Type Directory -Path \"$env:ProgramData\PatchMyPC\" -Verbose -Force"


:: Run Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Copy-Item -Path \"$env:instFILE\" -Destination \"$env:ProgramData\PatchMyPC\" -Verbose -Force"

:: Add to Machine Path
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -File "set-new-path.ps1"


:: Make Registry Entries - add important version entry that original installer does NOT provide
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\PatchMyPC" /v DisplayVersion /d %progVER% /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\PatchMyPC" /v Publisher /d "Installed by Salt" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\PatchMyPC" /v URLUpdateInfo /d "https://patchmypc.com/home-updater" /f

