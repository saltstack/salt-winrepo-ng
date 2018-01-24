{% set versions = {'3.3.14.2':['3']} %}
autoit:
{% for version, releases in versions.items() %}
{% for release in releases %}  
  '{{ version }}':
    full_name: 'AutoIt v{{ version }}'
    installer: 'https://www.autoitscript.com/files/autoit{{ release }}/autoit-v{{ release }}-setup.exe'
    install_flags: '/S'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%PROGRAMFILES(x86)%\AutoIt{{ release }}\Uninstall.exe'
    {% else %}
    uninstaller: '%PROGRAMFILES%\AutoIt{{ release }}\Uninstall.exe'
    {% endif %}
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
