libreoffice:
  '5.2.7.2':
    full_name: 'LibreOffice 5.2.7'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.2.7/win/x86_64/LibreOffice_5.2.7_Win_x64.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.2.7/win/x86_64/LibreOffice_5.2.7_Win_x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.2.7/win/x86/LibreOffice_5.2.7_Win_x86.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.2.7/win/x86/LibreOffice_5.2.7_Win_x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
