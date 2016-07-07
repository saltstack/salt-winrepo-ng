# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
urlrewrite:
  '7.2.1952':
    full_name: 'IIS URL Rewrite Module 2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://download.microsoft.com/download/C/9/E/C9E8180D-4E51-40A6-A9BF-776990D8BCA9/rewrite_amd64.msi'
    uninstaller: 'http://download.microsoft.com/download/C/9/E/C9E8180D-4E51-40A6-A9BF-776990D8BCA9/rewrite_amd64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://download.microsoft.com/download/5/4/9/54980B19-9C64-4E8E-A69C-615A88DFF8B7/rewrite_x86.msi'
    uninstaller: 'http://download.microsoft.com/download/5/4/9/54980B19-9C64-4E8E-A69C-615A88DFF8B7/rewrite_x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '7.1.0490.43':
    full_name: 'Microsoft URL Rewrite Module 1.1 for IIS 7'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://download.microsoft.com/download/0/3/E/03EBE3E1-494A-4DC7-B04B-F2B0A35FA988/rewrite_1.1_amd64_en-US.msi'
    uninstaller: 'http://download.microsoft.com/download/0/3/E/03EBE3E1-494A-4DC7-B04B-F2B0A35FA988/rewrite_1.1_amd64_en-US.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'http://download.microsoft.com/download/0/4/D/04DF5782-1A23-41FF-82CE-B59426A06472/rewrite_1.1_x86_en-US.msi'
    uninstaller: 'http://download.microsoft.com/download/0/4/D/04DF5782-1A23-41FF-82CE-B59426A06472/rewrite_1.1_x86_en-US.msi'
    {% endif %}
    install_flags: '/quiet /norestart'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
