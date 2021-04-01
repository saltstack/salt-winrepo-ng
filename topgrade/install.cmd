:: Installs TopGrade
:: Get the passed URL
set "downURL=%~1"
set "zipFILE=%~2"
set "progVER=%~3"
set "unzipFILE=%DIR%%ZipFILE%"
set DIR=%~dp0%

:: Download Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('%downURL%','%zipFILE%'))"

:: Run Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Path \"$env:unzipFILE\" -DestinationPath \"$env:ProgramData\TopGrade\" -Verbose -Force"

:: Add to Machine Path
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -File "set-new-path.ps1"


:: Make Registry Entries - add important version entry that original installer does NOT provide
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TopGrade" /v DisplayVersion /d %progVER% /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TopGrade" /v Publisher /d "Installed by Salt" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\TopGrade" /v URLUpdateInfo /d "https://github.com/r-darwish/topgrade/releases" /f

