wamp-server-3:
  Not Found:
    full_name: 'WAMP Server 3'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://skylink.dl.sourceforge.net/project/wampserver/WampServer%203/WampServer%203.0.0/wampserver3_x64_apache2.4.17_mysql5.7.9_php5.6.16_php7.0.0.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://heanet.dl.sourceforge.net/project/wampserver/WampServer%203/WampServer%203.0.0/wampserver3_x86_apache2.4.17_mysql5.7.9_php5.6.15.exe'
    {% endif %}
    install_flags: '/S /VERYSILENT'
    uninstaller: 'c:\wamp\uninstall_services.bat'
    uninstall_flags: '& c:\wamp\unins000.exe /S /VERYSILENT'
    msiexec: False
    locale: en_US
    reboot: False
