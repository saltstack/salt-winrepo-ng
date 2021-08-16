# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
urlrewrite:
  '7.2.2':
    full_name: 'IIS URL Rewrite Module 2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/6/7/D/67D80164-7DD0-48AF-86E3-DE7A182D6815/rewrite_2.0_rtw_x64.msi'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {EB675D0A-2C95-405B-BEE8-B42A65D23E11} /qn /norestart'
    {% else %}
    installer: 'https://download.microsoft.com/download/6/9/C/69C1195A-123E-4BE8-8EDF-371CDCA4EC6C/rewrite_2.0_rtw_x86.msi'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {EB675D0A-2C95-405B-BEE8-B42A65D23E11} /qn /norestart'
    {% endif %}
    install_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
#
  '7.2.1983':
    full_name: 'IIS URL Rewrite Module 2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/1/2/8/128E2E22-C1B9-44A4-BE2A-5859ED1D4592/rewrite_amd64_en-US.msi'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {9BCA2118-F753-4A1E-BCF3-5A820729965C} /qn /norestart'
    {% else %}
    installer: 'https://download.microsoft.com/download/D/8/1/D81E5DD6-1ABB-46B0-9B4B-21894E18B77F/rewrite_x86_en-US.msi'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {C4ACC5BB-0446-4A3D-94A2-1C4B3537DFAC} /qn /norestart'
    {% endif %}
    install_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
#
  '7.2.1980':
    full_name: 'IIS URL Rewrite Module 2'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {38D32370-3A31-40E9-91D0-D236F47E3C4A} /qn /norestart'
    {% else %}
    installer: 'https://download.microsoft.com/download/6/8/F/68F82751-0644-49CD-934C-B52DF91765D1/rewrite_x86_en-US.msi'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {F5B6E49C-F346-47C2-BF6B-59F1D464C595} /qn /norestart'
    {% endif %}
    install_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of IIS URL Rewrite Module 2 that have had the installer assets removed from microsoft.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
  '7.2.1952':
    skip_urltest: True
    full_name: 'IIS URL Rewrite Module 2'
    {% if grains['cpuarch'] == 'AMD64' %}
    #installer: 'https://download.microsoft.com/download/C/9/E/C9E8180D-4E51-40A6-A9BF-776990D8BCA9/rewrite_amd64.msi'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {08F0318A-D113-4CF0-993E-50F191D397AD} /qn /norestart'
    {% else %}
    #installer: 'https://download.microsoft.com/download/5/4/9/54980B19-9C64-4E8E-A69C-615A88DFF8B7/rewrite_x86.msi'
    uninstaller: 'msiexec'
    uninstall_flags: '/x {41F073A0-9EB5-4E3B-871C-2AA18F0C5ED5} /qn /norestart'
    {% endif %}
    install_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
#
