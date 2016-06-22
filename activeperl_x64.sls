activeperl_x64:
  {% for version, build, guidx86, guidx64 in (('5.22.2', '2202', '{8511C2FE-31FE-40B3-96EC-91707329B0AA}', '{E8A8E18A-C3AD-4436-834F-EC150C3A3851}'), ('5.24.0', '2400', '{CD02A72D-C2E9-482F-8C19-3E329A115E28}', '{C89FA3E7-29C4-4A60-AFB9-40E04715AE78}')) %}
  '{{ version }}':
    full_name: 'ActivePerl {{ version }} Build {{ build }} (64-bit)'
    installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build}}/ActivePerl-{{ version }}.{{ build}}-MSWin32-x64-300558.exe'
    uninstaller: 'msiexec.exe'
    install_flags: '/exenoui /qn /norestart'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstall_flags: '/x {{ guidx64 }} /qn /norestart'
    {% elif grains['cpuarch'] == 'x86' %}
    uninstall_flags: '/x {{ guidx86 }} /qn /norestart'
    {% endif %}
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
