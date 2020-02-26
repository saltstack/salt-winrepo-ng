# Keepass 2.x installation from https://keepass.info/
# to keep the versioning in the format of "2.<version>.minor", two seperate version arrays are created.

keepass-2x:
{% for version in ['2.42.1', '2.39.1'] %}
  '{{ version }}':
    full_name: 'KeePass {{ version }}'
    installer: 'https://downloads.sourceforge.net/project/keepass/KeePass%202.x/{{ version }}/KeePass-{{ version }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'https://downloads.sourceforge.net/project/keepass/KeePass%202.x/{{ version }}/KeePass-{{ version }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
{% for version in ['2.44', '2.43', '2.42', '2.41', '2.40', '2.39', '2.38', '2.37', '2.36', '2.35', '2.34', '2.33', '2.32', '2.31', '2.30', '2.29'] %}
  '{{ version }}.0':
    full_name: 'KeePass {{ version }}'
    installer: 'https://downloads.sourceforge.net/project/keepass/KeePass%202.x/{{ version }}/KeePass-{{ version }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'https://downloads.sourceforge.net/project/keepass/KeePass%202.x/{{ version }}/KeePass-{{ version }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}