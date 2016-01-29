grepwin:
  '1.6.661':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'grepWin x64'
    installer: 'http://netassist.dl.sourceforge.net/project/grepwin/1.6.13/grepWin-1.6.13-x64.msi'
    uninstaller: 'http://netassist.dl.sourceforge.net/project/grepwin/1.6.13/grepWin-1.6.13-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'grepWin'
    installer: 'http://netassist.dl.sourceforge.net/project/grepwin/1.6.13/grepWin-1.6.13.msi'
    uninstaller: 'http://netassist.dl.sourceforge.net/project/grepwin/1.6.13/grepWin-1.6.13.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '1.6.646':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'grepWin x64'
    installer: 'http://netassist.dl.sourceforge.net/project/grepwin/1.6.12/grepWin-1.6.12-x64.msi'
    uninstaller: 'http://netassist.dl.sourceforge.net/project/grepwin/1.6.12/grepWin-1.6.12-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'grepWin'
    installer: 'http://netassist.dl.sourceforge.net/project/grepwin/1.6.12/grepWin-1.6.12.msi'
    uninstaller: 'http://netassist.dl.sourceforge.net/project/grepwin/1.6.12/grepWin-1.6.12.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
