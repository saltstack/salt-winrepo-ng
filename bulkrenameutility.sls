bulkrenameutility:
  '3.0.0.1':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Bulk Rename Utility 3.0 (64-bit)'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Bulk Rename Utility 3.0 (32-bit)'
    {% endif %}
    installer: 'http://www.s3.tgrmn.com/bru/BRU_setup_3.0.0.1.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '%PROGRAM_FILES%/Bulk Rename Utility/unins000.exe'
    uninstall_flags: '/VERYSILENT  /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
