cdroller:
  '11.0':
    full_name: 'CDRoller version 11'
    installer: 'https://www.cdroller.com/de/download/CDRoller11_de.exe'
    install_flags: '/VERYSILENT /MERGETASKS="set_edr_mode,cdroller_desktopicon,manual_desktopicon,quickref_desktopicon"'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%PROGRAMFILES%\CDRoller\unins000.exe'
    {% else %}
    uninstaller: '%PROGRAMFILES(x86)%\CDRoller\unins000.exe'
    {% endif %}
    uninstall_flags: '/VERYSILENT'
    msiexec: False
    locale: en_US
    reboot: False
