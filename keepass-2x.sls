# Keepass 2.x installation from https://keepass.info/
# to keep the versioning in the format of "2.<version>.minor", two seperate version arrays are created.

{% set source_path = 'https://downloads.sourceforge.net/project/keepass/KeePass%202.x' %}

# Hint: Version 2.24 is the first version that provides a msi-package, all versions before had a -Setup.exe
{% set versions = [
  '2.24', '2.25', '2.26', '2.27', '2.28', '2.29', '2.30',
  '2.31', '2.32', '2.33', '2.34', '2.35', '2.36', '2.37', '2.38', '2.39', '2.40',
  '2.41', '2.42', '2.43', '2.44', '2.45', '2.46', '2.47',
  '2.39.1', '2.42.1',
] %}

keepass-2x:
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
# Keepass 2.x installation from https://keepass.info/
# to keep the versioning in the format of "2.<version>.minor", two seperate version arrays are created.

{% set source_path = 'https://downloads.sourceforge.net/project/keepass/KeePass%202.x' %}

# Hint: Version 2.24 is the first version that provides a msi-package, all versions before had a -Setup.exe
{% set versions = [
  '2.24', '2.25', '2.26', '2.27', '2.28', '2.29', '2.30',
  '2.31', '2.32', '2.33', '2.34', '2.35', '2.36', '2.37', '2.38', '2.39', '2.40',
  '2.41', '2.42', '2.43', '2.44', '2.45', '2.46', '2.47',
  '2.39.1', '2.42.1',
  '2.48', '2.48.1', '2.49', '2.50', '2.51', '2.51.1', '2.52',
  '2.53', '2.53.1', '2.54', '2.55', '2.56', '2.57', '2.57.1',
  '2.58', '2.59', '2.60', '2.61', '2.61.1', '2.62',
] %}

keepass-2x:
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
