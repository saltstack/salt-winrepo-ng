# Script to download, unzip, and setup Auditbeat
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
$base_url="https://artifacts.elastic.co/downloads/beats/auditbeat"
$filename = "auditbeat-$version-windows-x86_64.zip"
$url = "$base_url/$filename"
$zip_file = "$script_path\$filename"
$date = Get-Date -Format "yyyyMMdd"

# Download the file
# Powershell supports only TLS 1.0 by default. Add support up to TLS 1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'
$client = new-object System.Net.WebClient
$client.DownloadFile($url, $zip_file)

# Unzip the file to current location
$ProgressPreference = "SilentlyContinue"
Get-ChildItem $zip_file | Expand-Archive -DestinationPath $env:ProgramFiles -Force

# Rename the directory
Rename-Item -Path "$env:ProgramFiles\auditbeat-$version-windows-x86_64" -NewName "Auditbeat"

# Install the auditbeat service
& "$env:ProgramFiles\Auditbeat\install-service-auditbeat.ps1" | Out-Null

# Calculate installation size
$size = (Get-ChildItem "$env:ProgramFiles\Auditbeat" | Measure Length -Sum).Sum /1KB

#Make registry entries
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Name "Auditbeat" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Auditbeat" -Name "DisplayName" -Value "Auditbeat" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Auditbeat" -Name "DisplayVersion" -Value "$version" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Auditbeat" -Name "UninstallString" -Value "Managed by Salt" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Auditbeat" -Name "Publisher" -Value "Elastic.co" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Auditbeat" -Name "InstallDate" -Value $date | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Auditbeat" -Name "EstimatedSize" -Value $size -PropertyType "DWord" | Out-Null
