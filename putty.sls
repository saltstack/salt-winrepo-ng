# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
putty:
  {% for version in '0.68' %}
  '{{ version }}':
    full_name:  'PuTTY release {{ version }}'
    installer: 'https://the.earth.li/~sgtatham/putty/{{ version }}/win32/putty-{{ version }}-installer.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\PuTTY\unins000.exe'
    uninstall_flags: '/SP- /silent /verysilent /suppressmsgboxes /norestart /UNINSTMODE'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
