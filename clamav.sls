clamav:
  '0.99.1':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'ClamAV-x64'
    # Official download link - https://www.clamav.net/downloads/production/clamav-0.99.1-x64.msi
    installer: 'salt://win/repo-ng/clamav/clamav-0.99.1-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'ClamAV'
    # Official download link - https://www.clamav.net/downloads/production/clamav-0.99.1-win32.msi
    installer: 'salt://win/repo-ng/clamav/clamav-0.99.1-win32.msi'
    {% endif %}
    install_flags: '/qr'
    locale: en_US
    reboot: False
    msiexec: True
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {66A7538D-C6C2-431D-A62F-BAD564FA4F6B}'
  '0.98.7':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'ClamAV-x64'
    # Official download link - https://www.clamav.net/downloads/production/clamav-0.98.7-x64.msi
    installer: 'salt://win/repo-ng/clamav/clamav-0.98.7-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'ClamAV'
    # Official download link - https://www.clamav.net/downloads/production/clamav-0.98.7-win32.msi
    installer: 'salt://win/repo-ng/clamav/clamav-0.98.7-win32.msi'
    {% endif %}
    install_flags: '/qr'
    locale: en_US
    reboot: False
    msiexec: True
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {66A7538D-C6C2-431D-A62F-BAD564FA4F6B}'
