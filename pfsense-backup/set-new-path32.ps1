
$OLDPATH = [System.Environment]::GetEnvironmentVariable('PATH','machine')
$INCLUDE = "$env:ProgramFiles(x86)\pfSenseBackup"
$NEWPATH = "$OLDPATH;$INCLUDE"
[Environment]::SetEnvironmentVariable("PATH", "$NEWPATH", "Machine")

