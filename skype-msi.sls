skype-msi:
  '7.44.40':
    full_name: 'Skype™ 7.44'
    installer: 'http://download.skype.com/msi/SkypeSetup_7.44.0.40.msi'
    install_flags: '/qn /norestart STARTSKYPE=FALSE TRANSFORMS=:RemoveDesktopShortcut.mst TRANSFORMS=:RemoveStartup.mst'
    uninstaller: 'http://download.skype.com/msi/SkypeSetup_7.44.0.40.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '7.41.101':
    full_name: 'Skype™ 7.41'
    installer: 'http://download.skype.com/msi/SkypeSetup_7.41.0.101.msi'
    install_flags: '/qn /norestart STARTSKYPE=FALSE TRANSFORMS=:RemoveDesktopShortcut.mst TRANSFORMS=:RemoveStartup.mst'
    uninstaller: 'http://download.skype.com/msi/SkypeSetup_7.41.0.101.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '7.40.151':
    full_name: 'Skype™ 7.40'
    installer: 'http://download.skype.com/msi/SkypeSetup_7.40.0.151.msi'
    install_flags: '/qn /norestart STARTSKYPE=FALSE TRANSFORMS=:RemoveDesktopShortcut.mst TRANSFORMS=:RemoveStartup.mst'
    uninstaller: 'http://download.skype.com/msi/SkypeSetup_7.40.0.151.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  '7.40.103':
    full_name: 'Skype™ 7.40'
    installer: 'http://download.skype.com/msi/SkypeSetup_7.40.0.103.msi'
    install_flags: '/qn /norestart STARTSKYPE=FALSE TRANSFORMS=:RemoveDesktopShortcut.mst TRANSFORMS=:RemoveStartup.mst'
    uninstaller: 'http://download.skype.com/msi/SkypeSetup_7.40.0.103.msi'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
# you can always get latest msi from:
# http://www.skype.com/go/getskype-msi (but version number keeps increasing)
#
# for explanation of silent switches read:
# http://community.skype.com/t5/Windows-archive/Unattended-install/td-p/184628
# you can also check microsite http://skype.techygeekshome.info/
