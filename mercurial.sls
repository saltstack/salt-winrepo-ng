mercurial:
  '3.6.3':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Mercurial 3.6.3 (x64)'
    installer: 'https://mercurial-scm.org/release/windows/Mercurial-3.6.3-x64.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Mercurial 3.6.3 (x86)'
    installer: 'https://mercurial-scm.org/release/windows/Mercurial-3.6.3.exe'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- & reg ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\{4B95A5F1-EF59-4B08-BED8-C891C46121B3}_is1 /f /v DisplayVersion /d 3.6.3 & exit 0'
    uninstaller: '%ProgramFiles%\Mercurial\unins000.exe'
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
  '3.1.1':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Mercurial 3.1.1 (x64)'
    installer: 'http://mercurial.selenic.com/release/windows/mercurial-3.1.1-x64.msi'
    uninstaller: 'http://mercurial.selenic.com/release/windows/mercurial-3.1.1-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Mercurial 3.1.1 (x86)'
    installer: 'http://mercurial.selenic.com/release/windows/mercurial-3.1.1-x86.msi'
    uninstaller: 'http://mercurial.selenic.com/release/windows/mercurial-3.1.1-x86.msi'  
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
