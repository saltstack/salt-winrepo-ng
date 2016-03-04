# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
filezilla:
  '3.16.0':
    full_name: 'FileZilla Client 3.16.0'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://netcologne.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.16.0/FileZilla_3.16.0_win64-setup.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://vorboss.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.16.0/FileZilla_3.16.0_win32-setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\FileZilla FTP Client\uninstall.exe' 
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '3.14.1':
    full_name: 'FileZilla Client 3.14.1'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://netcologne.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.14.1/FileZilla_3.14.1_win64-setup.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://vorboss.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.14.1/FileZilla_3.14.1_win32-setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\FileZilla FTP Client\uninstall.exe' 
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '3.14.0':
    full_name: 'FileZilla Client 3.14.0'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://netcologne.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.14.0/FileZilla_3.14.0_win64-setup.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://vorboss.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.14.0/FileZilla_3.14.0_win32-setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\FileZilla FTP Client\uninstall.exe' 
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '3.13.0':
    full_name: 'FileZilla Client 3.13.0'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://heanet.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.13.0/FileZilla_3.13.0_win64-setup.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://heanet.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.13.0/FileZilla_3.13.0_win32-setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\FileZilla FTP Client\uninstall.exe' 
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '3.11.0.2':
    full_name: 'FileZilla Client 3.11.0.2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://heanet.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.11.0.2/FileZilla_3.11.0.2_win64-setup.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://heanet.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.11.0.2/FileZilla_3.11.0.2_win32-setup.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\FileZilla FTP Client\uninstall.exe' 
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
