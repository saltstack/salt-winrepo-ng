skype-msi:
  # new current versions of 8.x 
  {% for full_version, rel_version, version, build, guid  in (('8.68.0.96', '8.68.96', '8.68', '96', '{0B447F1C-97B5-4FE3-BE1D-D3CB831E4BE2}'), 
                                                              ('8.65.0.78', '8.65.78', '8.65', '78', '{8FCFFF11-79D7-4AB6-98E8-06013FE7CF89}'), 
                                                              ('8.63.0.76', '8.63.76', '8.63', '76', '{64F6F29F-C59A-4CF5-83EB-C1DB34B8C463}'), 
                                                              ('8.61.0.87', '8.61.87', '8.61', '87', '{0A904146-BD29-450B-8460-30C19948FD27}'), 
                                                              ('8.60.0.76', '8.60.76', '8.60', '76', '{8B163110-D657-43CC-8929-4F3C8756AB15}'), 
                                                              ('8.58.0.93', '8.58.93', '8.58', '93', '{F091C5BB-969D-4322-8369-20DD57B2E8F9}'), 
                                                              ('8.57.0.116', '8.57.116', '8.57', '116', '{D7CA7D65-B108-4DF4-85C8-B64EFBEB512D}')
                                  ) %}

  '{{ rel_version }}':
    full_name: 'Skype™ {{ version }}'
    installer: 'https://download.skype.com/s4l/download/win/Skype-{{ full_version }}.msi'
    install_flags: '/qn /norestart STARTSKYPE=FALSE TRANSFORMS=:RemoveDesktopShortcut.mst TRANSFORMS=:RemoveStartup.mst'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {{ guid }} /qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}

#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Skype that have had the installer assets removed by microsoft.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  
  {% for full_version, rel_version, version, build, guid  in (('7.41.0.101', '7.41.101', '7.41', '101', '{3B7E914A-93D5-4A29-92BB-AF8C3F66C431}'),
                                                              ('7.40.0.151', '7.40.151', '7.40', '151', '{3B7E914A-93D5-4A29-92BB-AF8C3F66C431}'), 
                                                              ('7.40.0.104', '7.40.104', '7.40', '104', '{3B7E914A-93D5-4A29-92BB-AF8C3F66C431}'), 
                                                              ('7.40.0.103', '7.40.103', '7.40', '103', '{3B7E914A-93D5-4A29-92BB-AF8C3F66C431}') 
                                               ) %}

  '{{ rel_version }}':
    skip_urltest: True
    full_name: 'Skype™ {{ version }}'
    #installer: 'https://download.skype.com/msi/SkypeSetup_{{ full_version }}.msi'
    #install_flags: '/qn /norestart STARTSKYPE=FALSE TRANSFORMS=:RemoveDesktopShortcut.mst TRANSFORMS=:RemoveStartup.mst'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {{ guid }} /qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False  
  {% endfor %}
#
#
# you can always get latest msi from:
# http://www.skype.com/go/getskype-msi (but version number keeps increasing)
#
# for explanation of silent switches read:
# http://community.skype.com/t5/Windows-archive/Unattended-install/td-p/184628
# you can also check microsite http://skype.techygeekshome.info/ 
#
