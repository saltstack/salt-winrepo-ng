{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
windirstat:
  Not Found:
    full_name: 'WinDirStat 1.1.2'
    installer: 'salt://win/repo-ng/windirstat/windirstat1_1_2_setup.exe'
    #download manually from 'http://prdownloads.sourceforge.net/windirstat/windirstat1_1_2_setup.exe' and place on master
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\WinDirStat\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
