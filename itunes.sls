# both 32-bit (x86) AND a 64-bit (AMD64) installer available
itunes:
  '12.7.2.60':
    full_name: 'iTunes'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-56359-20171213-EDF2198A-E039-11E7-9A9F-D21A1E4B8CED/iTunes64Setup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {56DDDFB8-7F79-4480-89D5-25E1F52AB28F} &
                     msiexec.exe /qn /norestart /x {C1BBFD2A-BCDD-45B3-8C0B-66BD434970A8} &
                     msiexec.exe /qn /norestart /x {BD6778C5-6FA5-492A-ADD6-E706339C2A7B} &
                     msiexec.exe /qn /norestart /x {BC7C46A4-D7A7-48EC-A98C-32A7762B5EFA} &
                     msiexec.exe /qn /norestart /x {F0C4B709-8BF4-4A72-B527-12E7BF5482F8} &
                     msiexec.exe /qn /norestart /x {D7D4465C-B3B6-4BC1-B336-2803FB57BFAF} &
                     exit 0'
    # the above uninstalls:
    # Bonjour64 v. 3.1.0.1  {56DDDFB8-7F79-4480-89D5-25E1F52AB28F}
    # Apple Software Update v. 2.4.8.1 {C1BBFD2A-BCDD-45B3-8C0B-66BD434970A8}
    # Apple Mobile Device Support (64-bit) v. 11.0.2.4 {BD6778C5-6FA5-492A-ADD6-E706339C2A7B}
    # Apple Application Support (32-bit)  v. 6.2.1 {BC7C46A4-D7A7-48EC-A98C-32A7762B5EFA}
    # Apple Application Support (64-bit) v. 6.2.1 {F0C4B709-8BF4-4A72-B527-12E7BF5482F8}
    # iTunes v. 12.7.2.60 {D7D4465C-B3B6-4BC1-B336-2803FB57BFAF}
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-56357-20171213-EDF21CDC-E039-11E7-9C46-D31A1E4B8CED/iTunesSetup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {D168AAD0-6686-47C1-B599-CDD4888B9D1A} &
                     msiexec.exe /qn /norestart /x {C1BBFD2A-BCDD-45B3-8C0B-66BD434970A8} &
                     msiexec.exe /qn /norestart /x {A0BE60AA-7470-4F16-A5C5-D9F4A575B606} &
                     msiexec.exe /qn /norestart /x {BC7C46A4-D7A7-48EC-A98C-32A7762B5EFA} &
                     msiexec.exe /qn /norestart /x {00540E97-8479-4B71-B737-8F5350F7B042} &
                     exit 0'
    # the above uninstalls:
    # Bonjour v. 3.1.0.1  {D168AAD0-6686-47C1-B599-CDD4888B9D1A}
    # Apple Software Update v. 2.4.8.1 {C1BBFD2A-BCDD-45B3-8C0B-66BD434970A8}
    # Apple Mobile Device Support v. 11.0.2.4 {A0BE60AA-7470-4F16-A5C5-D9F4A575B606}
    # Apple Application Support (32-bit)  v. 6.2.1 {BC7C46A4-D7A7-48EC-A98C-32A7762B5EFA}
    # iTunes v. 12.7.2.60 {00540E97-8479-4B71-B737-8F5350F7B042}
    {% endif %}
    install_flags: '/quiet /qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
