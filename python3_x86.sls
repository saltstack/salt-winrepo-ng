python3_x86:
  '3.4.3150':
    full_name: 'Python 3.4.3'
    installer: 'https://www.python.org/ftp/python/3.4.3/python-3.4.3.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'https://www.python.org/ftp/python/3.4.3/python-3.4.3.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '3.4.2150':
    full_name: 'Python 3.4.2'
    installer: 'https://www.python.org/ftp/python/3.4.2/python-3.4.2.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'https://www.python.org/ftp/python/3.4.2/python-3.4.2.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '3.4.1150':
    full_name: 'Python 3.4.1'
    installer: 'https://www.python.org/ftp/python/3.4.1/python-3.4.1.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'https://www.python.org/ftp/python/3.4.1/python-3.4.1.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '3.3.3150':
    full_name: 'Python 3.3.3'
    installer: 'http://www.python.org/ftp/python/3.3.3/python-3.3.3.msi'
    install_flags: '/qn ALLUSERS=1 /norestart'
    uninstaller: 'http://www.python.org/ftp/python/3.3.3/python-3.3.3.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
