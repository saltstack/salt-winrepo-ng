{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
autohotkey:
  '1.1.29.01':
    full_name: 'AutoHotkey 1.1.29.01'
    installer: 'http://ahkscript.org/download/1.1/AutoHotkey112706_Install.exe'
    install_flags: '/S /U32 /D="{{ PROGRAM_FILES }}\AutoHotkey"'
    uninstaller: '{{ PROGRAM_FILES }}\AutoHotKey\AutoHotKey.exe'
    uninstall_flags: '"{{ PROGRAM_FILES }}\AutoHotkey\Installer.ahk" /Uninstall'
    msiexec: False
    locale: en_US
    reboot: False
  '1.1.27.06':
    full_name: 'AutoHotkey 1.1.27.06'
    installer: 'http://ahkscript.org/download/1.1/AutoHotkey112706_Install.exe'
    install_flags: '/S /U32 /D="{{ PROGRAM_FILES }}\AutoHotkey"'
    uninstaller: '{{ PROGRAM_FILES }}\AutoHotKey\AutoHotKey.exe'
    uninstall_flags: '"{{ PROGRAM_FILES }}\AutoHotkey\Installer.ahk" /Uninstall'
    msiexec: False
    locale: en_US
    reboot: False
  '1.1.24.00':
    full_name: 'AutoHotkey 1.1.24.00'
    installer: 'http://ahkscript.org/download/1.1/AutoHotkey112400_Install.exe'
    install_flags: '/S /U32 /D="{{ PROGRAM_FILES }}\AutoHotkey"'
    uninstaller: '{{ PROGRAM_FILES }}\AutoHotKey\AutoHotKey.exe'
    uninstall_flags: '"{{ PROGRAM_FILES }}\AutoHotkey\Installer.ahk" /Uninstall'
    msiexec: False
    locale: en_US
    reboot: False
  '1.1.22.09':
    full_name: 'AutoHotkey 1.1.22.09'
    installer: 'http://ahkscript.org/download/1.1/AutoHotkey112209_Install.exe'
    install_flags: '/S /U32 /D="{{ PROGRAM_FILES }}\AutoHotkey"'
    uninstaller: '{{ PROGRAM_FILES }}\AutoHotKey\AutoHotKey.exe'
    uninstall_flags: '"{{ PROGRAM_FILES }}\AutoHotkey\Installer.ahk" /Uninstall'
    msiexec: False
    locale: en_US
    reboot: False
