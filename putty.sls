# just 32-bit x86 installer available
putty:
{% for version in ['0.68', '0.69'] %}
  '{{ version }}':
    full_name:  'PuTTY release {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://the.earth.li/~sgtatham/putty/{{ version }}/w64/putty-64bit-{{ version }}-installer.msi'
    uninstaller: 'https://the.earth.li/~sgtatham/putty/{{ version }}/w64/putty-64bit-{{ version }}-installer.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://the.earth.li/~sgtatham/putty/{{ version }}/w32/putty-{{ version }}-installer.msi'
    uninstaller: 'https://the.earth.li/~sgtatham/putty/{{ version }}/w32/putty-{{ version }}-installer.msi'
    {% endif %}
    install_flags: ' /qn '
    uninstall_flags: ' /qn '
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
{% for version in ['0.67', '0.66', '0.65', '0.64'] %}
  {% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
  {% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
  {% endif %}
  '{{ version }}':
    full_name:  'PuTTY release {{ version }}'
    installer: 'http://the.earth.li/~sgtatham/putty/{{ version }}/x86/putty-{{ version }}-installer.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\PuTTY\unins000.exe'
    uninstall_flags: '/SP- /silent /verysilent /suppressmsgboxes /norestart /UNINSTMODE'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
