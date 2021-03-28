{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}

autohotkey:
  {% for version in ['1.1.33.06', '1.1.33.05', '1.1.33.04', '1.1.33.02', '1.1.33.01', '1.1.33.00', '1.1.32.00', '1.1.31.01', '1.1.31.00', '1.1.30.03', '1.1.30.02', '1.1.30.01', '1.1.30.00', '1.1.29.01', '1.1.29.00', '1.1.28.02', '1.1.28.01', '1.1.28.00', '1.1.27.07', '1.1.27.06', '1.1.27.05', '1.1.27.04', '1.1.27.03', '1.1.27.02', '1.1.27.01', '1.1.27.00', '1.1.26.01', '1.1.26.00', '1.1.25.02', '1.1.25.01', '1.1.25.00', '1.1.24.05', '1.1.24.04', '1.1.24.03', '1.1.24.02'] %}
  '{{ version }}':
    full_name: 'AutoHotkey {{ version }}'
    installer: 'https://github.com/Lexikos/AutoHotkey_L/releases/download/v{{ version }}/AutoHotkey_{{ version }}_setup.exe'
    install_flags: '/S /U32 /D="{{ PROGRAM_FILES }}\AutoHotkey"'
    uninstaller: '{{ PROGRAM_FILES }}\AutoHotKey\AutoHotKey.exe'
    uninstall_flags: '"{{ PROGRAM_FILES }}\AutoHotkey\Installer.ahk" /Uninstall'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
