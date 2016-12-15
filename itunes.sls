# both 32-bit (x86) AND a 64-bit (AMD64) installer available
itunes:
  '12.5.4.42':
    full_name: 'iTunes'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/031-86055-20161212-CC2643BA-BE1D-11E6-BD92-B2E982FDB0CC/iTunes6464Setup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {56DDDFB8-7F79-4480-89D5-25E1F52AB28F} &
                     msiexec.exe /qn /norestart /x {56EC47AA-5813-4FF6-8E75-544026FBEA83} &
                     msiexec.exe /qn /norestart /x {55BB2110-FB43-49B3-93F4-945A0CFB0A6C} &
                     msiexec.exe /qn /norestart /x {D079CAAD-0C31-47A2-9AF5-A82F9CD9B221} &
                     msiexec.exe /qn /norestart /x {64E6007B-1DA9-42CD-BBE4-D5FA67A7C71D} &
                     msiexec.exe /qn /norestart /x {81C96689-EA5B-4B7D-A04F-16326EC51BC2} &
                     exit 0'
    # the above uninstalls:
    # Bonjour64 v. 3.1.0.1  {56DDDFB8-7F79-4480-89D5-25E1F52AB28F}
    # Apple Software Update v. 2.2.0.150 {56EC47AA-5813-4FF6-8E75-544026FBEA83}
    # Apple Mobile Device Support v. 10.0.1.3 {55BB2110-FB43-49B3-93F4-945A0CFB0A6C}
    # Apple Application Support (32-bit)  v. 5.2 {D079CAAD-0C31-47A2-9AF5-A82F9CD9B221}
    # Apple Application Support (64-bit) v. 5.2 {64E6007B-1DA9-42CD-BBE4-D5FA67A7C71D}
    # iTunes v. 12.5.4.42 {81C96689-EA5B-4B7D-A04F-16326EC51BC2}
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/031-86054-20161212-CC264356-BE1D-11E6-BD92-B3E982FDB0CC/iTunesSetup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {D168AAD0-6686-47C1-B599-CDD4888B9D1A} &
                     msiexec.exe /qn /norestart /x {56EC47AA-5813-4FF6-8E75-544026FBEA83} &
                     msiexec.exe /qn /norestart /x {D9F3D66A-9885-4DDD-A800-9DDF488359A1} &
                     msiexec.exe /qn /norestart /x {D079CAAD-0C31-47A2-9AF5-A82F9CD9B221} &
                     msiexec.exe /qn /norestart /x {4EEBA4CC-6719-4AA0-B36E-D7748E55804E} &
                     exit 0'
    # the above uninstalls:
    # Bonjour v. 3.1.0.1  {D168AAD0-6686-47C1-B599-CDD4888B9D1A}
    # Apple Software Update v. 2.2.0.150 {56EC47AA-5813-4FF6-8E75-544026FBEA83}
    # Apple Mobile Device Support v. 10.0.1.3 {D9F3D66A-9885-4DDD-A800-9DDF488359A1}
    # Apple Application Support (32-bit)  v. 5.2 {D079CAAD-0C31-47A2-9AF5-A82F9CD9B221}
    # iTunes v. 12.5.4.42 {4EEBA4CC-6719-4AA0-B36E-D7748E55804E}
    {% endif %}
    install_flags: '/quiet /qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
