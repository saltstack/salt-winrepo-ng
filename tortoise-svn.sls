# Source: http://tortoisesvn.net/
tortoise-svn:
  '1.9.4.27285':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'TortoiseSVN 1.9.4.27285 (64 bit)'
    installer: 'http://netcologne.dl.sourceforge.net/project/tortoisesvn/1.9.4/Application/TortoiseSVN-1.9.4.27285-x64-svn-1.9.4.msi'
    uninstaller: 'http://netcologne.dl.sourceforge.net/project/tortoisesvn/1.9.4/Application/TortoiseSVN-1.9.4.27285-x64-svn-1.9.4.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'TortoiseSVN 1.9.4.27285 (32 bit)'
    installer: 'http://netcologne.dl.sourceforge.net/project/tortoisesvn/1.9.4/Application/TortoiseSVN-1.9.4.27285-win32-svn-1.9.4.msi'
    uninstaller: 'http://netcologne.dl.sourceforge.net/project/tortoisesvn/1.9.4/Application/TortoiseSVN-1.9.4.27285-win32-svn-1.9.4.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
