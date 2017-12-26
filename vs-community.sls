vs-community:
  15.5.27130.0:                 # Visual Studio Community 2017 (Version 15.4)
    full_name:
      Visual Studio Community 2017
    installer:
      https://download.visualstudio.microsoft.com/download/pr/100314170/045b56eb413191d03850ecc425172a7d/vs_Community.exe
    install_flags:
      --quiet
      --norestart
      --wait
    uninstaller: {{
      [ salt.environ.get('ProgramFiles(x86)') if salt.grains.get('cpuarch') == 'AMD64' else
        salt.environ.get('ProgramFiles')
      , 'Microsoft Visual Studio'
      , 'Installer'
      , 'vs_installer.exe'
      ]|join('\\')|yaml_encode }}
    uninstall_flags:
      /uninstall
      --force
      --quiet
      --norestart
    reboot: False
