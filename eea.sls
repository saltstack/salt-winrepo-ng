eea:
  '6.3.2016.0':
    full_name: 'ESET Endpoint Antivirus'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://download.eset.com/download/win/eea/eea_nt64_enu.msi'
    uninstaller: 'http://download.eset.com/download/win/eea/eea_nt64_enu.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://download.eset.com/download/win/eea/eea_nt32_enu.msi'
    uninstaller: 'http://download.eset.com/download/win/eea/eea_nt32_enu.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '6.2.2021.0':
    full_name: 'ESET Endpoint Antivirus'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/eea/v6/eea_nt64_enu.msi'
    uninstaller: 'salt://win/repo-ng/eea/v6/eea_nt64_enu.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/eea/v6/eea_nt32_enu.msi'
    uninstaller: 'salt://win/repo-ng/eea/v6/eea_nt32_enu.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '5.0.2254.0':
    full_name: 'ESET Endpoint Antivirus'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'salt://win/repo-ng/eea/v5/eea_nt64_enu.msi'
    uninstaller: 'salt://win/repo-ng/eea/v5/eea_nt64_enu.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'salt://win/repo-ng/eea/v5/eea_nt32_enu.msi'
    uninstaller: 'salt://win/repo-ng/eea/v5/eea_nt32_enu.msi'
    {% endif %}
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
