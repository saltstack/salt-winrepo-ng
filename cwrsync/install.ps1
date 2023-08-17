# Script to download, unzip, and setup cwRsync in the Program Files\cwRsync
# Called by install.cmd

# Load parameters
param(
    [Parameter(Mandatory=$True)]
    [String] $Version
)

# Script Settings
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'
$ProgressPreference = "SilentlyContinue"
$script_path = Get-ChildItem "$($myInvocation.MyCommand.Definition)"
$script_path = $script_path.DirectoryName

# Functions
function Add-SystemPathValue{
    # Add a new entry to the system path environment variable. Only adds the new
    # path if it does not already exist.
    #
    # Args:
    #     Path (string): The target path to add
    [Cmdletbinding()]
    param (
        [parameter(Mandatory=$True)]
        [String]$Path
    )

    # Get the current system path
    $current_path = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
    $new_path_list = New-Object System.Collections.Generic.List[String]

    # Make sure the path is not already present
    $regex_path = $Path.Replace("\", "\\")
    foreach ($item in $current_path.Split(";")) {
        # Bail if we find the new path in the current path
        if ($item -imatch "^$regex_path(\\)?$") {
            Write-Host "Target path already exists: $Path"
        } else {
            # Add the item to our new path array
            $new_path_list.Add($item) | Out-Null
        }
    }

    # Add the item to our new path array
    $new_path_list.Add($Path) | Out-Null

    # Update the system path
    $new_path = $new_path_list -join ";"
    try{
        [System.Environment]::SetEnvironmentVariable("Path", $new_path, "Machine")
    } catch {
        Write-Host "Failed to add $Path to the system path"
        Write-Host "Tried to write: $new_path"
        Write-Host "Error message: $_"
    }
}

function Expand-ZipFile {
    # Extract a zip file using supported methods for each version of Windows.
    # For example, PowerShell 5 added the Expand-Archive commandlet, but in
    # previous versions you had to hook into the shell using com objects.
    #
    # Args:
    #     ZipFile (string): The file to extract
    #     Destination (string): The location to extract to
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string] $ZipFile,

        [Parameter(Mandatory = $true)]
        [string] $Destination
    )

    # Create missing directory
    if (!(Test-Path -Path $Destination)) {
        New-Item -ItemType directory -Path $Destination
    }

    # Unzip the file
    if ($PSVersionTable.PSVersion.Major -ge 5) {
        # PowerShell 5 introduced Expand-Archive
        try{
            Expand-Archive -Path $ZipFile -DestinationPath $Destination -Force
        } catch {
            Write-Host "Failed to unzip $ZipFile : $_"
            exit 1
        }
    } else {
        # This method will work with older versions of powershell, but it is
        # slow
        $objShell = New-Object -Com Shell.Application
        $objZip = $objShell.NameSpace($ZipFile)
        try{
            foreach ($item in $objZip.Items()) {
                $objShell.Namespace($Destination).CopyHere($item, 0x14)
            }
        } catch {
            Write-Host "Failed to unzip $ZipFile : $_"
            exit 1
        }
    }
}

# Define variables
$base_url = "https://itefix.net/dl/free-software"
$file_name = "cwrsync_$Version`_x64_free.zip"
$date = Get-Date -Format "yyyyMMdd"
$target_dir = "$env:ProgramFiles\cwRsync"

# Download zip file
$url = "$base_url/$file_name"
$zip_file = "$env:TEMP\$file_name"
$client = new-object System.Net.WebClient
$client.DownloadFile($url, $zip_file)

# Remove existing temp directory if present
if ( Test-Path -Path "$env:TEMP\cwrsync" ) {
    Remove-Item -Path "$env:TEMP\cwrsync" -Recurse -Force
}
New-Item -Path "$env:TEMP\cwrsync" -Type Directory | Out-Null

# Unzip the file to the user temp dir
Expand-ZipFile -ZipFile "$zip_file" -Destination "$env:TEMP\cwrsync"

# Clean-up Zip File
Remove-Item -Path "$zip_file" -Force

# Calculate installation size
$size = (Get-ChildItem "$env:TEMP\cwrsync" | Measure Length -Sum).Sum /1KB

# Remove existing installation
if ( Test-Path -Path "$target_dir" ) {
    Remove-Item -Path "$target_dir" -Recurse -Force
}

# Copy files to Git usr/bin
Move-Item -Path "$env:TEMP\cwrsync" -Destination "$target_dir" -Force
Copy-Item -Path "$script_path\remove.cmd" -Destination "$target_dir\remove.cmd"
Copy-Item -Path "$script_path\remove.ps1" -Destination "$target_dir\remove.ps1"

# Add the new path to the array
Add-SystemPathValue -Path "$target_dir\bin"

#Make registry entries
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Name "cwRsync" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\cwRsync" -Name "DisplayName" -Value "cwRsync" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\cwRsync" -Name "DisplayVersion" -Value "$Version" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\cwRsync" -Name "UninstallString" -Value "$target_dir\remove.cmd" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\cwRsync" -Name "Publisher" -Value "itefix.net" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\cwRsync" -Name "InstallDate" -Value $date | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\cwRsync" -Name "EstimatedSize" -Value $size -PropertyType "DWord" | Out-Null

$paths = [System.Environment]::GetEnvironmentVariable("Path", "Machine"),
         [System.Environment]::GetEnvironmentVariable("Path", "User")
$env:Path = $paths -join ";"
