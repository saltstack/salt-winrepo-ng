virtualbox:
  '5.0.20':
    full_name: 'Oracle VM VirtualBox 5.0.20'
    installer: 'http://download.virtualbox.org/virtualbox/5.0.20/VirtualBox-5.0.20-106931-Win.exe'
    install_flags: '--silent'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {8209969B-9A31-4021-B0D8-E6F719F7F995} /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  '4.3.28':
    full_name: 'Virtualbox 4.3.28'
    installer: 'http://download.virtualbox.org/virtualbox/4.3.28/VirtualBox-4.3.28-100309-Win.exe'
    install_flags: '--silent'
    uninstaller: 'msiexec.exe'
    uninstall_flags: '/qn /x {E8BB81BC-E67C-4750-84EE-128DA5A7ADA5} /norestart'
    msiexec: False
    locale: en_US
    reboot: False