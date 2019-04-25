#Vivaldi is a Chromium-based browser
#https://vivaldi.com

{% set SOURCE_PATH = 'https://downloads.vivaldi.com/stable' %}

vivaldi:
  latest:
    full_name: 'Vivaldi'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: '{{ SOURCE_PATH }}/Vivaldi.x64.exe'
    uninstaller: '{{ SOURCE_PATH }}/Vivaldi.x64.exe'
    {% else %}
    installer: '{{ SOURCE_PATH }}/Vivaldi.x86.exe'
    uninstaller: '{{ SOURCE_PATH }}/Vivaldi.x86.exe'
    {% endif %}
    install_flags: '--vivaldi-silent --do-not-launch-chrome --system-level'
    uninstall_flags: '--uninstall --force-uninstall --system-level --vivaldi'
    msiexec: False
    locale: en_US
    reboot: False
