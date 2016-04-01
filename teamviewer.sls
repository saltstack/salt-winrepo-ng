# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
teamviewer:
  latest:
    full_name: 'TeamViewer 11'
    installer: 'https://downloadeu1.teamviewer.com/download/TeamViewer_Setup_en.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\TeamViewer\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
