mbsa:
  '2.3.2211':
    full_name: 'Microsoft Baseline Security Analyzer 2.3'
    installer: 'http://salt/packages/MBSASetup-x64-EN.msi'
    uninstaller: 'http://salt/packages/MBSASetup-x64-EN.msi'
    # installer: 'https://download.microsoft.com/download/8/E/1/8E16A4C7-DD28-4368-A83A-282C82FC212A/MBSASetup-x64-EN.msi'
    # uninstaller: 'https://download.microsoft.com/download/8/E/1/8E16A4C7-DD28-4368-A83A-282C82FC212A/MBSASetup-x64-EN.msi'
    install_flags: '/q'
    uninstall_flags: '/q'
    msiexec: True
    locale: en_US
    reboot: False
