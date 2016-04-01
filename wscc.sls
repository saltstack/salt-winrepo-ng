# source: http://www.kls-soft.com/wscc/
wscc:
  '2.5.0.4':
    full_name: 'WSCC 2.5.0.4'
    installer: 'http://www.kls-soft.com/downloads/wscc_setup.exe'
    install_flags: '/SP- /SILENT /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%PROGRAMFILES(x86)%\WSCC\unins000.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    uninstaller: '%PROGRAMFILES%\WSCC\unins000.exe'
    {% endif %}
    uninstall_flags: '/SILENT /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
