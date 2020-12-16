wsl2-update:
  '4.19.128':
    full_name: Windows Subsystem for Linux Update
    installer: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
    install_flags: /qn
    uninstaller: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
    uninstall_flags: /qn
    msiexec: True
    reboot: False
