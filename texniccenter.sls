{% set PROGRAM_FILES = "%PROGRAMFILES%" %}
texniccenter:
  '2.02 Stable':
    full_name: 'TeXnicCenter Version 2.02 Stable'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://downloads.sourceforge.net/project/texniccenter/TeXnicCenter/2.02%20Stable/TXCSetup_2.02Stable_x64.exe'
    {% else %}
    installer: 'https://downloads.sourceforge.net/project/texniccenter/TeXnicCenter/2.02%20Stable/TXCSetup_2.02Stable_Win32.exe'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\TeXnicCenter\unins000.exe'
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
