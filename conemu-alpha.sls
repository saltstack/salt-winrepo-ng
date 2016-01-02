# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
conemu-alpha:
  '11.151.2240':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'ConEmu 151224.x64'
    installer: 'https://github.com/Maximus5/ConEmu/releases/download/v15.12.24/ConEmuSetup.151224.exe'
    install_flags: '/p:x64,adm /passive /qn /norestart'
    uninstall_flags: '/qn /x {4DD9DBD2-7679-4EBF-A66F-3AD80DA0FCED} /norestart'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'ConEmu 151224.x86'
    installer: 'https://github.com/Maximus5/ConEmu/releases/download/v15.12.24/ConEmuSetup.151224.exe'
    install_flags: '/p:x86,adm /passive /qn /norestart'    
    uninstall_flags: '/qn /x {5C9FFE17-E9F2-4BD4-A8A7-94CB5D8FD1B2} /norestart'  
    {% endif %}
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
  '11.150.7160':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'ConEmu 150716.x64'
    installer: 'https://github.com/Maximus5/ConEmu/releases/download/v15.07.16/ConEmuSetup.150716.exe'
    install_flags: '/p:x64,adm /passive /qn /norestart'
    uninstall_flags: '/qn /x {522C1773-3088-46E4-B3D9-28ED86D841DA} /norestart'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'ConEmu 150716.x86'
    installer: 'https://github.com/Maximus5/ConEmu/releases/download/v15.07.16/ConEmuSetup.150716.exe'
    install_flags: '/p:x86,adm /passive /qn /norestart'    
    uninstall_flags: '/qn /x {2D45F5AB-DA52-4E4D-B8D0-D4795F57A93F} /norestart'  
    {% endif %}
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False    
