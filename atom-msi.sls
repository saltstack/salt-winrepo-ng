{% set versions = ['1.23.3', '1.8.0', '1.7.3'] %}
atom-msi:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Atom Machine-Wide Installer'
    installer: 'https://github.com/atom/atom/releases/download/v{{ version }}/AtomSetup.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'https://github.com/atom/atom/releases/download/v{{ version }}/AtomSetup.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}
