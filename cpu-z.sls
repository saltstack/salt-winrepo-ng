# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
# Source: http://www.cpuid.com/softwares/cpu-z.html
cpu-z:
  '1.74.0':
    full_name: 'CPUID CPU-Z 1.74.0'
    installer: 'salt://win/repo-ng/cpu-z/cpu-z_1.74-setup-en.exe'
    install_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    uninstaller: '{{ PROGRAM_FILES }}\CPU-Z\unins000.exe'
    uninstall_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
  '1.71.1':
    full_name: 'CPUID CPU-Z 1.71.1'
    installer: 'salt://win/repo-ng/cpu-z/cpu-z_1.71.1-setup-en.exe'
    install_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    uninstaller: '{{ PROGRAM_FILES }}\CPU-Z\unins000.exe'
    uninstall_flags: '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
# need to manually download from:
# http://www.cpuid.com/softwares/cpu-z.html (ftp DL is cookie protected)
# and place in your master's salt://win/repo-ng/cpu-z directory
# actual file is: cpu-z_1.71.1-setup-en.exe from ftp://ftp.cpuid.com/cpu-z/cpu-z_1.71.1-setup-en.exe
