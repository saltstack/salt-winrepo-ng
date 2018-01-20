tightvnc:
  '2.7.10.0':
    full_name: 'TightVNC'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://www.tightvnc.com/download/2.7.10/tightvnc-2.7.10-setup-64bit.msi'
    uninstaller: 'http://www.tightvnc.com/download/2.7.10/tightvnc-2.7.10-setup-64bit.msi'
    {% else %}
    installer: 'http://www.tightvnc.com/download/2.7.10/tightvnc-2.7.10-setup-32bit.msi'
    uninstaller: 'http://www.tightvnc.com/download/2.7.10/tightvnc-2.7.10-setup-32bit.msi'
    {% endif %}
    install_flags: '/quiet /norestart'
    uninstall_flags: '/quiet /norestart'
    msiexec: True
    locale: en_US
    reboot: False
