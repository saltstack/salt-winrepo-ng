classicshell:
  '4.2.4':
    full_name: 'Classic Shell'
    installer: 'http://www.mediafire.com/download/wl5nbjaki7zbssn/ClassicShellSetup_4_2_4.exe'
    install_flags: '/passive'
    uninstaller: 'msiexec.exe'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstall_flags: '/qn /x {E289B7DD-6732-4333-A47A-75A145D23EE3} /norestart'
    {% elif grains['cpuarch'] == 'x86' %}
    uninstall_flags: '/qn /x {B9EFC38D-E52A-4BBE-8421-58FCFFDE19E2} /norestart'
    {% endif %}
    msiexec: False
    locale: en_US
    reboot: False
