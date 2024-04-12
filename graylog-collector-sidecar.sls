{%- load_yaml as versions %}
- 1.5.0
- 1.4.0
- 1.3.0
- 1.2.0
- 1.1.0
- 1.0.2
- 1.0.1
- 0.1.8
- 0.1.6
- 0.1.5
- 0.1.4
- 0.1.3
- 0.1.2
- 0.1.1
- 0.1.0
{%- endload %}

graylog-collector-sidecar:
  {% for version in versions %}
  '{{ version }}':
    {% if salt["pkg.compare_versions"](version, ">=", "1.0.0") -%}
    full_name: 'Graylog Sidecar'
    installer: 'https://github.com/Graylog2/collector-sidecar/releases/download/{{ version }}/graylog_sidecar_installer_{{ version }}-1.exe'
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\graylog\sidecar\uninstall.exe'
    uninstall_flags: '/S'
    {% else -%}
    full_name: 'Graylog Collector Sidecar'
    installer: 'https://github.com/Graylog2/collector-sidecar/releases/download/{{ version }}/collector_sidecar_installer_{{ version }}-1.exe'
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\graylog\collector-sidecar\uninstall.exe'
    uninstall_flags: '/S'
    {% endif %}
  {% endfor %}
