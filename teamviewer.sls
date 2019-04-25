# just 32-bit x86 installer available

{% set SOURCE_PATH = 'https://dl.tvcdn.de/download' %}

{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}

teamviewer:
  latest:
    full_name: 'TeamViewer 14'
    installer: '{{ SOURCE_PATH }}/TeamViewer_Setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\TeamViewer\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
