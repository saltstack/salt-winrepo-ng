{% set versions = ['1.53.0', '1.52.0', '1.28.0', '1.27.2', '1.27.1', '1.23.3', '1.8.0', '1.7.3'] %}
atom:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Atom'
    installer: 'https://github.com/atom/atom/releases/download/v{{ version }}/AtomSetup.exe'
    install_flags: '--machine'
    uninstaller: '%AppData%\Local\atom\Update.exe'
    uninstall_flags: '--uninstall'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
