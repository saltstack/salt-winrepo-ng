steam:
  latest:
    full_name: 'Steam'
    installer: 'https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe'
    install_flags: '/S'
    uninstaller:
      {{ [
           salt.environ.get('ProgramFiles(x86)') if salt.grains.get('cpuarch') == 'AMD64' else
           salt.environ.get('ProgramFiles'),
           'Steam',
           'uninstaller.exe'
         ]|join('\\')|yaml_encode }}
    uninstall_flags: '/S'
    reboot: False
