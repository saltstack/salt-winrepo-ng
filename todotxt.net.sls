todotxt.net:
  'Not Found':
    # both 32-bit (x86) AND a 64-bit (AMD64) installer available
    {% if grains['cpuarch'] == 'AMD64' %}
      {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
    {% elif grains['cpuarch'] == 'x86' %}
      {% set PROGRAM_FILES = "%ProgramFiles%" %}
    {% endif %}
    full_name: 'todotxt.net v3.2.0.0'
    installer: 'salt://win/repo-ng/todotxt.net/todotxt-setup-3.2.0.0.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\Hughesoft\todotxt.net\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
