cdburnerxp:
  '4.5.6.5931':
    full_name: 'CDBurnerXP'
    installer: 'https://download.cdburnerxp.se/cdbxp_setup_4.5.6.5931.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%ProgramFiles%\CDBurnerXP\unins000.exe'
    {% else %}
    uninstaller: '%ProgramFiles(x86)%\CDBurnerXP\unins000.exe'
    {% endif %}
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
