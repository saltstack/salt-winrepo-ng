# https://www.microsoft.com/openjdk
# dowload from aka.ms aliases i.e. https://aka.ms/download-jdk/microsoft-jdk-11.0.10.9-windows-x64.msi
#
{% set arch = 'x64' if grains['cpuarch'] == 'AMD64' else 'x86' %}
{% set source_path = 'https://aka.ms/download-jdk/' %}
#
microsoft-jdk:
  {% if grains['cpuarch'] == 'AMD64' %}
  {% for version, disp_version, guid in [('11.0.10.9', '11.0.10+9', '{8650B43A-3575-46E9-852B-47A35C3CA85B}')] %}
  '{{ version }}':
    full_name: 'Microsoft Build of OpenJDK with Hotspot {{ disp_version }} ({{ arch }})'
    installer:   '{{source_path}}/microsoft-jdk-{{ version }}-windows-{{ arch }}.msi'
    uninstaller: 'msiexec'
    install_flags:   '/qn /norestart'
    uninstall_flags: '/x {{ guid }} /qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
  {% endif %}
#
