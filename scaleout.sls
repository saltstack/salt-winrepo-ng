scaleout:
  '5.6.3':
    full_name: 'ScaleOut StateServer x64 Edition'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://www.scaleoutsoftware.com/pkg/soss_setup64.msi'
    {% else %}
    installer: 'https://www.scaleoutsoftware.com/pkg/soss_setup32.msi'
    {% endif %}
    install_flags: '/quiet'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: 'https://www.scaleoutsoftware.com/pkg/soss_setup64.msi'
    {% else %}
    uninstaller: 'https://www.scaleoutsoftware.com/pkg/soss_setup32.msi'
    {% endif %}
    uninstall_flags: '/quiet'
    msiexec: True
    locale: en_US
    reboot: False
