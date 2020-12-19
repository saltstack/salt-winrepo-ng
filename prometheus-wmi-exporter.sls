# Installs the WMI Exporter used by prometheus to scrape metrics from windows based systems
# WMI Exporter: https://github.com/martinlindhe/wmi_exporter
# Prometheus Monitoring: https://prometheus.io/

{% set versions = [
                   '0.14.0',
                   '0.13.0',
                   '0.12.0',
                   '0.11.1',
                   '0.11.0',
                   '0.10.2',
                   '0.10.1',
                   '0.10.0',
                   '0.9.0',
                   '0.8.3',
                   '0.8.1',
                   '0.8.0',
                   '0.7.0',
                   '0.6.0',
                   '0.5.0',
                   '0.4.4',
                   '0.4.3',
                   '0.4.2',
                   '0.4.1',
                   '0.4.0',
                   '0.3.3',
                   '0.3.2',
                   '0.3.1',
                   '0.3.0'
] %}


prometheus-wmi-exporter:
{% for version in versions %}
  '{{ version }}':
    full_name: 'WMI Exporter'
    {% set package_arch = '386' %}
    {% if grains['cpuarch'] == 'AMD64' %}
      {% set package_arch = 'amd64' %}
    {% endif %}
    {% set package_name = 'wmi_exporter' %}
    {% if salt.pkg_resource.version_compare(version, '>=', '0.13.0') %}
      {% set package_name = 'windows_exporter' %}
    {% endif %}
    installer:   'https://github.com/prometheus-community/windows_exporter/releases/download/v{{version}}/{{package_name}}-{{version}}-{{package_arch}}.msi'
    uninstaller: 'https://github.com/prometheus-community/windows_exporter/releases/download/v{{version}}/{{package_name}}-{{version}}-{{package_arch}}.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
