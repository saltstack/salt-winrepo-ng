{% set url = "https://www.zoom.us/client/latest/ZoomInstallerFull.msi" %}
zoom:
  latest:
    full_name: 'Zoom'
    installer: '{{ url }}'
    install_flags: '/qn /norestart'
    uninstaller: '{{ url }}'
    uninstall_flags: '/qn /norestart'
    msiexec: True
    reboot: False
