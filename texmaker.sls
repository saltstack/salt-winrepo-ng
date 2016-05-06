# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
texmaker:
  'Not Found':
    full_name: 'Texmaker'
    installer: 'http://www.xm1math.net/texmaker/texmakerwin32_install.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Texmaker\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
