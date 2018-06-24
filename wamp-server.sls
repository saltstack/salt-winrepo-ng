wamp-server:
  'Not Found':
    full_name: 'WAMP Server 3.1.3'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://netix.dl.sourceforge.net/project/wampserver/WampServer%203/WampServer%203.0.0/wampserver3.1.3_x64.exe'
    {% else %}
    installer: 'https://netcologne.dl.sourceforge.net/project/wampserver/WampServer%203/WampServer%203.0.0/wampserver3.1.3_x86.exe'
    {% endif %}
    install_flags: '/S /VERYSILENT'
    uninstaller: 'c:\wamp\uninstall_services.bat'
    uninstall_flags: '& c:\wamp\unins000.exe /S /VERYSILENT'
    msiexec: False
    locale: en_US
    reboot: False

