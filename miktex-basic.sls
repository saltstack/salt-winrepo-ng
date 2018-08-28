miktex-basic:
  '2.9':
    full_name: 'MiKTeX 2.9'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'http://mirrors.ctan.org/systems/win32/miktex/setup/basic-miktex-2.9.6643-x64.exe'
    {% else %}
    installer: 'http://mirrors.ctan.org/systems/win32/miktex/setup/basic-miktex-2.9.6643.exe'
    {% endif %}
    install_flags: '--auto-install=yes --paper-size=A4 --shared --unattended --package-set=basic --program-folder="%ProgramFiles%\MiKTeX 2.9\"'
    uninstaller: 'cmd'
    uninstall_flags: |
                     '/c del /Q /F /S "%ProgramFiles%\MiKTeX 2.9\" &
                     reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\MiKTeX 2.9" /f &
                     exit 0'
    msiexec: False
    locale: en_US
    reboot: False
