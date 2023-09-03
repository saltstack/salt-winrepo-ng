# Script Functions
function Remove-SystemPathValue {
    # Removes the specified target path from the system path environment
    # variable
    #
    # Args
    #     Path (string): The target path to remove
    [Cmdletbinding()]
    param (
        [parameter(Mandatory=$True)]
        [String]$Path
    )

    # Get the current system path
    $current_path = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
    $new_path_list = New-Object System.Collections.Generic.List[String]

    # Find the path in the system path
    $regex_path = $Path.Replace("\", "\\")
    $removed = 0
    foreach ($item in $current_path.Split(";")) {
        # Don't add if we find the new path
        if ($item -imatch "^$regex_path(\\)?$") {
            Write-Host "Removing target path: $Path"
            $removed = 1
        } else {
            # Add the item to our new path array
            $new_path_list.Add($item) | Out-Null
        }
    }

    if ($removed) {
        $new_path = $new_path_list -join ";"
        try {
            [System.Environment]::SetEnvironmentVariable("Path", $new_path, "Machine")
        } catch {
            Write-Host "Failed to remove $Path from the system path"
            Write-Host "Tried to write: $new_path"
            Write-Host "Error message: $_"
        }
    }
}


# Script to uninstall rSyncForGit
$git_bin_dir = "$env:ProgramFiles\Git\usr\bin"

# Remove Files
$files = "msys-xxhash-0.dll",
         "msys-zstd-1.dll",
         "rsync.exe",
         "rsync-ssl"
$files | ForEach-Object {
    if ( Test-Path -Path "$git_bin_dir\$_" ) {
        Remove-Item -Path "$git_bin_dir\$_" -Force
    }
}

# Remove Registry Entries
if ( Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\rSyncForGit") {
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\rSyncForGit" -Force
}

# Remove path from the System path
Remove-SystemPathValue -Path $git_bin_dir

$paths = [System.Environment]::GetEnvironmentVariable("Path", "Machine"),
         [System.Environment]::GetEnvironmentVariable("Path", "User")
$env:Path = $paths -join ";"
