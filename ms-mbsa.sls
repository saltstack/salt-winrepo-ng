# both 32-bit (x86) AND a 64-bit (AMD64) installer available
#
# this product is EOL and does not work properly for win 10 or newer
#
# the internet way back machine has an archive of it at 
# https://web.archive.org/web/20150315030056/http://www.microsoft.com/en-us/download/details.aspx?id=7558
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Microsoft Baseline Security Analyzer 2.3 that have had the installer assets removed.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ms-mbsa:
  '2.3.2211':
    skip_urltest: True  
    {% if grains['cpuarch'] == 'AMD64' %}
    #installer: 'https://download.microsoft.com/download/8/E/1/8E16A4C7-DD28-4368-A83A-282C82FC212A/MBSASetup-x64-EN.msi'
    #uninstaller: 'https://download.microsoft.com/download/8/E/1/8E16A4C7-DD28-4368-A83A-282C82FC212A/MBSASetup-x64-EN.msi'
    uninstall_flags: '/x {C058FC5D-565F-4360-A562-0527A3D993DC} /qn /norestart'
    {% else %}
    #installer: 'https://download.microsoft.com/download/8/E/1/8E16A4C7-DD28-4368-A83A-282C82FC212A/MBSASetup-x86-EN.msi'
    #uninstaller: 'https://download.microsoft.com/download/8/E/1/8E16A4C7-DD28-4368-A83A-282C82FC212A/MBSASetup-x86-EN.msi'
    uninstall_flags: '/x {9CB185CC-EDD4-45C5-A4E1-29B766E7B189} /qn /norestart'
    {% endif %}
    uninstaller: 'msiexec'
    full_name: 'Microsoft Baseline Security Analyzer 2.3'
    install_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
#
