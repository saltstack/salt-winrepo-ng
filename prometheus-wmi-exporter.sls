# Installs the WMI Exporter used by prometheus to scrape metrics from windows based systems
# WMI Exporter: https://github.com/martinlindhe/wmi_exporter
# Prometheus Monitoring: https://prometheus.io/

prometheus-wmi-exporter:
{% for version in ['0.9.0', '0.8.3', '0.8.1', '0.8.0', '0.7.0', '0.6.0', '0.5.0', '0.4.4', '0.4.3', '0.4.2', '0.4.1', '0.4.0', '0.3.3', '0.3.2', '0.3.1', '0.3.0'] %}
  '{{ version }}':
    full_name: 'WMI Exporter'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer:   'https://github.com/martinlindhe/wmi_exporter/releases/download/v{{version}}/wmi_exporter-{{version}}-amd64.msi'
    uninstaller: 'https://github.com/martinlindhe/wmi_exporter/releases/download/v{{version}}/wmi_exporter-{{version}}-amd64.msi'
    {% else %}
    installer:   'https://github.com/martinlindhe/wmi_exporter/releases/download/v{{version}}/wmi_exporter-{{version}}-386.msi'
    uninstaller: 'https://github.com/martinlindhe/wmi_exporter/releases/download/v{{version}}/wmi_exporter-{{version}}-386.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
