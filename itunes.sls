# both 32-bit (x86) AND a 64-bit (AMD64) installer available
itunes:
  '12.5.5.5':
    full_name: 'iTunes'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/031-94939-20170123-014E4004-DF1D-11E6-8CA3-56D3D55B5B9D/iTunes6464Setup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {56DDDFB8-7F79-4480-89D5-25E1F52AB28F} &
                     msiexec.exe /qn /norestart /x {56EC47AA-5813-4FF6-8E75-544026FBEA83} &
                     msiexec.exe /qn /norestart /x {55BB2110-FB43-49B3-93F4-945A0CFB0A6C} &
                     msiexec.exe /qn /norestart /x {9BA1A894-B42F-4805-BC8C-349C905A3930} &
                     msiexec.exe /qn /norestart /x {7EAC8A42-9FAC-4F6B-AABF-C08C9F2E0F13} &
                     msiexec.exe /qn /norestart /x {9D0D2A8B-7E7B-4D88-8D50-24286ED6A5EB} &
                     exit 0'
    # the above uninstalls:
    # Bonjour64 v. 3.1.0.1  {56DDDFB8-7F79-4480-89D5-25E1F52AB28F}
    # Apple Software Update v. 2.2.0.150 {56EC47AA-5813-4FF6-8E75-544026FBEA83}
    # Apple Mobile Device Support v. 10.0.1.3 {55BB2110-FB43-49B3-93F4-945A0CFB0A6C}
    # Apple Application Support (32-bit)  v. 5.3.1 {9BA1A894-B42F-4805-BC8C-349C905A3930}
    # Apple Application Support (64-bit) v. 5.3.1 {7EAC8A42-9FAC-4F6B-AABF-C08C9F2E0F13}
    # iTunes v. 12.5.5.5 {9D0D2A8B-7E7B-4D88-8D50-24286ED6A5EB}
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/031-94942-20170123-014E4040-DF1D-11E6-8CA3-57D3D55B5B9D/iTunesSetup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {D168AAD0-6686-47C1-B599-CDD4888B9D1A} &
                     msiexec.exe /qn /norestart /x {56EC47AA-5813-4FF6-8E75-544026FBEA83} &
                     msiexec.exe /qn /norestart /x {D9F3D66A-9885-4DDD-A800-9DDF488359A1} &
                     msiexec.exe /qn /norestart /x {9BA1A894-B42F-4805-BC8C-349C905A3930} &
                     msiexec.exe /qn /norestart /x {B7C4ABF3-59A7-47AB-A72E-956BA5B4841C} &
                     exit 0'
    # the above uninstalls:
    # Bonjour v. 3.1.0.1  {D168AAD0-6686-47C1-B599-CDD4888B9D1A}
    # Apple Software Update v. 2.2.0.150 {56EC47AA-5813-4FF6-8E75-544026FBEA83}
    # Apple Mobile Device Support v. 10.0.1.3 {D9F3D66A-9885-4DDD-A800-9DDF488359A1}
    # Apple Application Support (32-bit)  v. 5.3.1 {9BA1A894-B42F-4805-BC8C-349C905A3930}
    # iTunes v. 12.5.5.5 {B7C4ABF3-59A7-47AB-A72E-956BA5B4841C}
    {% endif %}
    install_flags: '/quiet /qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
