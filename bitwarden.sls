#
{% set PROGRAM_FILES = "%ProgramFiles%" %}

bitwarden:
  {% for version in ['1.25.1', '1.25.0', '1.24.6', '1.24.4', '1.24.1', '1.23.1', '1.23.0' ] %}
  '{{ version }}':
    full_name: 'Bitwarden'
    installer: 'https://github.com/bitwarden/desktop/releases/download/v{{ version }}/Bitwarden-Installer-{{ version }}.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Bitwarden\Uninstall Bitwarden.exe'
    uninstall_flags: '/allusers /S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
