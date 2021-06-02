# Installs the WMI Exporter used by prometheus to scrape metrics from windows based systems
# WMI Exporter: https://github.com/martinlindhe/wmi_exporter
# Prometheus Monitoring: https://prometheus.io/
# Hint: Since Version 0.13.0, the full_name has changed from "WMI Exporter" to "windows_exporter".
#    This causes the issue, that previous versions will just be updated, and still be named
#    "WMI Exporter". New installations are named "windows_exporter".

# full_name: WMI Exporter for new installations, updating existing installations 0.12.0 and lower are still named "WMI Exporter"
{% set newversions = [
                   '0.16.0',
                   '0.15.0',
                   '0.14.0',
                   '0.13.0'
] %}

# full_name: WMI Exporter
{% set legacyversions = [
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

# For new installations beginning 0.13.0
prometheus-wmi-exporter-new-naming:
{% for version in newversions %}
  '{{ version }}':
    full_name: 'windows_exporter'
    {% set package_arch = '386' %}
    {% if grains['cpuarch'] == 'AMD64' %}
      {% set package_arch = 'amd64' %}
    {% endif %}
    installer:   'https://github.com/prometheus-community/windows_exporter/releases/download/v{{version}}/windows_exporter-{{version}}-{{package_arch}}.msi'
    uninstaller: 'https://github.com/prometheus-community/windows_exporter/releases/download/v{{version}}/windows_exporter-{{version}}-{{package_arch}}.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}

# For updated installations from 0.12.0 and lower updated to 0.13.0 and later
prometheus-wmi-exporter-old-naming-new:
{% for version in newversions %}
  '{{ version }}':
    full_name: 'WMI Exporter'
    {% set package_arch = '386' %}
    {% if grains['cpuarch'] == 'AMD64' %}
      {% set package_arch = 'amd64' %}
    {% endif %}
    installer:   'https://github.com/prometheus-community/windows_exporter/releases/download/v{{version}}/windows_exporter-{{version}}-{{package_arch}}.msi'
    uninstaller: 'https://github.com/prometheus-community/windows_exporter/releases/download/v{{version}}/windows_exporter-{{version}}-{{package_arch}}.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}

# For existing installations 0.12.0 and below
prometheus-wmi-exporter-old-naming-legacy:
{% for version in legacyversions %}
  '{{ version }}':
    full_name: 'WMI Exporter'
    {% set package_arch = '386' %}
    {% if grains['cpuarch'] == 'AMD64' %}
      {% set package_arch = 'amd64' %}
    {% endif %}
    installer:   'https://github.com/prometheus-community/windows_exporter/releases/download/v{{version}}/wmi_exporter-{{version}}-{{package_arch}}.msi'
    uninstaller: 'https://github.com/prometheus-community/windows_exporter/releases/download/v{{version}}/wmi_exporter-{{version}}-{{package_arch}}.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
