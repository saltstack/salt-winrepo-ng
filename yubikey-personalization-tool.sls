yubikey-personalization-tool:
  '3.1.24':
    full_name: 'YubiKey Personalization Tool'
    installer: 'https://developers.yubico.com/yubikey-personalization-gui/Releases/yubikey-personalization-gui-3.1.24.exe'
    install_flags: '/S'
    uninstaller: {{
      [ salt.environ.get('ProgramFiles(x86)') if salt.grains.get('cpuarch') == 'AMD64' else
        salt.environ.get('ProgramFiles')
      , 'Yubico'
      , 'YubiKey Personalization Tool'
      , 'uninstall.exe'
      ]|join('\\')|yaml_encode }}
    uninstall_flags: '/S'
    reboot: False
