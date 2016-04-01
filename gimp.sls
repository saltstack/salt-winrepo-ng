# just 32-bit x86 installer available
# Gimp installs into %ProgramFiles anyway
gimp:
  {% for version, dl_version in (('2.8.14','-1'), ('2.8.10', ''), ('2.8.8', ''), ('2.8.4', ''), ('2.8.2', '-1'), ('2.8.0','')) %}
  {{ version }}:
    full_name: 'GIMP {{ version }}'
    installer: 'http://download.gimp.org/mirror/pub/gimp/v2.8/windows/gimp-{{ version }}-setup{{ dl_version }}.exe'
    install_flags: '/SP- /SILENT /NORESTART'
    uninstaller: '%ProgramFiles%\Gimp 2\uninst\unins000.exe'
    uninstall_flags: '/SP- /SILENT /NORESTART'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    restart: False
  {% endfor %}
