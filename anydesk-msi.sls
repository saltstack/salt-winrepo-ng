# just 32-bit x86 msi package available

{% set SOURCE_PATH = 'https://download.anydesk.com' %}

anydesk-msi:
  latest:
    full_name: 'AnyDesk MSI'
    installer: '{{ SOURCE_PATH }}/AnyDesk.msi'
    install_flags: '/qn /norestart'
    uninstaller: '{{ SOURCE_PATH }}/AnyDesk.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
