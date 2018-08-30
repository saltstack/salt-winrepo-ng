wamp-server-3:
  '3.1.3':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Wampserver64 3.1.3'
    installer: 'https://iweb.dl.sourceforge.net/project/wampserver/WampServer%203/WampServer%203.0.0/wampserver3.1.3_x64.exe'
    uninstaller: 'c:\wamp64\uninstall_services.bat'
    uninstall_flags: '& c:\wamp64\unins000.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    {% else %}
    full_name: 'Wampserver 3.1.3'
    installer: 'https://iweb.dl.sourceforge.net/project/wampserver/WampServer%203/WampServer%203.0.0/wampserver3.1.3_x86.exe'
    uninstaller: 'c:\wamp\uninstall_services.bat'
    uninstall_flags: '& c:\wamp\unins000.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
