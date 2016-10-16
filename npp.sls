# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
npp:
  {% for maj_version, f_version, s_version in [('7.x', '7.0', '7')] %}
  '{{ s_version }}':
    full_name: 'Notepad++'
    installer: 'https://notepad-plus-plus.org/repository/{{ maj_version }}/{{ f_version }}/npp.{{ s_version }}.Installer.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
 {% endfor %}
