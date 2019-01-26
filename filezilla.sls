# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
filezilla:
  {% for version in ['3.40.0','3.39.0','3.38.1'] %}
  '{{ version }}':
    full_name: 'FileZilla Client {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://downloads.sourceforge.net/project/filezilla/FileZilla_Client/{{ version }}/FileZilla_{{ version }}_win64-setup.exe'
    {% else %}
    installer: 'https://downloads.sourceforge.net/project/filezilla/FileZilla_Client/{{ version }}/FileZilla_{{ version }}_win32-setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\FileZilla FTP Client\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
