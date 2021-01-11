#PowerShell Core https://github.com/PowerShell/PowerShell

{% set source_path = 'https://github.com/PowerShell/PowerShell/releases/download/v' %}
{% set versions = [
  '7.1.0',
  '7.0.3',
  '7.0.2',
  '7.0.1',
  '7.0.0',
  '6.2.7',
  '6.2.6',
  '6.2.5',
  '6.2.4',
  '6.2.3',
  '6.2.2',
  '6.2.1',
  '6.2.0',
  '6.1.6',
  '6.1.5',
  '6.1.4',
  '6.1.3',
  '6.1.2',
  '6.1.1',
  '6.1.0',
  '6.0.5',
  '6.0.4',
  '6.0.3',
  '6.0.2',
  '6.0.1',
  '6.0.0'
] %}

powershell-core:
  {% for version in ['6.1.3', '6.1.2', '6.1.1', '6.1.0', '6.0.5'] %}
  '{{ version }}.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'PowerShell 6-x64'
    installer: '{{ source_path }}{{ version }}/PowerShell-{{ version }}-win-x64.msi'
    uninstaller: '{{ source_path }}{{ version }}/PowerShell-{{ version }}-win-x64.msi'
    {% else %}
    full_name: 'PowerShell 6-x86'
    installer: '{{ source_path }}{{ version }}/PowerShell-{{ version }}-win-x86.msi'
    uninstaller: '{{ source_path }}{{ version }}/PowerShell-{{ version }}-win-x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    reboot: False
  {% endfor %}
