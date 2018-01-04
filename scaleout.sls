scaleout:
  latest:
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'ScaleOut StateServer x64 Edition'
    installer: 'https://www.scaleoutsoftware.com/pkg/soss_setup64.msi'
    uninstaller: 'https://www.scaleoutsoftware.com/pkg/soss_setup64.msi'
    {% else %}
    full_name: 'ScaleOut StateServer'
    installer: 'https://www.scaleoutsoftware.com/pkg/soss_setup32.msi'
    uninstaller: 'https://www.scaleoutsoftware.com/pkg/soss_setup32.msi'
    {% endif %}
    install_flags: '/quiet'
    uninstall_flags: '/quiet'
    msiexec: True
    locale: en_US
    reboot: False
