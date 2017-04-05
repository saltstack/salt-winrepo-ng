# both 32-bit (x86) AND a 64-bit (AMD64) installer available
itunes:
  '12.6.0.100':
    full_name: 'iTunes'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-04060-20170323-F8B6662A-39E9-46EE-BA40-BDA0CCD05F40/iTunes64Setup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {56DDDFB8-7F79-4480-89D5-25E1F52AB28F} &
                     msiexec.exe /qn /norestart /x {52D87F32-70E4-4348-8148-C0B9F35B1314} &
                     msiexec.exe /qn /norestart /x {DB18F1C0-846F-46F5-A074-5B97C8AF5C8E} &
                     msiexec.exe /qn /norestart /x {05E07D23-91E9-4E70-A4CC-EF505088F967} &
                     msiexec.exe /qn /norestart /x {741291DA-2B34-4D44-8FB6-58EDE21261D8} &
                     msiexec.exe /qn /norestart /x {6C01A0A7-7440-4D48-93C6-2927A1E93FE6} &
                     exit 0'
    # the above uninstalls:
    # Bonjour64 v. 3.1.0.1  {56DDDFB8-7F79-4480-89D5-25E1F52AB28F}
    # Apple Software Update v. 2.3.0.177 {52D87F32-70E4-4348-8148-C0B9F35B1314}
    # Apple Mobile Device Support v. 10.3.1.2 {DB18F1C0-846F-46F5-A074-5B97C8AF5C8E}
    # Apple Application Support (32-bit)  v. 5.4.1 {05E07D23-91E9-4E70-A4CC-EF505088F967}
    # Apple Application Support (64-bit) v. 5.4.1 {741291DA-2B34-4D44-8FB6-58EDE21261D8}
    # iTunes v. 12.6.0.100 {6C01A0A7-7440-4D48-93C6-2927A1E93FE6}
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-04059-20170323-2BBE2BB2-5737-4F97-AE9F-E7BE77A55307/iTunesSetup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {D168AAD0-6686-47C1-B599-CDD4888B9D1A} &
                     msiexec.exe /qn /norestart /x {52D87F32-70E4-4348-8148-C0B9F35B1314} &
                     msiexec.exe /qn /norestart /x {90B7F915-6343-43CE-9DA7-E79E5BAC6673} &
                     msiexec.exe /qn /norestart /x {05E07D23-91E9-4E70-A4CC-EF505088F967} &
                     msiexec.exe /qn /norestart /x {2F95FFC4-8624-43AB-8256-AA223555C9B7} &
                     exit 0'
    # the above uninstalls:
    # Bonjour v. 3.1.0.1  {D168AAD0-6686-47C1-B599-CDD4888B9D1A}
    # Apple Software Update v. 2.3.0.177 {52D87F32-70E4-4348-8148-C0B9F35B1314}
    # Apple Mobile Device Support v. 10.3.1.2 {90B7F915-6343-43CE-9DA7-E79E5BAC6673}
    # Apple Application Support (32-bit)  v. 5.4.1 {05E07D23-91E9-4E70-A4CC-EF505088F967}
    # iTunes v. 12.6.0.100 {2F95FFC4-8624-43AB-8256-AA223555C9B7}
    {% endif %}
    install_flags: '/quiet /qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
