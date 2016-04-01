# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
icecast:
  '2.4.2': 
    full_name: 'Icecast'
    installer: 'http://downloads.xiph.org/releases/icecast/icecast_win32_2.4.2.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Icecast\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
