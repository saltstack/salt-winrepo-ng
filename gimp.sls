# just 32-bit x86 installer available
# Gimp installs into %ProgramFiles on either cpu arch
gimp:
  {% for major_version, version, minor_version in [('v2.10', '2.10.22', ''),
                                                   ('v2.10', '2.10.4', '-2'),
                                                   ('v2.8', '2.8.22', ''),
                                                   ('v2.8', '2.8.16', '-6'),
                                                   ('v2.8', '2.8.14', '-1')] %}
  '{{ version }}':
    full_name: 'GIMP {{ version }}'
    installer: 'https://download.gimp.org/mirror/pub/gimp/{{ major_version }}/windows/gimp-{{ version }}-setup{{ minor_version }}.exe'
    install_flags: '/SP- /SILENT /NORESTART'
    uninstaller: '%ProgramFiles%\Gimp 2\uninst\unins000.exe'
    uninstall_flags: '/SP- /SILENT /NORESTART'
    msiexec: False
    locale: en_US
    restart: False
  {% endfor %}
