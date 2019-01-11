# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
nmap:
  '7.60':
    full_name: 'Nmap 7.60'
    installer: 'https://nmap.org/dist/nmap-7.60-setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Nmap\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
