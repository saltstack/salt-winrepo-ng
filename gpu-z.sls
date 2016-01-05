# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
# Source: http://www.techpowerup.com/gpuz/
gpu-z:
  Not Found:
    full_name: 'GPU-Z 0.8.6'
    installer: 'http://us1-dl.techpowerup.com/SysInfo/GPU-Z/GPU-Z.0.8.6.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\GPU-Z\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False    
    # alternate DL URLs
    # http://uk1-dl.techpowerup.com/SysInfo/GPU-Z/GPU-Z.0.8.4.exe
    # http://us2-dl.techpowerup.com/SysInfo/GPU-Z/GPU-Z.0.8.4.exe
    # http://de1-dl.techpowerup.com/SysInfo/GPU-Z/GPU-Z.0.8.4.exe
    # http://nl2-dl.techpowerup.com/SysInfo/GPU-Z/GPU-Z.0.8.4.exe
