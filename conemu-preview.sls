# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
conemu-preview:
  '11.150.8136':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'ConEmu 150813f.x64'
    installer: 'https://github.com/Maximus5/ConEmu/releases/download/v15.08.13f/ConEmuSetup.150813f.exe'
    install_flags: '/p:x64,adm /passive /qn /norestart'
    uninstall_flags: '/qn /x {FD26C53F-1736-4D7B-AC22-697A4846586F} /norestart'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'ConEmu 150813f.x86'
    installer: 'https://github.com/Maximus5/ConEmu/releases/download/v15.08.13f/ConEmuSetup.150813f.exe'
    install_flags: '/p:x86,adm /passive /qn /norestart'
    uninstall_flags: '/qn /x {0498F5D1-EE67-4C52-9DBD-B8CF5F329D86} /norestart'
    {% endif %}
    msiexec: False
    uninstaller: 'msiexec.exe'
    locale: en_US
    reboot: False
  '11.150.7050':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'ConEmu 150705.x64'
    installer: 'https://github.com/Maximus5/ConEmu/releases/download/v15.07.05/ConEmuSetup.150705.exe'
    install_flags: '/p:x64,adm /passive /qn /norestart'
    uninstall_flags: '/qn /x {DFB987EE-BA87-4D22-B55E-B9F87067AA19} /norestart'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'ConEmu 150705.x86'
    installer: 'https://github.com/Maximus5/ConEmu/releases/download/v15.07.05/ConEmuSetup.150705.exe'
    install_flags: '/p:x86,adm /passive /qn /norestart'
    uninstall_flags: '/qn /x {A6D3B1A7-F481-465C-BA61-99822A47D1C6} /norestart'
    {% endif %}
    msiexec: False
    uninstaller: 'msiexec.exe'
    locale: en_US
    reboot: False
