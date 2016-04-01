activeperl_x86:
  {% for version, build in (('5.22.0', '2200'), ('5.20.2', '2002'), ('5.18.4', '1805')) %}
  '{{ version }}':
    full_name: 'ActivePerl {{ version }} Build {{ build }}'
    installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build }}/ActivePerl-{{ version }}.{{ build }}-MSWin32-x86-64int-299195.msi'
    uninstaller: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build }}/ActivePerl-{{ version }}.{{ build }}-MSWin32-x86-64int-299195.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  {% endfor %}
