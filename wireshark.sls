# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
wireshark:
  {% for version in '2.6.1', '2.4.7', '2.2.15' %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Wireshark {{ version }} (64-bit)'
    installer: 'https://1.na.dl.wireshark.org/win64/Wireshark-win64-{{ version }}.exe'
    {% else %}
    full_name: 'Wireshark {{ version }}'
    installer: 'https://2.na.dl.wireshark.org/win32/Wireshark-win32-{{ version }}.exe'
    {% endif %}
    install_flags: '/S /desktopicon=yes /quicklaunchicon=yes'
    uninstaller: '{{ PROGRAM_FILES }}\Wireshark\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
