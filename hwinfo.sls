{% set PROGRAM_FILES = "%PROGRAMFILES%" %}
hwinfo:
  '6.32':
    full_name: 'HWiNFO Version 6.32'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://www.hwinfo.com/files/hwi_632.exe'
    uninstaller: '{{ PROGRAM_FILES }}\HWiNFO64\unins000.exe'
    {% else %}
    installer: 'https://www.hwinfo.com/files/hwi_632.exe'
    uninstaller: '{{ PROGRAM_FILES }}\HWiNFO32\unins000.exe'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstall_flags: '/VERYSILENT'
    msiexec: False
    locale: en_US
    reboot: False
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
