{% set PROGRAM_FILES = "%PROGRAMFILES%" %}
hwinfo:
  '5.70':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'HWiNFO64 Version 5.70'
    installer: 'https://www.fosshub.com/HWiNFO.html/hw64_570.exe'
    uninstaller: '{{ PROGRAM_FILES }}\HWiNFO64\unins000.exe'
    {% else %}
    full_name: 'HWiNFO32 Version 5.70'
    installer: 'https://www.fosshub.com/HWiNFO.html/hw32_570.exe'
    uninstaller: '{{ PROGRAM_FILES }}\HWiNFO32\unins000.exe'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstall_flags: '/VERYSILENT'
    msiexec: False
    locale: en_US
    reboot: False
