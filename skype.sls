{% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% for version, file_version in [('8.25', '8.25.0.5')] %}
skype:
  '{{ version }}':
    full_name: 'Skype version {{ version }}'
    installer: 'https://endpoint920510.azureedge.net/s4l/s4l/download/win/Skype-{{ file_version }}.exe'
    install_flags: '/SILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\Microsoft\Skype for Desktop\unins000.exe'
    uninstall_flags: '/SILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
