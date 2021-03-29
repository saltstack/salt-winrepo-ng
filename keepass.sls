# Keepass 1.x installation from https://keepass.info/
# to keep the versioning in the format of "1.<version>.minor", two seperate version arrays are created.

{% set source_path = 'https://downloads.sourceforge.net/project/keepass/KeePass%201.x' %}

# Hint: Version 1.26 is the first version that provides a msi-package, all versions before had a -Setup.exe
{% set versions = [
  '1.26', '1.27', '1.28', '1.29', '1.30','1.31','1.32','1.33','1.34','1.35','1.36','1.37','1.38','1.39'
] %}

keepass:
{% for version in versions %}
  {% set versionWithTrailingZero = version + ".0" if version.split('.')|count == 2 else version %}
  '{{ versionWithTrailingZero }}':
    full_name: 'KeePass {{ version }}'
    installer:   '{{ source_path }}/{{ version }}/KeePass-{{ version }}.msi'
    uninstaller: '{{ source_path }}/{{ version }}/KeePass-{{ version }}.msi'
    install_flags:   '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
{% endfor %}
