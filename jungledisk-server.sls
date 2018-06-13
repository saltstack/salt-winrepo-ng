jungledisk-server:
  '3.23.0.2':
    full_name: 'Jungle Disk Server'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://downloads.jungledisk.com/jungledisk/JungleDiskServer64-3230.exe'
    uninstaller: 'https://downloads.jungledisk.com/jungledisk/JungleDiskServer64-3230.exe'
    install_flags: '/install /quiet /norestart /log jungledisk-server-64-3230.log'
    uninstall_flags: '/uninstall /quiet /norestart /log jungledisk-server-64-3230.log'
    {% else %}
    installer: 'https://downloads.jungledisk.com/jungledisk/JungleDiskServer-3230.exe'
    uninstaller: 'https://downloads.jungledisk.com/jungledisk/JungleDiskServer-3230.exe'
    install_flags: '/install /quiet /norestart /log jungledisk-server-3230.log'
    uninstall_flags: '/uninstall /quiet /norestart /log jungledisk-server-3230.log'
    {% endif %}    
    msiexec: False
    locale: en_US
    reboot: False
