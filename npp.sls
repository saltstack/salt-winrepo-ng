# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
npp:
  {% for maj_version, version, sversion in [('7.x', '7.0', '7'),('6.x', '6.9.2', '6.9.2'), ('6.x', '6.9.1', '6.9.1'),('6.x', '6.9', '6.9'),('6.x', '6.8.8', '6.8.8'),('6.x', '6.8', '6.8'),('6.x', '6.7.9.2', '6.7.9.2'),('6.x', '6.4.2', '6.4.2')] %}
  '{{ version }}':
    full_name: Notepad++
    installer: 'https://notepad-plus-plus.org/repository/{{ maj_version }}/{{ version }}/npp.{{ sversion }}.Installer.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
 {% endfor %}
