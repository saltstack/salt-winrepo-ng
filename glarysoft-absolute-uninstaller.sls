# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
glarysoft-absolute-uninstaller:
  '5.3.1.23':
    full_name: 'Absolute Uninstaller 5.3.1.23'
    installer: 'https://download.glarysoft.com/ausetup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Glarysoft\Absolute Uninstaller 5\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '5.3.1.21':
    full_name: 'Absolute Uninstaller 5.3.1.21'
    installer: 'https://download.glarysoft.com/ausetup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Glarysoft\Absolute Uninstaller 5\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
