# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
snmptools:
  Not Found:
    full_name: 'SnmpTools 2'
    installer: 'http://erwan.labalec.fr/snmptools/snmptools32.exe'
    install_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    uninstaller: '{{ PROGRAM_FILES }}\SnmpTools\unins000.exe'
    uninstall_flags: '/SP- /VERYSILENT /NORESTART'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
