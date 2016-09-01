activeperl_x86:
  {% for version, build, guid_x64, guid_x86, release_x64, release_x86 in [('5.22.2', '2202', '{8511C2FE-31FE-40B3-96EC-91707329B0AA}', '{8511C2FE-31FE-40B3-96EC-91707329B0AA}', '300558', '300560'), ('5.24.0', '2400', '{CD02A72D-C2E9-482F-8C19-3E329A115E28}', '{CD02A72D-C2E9-482F-8C19-3E329A115E28}', '300558','300560')] %}
  '{{ version }}':
    full_name: 'ActivePerl {{ version }} Build {{ build }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build }}/ActivePerl-{{ version }}.{{ build }}-MSWin32-x86-64int-{{ release_x64 }}.exe'
    uninstall_flags: '/x {{ guid_x64 }} /qn /norestart'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://downloads.activestate.com/ActivePerl/releases/{{ version }}.{{ build }}/ActivePerl-{{ version }}.{{ build }}-MSWin32-x86-64int-{{ release_x86 }}.exe'
    uninstall_flags: '/x {{ guid_x86 }} /qn /norestart'
    {% endif %}
    uninstaller: 'msiexec.exe'
    install_flags: '/exenoui /qn /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
