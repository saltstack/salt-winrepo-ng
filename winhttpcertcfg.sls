winhttpcertcfg:
  '5.2.3790.1060':
    full_name: 'Windows Resource Kit Tools - WinHttpCertCfg.exe'
    installer: 'http://download.microsoft.com/download/4/5/b/45bab62d-cdd8-42c7-85d0-0275b96db2c5/winhttpcertcfg.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'http://download.microsoft.com/download/4/5/b/45bab62d-cdd8-42c7-85d0-0275b96db2c5/winhttpcertcfg.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
