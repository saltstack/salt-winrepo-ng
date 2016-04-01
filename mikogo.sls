mikogo:
  '5.3.0':
    full_name: 'Mikogo'
    installer: 'http://download.mikogo4.com/mikogo-starter.exe'
    install_flags: '/S & taskkill /F /T /IM Mikogo-Screen-Service.exe & exit 0'
    uninstaller: '%AppData%\Mikogo\remover.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
