activeperl_x64:
  {% for version, build, guid in (('5.22.2', '2202', '{E8A8E18A-C3AD-4436-834F-EC150C3A3851}'), ('5.24.0', '2400', '{C89FA3E7-29C4-4A60-AFB9-40E04715AE78}')) %}
  '{{ version }}':
    full_name: 'ActivePerl {{ version }} Build {{ build }} (64-bit)'
    installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build}}/ActivePerl-{{ version }}.{{ build}}-MSWin32-x64-300558.exe'
    uninstaller: 'msiexec.exe'
    install_flags: '/exenoui /qn /norestart'
    uninstall_flags: '/x {{ guid }} /qn /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
