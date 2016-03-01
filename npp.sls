# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
npp:
  {% for version in '6.9', '6.8.8', '6.8.7', '6.8.6', '6.8.5', '6.8.4', '6.8.3', '6.8.2', '6.8.1', '6.8', '6.7.9.2', '6.7.8.2', '6.7.4', '6.4.2' %}
  '{{ version }}':
    full_name: Notepad++
    installer: 'https://notepad-plus-plus.org/repository/6.x/{{ version }}/npp.{{ version }}.Installer.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
 {% endfor %}
