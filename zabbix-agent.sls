# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set versions = {'4.2':['3'], '4.0':[9], '3.0':[28]} %}
{% set source_path = 'https://www.zabbix.com/downloads/' %}

zabbix-agent:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{major}}.{{minor}}.2400':
    full_name: 'Zabbix Agent (64-bit)'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-win-amd64-openssl.msi'
    uninstall_flags: '/x {{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-win-amd64-openssl.msi /quiet'
    {% else %}
    installer: '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-win-i386-openssl.msi'
    uninstall_flags: '/x {{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-win-i386-openssl.msi /quiet'
    {% endif %}
    install_flags: '/quiet SERVER=localhost'
    uninstaller: 'msiexec.exe'
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
