# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
wireshark:
  {% for version in '3.0.4', '3.0.3','3.0.2', '3.0.1', '3.0.0', '2.6.6', '2.6.5', '2.6.4', '2.6.3', '2.6.2', '2.6.1', '2.6.0', '2.4.12', '2.4.11', '2.4.10', '2.4.9', '2.4.8', '2.4.7', '2.4.6', '2.4.5', '2.4.4', '2.4.3', '2.4.2', '2.4.1', '2.4.0', '2.2.17', '2.2.16', '2.2.15', '2.2.14', '2.2.13', '2.2.12', '2.2.11', '2.2.10', '2.2.9', '2.2.8', '2.2.7', '2.2.6', '2.2.5', '2.2.4', '2.2.3', '2.2.2', '2.2.1', '2.2.0' %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Wireshark {{ version }} 64-bit'
    installer: 'https://1.na.dl.wireshark.org/win64/all-versions/Wireshark-win64-{{ version }}.exe'
    {% else %}
    full_name: 'Wireshark {{ version }}'
    installer: 'https://1.na.dl.wireshark.org/win32/all-versions/Wireshark-win32-{{ version }}.exe'
    {% endif %}
    install_flags: '/S /desktopicon=yes /quicklaunchicon=yes'
    uninstaller: '{{ PROGRAM_FILES }}\Wireshark\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
