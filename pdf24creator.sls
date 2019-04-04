pdf24creator:
  {% for version in ['8.5.0'] %}
  '{{ version }}':
    full_name: 'PDF24 Creator'
    installer: 'https://en.pdf24.org/products/pdf-creator/download/pdf24-creator-{{ version }}.msi'
    install_flags: 'DESKTOPICONS=No FAXPRINTER=No /norestart /qn'
    uninstaller: 'https://en.pdf24.org/products/pdf-creator/download/pdf24-creator-{{ version }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
# Source: https://en.pdf24.org/
# Packagin info Source: https://chocolatey.org/packages/pdf24
