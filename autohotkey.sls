{% set versions, rels, vers = (('1.1.27.06', '112706', '1.1'), ('1.1.24.00', '112400', '1.1'), ('1.1.22.09', '112209', '1.1')) %}
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
autohotkey:
  {% for version, ver, rel in [(versions, vers, rels)] %}
  '{{ version }}':
    full_name: 'AutoHotkey {{ version }}'
    installer: 'http://ahkscript.org/download/{{ rel }}/AutoHotkey{{ ver }}_Install.exe'
    install_flags: '/S /U32 /D="{{ PROGRAM_FILES }}\AutoHotkey"'
    uninstaller: '{{ PROGRAM_FILES }}\AutoHotKey\AutoHotKey.exe'
    uninstall_flags: '"{{ PROGRAM_FILES }}\AutoHotkey\Installer.ahk" /Uninstall'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
