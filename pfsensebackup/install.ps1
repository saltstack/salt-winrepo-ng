# Script to setup pfSenseBackup
# Called by install.cmd

# Load parameters
param(
    [Parameter(Mandatory=$True)]
    [String] $version
)

# Get the directory this script is running under
$script_path = dir "$($myInvocation.MyCommand.Definition)"
$script_path = $script_path.DirectoryName

# Define variables
$base_url="https://github.com/KoenZomers/pfSenseBackup/releases/download"
$filename = "pfSenseBackupv$version-win-x64.exe"
$url = "$base_url/$version/$filename"
$exe_file = "$script_path\$filename"
$date = Get-Date -Format "yyyyMMdd"

# Download the file
# Powershell supports only TLS 1.0 by default. Add support up to TLS 1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'
$client = new-object System.Net.WebClient
$client.DownloadFile($url, $exe_file)

# Create directory
New-Item -Type Directory -Path "$env:ProgramFiles(x86)\pfSenseBackup" -Verbose -Force | Out-Null

# Copy program into place
Copy-Item -Path "$env:exe_file" -Destination "$env:ProgramFiles(x86)\pfSenseBackup"" -Verbose -Force | Out-Null


# Add to Machine PATH

# 64-bit
$OLDPATH = [System.Environment]::GetEnvironmentVariable('PATH','machine')
$INCLUDE = "$env:ProgramFiles(x86)\pfSenseBackup"
$NEWPATH = "$OLDPATH;$INCLUDE"
[Environment]::SetEnvironmentVariable("PATH", "$NEWPATH", "Machine")

# 32-bit
# $OLDPATH = [System.Environment]::GetEnvironmentVariable('PATH','machine')
# $INCLUDE = "$env:ProgramFiles\pfSenseBackup"
# $NEWPATH = "$OLDPATH;$INCLUDE"
# [Environment]::SetEnvironmentVariable("PATH", "$NEWPATH", "Machine")

# Calculate installation size
$size = (Get-ChildItem "$env:ProgramFiles(x86)\pfSenseBackup" | Measure Length -Sum).Sum /1KB

#Make registry entries
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Name "pfSenseBackup" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" -Name "DisplayName" -Value "pfSenseBackup" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" -Name "DisplayVersion" -Value "$version" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" -Name "UninstallString" -Value "Managed by Salt" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" -Name "Publisher" -Value "Koen Zomers - (Github)" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" -Name "InstallDate" -Value $date | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" -Name "EstimatedSize" -Value $size -PropertyType "DWord" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pfSenseBackup" -Name "URLUpdateInfo" -Value "https://github.com/KoenZomers/pfSenseBackup/releases" | Out-Null
