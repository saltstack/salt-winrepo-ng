# both 32-bit (x86) AND a 64-bit (AMD64) installer available
itunes:
  '12.7.3.46':
    full_name: 'iTunes'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-45357-20180123-72201840-FFEA-11E7-92F9-85B67CCC33A9/iTunes64Setup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {56DDDFB8-7F79-4480-89D5-25E1F52AB28F} &
                     msiexec.exe /qn /norestart /x {19589375-5C58-4AFA-842F-8B34744CCEAD} &
                     msiexec.exe /qn /norestart /x {AA7D90D2-2387-4FA5-A3AF-96811BE49BFD} &
                     msiexec.exe /qn /norestart /x {D4C80B0C-CF67-43A7-90C3-466853543B54} &
                     msiexec.exe /qn /norestart /x {B2A2E8AF-BC48-4191-B2C4-3846A19835CA} &
                     msiexec.exe /qn /norestart /x {1D7D1271-5258-4F5A-B8C1-7176BF398782} &
                     exit 0'
    # the above uninstalls:
    # Bonjour64 v. 3.1.0.1  {56DDDFB8-7F79-4480-89D5-25E1F52AB28F}
    # Apple Software Update v. 2.5.0.1 {19589375-5C58-4AFA-842F-8B34744CCEAD}
    # Apple Mobile Device Support (64-bit) v. 11.0.5.14 {AA7D90D2-2387-4FA5-A3AF-96811BE49BFD}
    # Apple Application Support (32-bit)  v. 6.3 {D4C80B0C-CF67-43A7-90C3-466853543B54}
    # Apple Application Support (64-bit) v. 6.3 {B2A2E8AF-BC48-4191-B2C4-3846A19835CA}
    # iTunes v. 12.7.3.46 {1D7D1271-5258-4F5A-B8C1-7176BF398782}
    {% else %}
    installer: 'https://secure-appldnld.apple.com/itunes12/091-56357-20171213-EDF21CDC-E039-11E7-9C46-D31A1E4B8CED/iTunesSetup.exe'
    uninstall_flags: |
                     '/qn /norestart /x {D168AAD0-6686-47C1-B599-CDD4888B9D1A} &
                     msiexec.exe /qn /norestart /x {19589375-5C58-4AFA-842F-8B34744CCEAD} &
                     msiexec.exe /qn /norestart /x {BD40DFE8-9908-43A8-93C0-67608DD3D400} &
                     msiexec.exe /qn /norestart /x {D4C80B0C-CF67-43A7-90C3-466853543B54} &
                     msiexec.exe /qn /norestart /x {F9FEA709-DE8A-4ECB-A57B-FB2604EF24FB} &
                     exit 0'
    # the above uninstalls:
    # Bonjour v. 3.1.0.1  {D168AAD0-6686-47C1-B599-CDD4888B9D1A}
    # Apple Software Update v. 2.5.0.1 {C1BBFD2A-BCDD-45B3-8C0B-66BD434970A8}
    # Apple Mobile Device Support v. 11.0.5.14 {BD40DFE8-9908-43A8-93C0-67608DD3D400}
    # Apple Application Support (32-bit)  v. 6.3 {D4C80B0C-CF67-43A7-90C3-466853543B54}
    # iTunes v. 12.7.3.46 {F9FEA709-DE8A-4ECB-A57B-FB2604EF24FB}
    {% endif %}
    install_flags: '/quiet /qn ALLUSERS=1 /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: en_US
    reboot: False
