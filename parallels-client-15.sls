parallels-client-15:
  '15.0.3869':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Parallels Client-64 bit'  
    installer: 'https://download.parallels.com/ras/v15/15.0.5.3869/RASClient-x64-15.0.3869.msi'
    uninstaller: 'https://download.parallels.com/ras/v15/15.0.5.3869/RASClient-x64-15.0.3869.msi'
    {% else %}
    full_name: 'Parallels Client'  
    installer: 'https://download.parallels.com/ras/v15/15.0.5.3869/RASClient-15.0.3869.msi'
    uninstaller: 'https://download.parallels.com/ras/v15/15.0.5.3869/RASClient-15.0.3869.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
# The latest RAS clients can be downloaded for FREE from:
# https://www.parallels.com/uk/products/ras/download/links/
