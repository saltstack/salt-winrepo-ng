tightvnc:
  {% for version in ['2.8.59', '2.8.27', '2.8.23', '2.8.11', '2.8.8', '2.8.5', '2.8.2', '2.7.10'] %}
  {% set full_version = version ~ '.0' %}
  '{{ full_version }}':
    full_name: 'TightVNC'
    {% if version.startswith('2.8') %}
    {% set versionsuffix = version ~ "-gpl" %}
    {% else %}
    {% set versionsuffix = version %}
    {% endif %}
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://www.tightvnc.com/download/{{ version }}/tightvnc-{{ versionsuffix }}-setup-64bit.msi'
    uninstaller: 'https://www.tightvnc.com/download/{{ version }}/tightvnc-{{ versionsuffix }}-setup-64bit.msi'
    {% else %}
    installer: 'https://www.tightvnc.com/download/{{ version }}/tightvnc-{{ versionsuffix }}-setup-32bit.msi'
    uninstaller: 'https://www.tightvnc.com/download/{{ version }}/tightvnc-{{ versionsuffix }}-setup-32bit.msi'
    {% endif %}
    install_flags: '/quiet /norestart'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
