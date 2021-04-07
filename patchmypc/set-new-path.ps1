
$OLDPATH = [System.Environment]::GetEnvironmentVariable('PATH','machine')
$INCLUDE = "$env:ProgramData\PatchMyPC"
$NEWPATH = "$OLDPATH;$INCLUDE"
[Environment]::SetEnvironmentVariable("PATH", "$NEWPATH", "Machine")

