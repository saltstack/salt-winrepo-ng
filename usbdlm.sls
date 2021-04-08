usbdlm:
  # author only keeps one msi online with latest version, wich keeps increaasing at random
  # info at https://www.uwe-sieber.de/usbdlm_e.html#download
  'latest':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'USB Drive Letter Manager (x64)'
    installer: https://www.uwe-sieber.de/files/usbdlm_x64.msi
    uninstaller: https://www.uwe-sieber.de/files/usbdlm_x64.msi
    {% else %}
    full_name: 'USB Drive Letter Manager (Win32)'
    installer: https://www.uwe-sieber.de/files/usbdlm.msi
    uninstaller: https://www.uwe-sieber.de/files/usbdlm.msi
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
#
  '5.4.11':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'USB Drive Letter Manager (x64)'
    installer: https://www.uwe-sieber.de/files/usbdlm_x64.msi
    uninstaller: https://www.uwe-sieber.de/files/usbdlm_x64.msi
    {% else %}
    full_name: 'USB Drive Letter Manager (Win32)'
    installer: https://www.uwe-sieber.de/files/usbdlm.msi
    uninstaller: https://www.uwe-sieber.de/files/usbdlm.msi
    {% endif %}
    install_flags: '/qn /norestart'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
