hwinfo:
  '6.32':
    full_name: 'HWiNFO Version 6.32'
    installer: 'https://www.sac.sk/download/utildiag/hwi_632.exe'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%ProgramFiles%\HWiNFO64\unins000.exe'
    {% else %}
    uninstaller: '%ProgramFiles(x86)%\HWiNFO32\unins000.exe'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstall_flags: '/VERYSILENT'
    msiexec: False
    locale: en_US
    reboot: False
