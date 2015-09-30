isapirewrite-lite:
  '3.1.0112':
    full_name: 'Helicon ISAPI_Rewrite 3 Lite'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://www.helicontech.com/download/isapi_rewrite/ISAPI_Rewrite3_0112_Lite_x64.msi'
    uninstaller: 'http://www.helicontech.com/download/isapi_rewrite/ISAPI_Rewrite3_0112_Lite_x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://www.helicontech.com/download/isapi_rewrite/ISAPI_Rewrite3_0112_Lite.msi'
    uninstaller: 'http://www.helicontech.com/download/isapi_rewrite/ISAPI_Rewrite3_0112_Lite.msi'
    {% endif %}
    install_flags: 'ALLUSERS=1 /quiet /norestart'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
