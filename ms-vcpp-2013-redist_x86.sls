ms-vcpp-2013-redist_x86:
  '12.0.30501.0':
    full_name: 'Microsoft Visual C++ 2013 Redistributable (x86) - 12.0.30501'
    installer: 'http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe'
    install_flags: '/quiet /norestart'
    uninstaller: 'http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe'
    uninstall_flags: '/uninstall /quiet /norestart'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
