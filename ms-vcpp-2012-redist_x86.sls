ms-vcpp-2012-redist_x86:
  '11.0.61030.0':
    full_name: 'Microsoft Visual C++ 2012 Redistributable (x86) - 11.0.61030'
    installer: 'http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe'
    install_flags: '/quiet /norestart'
    uninstaller: '"%ProgramData%\Package Cache\{33d1fd90-4274-48a1-9bc1-97e33d9c2d6f}\vcredist_x86.exe"'
    uninstall_flags: '/uninstall /quiet /norestart'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
