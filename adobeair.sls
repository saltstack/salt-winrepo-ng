adobeair:
  latest:
    full_name: 'Adobe AIR'
    installer: 'http://airdownload.adobe.com/air/win/download/20.0/AdobeAIRInstaller.exe'
    install_flags: '-silent -eulaAccepted'
    uninstaller: 'c:\salt\var\cache\salt\minion\extrn_files\base\airdownload.adobe.com\air\win\download\20.0\AdobeAIRInstaller.exe'
    uninstall_flags: '-uninstall'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '19.0.0.241':
    full_name: 'Adobe AIR'
    installer: 'http://airdownload.adobe.com/air/win/download/19.0/AdobeAIRInstaller.exe'
    install_flags: '-silent -eulaAccepted'
    uninstaller: 'c:\salt\var\cache\salt\minion\extrn_files\base\airdownload.adobe.com\air\win\download\19.0\AdobeAIRInstaller.exe'
    uninstall_flags: '-uninstall'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '18.0.0.199':
    full_name: 'Adobe AIR'
    installer: 'http://airdownload.adobe.com/air/win/download/18.0/AdobeAIRInstaller.exe'
    install_flags: '-silent -eulaAccepted'
    uninstaller: 'c:\salt\var\cache\salt\minion\extrn_files\base\airdownload.adobe.com\air\win\download\18.0\AdobeAIRInstaller.exe'
    uninstall_flags: '-uninstall'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
