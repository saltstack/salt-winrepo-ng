passware-kit-forensic:
  '13.1.7657':
    full_name: 'Passware Kit Forensic (64-bit)'
    installer: 'salt://win/repo-ng/passware-kit-forensic-13.1.7657/passware-kit-forensic-64bit.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'salt://win/repo-ng/passware-kit-forensic-13.1.7657/passware-kit-forensic-64bit.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
