python2_x64:
  '2.7.10150':
    full_name: 'Python 2.7.10 (64-bit)'
    installer: 'http://www.python.org/ftp/python/2.7.10/python-2.7.10.amd64.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'http://www.python.org/ftp/python/2.7.10/python-2.7.10.amd64.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '2.7.9150':
    full_name: 'Python 2.7.9 (64-bit)'
    installer: 'http://www.python.org/ftp/python/2.7.9/python-2.7.9.amd64.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'http://www.python.org/ftp/python/2.7.9/python-2.7.9.amd64.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '2.7.8150':
    full_name: 'Python 2.7.8 (64-bit)'
    installer: 'http://www.python.org/ftp/python/2.7.8/python-2.7.8.amd64.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'http://www.python.org/ftp/python/2.7.8/python-2.7.8.amd64.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '2.7.7150':
    full_name: 'Python 2.7.7 (64-bit)'
    installer: 'http://www.python.org/ftp/python/2.7.7/python-2.7.7.amd64.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'http://www.python.org/ftp/python/2.7.7/python-2.7.7.amd64.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '2.7.6150':
    full_name: 'Python 2.7.6 (64-bit)'
    installer: 'http://www.python.org/ftp/python/2.7.6/python-2.7.6.amd64.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'http://www.python.org/ftp/python/2.7.6/python-2.7.6.amd64.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
