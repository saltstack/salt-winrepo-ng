# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
skype:
{% for version, file_version in [('8.66', '8.66.0.74'),
                                 ('8.34', '8.34.0.78'),
                                 ('8.32', '8.32.0.53'),
                                 ('8.31', '8.31.0.92'),
                                 ('8.30', '8.30.0.50'),
                                 ('8.29', '8.29.0.50'),
                                 ('8.25', '8.25.0.5'),
                                 ('8.23', '8.23.0.10'),
                                 ('8.20', '8.20.0.9'),
                                 ('8.19', '8.19.0.1'),
                                 ('8.17', '8.17.0.2'),
                                 ('8.15', '8.15.0.4'),
                                 ('8.12', '8.12.0.14'),
                                 ('8.10', '8.10.0.9')] %}
#
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
