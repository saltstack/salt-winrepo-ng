# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set versions = {'4.2':['3'], '4.0':[9], '3.0':[28]} %}
{% set source_path = 'https://www.zabbix.com/downloads/' %}

zabbix-agent:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{major}}.{{minor}}.2400':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Zabbix Agent (64-bit)'
    installer: '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-win-amd64-openssl.msi'
    uninstaller: '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-win-amd64-openssl.msi'
    {% else %}
    full_name: 'Zabbix Agent'
    installer: '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-win-i386-openssl.msi'
    uninstaller:  '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-win-i386-openssl.msi'
    {% endif %}
    install_flags: '/qn SERVER=localhost'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
