nextcloud-client:
{% for version in ['3.0.1', '3.0.0', '2.6.5', '2.6.4', '2.6.3', '2.6.2', '2.6.1', '2.6.0', '2.5.3', '2.5.2', '2.5.1', '2.5.0', '2.3.3.1', '2.3.2.1', '2.3.1.8', '2.2.4.2', '2.2.3.4'] %}
  '{{ version }}':
    full_name: 'Nextcloud'
    installer: 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-{{ version }}-setup.exe'
    install_flags: '/S'
    uninstaller: 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-{{ version }}-setup.exe'
    uninstall_flags: '/S'
    locale: en_US
    reboot: False
{% endfor %}
