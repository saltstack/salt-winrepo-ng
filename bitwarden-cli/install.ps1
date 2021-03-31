# Script to download, unzip, and setup Bitwarden CLI
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
$base_url="https://github.com/bitwarden/cli/releases/download/v$version/"
$filename = "bw-windows-$version.zip"
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
New-Item -Path $env:ProgramFiles -Type Directory -Name "Bitwarden CLI" | Out-Null
Get-ChildItem $zip_file | Expand-Archive -DestinationPath "$env:ProgramFiles\Bitwarden CLI\" -Force

# add to machine PATH
$OLDPATH = [System.Environment]::GetEnvironmentVariable('PATH','machine')
$INCLUDE = "$env:ProgramFiles\Bitwarden CLI"
$NEWPATH = "$OLDPATH;$INCLUDE"
[Environment]::SetEnvironmentVariable("PATH", "$NEWPATH", "Machine")

# Calculate installation size
$size = (Get-ChildItem "$env:ProgramFiles\Bitwarden CLI" | Measure Length -Sum).Sum /1KB

#Make registry entries
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Name "Bitwarden-CLI" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Bitwarden-CLI" -Name "DisplayName" -Value "Bitwarden CLI" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Bitwarden-CLI" -Name "DisplayVersion" -Value "$version" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Bitwarden-CLI" -Name "UninstallString" -Value "Managed by Salt" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Bitwarden-CLI" -Name "Publisher" -Value "Bitwarden.com" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Bitwarden-CLI" -Name "InstallDate" -Value $date | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Bitwarden-CLI" -Name "EstimatedSize" -Value $size -PropertyType "DWord" | Out-Null
