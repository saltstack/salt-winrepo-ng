{% set PROGRAM_FILES = "%ProgramFiles%" %}

filezilla:
  {% for version in ['3.40.0','3.39.0','3.38.1'] %}
  '{{ version }}':
    full_name: 'FileZilla Client {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.filezilla-project.org/client/FileZilla_{{ version }}_win64-setup.exe'
    {% else %}
    installer: 'https://download.filezilla-project.org/client/FileZilla_{{ version }}_win32-setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\FileZilla FTP Client\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
