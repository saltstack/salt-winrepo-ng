# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
urlrewrite:
  '7.2.1952':
    full_name: 'IIS URL Rewrite Module 2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/C/9/E/C9E8180D-4E51-40A6-A9BF-776990D8BCA9/rewrite_amd64.msi'
    uninstaller: 'https://download.microsoft.com/download/C/9/E/C9E8180D-4E51-40A6-A9BF-776990D8BCA9/rewrite_amd64.msi'
    {% else %}
    installer: 'https://download.microsoft.com/download/5/4/9/54980B19-9C64-4E8E-A69C-615A88DFF8B7/rewrite_x86.msi'
    uninstaller: 'https://download.microsoft.com/download/5/4/9/54980B19-9C64-4E8E-A69C-615A88DFF8B7/rewrite_x86.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '7.2.1980':
    full_name: 'IIS URL Rewrite Module 2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi'
    uninstaller: 'https://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi'
    {% else %}
    installer: 'https://download.microsoft.com/download/6/8/F/68F82751-0644-49CD-934C-B52DF91765D1/rewrite_x86_en-US.msi'
    uninstaller: 'https://download.microsoft.com/download/6/8/F/68F82751-0644-49CD-934C-B52DF91765D1/rewrite_x86_en-US.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '7.2.1993':
    full_name: 'IIS URL Rewrite Module 2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/1/2/8/128E2E22-C1B9-44A4-BE2A-5859ED1D4592/rewrite_amd64_en-US.msi'
    uninstaller: 'https://download.microsoft.com/download/1/2/8/128E2E22-C1B9-44A4-BE2A-5859ED1D4592/rewrite_amd64_en-US.msi'
    {% else %}
    installer: 'https://download.microsoft.com/download/D/8/1/D81E5DD6-1ABB-46B0-9B4B-21894E18B77F/rewrite_x86_en-US.msi'
    uninstaller: 'https://download.microsoft.com/download/D/8/1/D81E5DD6-1ABB-46B0-9B4B-21894E18B77F/rewrite_x86_en-US.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False

