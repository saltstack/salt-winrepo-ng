{% set versions = ['2.1', '2.0', '1.6'] %} 
{% if grains['cpuarch'] == 'AMD64' %}
  {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
  {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
pgadmin4:
{% for version in versions %}
  '{{ version }}':
    full_name: 'pgAdmin 4 version {{ version }}'
    installer: 'https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v{{ version }}/windows/pgadmin4-{{ version }}-x86.exe'
    install_flags: '/SP- /verysilent /norestart'
  {% if version == "1.6" %}
    uninstaller: '{{ PROGRAM_FILES }}\pgAdmin 4\v1\unins000.exe'
  {% elif version == "2.0" or version == "2.1" %}
    uninstaller: '{{ PROGRAM_FILES }}\pgAdmin 4\v2\unins000.exe'
  {% endif %}
    uninstall_flags: '/verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
