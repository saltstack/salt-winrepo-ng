# just 32-bit x86 installer available

{% set versions = {'6.9.0':['29768'], '6.8.3':['29107'], '6.8.2':['28974']} %}
{% set source_path = 'https://update.cyberduck.io/windows' %}

cyberduck-msi:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{major}}.{{minor}}':
    full_name: 'Cyberduck'
    installer: '{{source_path}}/Cyberduck-Installer-{{major}}.{{minor}}.msi'
    uninstaller: '{{source_path}}/Cyberduck-Installer-{{major}}.{{minor}}.msi'
    install_flags: '/qn'
    uninstall_flags: '/qn'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
