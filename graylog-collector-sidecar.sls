{% set versions = ['0.1.6', '0.1.5', '0.1.4', '0.1.3', '0.1.2', '0.1.1', '0.1.0'] %}

graylog-collector-sidecar:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Graylog Collector Sidecar'
    installer: 'https://github.com/Graylog2/collector-sidecar/releases/download/{{ version }}/collector_sidecar_installer_{{ version }}-1.exe'
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\graylog\collector-sidecar\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
