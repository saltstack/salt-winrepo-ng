owncloud:
  2.6.3.14058.13619:
    full_name: 'ownCloud'
    installer: 'https://download.owncloud.com/desktop/stable/ownCloud-2.6.3.14058.13619.msi'
    install_flags: '/S'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {84FE3CE4-1E1F-4CE7-9606-4DD7BF0AE35D} /norestart'
    msiexec: True
    locale: en_US
    reboot: False
