nsclient:
  '0.4.4.19':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name:  'NSClient++ (x64)'
    installer: 'https://github.com/mickem/nscp/releases/download/0.4.4.19/NSCP-0.4.4.19-x64.msi'
    uninstaller: 'https://github.com/mickem/nscp/releases/download/0.4.4.19/NSCP-0.4.4.19-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name:  'NSClient++'
    installer: 'https://github.com/mickem/nscp/releases/download/0.4.4.19/NSCP-0.4.4.19-Win32.msi'
    uninstaller: 'https://github.com/mickem/nscp/releases/download/0.4.4.19/NSCP-0.4.4.19-Win32.msi'
    {% endif %}
    install_flags: '/quiet'
    uninstall_flags: '/quiet'
    msiexec: True
    locale: en_US
    reboot: False
  '0.4.3.143':
    # This client can be currently be downloaded from https://github.com/mickem/nscp/releases/download/0.4.3.143/NSCP-0.4.3.143-x64.msi
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name:  'NSClient++ (x64)'
    installer: 'salt://win/repo/nsclientpp/NSCP-0.4.3.143-x64.msi'
    uninstaller: 'salt://win/repo/nsclientpp/NSCP-0.4.3.143-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    # This client can be currently be downloaded from https://github.com/mickem/nscp/releases/download/0.4.3.143/NSCP-0.4.3.143-win32.msi
    full_name:  'NSClient++'
    installer: 'salt://win/repo/nsclientpp/NSCP-0.4.3.143-win32.msi'
    uninstaller: 'salt://win/repo/nsclientpp/NSCP-0.4.3.143-win32.msi'
    {% endif %}
    install_flags: '/quiet'
    uninstall_flags: '/quiet'
    msiexec: True
    locale: en_US
    reboot: False
  '0.4.3.88':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name:  'NSClient++ (x64)'
    installer: 'https://github.com/mickem/nscp/releases/download/0.4.3.88/NSCP-0.4.3.88-x64.msi'
    uninstaller: 'https://github.com/mickem/nscp/releases/download/0.4.3.88/NSCP-0.4.3.88-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name:  'NSClient++'
    installer: 'https://github.com/mickem/nscp/releases/download/0.4.3.88/NSCP-0.4.3.88-Win32.msi'
    uninstaller: 'https://github.com/mickem/nscp/releases/download/0.4.3.88/NSCP-0.4.3.88-Win32.msi'
    {% endif %}
    install_flags: '/quiet'
    uninstall_flags: '/quiet'
    msiexec: True
    locale: en_US
    reboot: False
  '0.3.9.328':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name:  'NSClient++ (x64)'
    installer: 'http://files.nsclient.org/0.3.x/NSClient%2B%2B-0.3.9-x64.msi'
    uninstaller: 'http://files.nsclient.org/0.3.x/NSClient%2B%2B-0.3.9-x64.msi'
    {% elif grains['cpuarch'] == 'x86' %}
    full_name:  'NSClient++'
    installer: 'http://files.nsclient.org/0.3.x/NSClient%2B%2B-0.3.9-Win32.msi'
    uninstaller: 'http://files.nsclient.org/0.3.x/NSClient%2B%2B-0.3.9-Win32.msi'
    {% endif %}
    install_flags: '/quiet'
    uninstall_flags: '/quiet'
    msiexec: True
    locale: en_US
    reboot: False
