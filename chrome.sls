chrome:
  latest:
    full_name: 'Google Chrome'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://dl.google.com/edgedl/chrome/install/GoogleChromeStandaloneEnterprise64.msi'
    uninstaller: 'https://dl.google.com/edgedl/chrome/install/GoogleChromeStandaloneEnterprise64.msi'
    {% else %}
    installer: 'https://dl.google.com/edgedl/chrome/install/GoogleChromeStandaloneEnterprise.msi'
    uninstaller: 'https://dl.google.com/edgedl/chrome/install/GoogleChromeStandaloneEnterprise.msi'
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
