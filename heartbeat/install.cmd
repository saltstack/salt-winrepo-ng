:: A Wrapper for the install.ps1 since you can't run a powershell script
:: directly from the software definition file

:: Get Passed Parameters
set "Version="

:: First Parameter
if not "%~1"=="" (
    echo.%1 | FIND /I "=" > nul && (
        :: Named Parameter
        echo Named Parameter
        set "%~1"
    ) || (
        :: Positional Parameter
        echo Positional Parameter
        set "Version=%~1"
    )
)

:: Get the current directory
Set "CurDir=%~dp0"

:: Launch the powershell script
powershell -ExecutionPolicy UnRestricted -file "%CurDir%\install.ps1" %Version%
