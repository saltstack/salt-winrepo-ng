# FileZilla has changed their download URLs
# due to winrepo installer limitations you need to manually download the 86x + x64 installer from
# https://filezilla-project.org/download.php?show_all=1
# and put it on the winrepo on master to install it the 'salt://win/repo-ng/filezilla/...

{% set version = '3.40.0' %}
{% set PROGRAM_FILES = "%ProgramFiles%" %}

filezilla:
  '{{ version }}':
    full_name: 'FileZilla Client {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/filezilla/FileZilla_{{ version }}_win64-setup.exe'
    {% else %}
    installer: 'salt://win/repo-ng/filezilla/FileZilla_{{ version }}_win32-setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\FileZilla FTP Client\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
