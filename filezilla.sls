# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
filezilla:
  {% for version in ['3.34.0','3.31.0','3.29.0','3.24.0','3.23.0.2','3.22.2.2','3.22.1','3.22.0','3.21.0','3.16.0'] %}
  '{{ version }}':
    full_name: 'FileZilla Client {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://iweb.dl.sourceforge.net/project/filezilla/FileZilla_Client/{{ version }}/FileZilla_{{ version }}_win64-setup.exe'
    {% else %}
    installer: 'http://iweb.dl.sourceforge.net/project/filezilla/FileZilla_Client/{{ version }}/FileZilla_{{ version }}_win32-setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\FileZilla FTP Client\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
