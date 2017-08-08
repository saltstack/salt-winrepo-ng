# Remove Environment Variables
Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SessionManager\Environment" -Name ChocolateyInstall -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SessionManager\Environment" -Name ChocolateyBinRoot -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SessionManager\Environment" -Name ChocolateyToolsLocation -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKCU:\Environment" -Name ChocolateyLastPathUpdate -ErrorAction SilentlyContinue

# Remove from Path
$regPath = "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
$hklm = [Microsoft.Win32.Registry]::LocalMachine
$regKey = $hklm.OpenSubKey($regPath, $TRUE)
$envpath = $regKey.GetValue("Path", "", [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
$new_envpath = $envpath -replace "C:\\ProgramData\\chocolatey\\bin;",$Null
$regKey.SetValue("Path", $new_envpath, [Microsoft.Win32.RegistryValueKind]::ExpandString)

# Remove Registry Entry for Add/Remove Programs
Remove-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\Chocolatey" -ErrorAction SilentlyContinue

# Remove Chocolatey Directories
If (Test-Path env:\ChocolateyBinRoot) { Remove-Item -Path "$env:ChocolateyBinRoot" -Recurse -ErrorAction SilentlyContinue }
If (Test-Path env:\ChocolateyToolsLocation) { Remove-Item -Path "$env:ChocolateyToolsLocation" -Recurse -ErrorAction SilentlyContinue }
If (Test-Path env:\ChocolateyInstall) { Remove-Item -Path "$env:ChocolateyInstall" -Recurse -ErrorAction SilentlyContinue }

# Make sure older versions are removed
If (Test-Path "C:\Chocolatey") { Remove-Item -Path "C:\Chocolatey" -Recurse }
If (Test-Path "C:\ProgramData\Chocolatey") { Remove-Item -Path "C:\ProgramData\Chocolatey" -Recurse }

