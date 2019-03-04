#MariaDB https://downloads.mariadb.org/mariadb/+releases/
#only stable versions are listed

{% set versions = {
'10.3':['13', '12', '11'],
'10.2':['22', '21'],
'10.1':['38', '37'],
'10.0':['38'],
'5.5':['63'],
} %}

{% set source_path = 'https://downloads.mariadb.org/f/mariadb-' %}
{% set source_path2 = '-packages/mariadb-' %}
{% set arch64 = 'winx64' %}
{% set arch32 = 'win32' %}

mariadb:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{major}}.{{minor}}.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'MariaDB {{major}} (x64)'
    installer: '{{ source_path }}{{major}}.{{minor}}/{{ arch64 }}{{ source_path2 }}{{major}}.{{minor}}-{{ arch64 }}.msi'
    uninstaller: '{{ source_path }}{{major}}.{{minor}}/{{ arch64 }}{{ source_path2 }}{{major}}.{{minor}}-{{ arch64 }}.msi'
    {% else %}
    full_name: 'MariaDB {{major}}'
    installer: '{{ source_path }}{{major}}.{{minor}}/{{ arch32 }}{{ source_path2 }}{{major}}.{{minor}}-{{ arch32 }}.msi'
    uninstaller: '{{ source_path }}{{major}}.{{minor}}/{{ arch32 }}{{ source_path2 }}{{major}}.{{minor}}-{{ arch32 }}.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    reboot: False
{% endfor %}
{% endfor %}
