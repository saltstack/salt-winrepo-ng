# Script to download, unzip, and setup Winlogbeat
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
$base_url="https://artifacts.elastic.co/downloads/beats/winlogbeat"
$filename = "winlogbeat-$version-windows-x86_64.zip"
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

if ($PSVersionTable.PSVersion.Major -ge 5) {
    Get-ChildItem $zip_file | Expand-Archive -DestinationPath $env:ProgramFiles -Force
} else {
    $Shell = new-object -com Shell.Application
    $Shell.Namespace($env:ProgramFiles).copyhere($Shell.NameSpace($zip_file).Items(), 4)
}

# Rename the directory
Rename-Item -Path "$env:ProgramFiles\winlogbeat-$version-windows-x86_64" -NewName "Winlogbeat"

# Install the winlogbeat service
& "$env:ProgramFiles\Winlogbeat\install-service-winlogbeat.ps1" | Out-Null

# Calculate installation size
$size = (Get-ChildItem "$env:ProgramFiles\Winlogbeat" | Measure Length -Sum).Sum /1KB

#Make registry entries
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Name "Winlogbeat" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Winlogbeat" -Name "DisplayName" -Value "Winlogbeat" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Winlogbeat" -Name "DisplayVersion" -Value "$version" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Winlogbeat" -Name "UninstallString" -Value "Managed by Salt" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Winlogbeat" -Name "Publisher" -Value "Elastic.co" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Winlogbeat" -Name "InstallDate" -Value $date | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Winlogbeat" -Name "EstimatedSize" -Value $size -PropertyType "DWord" | Out-Null
