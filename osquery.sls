# Performant endpoint visibility https://osquery.io/

{% set source_path = 'https://osquery-packages.s3.amazonaws.com/windows/' %}

osquery:
  {% for version in ['3.3.2',
                     '3.3.0',
                     '3.2.6',
                     '3.2.4',
                     '2.11.2',] %}
  '{{ version }}':
    full_name: 'osquery'
    installer: '{{ source_path }}osquery-{{ version }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: '{{ source_path }}osquery-{{ version }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    reboot: False
  {% endfor %}
