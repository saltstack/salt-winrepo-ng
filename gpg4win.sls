# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
gpg4win:
  {% for version in ['3.1.5', '3.1.4', '3.1.3', '3.1.2', '3.1.1', '3.1.0', '3.0.3', '3.0.0', '2.3.4', '2.3.3', '2.3.2', '2.3.1', '2.3.0', '2.2.4'] %}
  '{{ version }}':
    full_name: 'Gpg4Win ({{ version }})'
    installer: 'https://files.gpg4win.org/gpg4win-{{ version }}.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\GNU\GnuPG\gpg4win-uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
