echo-desktop:
  '3.0.4':
    full_name:
      Echo Desktop
    installer:
      https://www.livescribe.com/downloads/support/EchoDesktop/win/EchoDesktop_Setup_v3.0.4.exe
    install_flags:
      /S
    uninstaller: {{
      [ salt['environ.get']('ProgramFiles(x86)') if salt['grains.get']('cpuarch') == 'AMD64' else
        salt['environ.get']('ProgramFiles')
      , 'LiveScribe'
      , 'uninstall.exe'
      ]|join('\\')|yaml_encode }}
    uninstall_flags: {{ (
      '/S /U:"' ~
      [ salt['environ.get']('ProgramFiles(x86)') if salt['grains.get']('cpuarch') == 'AMD64' else
        salt['environ.get']('ProgramFiles')
      , 'LiveScribe'
      , 'Uninstall'
      , 'uninstall.xml'
      ]|join('\\') ~
      '"')|yaml_encode }}
