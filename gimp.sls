# just 32-bit x86 installer available
# Gimp installs into %ProgramFiles anyway
gimp:
  {% for version, dl_version in (('2.8.14', '-1'), ('2.8.16', '-6')) %}
  {{ version }}:
    full_name: 'GIMP {{ version }}'
    installer: 'http://download.gimp.org/mirror/pub/gimp/v2.8/windows/gimp-{{ version }}-setup{{ dl_version }}.exe'
    install_flags: '/SP- /SILENT /NORESTART'
    uninstaller: '%ProgramFiles%\Gimp 2\uninst\unins000.exe'
    uninstall_flags: '/SP- /SILENT /NORESTART'
    msiexec: False
    locale: en_US
    restart: False
  {% endfor %}
