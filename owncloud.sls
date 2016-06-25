owncloud:
  {% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
  {% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
  {% endif %}
  '2.2.0.6076':
    full_name: 'ownCloud'
    installer: 'https://download.owncloud.com/desktop/stable/ownCloud-2.2.0.6076-setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\ownCloud\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
