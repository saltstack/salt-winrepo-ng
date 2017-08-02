# both 32-bit (x86) AND a 64-bit (AMD64) installer available
itunes:
  '12.6.2.20':
    full_name: 'iTunes'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-22850-20170719-8AC53D14-6BB9-11E7-A878-C6374A4DD6D5/iTunes64Setup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {56DDDFB8-7F79-4480-89D5-25E1F52AB28F} &
                     msiexec.exe /qn /norestart /x {52D87F32-70E4-4348-8148-C0B9F35B1314} &
                     msiexec.exe /qn /norestart /x {0A596141-97D5-45FA-9281-98DFAF48D579} &
                     msiexec.exe /qn /norestart /x {D2FE6376-E549-4F63-A2C5-CA24DA035DE4} &
                     msiexec.exe /qn /norestart /x {BB109E24-EE90-485B-A28B-ADDEFB40540B} &
                     msiexec.exe /qn /norestart /x {02F95875-9527-49CC-B32F-970ADAEBD1EF} &
                     exit 0'
    # the above uninstalls:
    # Bonjour64 v. 3.1.0.1  {56DDDFB8-7F79-4480-89D5-25E1F52AB28F}
    # Apple Software Update v. 2.3.0.177 {52D87F32-70E4-4348-8148-C0B9F35B1314}
    # Apple Mobile Device Support (64-bit) v. 10.3.2.3 {0A596141-97D5-45FA-9281-98DFAF48D579}
    # Apple Application Support (32-bit)  v. 5.6 {D2FE6376-E549-4F63-A2C5-CA24DA035DE4}
    # Apple Application Support (64-bit) v. 5.6 {BB109E24-EE90-485B-A28B-ADDEFB40540B}
    # iTunes v. 12.6.2.20 {02F95875-9527-49CC-B32F-970ADAEBD1EF}
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-22849-20170719-8AC5248C-6BB9-11E7-A52A-C7374A4DD6D5/iTunesSetup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {D168AAD0-6686-47C1-B599-CDD4888B9D1A} &
                     msiexec.exe /qn /norestart /x {52D87F32-70E4-4348-8148-C0B9F35B1314} &
                     msiexec.exe /qn /norestart /x {2A2C8640-5402-428A-909A-0236CB2B77C7} &
                     msiexec.exe /qn /norestart /x {D2FE6376-E549-4F63-A2C5-CA24DA035DE4} &
                     msiexec.exe /qn /norestart /x {BE5DD9B6-9DF7-4163-A39E-E2141C7A7488} &
                     exit 0'
    # the above uninstalls:
    # Bonjour v. 3.1.0.1  {D168AAD0-6686-47C1-B599-CDD4888B9D1A}
    # Apple Software Update v. 2.3.0.177 {52D87F32-70E4-4348-8148-C0B9F35B1314}
    # Apple Mobile Device Support v. 10.3.2.3 {2A2C8640-5402-428A-909A-0236CB2B77C7}
    # Apple Application Support (32-bit)  v. 5.6 {D2FE6376-E549-4F63-A2C5-CA24DA035DE4}
    # iTunes v. 12.6.2.20 {BE5DD9B6-9DF7-4163-A39E-E2141C7A7488}
    {% endif %}
    install_flags: '/quiet /qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
