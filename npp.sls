# just 32-bit x86 installer used for now. x64 was introduced at ver. 7.0, but most plugins are still only 32-bit.
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
npp:
  {% for maj_version, f_version, s_version in [('7.x', '7.5.1', '7.5.1')] %}
  '{{ s_version }}':
    full_name: 'Notepad++ (32-bit x86)'
    installer: 'https://notepad-plus-plus.org/repository/{{ maj_version }}/{{ f_version }}/npp.{{ s_version }}.Installer.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Notepad++\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
# the 64-bit installer is available from:
# https://notepad-plus-plus.org/repository/7.x/7.4.4/npp.7.4.4.Installer.x64.exe
