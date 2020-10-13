# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
cdroller:
  '11.0':
    full_name: 'CDRoller version 10.0'
    installer: 'https://www.cdroller.com/de/download/CDRoller11_de.exe'
    install_flags: '/VERYSILENT /MERGETASKS="set_edr_mode,cdroller_desktopicon,manual_desktopicon,quickref_desktopicon"'
    uninstaller: '{{ PROGRAM_FILES }}\CDRoller\unins000.exe'
    uninstall_flags: '/VERYSILENT'
    msiexec: False
    locale: en_US
    reboot: False
  '10.0':
    full_name: 'CDRoller version 10.0'
    installer: 'http://cdroller.fileburst.com/CDRoller10_en.exe'
    install_flags: '/VERYSILENT /MERGETASKS="set_edr_mode,cdroller_desktopicon,manual_desktopicon,quickref_desktopicon"'
    uninstaller: '{{ PROGRAM_FILES }}\CDRoller\unins000.exe'
    uninstall_flags: '/VERYSILENT'
    msiexec: False
    locale: en_US
    reboot: False
