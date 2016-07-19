pdf24creator:
  {% for version in ['7.9.0', '7.8.1'] %}
  '{{ version }}':
    full_name: 'PDF24 Creator'
    installer: 'http://en.pdf24.org/products/pdf-creator/download/pdf24-creator-{{ version }}.msi'
    install_flags: 'DESKTOPICONS=No FAXPRINTER=No /norestart /qn'
    uninstaller: 'http://en.pdf24.org/products/pdf-creator/download/pdf24-creator-{{ version }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
# Source: http://en.pdf24.org/
# Packagin info Source: https://chocolatey.org/packages/pdf24
