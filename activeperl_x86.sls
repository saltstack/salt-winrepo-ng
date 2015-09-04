activeperl_x86:
  {% for version in '5.22.0', '5.20.2', '5.18.4' %}
  {{ version }}:
    full_name: 'ActivePerl {{ version }} Build {{ build }} (64-bit)'
    installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build }}/ActivePerl-{{ version }}.{{ build }}-MSWin32-x86-64int-299195.msi'
    uninstaller: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build }}/ActivePerl-{{ version }}.{{ build }}-MSWin32-x86-64int-299195.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
  # http://downloads.activestate.com/ActivePerl/releases/5.18.4.1805/ActivePerl-5.18.4.1805-MSWin32-x86-64int-299195.msi
  # http://downloads.activestate.com/ActivePerl/releases/5.20.2.2002/ActivePerl-5.20.2.2002-MSWin32-x86-64int-299195.msi
  # http://downloads.activestate.com/ActivePerl/releases/5.22.0.2200/ActivePerl-5.22.0.2200-MSWin32-x86-64int-299195.msi
