# both 32-bit (x86) AND a 64-bit (AMD64) installer available
itunes:
  '12.7.5.9':
    full_name: 'iTunes'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-81934-20180529-DAFCAAD0-5F77-11E8-99A3-4F9A897FD268/iTunes64Setup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {56DDDFB8-7F79-4480-89D5-25E1F52AB28F} &
                     msiexec.exe /qn /norestart /x {A30EA700-5515-48F0-88B0-9E99DC356B88} &
                     msiexec.exe /qn /norestart /x {64695C4A-C68F-46B5-A734-50EBF124A68E} &
                     msiexec.exe /qn /norestart /x {C56BA005-F02C-461B-ACA5-A0CE3E32578F} &
                     msiexec.exe /qn /norestart /x {C8087B7C-8496-45BE-92FB-91D31EB73969} &
                     msiexec.exe /qn /norestart /x {A0274977-870A-42EA-ACB8-E1AAFECB3855} &
                     exit 0'
    # the above uninstalls:
    # Bonjour64 v. 3.1.0.1  {56DDDFB8-7F79-4480-89D5-25E1F52AB28F}
    # Apple Software Update v. 2.6.0.1 {A30EA700-5515-48F0-88B0-9E99DC356B88}
    # Apple Mobile Device Support (64-bit) v. 11.3.3.4 {64695C4A-C68F-46B5-A734-50EBF124A68E}
    # Apple Application Support (32-bit)  v. 6.5 {C56BA005-F02C-461B-ACA5-A0CE3E32578F}
    # Apple Application Support (64-bit) v. 6.5 {C8087B7C-8496-45BE-92FB-91D31EB73969}
    # iTunes v. 12.7.5.9 {A0274977-870A-42EA-ACB8-E1AAFECB3855}
    {% else %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-81943-20180529-DAFD73DE-5F77-11E8-AF1E-509A897FD268/iTunesSetup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {D168AAD0-6686-47C1-B599-CDD4888B9D1A} &
                     msiexec.exe /qn /norestart /x {A30EA700-5515-48F0-88B0-9E99DC356B88} &
                     msiexec.exe /qn /norestart /x {BD40DFE8-9908-43A8-93C0-67608DD3D400} &
                     msiexec.exe /qn /norestart /x {C56BA005-F02C-461B-ACA5-A0CE3E32578F} &
                     msiexec.exe /qn /norestart /x {F9FEA709-DE8A-4ECB-A57B-FB2604EF24FB} &
                     exit 0'
    # the above uninstalls:
    # Bonjour v. 3.1.0.1  {D168AAD0-6686-47C1-B599-CDD4888B9D1A}
    # Apple Software Update v. 2.6.0.1 {A30EA700-5515-48F0-88B0-9E99DC356B88}
    # Apple Mobile Device Support v. 11.3.3.4 {F9055C0A-F9F9-4EE1-8554-80BEBA0B43F4}
    # Apple Application Support (32-bit)  v. 6.5 {C56BA005-F02C-461B-ACA5-A0CE3E32578F}
    # iTunes v. 12.7.5.9 {F9FEA709-DE8A-4ECB-A57B-FB2604EF24FB}
    {% endif %}
    install_flags: '/quiet /qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
