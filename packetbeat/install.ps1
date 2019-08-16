# Script to download, unzip, and setup Packetbeat
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
$base_url="https://artifacts.elastic.co/downloads/beats/packetbeat"
$filename = "packetbeat-$version-windows-x86_64.zip"
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
Rename-Item -Path "$env:ProgramFiles\packetbeat-$version-windows-x86_64" -NewName "Packetbeat"

# Install the packetbeat service
& "$env:ProgramFiles\Packetbeat\install-service-packetbeat.ps1" | Out-Null

# Calculate installation size
$size = (Get-ChildItem "$env:ProgramFiles\Packetbeat" | Measure Length -Sum).Sum /1KB

#Make registry entries
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Name "Packetbeat" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Packetbeat" -Name "DisplayName" -Value "Packetbeat" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Packetbeat" -Name "DisplayVersion" -Value "$version" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Packetbeat" -Name "UninstallString" -Value "Managed by Salt" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Packetbeat" -Name "Publisher" -Value "Elastic.co" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Packetbeat" -Name "InstallDate" -Value $date | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Packetbeat" -Name "EstimatedSize" -Value $size -PropertyType "DWord" | Out-Null
