atom:
  {% for version in ['1.23.3', '1.8.0', '1.7.3] %}
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
