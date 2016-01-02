autoit:
  '3.3.14.2':
    full_name: 'AutoIt v3.3.14.2'
    installer: 'https://www.autoitscript.com/files/autoit3/autoit-v3-setup.exe'
    install_flags: '/S'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%PROGRAMFILES(x86)%\AutoIt3\Uninstall.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    uninstaller: '%PROGRAMFILES%\AutoIt3\Uninstall.exe'
    {% endif %}
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
