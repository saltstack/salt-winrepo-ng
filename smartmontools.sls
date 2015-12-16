# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
smartmontools:
  '6.4 2015-06-04 r4109 (sf-6.4-1)':
    full_name: 'smartmontools'
    installer: 'http://netix.dl.sourceforge.net/project/smartmontools/smartmontools/6.4/smartmontools-6.4-1.win32-setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\smartmontools\uninst-smartmontools.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
