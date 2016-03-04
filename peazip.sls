peazip:
  '6.0.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'PeaZip 6.0.0 (WIN64)'
    installer: 'http://sourceforge.net/projects/peazip/files/6.0.0/peazip-6.0.0.WIN64.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'PeaZip 6.0.0'
    installer: 'http://sourceforge.net/projects/peazip/files/6.0.0/peazip-6.0.0.WINDOWS.exe'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '%ProgramFiles%\PeaZip\unins000.exe'
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
