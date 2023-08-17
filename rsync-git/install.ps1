# Script to download, unzip, and setup rSync in the git ``usr/bin`` directory
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

# Define variables
$base_url = "https://repo.msys2.org/msys/x86_64"
# Do we need to break out the other 2 into their own repos?
$rsync_file = "rsync-$Version-x86_64.pkg.tar.zst"
$libxxhash_file = "libxxhash-0.8.2-1-x86_64.pkg.tar.zst"
$libzstd_file = "libzstd-1.5.5-1-x86_64.pkg.tar.zst"
$files = $rsync_file, $libxxhash_file, $libzstd_file
$date = Get-Date -Format "yyyyMMdd"
$7z_bin = "$env:ProgramFiles\7-Zip-Zstandard\7z.exe"
$git_bin_dir = "$env:ProgramFiles\Git\usr\bin"

# Detect Missing Dependencies
if ( ! (Test-Path -Path "$7z_bin") ) {
    Write-Host "rSync Package: Missing dependency 7zip Zstandard"
    exit 1
}
if ( ! (Test-Path -Path "$git_bin_dir") ) {
    Write-Host "rSync Package: Missing dependency git"
    exit 1
}

# Download the files
$files | ForEach-Object {
    $url = "$base_url/$_"
    $tarball = "$env:TEMP\$_"
    $client = new-object System.Net.WebClient
    $client.DownloadFile($url, $tarball)
}

# Remove existing temp directory if present
if ( Test-Path -Path "$env:TEMP\rsync" ) {
    Remove-Item -Path "$env:TEMP\rsync" -Recurse -Force
}
New-Item -Path "$env:TEMP\rsync" -Type Directory | Out-Null

# Unzip the files to the user temp dir
$files | ForEach-Object {
    # Unzip the zst tarball
    $tarball = "$env:TEMP\$_"
    Start-Process -FilePath $7z_bin `
                  -ArgumentList "x", "$tarball", "-o$env:TEMP\rsync\" `
                  -NoNewWindow -Wait
     Remove-Item -Path $tarball -Force
    # Unzip the tarball
    $tarball = "$env:TEMP\rsync\$([System.IO.Path]::GetFileNameWithoutExtension($_))"
    Start-Process -FilePath $7z_bin `
                  -ArgumentList "x", "$tarball", "-o$env:TEMP\rsync\", "-aoa" `
                  -NoNewWindow -Wait
     Remove-Item -Path $tarball -Force
}

# Calculate installation size
$size = (Get-ChildItem "$env:TEMP\rsync\usr\bin" | Measure Length -Sum).Sum /1KB

# Copy files to Git usr/bin
Get-ChildItem -Path "$env:TEMP\rsync\usr\bin" | Move-Item -Destination "$git_bin_dir" -Force
Copy-Item -Path "$script_path\remove.ps1" -Destination "$git_bin_dir\remove_rsync.ps1"

# Cleanup Temp Dir
Remove-Item -Path "$env:TEMP\rsync" -Recurse -Force

# Add the new path to the array
Add-SystemPathValue -Path $git_bin_dir

#Make registry entries
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -Name "rSyncForGit" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\rSyncForGit" -Name "DisplayName" -Value "rSync for Git" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\rSyncForGit" -Name "DisplayVersion" -Value "$Version" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\rSyncForGit" -Name "UninstallString" -Value "powershell -ExecutionPolicy UnRestricted -file `"$git_bin_dir\remove_rsync.ps1`"" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\rSyncForGit" -Name "Publisher" -Value "msys2.org" | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\rSyncForGit" -Name "InstallDate" -Value $date | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\rSyncForGit" -Name "EstimatedSize" -Value $size -PropertyType "DWord" | Out-Null

$paths = [System.Environment]::GetEnvironmentVariable("Path", "Machine"),
         [System.Environment]::GetEnvironmentVariable("Path", "User")
$env:Path = $paths -join ";"
