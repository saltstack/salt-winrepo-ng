kdiff3:
  Not Found:
    full_name: 'KDiff3 (remove only)'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://downloads.sourceforge.net/project/kdiff3/kdiff3/0.9.98/KDiff3-64bit-Setup_0.9.98-2.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://downloads.sourceforge.net/project/kdiff3/kdiff3/0.9.98/KDiff3-32bit-Setup_0.9.98-3.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '%PROGRAMFILES%\KDiff3\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
