{% set versions = ['1.20.0.0', '1.19.6.4'] %}
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
vcxsrv:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'VcXsrv'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://iweb.dl.sourceforge.net/project/vcxsrv/vcxsrv/1.20.0.0/vcxsrv-64.1.20.0.0.installer.exe'
    {% else %}
    installer: 'https://iweb.dl.sourceforge.net/project/vcxsrv/vcxsrv/1.20.0.0/vcxsrv.1.20.0.0.installer.exe'
    {% endif %} 
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\VcXsrv\uninstall.exe'
    uninstall_flags: '/SP- /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
