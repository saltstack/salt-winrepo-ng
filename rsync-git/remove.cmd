@echo off
:: A Wrapper for the remove.ps1 since you can't run a powershell script
:: directly from the software definition file

:: Get the current directory
Set "CurDir=%~dp0"

:: Launch the powershell script
powershell -ExecutionPolicy UnRestricted -file "%CurDir%\remove.ps1"
