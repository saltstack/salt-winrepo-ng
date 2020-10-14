# just 32-bit x86 installer used for now. x64 was introduced at ver. 7.0, but most plugins are still only 32-bit.
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
npp:
  {% for version in ['7.9', '7.8', '7.7.1', '7.7'] %}
  '{{ version }}':
    full_name: 'Notepad++'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v{{ version }}/npp.{{ version }}.Installer.x64.exe'
    uninstaller: '%ProgramFiles%\Notepad++\uninstall.exe'
    {% else %}
    installer: 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v{{ version }}/npp.{{ version }}.Installer.exe'
    uninstaller: '%ProgramFiles(x86)%\Notepad++\uninstall.exe'
    {% endif %}
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
# the 64-bit installer is available from:
# https://notepad-plus-plus.org/repository/7.x/7.5.8/npp.7.5.8.Installer.x64.exe
