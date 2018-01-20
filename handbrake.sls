# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
# Source: https://handbrake.fr
handbrake:
  '0.10.5':
    full_name: 'Handbrake 0.10.5'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://download.handbrake.fr/handbrake/releases/0.10.5/HandBrake-0.10.5-x86_64-Win_GUI-1.exe'
    {% else %}
    installer: 'https://handbrake.fr/mirror/HandBrake-0.10.5-i686-Win_GUI-1.exe'
    {% endif %}
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Handbrake\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
