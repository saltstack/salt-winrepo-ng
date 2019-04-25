# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
# Source: http://software.informer.com/
software-informer:
  'Not Found':
    full_name: 'Software Informer'
    installer: 'https://files.informer.com/siinst.exe'
    install_flags: '/SP- /VERYSILENT /NORESTART /SUPPRESSMSGBOXES'
    uninstaller: '{{ PROGRAM_FILES }}\Software Informer\unins000.exe'
    uninstall_flags: '/SP- /VERYSILENT /NORESTART /SUPPRESSMSGBOXES'
    msiexec: False
    locale: en_US
    reboot: False
