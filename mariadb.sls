#MariaDB https://downloads.mariadb.org/mariadb/+releases/
#only stable versions are listed

{% set versions = {
'10.5':['6', '5', '4'],
'10.4':['15', '14', '13', '12', '11', '10', '8', '7', '6'],
'10.3':['13', '12', '11', '10', '9', '8', '7'],
'10.2':['22', '21', '20', '19', '18', '17', '16', '15', '14', '13', '12', '11', '10', '9', '8', '7', '6'],
'10.1':['38', '37', '36', '35', '34', '33', '32', '31', '30', '29', '28', '27', '26', '25', '24', '23', '22', '21', '20', '19', '18', '17', '16', '14', '13', '12', '11', '10', '9', '8'],
'10.0':['38', '37', '36', '35', '34', '33', '32', '31', '30', '29', '28', '27', '26', '25', '24', '23', '22', '21', '20', '19', '18', '17', '16', '15', '14', '13', '12', '11', '10'],
'5.5':['63', '62', '61', '60', '59', '58', '57', '56', '55', '54', '53', '52', '51', '50', '49', '48', '47', '46', '45', '44', '43', '42', '41', '40', '39', '38', '37', '36', '35', '34'],
} %}

{% set source_path = 'http://archive.mariadb.org/mariadb-' %}
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
