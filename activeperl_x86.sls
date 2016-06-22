activeperl_x86:
  {% for version, build, guid in (('5.22.2', '2202', '{8511C2FE-31FE-40B3-96EC-91707329B0AA}'), ('5.24.0', '2400', '{CD02A72D-C2E9-482F-8C19-3E329A115E28}')) %}
  '{{ version }}':
    full_name: 'ActivePerl {{ version }} Build {{ build }}'
    installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build }}/ActivePerl-{{ version }}.{{ build }}-MSWin32-x86-64int-300558.exe'
    uninstaller: 'msiexec.exe'
    install_flags: '/exenoui /qn /norestart'
    uninstall_flags: '/x {{ guid }} /qn /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
