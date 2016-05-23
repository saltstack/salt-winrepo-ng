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
  '5.0.2260.1':
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
#
# download from your closest eset server using your credentials and place into relevant version dir in salt://win/repo/eea/
# for Uk use http://www.eset.co.uk/Download/Software/Product/EAVB
