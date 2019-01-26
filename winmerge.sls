{% set version = '2.16.0' %}

{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}

winmerge:
  '{{version}}':
    full_name: 'WinMerge {{version}}'
    installer: 'https://downloads.sourceforge.net/project/winmerge/stable/{{version}}/WinMerge-{{version}}-Setup.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\WinMerge\unins000.exe'
    uninstall_flags: '/SP- /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
