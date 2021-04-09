# https://www.rust-lang.org
# download from https://forge.rust-lang.org/infra/other-installation-methods.html
#
{% set arch = 'x86_64-pc-windows' if grains['cpuarch'] == 'AMD64' else 'i686-pc-windows' %}
{% set source_path = 'https://static.rust-lang.org/dist' %}
#
rust-msvc:
  {% for version, guid32, guid64 in [('1.51.0', '{252A90C9-218C-4149-963D-93242AB48EAF}', '{BF1CEB33-249F-4360-A9B5-FE901E5849E7}')] %}
  '{{ version }}.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Rust {{ version }} (MSVC 64-bit)'
    uninstall_flags: '/x {{ guid64 }} /qn /norestart'
    {% else %}
    full_name: 'Rust {{ version }} (MSVC)'
    uninstall_flags: '/x {{ guid32 }} /qn /norestart'
    {% endif %}
    installer:   '{{source_path}}/rust-{{ version }}-{{ arch }}-msvc.msi'
    install_flags:   '/qn /norestart'
    uninstaller: 'msiexec'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %} 
#
rust-gnu:
  {% for version, guid32, guid64 in [('1.51.0', '{4F02C97C-75A4-49A5-AF37-9CBE74E8B6CD}', '{FBE1449D-4AAA-4381-A35A-EE3BDFBC968C}')] %}
  '{{ version }}.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Rust {{ version }} (GNU 64-bit)'
    uninstall_flags: '/x {{ guid64 }} /qn /norestart'
    {% else %}
    full_name: 'Rust {{ version }} (GNU)'
    uninstall_flags: '/x {{ guid32 }} /qn /norestart'
    {% endif %}
    installer:   '{{source_path}}/rust-{{ version }}-{{ arch }}-msvc.msi'
    install_flags:   '/qn /norestart'
    uninstaller: 'msiexec'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
#
