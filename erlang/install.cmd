:: Installs Erlang
:: Get the passed URL
set "downURL=%~1"
set "instNAME=%~2"
set "progVER=%~3"
set "regNAME=%~4"
set "instFLAG=%~5"
set DIR=%~dp0%

:: Download Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('%downURL%','%instNAME%'))"

:: Run Installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%DIR%%instNAME%' %instFLAG%"

:: Make Registry Entries - add important version entry that original installer does NOT provide
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%regNAME%" /v DisplayVersion /d %progVER% /f /reg:32
