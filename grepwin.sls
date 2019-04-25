grepwin:
  '1.6.682':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'grepWin x64'
    installer: 'https://downloads.sourceforge.net/project/grepwin/1.6.15/grepWin-1.6.15-x64.msi'
    uninstaller: 'https://downloads.sourceforge.net/project/grepwin/1.6.15/grepWin-1.6.15-x64.msi'
    {% else %}
    full_name: 'grepWin'
    installer: 'https://downloads.sourceforge.net/project/grepwin/1.6.15/grepWin-1.6.15.msi'
    uninstaller: 'https://downloads.sourceforge.net/project/grepwin/1.6.15/grepWin-1.6.15.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '1.6.673':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'grepWin x64'
    installer: 'https://downloads.sourceforge.net/project/grepwin/1.6.14/grepWin-1.6.14-x64.msi'
    uninstaller: 'https://downloads.sourceforge.net/project/grepwin/1.6.14/grepWin-1.6.14-x64.msi'
    {% else %}
    full_name: 'grepWin'
    installer: 'https://downloads.sourceforge.net/project/grepwin/1.6.14/grepWin-1.6.14.msi'
    uninstaller: 'https://downloads.sourceforge.net/project/grepwin/1.6.14/grepWin-1.6.14.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '1.6.661':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'grepWin x64'
    installer: 'https://downloads.sourceforge.net/project/grepwin/1.6.13/grepWin-1.6.13-x64.msi'
    uninstaller: 'https://downloads.sourceforge.net/project/grepwin/1.6.13/grepWin-1.6.13-x64.msi'
    {% else %}
    full_name: 'grepWin'
    installer: 'https://downloads.sourceforge.net/project/grepwin/1.6.13/grepWin-1.6.13.msi'
    uninstaller: 'https://downloads.sourceforge.net/project/grepwin/1.6.13/grepWin-1.6.13.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '1.6.646':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'grepWin x64'
    installer: 'https://downloads.sourceforge.net/project/grepwin/1.6.12/grepWin-1.6.12-x64.msi'
    uninstaller: 'https://downloads.sourceforge.net/project/grepwin/1.6.12/grepWin-1.6.12-x64.msi'
    {% else %}
    full_name: 'grepWin'
    installer: 'https://downloads.sourceforge.net/project/grepwin/1.6.12/grepWin-1.6.12.msi'
    uninstaller: 'https://downloads.sourceforge.net/project/grepwin/1.6.12/grepWin-1.6.12.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
