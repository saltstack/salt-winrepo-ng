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
