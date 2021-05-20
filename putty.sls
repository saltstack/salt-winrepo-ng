putty:
{% for version in ['0.75', '0.74', '0.73', '0.72', '0.71', '0.70', '0.69', '0.68'] %}
  '{{ version }}.0.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    {% set ver_arch = " (64-bit)" %}
    installer: 'https://the.earth.li/~sgtatham/putty/{{ version }}/w64/putty-64bit-{{ version }}-installer.msi'
    uninstaller: 'https://the.earth.li/~sgtatham/putty/{{ version }}/w64/putty-64bit-{{ version }}-installer.msi'
    {% else %}
    installer: 'https://the.earth.li/~sgtatham/putty/{{ version }}/w32/putty-{{ version }}-installer.msi'
    uninstaller: 'https://the.earth.li/~sgtatham/putty/{{ version }}/w32/putty-{{ version }}-installer.msi'
    {% endif %}
    full_name:  'PuTTY release {{ version }}{{ ver_arch | default('') }}'
    install_flags: '/qn'
    uninstall_flags: '/qn'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
{% if grains['cpuarch'] == 'AMD64' %}
  {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
  {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
{% for version in ['0.67', '0.66', '0.65', '0.64'] %}
  '{{ version }}':
    full_name:  'PuTTY release {{ version }}'
    installer: 'https://the.earth.li/~sgtatham/putty/{{ version }}/x86/putty-{{ version }}-installer.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\PuTTY\unins000.exe'
    uninstall_flags: '/SP- /silent /verysilent /suppressmsgboxes /norestart /UNINSTMODE'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
