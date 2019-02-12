# just 32-bit x86 installer available

{% set SOURCE_PATH = 'https://download.anydesk.com' %}

{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}

anydesk:
  latest:
    full_name: 'AnyDesk'
    installer: '{{ SOURCE_PATH }}/AnyDesk.exe'
    install_flags: '--install "{{ PROGRAM_FILES }}\AnyDesk" --start-with-win --silent --create-shortcut'
    uninstaller: '{{ SOURCE_PATH }}/AnyDesk.exe'
    uninstall_flags: '--silent --remove'
    msiexec: False
    locale: en_US
    reboot: False
