# Keepass 2.x installation from https://keepass.info/
# to keep the versioning in the format of "2.<version>.minor", two seperate version arrays are created.

{% set source_path = 'https://downloads.sourceforge.net/project/keepass' %}

{% set versions = [
  '2.00',
  '2.01', '2.02', '2.03', '2.04', '2.05', '2.06', '2.07', '2.08', '2.09', '2.10'
  '2.11', '2.12', '2.13', '2.14', '2.15', '2.16', '2.17', '2.18', '2.19', '2.20'
  '2.21', '2.22', '2.23', '2.24', '2.25', '2.26', '2.27', '2.28', '2.29', '2.30',
  '2.31', '2.32', '2.33', '2.34', '2.35', '2.36', '2.37', '2.38', '2.39', '2.40',
  '2.41', '2.42', '2.43', '2.44'
  '2.20.1', '2.39.1', '2.42.1',
] %}

keepass-2x:
{% for version in versions %}
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