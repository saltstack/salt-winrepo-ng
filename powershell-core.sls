#PowerShell Core https://github.com/PowerShell/PowerShell

{% set SRC_PATH = 'https://github.com/PowerShell/PowerShell/releases/download/v' %}
{% set VERS = [
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
{% for VER in VERS%}
  {% set MAJ_VER = VER.split(".")[0] %}
  '{{ VER }}.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'PowerShell {{ MAJ_VER }}-x64'
    installer: '{{ SRC_PATH }}{{ VER }}/PowerShell-{{ VER }}-win-x64.msi'
    uninstaller: '{{ SRC_PATH }}{{ VER }}/PowerShell-{{ VER }}-win-x64.msi'
    {% else %}
    full_name: 'PowerShell {{ MAJ_VER }}-x86'
    installer: '{{ SRC_PATH }}{{ VER }}/PowerShell-{{ VER }}-win-x86.msi'
    uninstaller: '{{ SRC_PATH }}{{ VER }}/PowerShell-{{ VER }}-win-x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    reboot: False
{% endfor %}
