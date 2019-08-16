# just 32-bit x86 installer available

{% set versions = {'6.9.0':['29768'], '6.8.3':['29107'], '6.8.2':['28974']} %}
{% set source_path = 'https://update.cyberduck.io/windows' %}

cyberduck:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{major}}.{{minor}}':
    full_name: 'Cyberduck'
    installer: '{{source_path}}/Cyberduck-Installer-{{major}}.{{minor}}.exe'
    uninstaller: '{{source_path}}/Cyberduck-Installer-{{major}}.{{minor}}.exe'
    install_flags: '/install /quiet'
    uninstall_flags: '/uninstall /quiet'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
{% endfor %}
