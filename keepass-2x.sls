# Keepass 2.x installation from https://keepass.info/
# to keep the versioning in the format of "2.<version>.minor", two seperate version arrays are created.

{% set source_path = 'https://downloads.sourceforge.net/project/keepass' %}

keepass-2x:
{% for version in ['2.44', '2.43', '2.42', '2.42.1', '2.41', '2.40', '2.39.1', '2.39', '2.38', '2.37', '2.36', '2.35', '2.34', '2.33', '2.32', '2.31', '2.30', '2.29'] %}
  {% set versionWithTrailingZero = version + ".0" if version.split('.')|count == 2 else version %}
  '{{ versionWithTrailingZero }}':
    full_name: 'KeePass {{ version }}'
    installer: '{{ source_path }}/KeePass%202.x/{{ version }}/KeePass-{{ version }}.msi'
    install_flags: '/qn /norestart'
    uninstaller: '{{ source_path }}/KeePass%202.x/{{ version }}/KeePass-{{ version }}.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}