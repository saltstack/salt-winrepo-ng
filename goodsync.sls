goodsync: 
  '9.9.41.7':
    full_name: 'GoodSync'
    installer: 'https://www.goodsync.com/download/GoodSync-Setup.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'https://www.goodsync.com/download/GoodSync-Setup.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
