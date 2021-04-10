
$OLDPATH = [System.Environment]::GetEnvironmentVariable('PATH','machine')
$INCLUDE = "$env:ProgramFiles\pfSenseBackup"
$NEWPATH = "$OLDPATH;$INCLUDE"
[Environment]::SetEnvironmentVariable("PATH", "$NEWPATH", "Machine")

