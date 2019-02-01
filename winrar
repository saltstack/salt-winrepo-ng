{% set versions = {'5':['61']} %}

winrar:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{major}}.{{minor}}.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'WinRAR {{major}}.{{minor}} (64-bit)'
    installer: 'https://www.rarlab.com/rar/winrar-x64-{{major}}{{minor}}.exe'
    arch: x64
    {% else %}
    full_name: 'WinRAR {{major}}.{{minor}} (32-bit)'
    installer: 'https://www.rarlab.com/rar/wrar{{major}}{{minor}}.exe'    
    arch: x86
    {% endif %}
    uninstaller: '%ProgramFiles%\WinRAR\uninstall.exe'
    install_flags: '/S'    
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
