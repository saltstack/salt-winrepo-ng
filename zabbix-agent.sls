# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set versions = {'5.0':[1,2], '4.4':[1,2,3,4,5], '4.2':[3,4,5,6,7,8], '4.0':[9,10,11,12,13,14,15,16,17,18,19,20,21,22], '3.0':[26,27,28,29]} %}
{% set source_path = 'https://www.zabbix.com/downloads/' %}

zabbix-agent:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{major}}.{{minor}}.2400':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Zabbix Agent (64-bit)'
    installer: '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-windows-amd64-openssl.msi'
    uninstaller: '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-windows-amd64-openssl.msi'
    {% else %}
    full_name: 'Zabbix Agent'
    installer: '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-windows-i386-openssl.msi'
    uninstaller:  '{{source_path}}{{major}}.{{minor}}/zabbix_agent-{{major}}.{{minor}}-windows-i386-openssl.msi'
    {% endif %}
    install_flags: '/qn /norestart SERVER=localhost'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
