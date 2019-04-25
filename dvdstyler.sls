# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
dvdstyler:
  'Not Found':
    full_name: 'DVDStyler v2.9.6'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://downloads.sourceforge.net/project/dvdstyler/dvdstyler/2.9.6/DVDStyler-2.9.6-win64.exe'
    {% else %}
    installer: 'https://downloads.sourceforge.net/project/dvdstyler/dvdstyler/2.9.6/DVDStyler-2.9.6-win32.exe'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\DVDStyler\unins000.exe'
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
