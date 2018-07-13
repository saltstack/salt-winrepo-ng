nxlog:
  {% for version in ['2.10.2102',
                     '2.9.1716'] %}
  '{{ version }}':
    full_name:  'NXLog-CE'
    installer: 'https://nxlog.co/system/files/products/files/348/nxlog-ce-{{ version }}.msi'
    install_flags: '/quiet /norestart'
    uninstaller: 'https://nxlog.co/system/files/products/files/348/nxlog-ce-{{ version }}.msi'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}