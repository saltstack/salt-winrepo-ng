# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
stunnel:
  '5.30':
    full_name: 'stunnel installed for AllUsers'
    installer: 'https://www.stunnel.org/downloads/archive/5.x/stunnel-5.30-installer.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\stunnel\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
