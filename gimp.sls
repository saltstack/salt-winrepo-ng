# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
gimp:
  {% for version, minor_version in (('2.8.16', ''), ('2.8.14','-1'), ('2.8.10', ''), ('2.8.8', ''), ('2.8.4', ''), ('2.8.2', '-1'), ('2.8.0','')) %}
  {{ version }}:
    full_name: 'GIMP {{ version }}'
    installer: 'http://download.gimp.org/mirror/pub/gimp/v2.8/windows/gimp-{{ version }}-setup{{ minor_version }}.exe'
    install_flags: '/SP- /SILENT /NORESTART'
    uninstaller: '{{ PROGRAM_FILES }}\Gimp 2\uninst\unins000.exe'
    uninstall_flags: '/SP- /SILENT /NORESTART'
    msiexec: False
    locale: en_US
    restart: False
  {% endfor %}