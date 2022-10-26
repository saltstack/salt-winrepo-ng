{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
{% set base_url = "https://downloads.sourceforge.net/project/windirstat/windirstat/" %}
windirstat:
  'Not Found':
    full_name: 'WinDirStat 1.1.2'
    installer: {{ base_url }}1.1.2%20installer%20re-release%20%28more%20languages%21%29/windirstat1_1_2_setup.exe
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\WinDirStat\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
