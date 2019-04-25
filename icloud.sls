icloud:
  '7.3.0.20':
    full_name: iCloud
    installer: 'https://secure-appldnld.apple.com/windows/091-43200-20180123-7D30C4B2-FFEC-11E7-A82F-B9BB7CCC33A9/iCloudSetup.exe'
    install_flags: '/qn /norestart'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {694E3E02-E14A-4BB2-A970-CF7F017FD5CC} /norestart'
    msiexec: False
    locale: en_US
    reboot: False
