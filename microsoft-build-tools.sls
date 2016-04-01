microsoft-build-tools:
  '14.0.23107':
{% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Microsoft Build Tools 14.0 (amd64)'
    uninstall_flags: '/qn /x {8C918E5B-E238-401F-9F6E-4FB84B024CA2} /norestart'
{% elif grains['cpuarch'] == 'x86' %}
    full_name: 'Microsoft Build Tools 14.0 (x86)'
    uninstall_flags: '/qn /x {D1437F51-786A-4F57-A99C-F8E94FBA1BD8} /norestart'
{% endif %}
    installer: 'https://download.microsoft.com/download/E/E/D/EEDF18A8-4AED-4CE0-BEBE-70A83094FC5A/BuildTools_Full.exe'
    install_flags: '/qn /norestart'
    uninstaller: 'msiexec.exe'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False