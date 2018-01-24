# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
  {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
  {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
spybot-anti-beacon:
  '1.6':
    full_name: 'Spybot Anti-Beacon'
    installer: 'https://download.spybot.info/AntiBeacon/SpybotAntiBeacon-1.6-setup.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\Spybot Anti-Beacon\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
