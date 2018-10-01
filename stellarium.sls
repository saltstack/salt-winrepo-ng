# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
stellarium:
  '0.16.1':
    full_name: 'Stellarium 0.16.1'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://downloads.sourceforge.net/project/stellarium/Stellarium-win64/0.16.1/stellarium-0.16.1-win64.exe'
    {% else %}
    installer: 'https://downloads.sourceforge.net/project/stellarium/Stellarium-win32/0.16.1/stellarium-0.16.1-win32.exe'
    {% endif %}
    install_flags: '/silent'
    uninstaller: '{{ PROGRAM_FILES }}\Stellarium\unins000.exe'
    uninstall_flags: '/silent'
    msiexec: False
    locale: en_US
    reboot: False
