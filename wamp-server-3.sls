wamp-server-3:
  '3.0.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Wampserver64 3.0.0'
    installer: 'http://skylink.dl.sourceforge.net/project/wampserver/WampServer%203/WampServer%203.0.0/wampserver3_x64_apache2.4.17_mysql5.7.9_php5.6.16_php7.0.0.exe'
    uninstaller: 'c:\wamp64\uninstall_services.bat'
    uninstall_flags: '& c:\wamp64\unins000.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Wampserver 3.0.0'
    installer: 'http://heanet.dl.sourceforge.net/project/wampserver/WampServer%203/WampServer%203.0.0/wampserver3_x86_apache2.4.17_mysql5.7.9_php5.6.15.exe'
    uninstaller: 'c:\wamp\uninstall_services.bat'
    uninstall_flags: '& c:\wamp\unins000.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
