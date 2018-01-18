icloud:
  '7.2.0.67':
    full_name: iCloud
    installer: 'http://appldnld.apple.com/windows/091-51900-20171213-3C2EC1AA-DE7F-11E7-A548-CC04219A6E60/iCloudSetup.exe'
    install_flags: '/qn /norestart'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {99868C9C-C141-4DDE-A2C7-9DDF00F68F17} /norestart'
    msiexec: False
    locale: en_US
    reboot: False
