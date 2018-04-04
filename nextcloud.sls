nextcloud:
  {% for version in ['2.3.3.1', '2.3.1.8', '2.3.2.1'] %}
  '{{ version }}':
    full_name: 'Nextcloud'
    installer: 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-{{ version }}-setup.exe'
    install_flags: '/S'
    uninstaller: 'C:\Program Files (x86)\Nextcloud\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}