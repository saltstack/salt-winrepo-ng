{% set versions, sv = (('3.3.14.2', '3')) %}
autoit:
  {% for version in versions %}
  {{ version }}:
    full_name: 'AutoIt v{{ version }}'
    installer: 'https://www.autoitscript.com/files/autoit{{ sv }}/autoit-v{{ sv }}-setup.exe'
    install_flags: '/S'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%PROGRAMFILES(x86)%\AutoIt{{ sv }}\Uninstall.exe'
    {% else %}
    uninstaller: '%PROGRAMFILES%\AutoIt{{ sv }}\Uninstall.exe'
    {% endif %}
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
