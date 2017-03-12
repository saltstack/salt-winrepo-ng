# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
putty:
  {% for version in '0.67', '0.66', '0.65', '0.64' %}
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
