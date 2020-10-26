mediamonkey:
  latest:
    full_name: 'MediaMonkey'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://www.mediamonkey.com/MediaMonkey_Setup.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /DIR="%ProgramFiles%\MediaMonkey" /SP-'
    uninstaller: '%ProgramFiles%\MediaMonkey\unins000.exe'
    {% else %}
    installer: 'https://www.mediamonkey.com/MediaMonkey_Setup.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /DIR="%ProgramFiles(x86)%\MediaMonkey" /SP-'
    uninstaller: '%ProgramFiles(x86)%\MediaMonkey\unins000.exe'
    {% endif %}
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
