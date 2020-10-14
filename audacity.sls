audacity:
  '2.4.2':
    full_name: 'Audacity'
    installer: 'https://fossies.org/windows/misc/audacity-win-2.4.2.exe'
    install_flags: '/SP- /verysilent /norestart'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%ProgramFiles%\Audacity\unins000.exe'
    {% else %}
    uninstaller: '%ProgramFiles(x86)%\Audacity\unins000.exe'
    {% endif %}
    uninstall_flags: '/SP- /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
