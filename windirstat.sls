{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
windirstat:
  'Not Found':
    full_name: 'WinDirStat 1.1.2'
    installer: 'http://download01.windirstat.info/windirstat1_1_2_setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\WinDirStat\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
