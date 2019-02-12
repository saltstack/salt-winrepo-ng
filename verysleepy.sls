{% set version = '0.90' %}

verysleepy:
  '{{version}}':
    full_name: 'Very Sleepy CS version {{version}}'
    installer: 'https://github.com/VerySleepy/verysleepy/releases/download/v0.90/verysleepy-cs-{{version}}.exe'
    uninstaller: '%ProgramFiles%\Very Sleepy CS\unins000.exe'
    install_flags: '/SP- /NORESTART /SILENT'
    uninstall_flags: '/SILENT'
    cache_dir: True
    msiexec: False
    locale: en_US
    reboot: False
