# Source: https://code.google.com/p/tortoisegit/
tortoise-git:
  '1.8.13.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'TortoiseGit 1.8.13.0 (64 bit)'
    installer: 'https://download.tortoisegit.org/tgit/1.8.13.0/TortoiseGit-1.8.13.0-64bit.msi'
    uninstaller: 'https://download.tortoisegit.org/tgit/1.8.13.0/TortoiseGit-1.8.13.0-64bit.msi'
    {% else %}
    full_name: 'TortoiseGit 1.8.13.0 (32 bit)'
    installer: 'https://download.tortoisegit.org/tgit/1.8.13.0/TortoiseGit-1.8.13.0-32bit.msi'
    uninstaller: 'https://download.tortoisegit.org/tgit/1.8.13.0/TortoiseGit-1.8.13.0-32bit.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
