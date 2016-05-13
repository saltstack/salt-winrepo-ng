activeperl_x64:
  {% for version, build in (('5.22.1', '2201'), ('5.20.3', '2003')) %}
  '{{ version }}':
    full_name: 'ActivePerl {{ version }} Build {{ build }} (64-bit)'
    installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build}}/ActivePerl-{{ version }}.{{ build}}-MSWin32-x64-299574.msi'
    uninstaller: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build}}/ActivePerl-{{ version }}.{{ build}}-MSWin32-x64-299574.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
