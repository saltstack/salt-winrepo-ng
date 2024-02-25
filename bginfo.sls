bginfo:
  '4.32':
    installer: 'http://live.sysinternals.com/Bginfo.exe'
    full_name: 'BGInfo - Wallpapertext Configurator'
    reboot: False
    install_flags: '/nolicprompt /silent /all & cmd /c xcopy /c /q /r /y "c:\salt\var\cache\salt\minion\extrn_files\base\live.sysinternals.com\Bginfo.exe" "%SystemRoot%"'
    uninstaller: 'cmd'
    uninstall_flags: '/c del /Q /F %SystemRoot%\bginfo.exe
