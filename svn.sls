svn:
  '1.8.13':
    full_name: 'Subversion'
    installer: 'http://sourceforge.net/projects/win32svn/files/1.8.13/Setup-Subversion-1.8.13.msi'
    install_flags: '/quiet'
    uninstaller: 'http://sourceforge.net/projects/win32svn/files/1.8.13/Setup-Subversion-1.8.13.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '1.8.11':
    full_name: 'Subversion'
    installer: 'http://sourceforge.net/projects/win32svn/files/1.8.11/Setup-Subversion-1.8.11.msi'
    install_flags: '/quiet'
    uninstaller: 'http://sourceforge.net/projects/win32svn/files/1.8.11/Setup-Subversion-1.8.11.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
