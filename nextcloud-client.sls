nextcloud-client:
  {% for version in ['2.2.3.4', '2.2.4.2', '2.3.1.8', '2.3.2.1', '2.3.3.1', '2.5.0', '2.5.1', '2.5.2', '2.5.3', '2.6.0'] %}
  '{{ version }}':
    full_name: 'Nextcloud Client {{ version }}'
    installer: 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-{{ version }}-setup.exe'
    install_flags: '/S'
    uninstaller: 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-{{ version }}-setup.exe'
    uninstall_flags: '/S'
    locale: en_US
    reboot: False
  {% endfor %}
