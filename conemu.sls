conemu:
  '11.160.5290':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'ConEmu 160529.x64'
    install_flags: '/p:x64,adm /quiet /norestart'
    uninstall_flags: '/qn /x {A75DF0AD-CC78-48F5-8DEF-868A393CE9DF} /norestart'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'ConEmu 160529.x86'
    install_flags: '/p:x86,adm /quiet /norestart'
    uninstall_flags: '/qn /x {565674FD-3E5D-4234-8829-8B2EF7E88975} /norestart'
    {% endif %}
    installer: 'https://github.com/Maximus5/ConEmu/releases/download/v16.05.29/ConEmuSetup.160529.exe'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
