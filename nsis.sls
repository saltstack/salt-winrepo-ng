nsis: 
  '3.0b2':
    full_name: 'Nullsoft Install System'
    installer: 'http://netcologne.dl.sourceforge.net/project/nsis/NSIS%203%20Pre-release/3.0b2/nsis-3.0b2-setup.exe'
    install_flags: '/S'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%PROGRAMFILES(x86)%\NSIS\uninst-nsis.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    uninstaller: '%PROGRAMFILES%\NSIS\uninst-nsis.exe'
    {% endif %}
    uninstall_flags: '/S'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '3.0b1':
    full_name: 'Nullsoft Install System'
    installer: 'http://vorboss.dl.sourceforge.net/project/nsis/NSIS%203%20Pre-release/3.0b1/nsis-3.0b1-setup.exe'
    install_flags: '/S'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%PROGRAMFILES(x86)%\NSIS\uninst-nsis.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    uninstaller: '%PROGRAMFILES%\NSIS\uninst-nsis.exe'
    {% endif %}
    uninstall_flags: '/S'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  '2.46':
    full_name: 'Nullsoft Install System'
    installer: 'http://netix.dl.sourceforge.net/project/nsis/NSIS%202/2.46/nsis-2.46-setup.exe'
    install_flags: '/S'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%PROGRAMFILES(x86)%\NSIS\uninst-nsis.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    uninstaller: '%PROGRAMFILES%\NSIS\uninst-nsis.exe'
    {% endif %}
    uninstall_flags: '/S'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
