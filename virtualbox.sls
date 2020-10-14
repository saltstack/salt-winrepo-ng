# Version 5.1 and older are no longer supported by Oracle
# https://www.virtualbox.org/wiki/Download_Old_Builds

virtualbox:
  '6.1.14':
    full_name: 'Oracle VM VirtualBox 6.1.14'
    installer: 'https://download.virtualbox.org/virtualbox/6.1.14/VirtualBox-6.1.14-140239-Win.exe'
    install_flags: '--silent'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {F54088F3-18F9-4953-A0AA-0D3E788E33E4} /norestart'
    msiexec: False
    locale: en_US
    reboot: False
