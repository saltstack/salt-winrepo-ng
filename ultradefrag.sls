# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
ultradefrag:
  '7.0.2':
    full_name: 'Ultra Defragmenter'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://downloads.sourceforge.net/project/ultradefrag/stable-release/7.0.2/ultradefrag-7.0.2.bin.amd64.exe'
    {% else %}
    installer: 'https://downloads.sourceforge.net/project/ultradefrag/stable-release/7.0.2/ultradefrag-7.0.2.bin.i386.exe'
    {% endif %}
    install_flags: '/S /FULL=1'
    uninstaller: '{{ PROGRAM_FILES }}\UltraDefrag\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
