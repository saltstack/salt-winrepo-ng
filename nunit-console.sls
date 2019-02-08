{% set versions = {'3.9':['0']} %}
{% set source_path = 'https://github.com/nunit/nunit-console/releases/download/v' %}

nunit-console:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{ major }}.{{ minor }}':
    full_name: 'NUnit Console {{ major }}.{{ minor }}'
    installer: '{{ source_path }}{{ major }}/NUnit.Console-{{ major }}.{{ minor }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: '{{ source_path }}{{ major }}/NUnit.Console-{{ major }}.{{ minor }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    reboot: False
{% endfor %}
{% endfor %}
