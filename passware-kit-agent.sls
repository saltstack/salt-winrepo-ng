passware-kit-agent:
  '13.1.7657':
    full_name: 'Passware Kit Agent (64-bit)'
    installer: 'http://www.lostpassword.com/downloads/passware-kit-agent-64bit.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'http://www.lostpassword.com/downloads/passware-kit-agent-64bit.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
