
todour:
  '2.03':
    # both 32-bit (x86) AND a 64-bit (AMD64) installer available
    {% if grains['cpuarch'] == 'AMD64' %}
      {% set PROGRAM_FILES = "%ProgramFiles%" %}
    {% elif grains['cpuarch'] == 'x86' %}
      {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
    {% endif %}
    full_name: 'Todour version 2.03'
    installer: 'http://nerdur.com/Todour-2.03.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\Todour\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
