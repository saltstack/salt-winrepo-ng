docker-desktop:
  '2.5.0.1':
    full_name: Docker Desktop
    installer: https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe
    install_flags: install --quiet
    uninstaller: C:\Program Files\Docker\Docker\Docker Desktop Installer.exe
    uninstall_flags: uninstall --quiet
    msiexec: False
    reboot: False
