activeperl_x64:
  {% for version, build, guid in (('5.24.3', '2404', '{9CED735F-477B-47A1-879E-741436701014}'),
                                  ('5.26.1', '2601', '{70850766-5026-4056-8E69-3F5AF1EA63DB}')) %}
  '{{ version }}':
    full_name: 'ActivePerl {{ version }} Build {{ build }} (64-bit)'
    installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build}}/ActivePerl-{{ version }}.{{ build}}-MSWin32-x64-404865.exe'
    uninstaller: 'msiexec.exe'
    install_flags: '/exenoui /qn /norestart'
    uninstall_flags: '/x {{ guid }} /qn /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
