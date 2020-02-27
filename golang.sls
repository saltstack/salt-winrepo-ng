# "Go is an open source programming language that makes it easy to build simple, reliable, and efficient software." - Google.
# See https://golang.org/

{% set source_path = 'https://dl.google.com/go' %}

{% set versions = [
  '1.2.2',
  '1.3', '1.3.1', '1.3.2', '1.3.3',
  '1.4', '1.4.1', '1.4.2', '1.4.3',
  '1.5', '1.5.1', '1.5.2', '1.5.3', '1.5.4',
  '1.6', '1.6.1', '1.6.2', '1.6.3', '1.6.4',
  '1.7', '1.7.1', '1.7.2', '1.7.3', '1.7.4', '1.7.5', '1.7.6',
  '1.8', '1.8.1', '1.8.2', '1.8.3', '1.8.4', '1.8.5', '1.8.6', '1.8.7',
  '1.9', '1.9.1', '1.9.2', '1.9.3', '1.9.4', '1.9.5', '1.9.6', '1.9.7',
  '1.10', '1.10.1', '1.10.2', '1.10.3', '1.10.4', '1.10.5', '1.10.6', '1.10.7', '1.10.8',
  '1.11', '1.11.1', '1.11.2', '1.11.3', '1.11.4', '1.11.5', '1.11.6', '1.11.7', '1.11.8', '1.11.9', '1.11.10', '1.11.11', '1.11.12', '1.11.13',
  '1.12', '1.12.1', '1.12.2', '1.12.3', '1.12.4', '1.12.5', '1.12.6', '1.12.7', '1.12.8', '1.12.9', '1.12.10', '1.12.11', '1.12.12', '1.12.13', '1.12.14', '1.12.15', '1.12.16', '1.12.17',
  '1.13', '1.13.1', '1.13.2', '1.13.3', '1.13.4', '1.13.5', '1.13.6', '1.13.7', '1.13.8',
  '1.14',
] %}

# Hint: the versionWithTrailingZero is required, because golang sets the version field in Windows to e.g. 1.14.0 or 1.13.0 if 1.14 or 1.13 is installed.
# If we dont do that the version can not be removed anymore via saltstack.

golang:
  {% for version in versions %}
  {% set versionWithTrailingZero = version + ".0" if version.split('.')|count == 2 else version %}
  '{{ versionWithTrailingZero }}':
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
