internet-evidence-finder:
  '6.2.3.0001':
    full_name: 'Internet Evidence Finder'
    installer: 'salt://win/repo-ng/ief/IEFv623.0001setup.exe'
    install_flags: '/sp- /verysilent /norestart'
    uninstaller: 'salt://win/repo-ng/ief/IEFv623.0001setup.exe'
    uninstall_flags: '/verysilent /norestart'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
