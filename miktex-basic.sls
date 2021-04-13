miktex-basic:
  {% for version in ['21.2', '21.1'] %}
  '{{ version }}':
    skip_urltest: True
    full_name: 'MiKTeX {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://mirrors.ctan.org/systems/win32/miktex/setup/windows-x64/basic-miktex-{{ version }}-x64.exe'
    {% else %}
    installer: 'https://mirrors.ctan.org/systems/win32/miktex/setup/windows-x86/basic-miktex-{{ version }}.exe'
    {% endif %}
    install_flags: '--auto-install=yes --paper-size=A4 --shared --unattended --package-set=basic --program-folder="%ProgramFiles%\MiKTeX {{ version }}\"'
    uninstaller: 'cmd'
    uninstall_flags: |
                     '/c del /Q /F /S "%ProgramFiles%\MiKTeX {{ version }}\" &
                     reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\MiKTeX {{ version }}" /f &
                     exit 0'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
#
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Below are versions of Notepad Plus Plus that have had the installer assets removed from gihub.
# An uninstall only definition will remain here so the packages will show up
# correctly in `pkg.list_pkgs` and to allow for removal using `pkg.remove`
#
  '2.9':
    skip_urltest: True
    full_name: 'MiKTeX 2.9'
    {% if grains['cpuarch'] == 'AMD64' %}
    #installer: 'http://mirrors.ctan.org/systems/win32/miktex/setup/basic-miktex-2.9.6643-x64.exe'
    {% else %}
    #installer: 'http://mirrors.ctan.org/systems/win32/miktex/setup/basic-miktex-2.9.6643.exe'
    {% endif %}
    #install_flags: '--auto-install=yes --paper-size=A4 --shared --unattended --package-set=basic --program-folder="%ProgramFiles%\MiKTeX 2.9\"'
    uninstaller: 'cmd'
    uninstall_flags: |
                     '/c del /Q /F /S "%ProgramFiles%\MiKTeX 2.9\" &
                     reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\MiKTeX 2.9" /f &
                     exit 0'
    msiexec: False
    locale: en_US
    reboot: False
#
