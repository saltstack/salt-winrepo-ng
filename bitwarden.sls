#
{% set PROGRAM_FILES = "%ProgramFiles%" %}

bitwarden:
  {% for version in ['1.33.0', '1.32.1', '1.32.0', '1.31.3', '1.31.2', '1.31.1', '1.30.0', '1.29.1', '1.28.3', '1.28.2', '1.28.1', '1.28.0', '1.27.1', '1.27.0', '1.26.5', '1.26.4', '1.26.3', '1.26.2', '1.26.1', '1.26.0', '1.25.1', '1.25.0', '1.24.6', '1.24.4', '1.24.1', '1.23.1', '1.23.0' ] %}
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
