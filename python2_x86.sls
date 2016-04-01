python2_x86:
  '2.7.10150':
    full_name: 'Python 2.7.10'
    installer: 'http://www.python.org/ftp/python/2.7.10/python-2.7.10.msi'
    install_flags: '/qn /norestart ALLUSERS=1'
    uninstaller: 'http://www.python.org/ftp/python/2.7.10/python-2.7.10.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '2.7.9150':
    full_name: 'Python 2.7.9'
    installer: 'http://www.python.org/ftp/python/2.7.9/python-2.7.9.msi'
    install_flags: '/qn /norestart ALLUSERS=1'
    uninstaller: 'http://www.python.org/ftp/python/2.7.9/python-2.7.9.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '2.7.8150':
    full_name: 'Python 2.7.8'
    installer: 'http://www.python.org/ftp/python/2.7.8/python-2.7.8.msi'
    install_flags: '/qn /norestart ALLUSERS=1'
    uninstaller: 'http://www.python.org/ftp/python/2.7.8/python-2.7.8.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '2.7.7150':
    full_name: 'Python 2.7.7'
    installer: 'http://www.python.org/ftp/python/2.7.7/python-2.7.7.msi'
    install_flags: '/qn /norestart ALLUSERS=1'
    uninstaller: 'http://www.python.org/ftp/python/2.7.7/python-2.7.7.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '2.7.6150':
    full_name: 'Python 2.7.6'
    installer: 'http://www.python.org/ftp/python/2.7.6/python-2.7.6.msi'
    install_flags: '/qn /norestart ALLUSERS=1'
    uninstaller: 'http://www.python.org/ftp/python/2.7.6/python-2.7.6.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
