texmaker:
  'Not Found':
    full_name: 'Texmaker 5.0.4 (64-bit)'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://www.xm1math.net/texmaker/assets/files/Texmaker_5.0.4_Win_x64.msi'
    install_flags: '/qn /norestart'
    {% endif %}
    uninstaller: 'msiexec'
    uninstall_flags: '/x {A0BF9BD0-B576-47A7-B650-0204CB190D28} /qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
