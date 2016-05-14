libreoffice:
  '5.1.3.2':
    full_name: 'LibreOffice 5.1.3.2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.3/win/x86_64/LibreOffice_5.1.3_Win_x64.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.3/win/x86_64/LibreOffice_5.1.3_Win_x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.3/win/x86/LibreOffice_5.1.3_Win_x86.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.3/win/x86/LibreOffice_5.1.3_Win_x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '5.1.2.2':
    full_name: 'LibreOffice 5.1.2.2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.2/win/x86_64/LibreOffice_5.1.2_Win_x64.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.2/win/x86_64/LibreOffice_5.1.2_Win_x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.2/win/x86/LibreOffice_5.1.2_Win_x86.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.2/win/x86/LibreOffice_5.1.2_Win_x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '5.1.1.3':
    full_name: 'LibreOffice 5.1.1.3'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.1/win/x86_64/LibreOffice_5.1.1_Win_x64.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.1/win/x86_64/LibreOffice_5.1.1_Win_x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.1/win/x86/LibreOffice_5.1.1_Win_x86.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.1.1/win/x86/LibreOffice_5.1.1_Win_x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '5.0.4.2':
    full_name: 'LibreOffice 5.0.4.2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.0.4/win/x86_64/LibreOffice_5.0.4_Win_x64.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.0.4/win/x86_64/LibreOffice_5.0.4_Win_x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.0.4/win/x86/LibreOffice_5.0.4_Win_x86.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.0.4/win/x86/LibreOffice_5.0.4_Win_x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '5.0.0':
    full_name: 'LibreOffice 5.0.0'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.0.0/win/x86_64/LibreOffice_5.0.0_Win_x64.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.0.0/win/x86_64/LibreOffice_5.0.0_Win_x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.0.0/win/x86/LibreOffice_5.0.0_Win_x86.msi'
    uninstaller: 'http://mirror.catn.com/pub/tdf/libreoffice/stable/5.0.0/win/x86/LibreOffice_5.0.0_Win_x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
