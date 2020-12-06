pdf24creator:
  {% for version in ['10.0.4', '10.0.2', '9.2.2', '8.8.2', '8.8.1', '8.8.0', '8.7.2', '8.7.1', '8.7.0', '8.6.1', '8.6.0', '8.5.0'] %}
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
