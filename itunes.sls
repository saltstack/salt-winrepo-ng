# both 32-bit (x86) AND a 64-bit (AMD64) installer available
itunes:
  '12.5.1.21':
    full_name: 'iTunes'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/031-77734-20160913-C951D608-792C-11E6-85DE-C31234D2D062/iTunes6464Setup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {56DDDFB8-7F79-4480-89D5-25E1F52AB28F} &
                     msiexec.exe /qn /norestart /x {56EC47AA-5813-4FF6-8E75-544026FBEA83} &
                     msiexec.exe /qn /norestart /x {D4D86CB2-2370-4691-8272-3869EDED6C64} &
                     msiexec.exe /qn /norestart /x {29DB9165-5FC1-48F0-9188-26123F526848} &
                     msiexec.exe /qn /norestart /x {5905C8CF-1C88-4478-A48E-4E458AD1BC7E} &
                     msiexec.exe /qn /norestart /x {9946A4F7-E0FD-4A33-82D1-06CBFFBBB9F9} &
                     exit 0'
    # the above uninstalls:
    # Bonjour64 v. 3.1.0.1  {56DDDFB8-7F79-4480-89D5-25E1F52AB28F}
    # Apple Software Update v. 2.2.0.150 {56EC47AA-5813-4FF6-8E75-544026FBEA83}
    # Apple Mobile Device Support v. 10.0.0.18 {D4D86CB2-2370-4691-8272-3869EDED6C64}
    # Apple Application Support (32-bit)  v. 5.0.1 {29DB9165-5FC1-48F0-9188-26123F526848}
    # Apple Application Support (64-bit) v. 5.0.1 {5905C8CF-1C88-4478-A48E-4E458AD1BC7E}
    # iTunes v. 12.5.1.21 {9946A4F7-E0FD-4A33-82D1-06CBFFBBB9F9}
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/031-77741-20160913-C951D5F4-792C-11E6-85DE-C41234D2D062/iTunesSetup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {D168AAD0-6686-47C1-B599-CDD4888B9D1A} &
                     msiexec.exe /qn /norestart /x {56EC47AA-5813-4FF6-8E75-544026FBEA83} &
                     msiexec.exe /qn /norestart /x {5CFFD58D-A8EB-439C-B3FD-A8862C886C55} &
                     msiexec.exe /qn /norestart /x {29DB9165-5FC1-48F0-9188-26123F526848} &
                     msiexec.exe /qn /norestart /x {C27F2813-083D-4E6C-A565-17E22D1F7FC8} &
                     exit 0'
    # the above uninstalls:
    # Bonjour v. 3.1.0.1  {D168AAD0-6686-47C1-B599-CDD4888B9D1A}
    # Apple Software Update v. 2.2.0.150 {56EC47AA-5813-4FF6-8E75-544026FBEA83}
    # Apple Mobile Device Support v. 10.0.0.18 {5CFFD58D-A8EB-439C-B3FD-A8862C886C55}
    # Apple Application Support (32-bit)  v. 5.0.1 {29DB9165-5FC1-48F0-9188-26123F526848}
    # iTunes v. 12.5.1.21 {C27F2813-083D-4E6C-A565-17E22D1F7FC8}
    {% endif %}
    install_flags: '/quiet /qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
