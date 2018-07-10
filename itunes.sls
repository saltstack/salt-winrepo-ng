# both 32-bit (x86) AND a 64-bit (AMD64) installer available
itunes:
  '12.8.0.150':
    full_name: 'iTunes'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-81692-20180709-A4DF288B-8929-401F-AD73-4189359D8A6B/iTunes64Setup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {56DDDFB8-7F79-4480-89D5-25E1F52AB28F} &
                     msiexec.exe /qn /norestart /x {A30EA700-5515-48F0-88B0-9E99DC356B88} &
                     msiexec.exe /qn /norestart /x {C29B636B-9015-4ED1-A12F-6375A337F23B} &
                     msiexec.exe /qn /norestart /x {C56BA005-F02C-461B-ACA5-A0CE3E32578F} &
                     msiexec.exe /qn /norestart /x {D745E014-74DD-43A3-98DF-E7D38164B681} &
                     msiexec.exe /qn /norestart /x {36F365B3-05C2-455D-9D96-B73829DE046D} &
                     exit 0'
    # the above uninstalls:
    # Bonjour64 v. 3.1.0.1  {56DDDFB8-7F79-4480-89D5-25E1F52AB28F}
    # Apple Software Update v. 2.6.0.1 {A30EA700-5515-48F0-88B0-9E99DC356B88}
    # Apple Mobile Device Support (64-bit) v. 11.4.1.46 {C29B636B-9015-4ED1-A12F-6375A337F23B}
    # Apple Application Support (32-bit)  v. 6.6 {C56BA005-F02C-461B-ACA5-A0CE3E32578F}
    # Apple Application Support (64-bit) v. 6.6 {D745E014-74DD-43A3-98DF-E7D38164B681}
    # iTunes v. 12.8.0.150 {36F365B3-05C2-455D-9D96-B73829DE046D}
    {% else %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-81691-20180709-C98EBAE5-D5C5-41EC-9847-A5F71D9C4437/iTunesSetup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {D168AAD0-6686-47C1-B599-CDD4888B9D1A} &
                     msiexec.exe /qn /norestart /x {A30EA700-5515-48F0-88B0-9E99DC356B88} &
                     msiexec.exe /qn /norestart /x {B19FCC39-7914-4BBC-80EE-1D606BD8C686} &
                     msiexec.exe /qn /norestart /x {E5347310-C82F-4833-AA36-8D11E5A8A86A} &
                     msiexec.exe /qn /norestart /x {ADB8797A-FAD0-4F2A-A23C-6DA6C5886407} &
                     exit 0'
    # the above uninstalls:
    # Bonjour v. 3.1.0.1  {D168AAD0-6686-47C1-B599-CDD4888B9D1A}
    # Apple Software Update v. 2.6.0.1 {A30EA700-5515-48F0-88B0-9E99DC356B88}
    # Apple Mobile Device Support v. 11.4.1.46 {B19FCC39-7914-4BBC-80EE-1D606BD8C686}
    # Apple Application Support (32-bit)  v. 6.6 {E5347310-C82F-4833-AA36-8D11E5A8A86A}
    # iTunes v. 12.8.0.150 {ADB8797A-FAD0-4F2A-A23C-6DA6C5886407}
    {% endif %}
    install_flags: '/quiet /qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
