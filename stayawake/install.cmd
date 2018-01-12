:: Installs StayAwake
:: Get the passed URL
set "downURL=%~1"
set "instNAME=%~2"
set "progVER=%~3"
set "instFLAG=%~4"
set DIR=%~dp0%

:: Download Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('%downURL%','%instNAME%'))"

:: Run Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%DIR%%instNAME%' %instFLAG%"

:: Make Registry Entries - add important version entry that original installer does NOT provide
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\StayAwake" /v DisplayVersion /d %progVER% /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\StayAwake" /v Publisher /d "Installed by Salt" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\StayAwake" /v URLUpdateInfo /d "https://sourceforge.net/projects/stayawake/" /f

