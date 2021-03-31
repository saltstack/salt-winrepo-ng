#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Remote Desktop Connection Manager that have had the installer assets removed from active web.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rdcman:
  '2.7.14060':
    skip_urltest: True
    full_name:  'Remote Desktop Connection Manager'
    # web.archive.org has an archive copy of the item
    #installer: 'https://web.archive.org/web/20181202080244/https://download.microsoft.com/download/A/F/0/AF0071F3-B198-4A35-AA90-C68D103BDCCF/rdcman.msi'
    install_flags: 'ALLUSERS=1 /quiet /norestart'
    #uninstaller: 'https://web.archive.org/web/20181202080244/https://download.microsoft.com/download/A/F/0/AF0071F3-B198-4A35-AA90-C68D103BDCCF/rdcman.msi'
    # web.archive.org has an archive copy of the item
    uninstaller: 'msiexec'
    uninstall_flags: '/qn /x {734A483B-D20F-4082-9595-577B5E0555C0} /norestart'
    msiexec: True
    locale: en_US
    reboot: False
