{% set source_path = 'https://dl.google.com/go' %}

{% set versions = ['1.11.5', '1.10.8'] %}

golang:
  {% for version in versions %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Go Programming Language amd64 go{{ version }}'
    installer: '{{ source_path }}/go{{ version }}.windows-amd64.msi'
    uninstaller: '{{ source_path }}/go{{ version }}.windows-amd64.msi'
    {% else %}
    full_name: 'Go Programming Language 386 go{{ version }}'
    installer: '{{ source_path }}/go{{ version }}.windows-386.msi'
    uninstaller: '{{ source_path }}/go{{ version }}.windows-386.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
