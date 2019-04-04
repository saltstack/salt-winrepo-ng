{% set versions = {'3.9':['0'], '3.8':['0'], '3.7':['0']} %}
{% set source_path = 'https://github.com/nunit/nunit-console/releases/download/' %}

nunit-console:
{% for major, subversions in versions.items() %}
{% for minor in subversions %}
  '{{ major }}.{{ minor }}':
    full_name: 'NUnit Console {{ major }}.{{ minor }}'
    {% if major.startswith('3.9') %}
    {% set majorsuffix = "v" ~ major %}
    {% else %}
    {% set majorsuffix = major %}
    {% endif %}
    installer: '{{ source_path }}{{ majorsuffix }}/NUnit.Console-{{ major }}.{{ minor }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: '{{ source_path }}{{ majorsuffix }}/NUnit.Console-{{ major }}.{{ minor }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    reboot: False
{% endfor %}
{% endfor %}
