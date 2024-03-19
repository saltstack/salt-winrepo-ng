{% set versions = {
  '2.3.2': '2.3.2.0',
  '2.3.1': '2.3.1.0',
  '2.3.0': '2.3.0.0',
  '2.2.1': '2.2.1.0',
  '2.2.0': '2.2.0.0',
  '2.1.1': '2.1.1.0'
  }
%}

arduino-ide:
  {% for version, winversion in versions.items() %}
  '{{ winversion }}':
    full_name: 'Arduino IDE'
    installer: 'https://github.com/arduino/arduino-ide/releases/download/{{ version }}/arduino-ide_{{ version }}_Windows_64bit.msi'
    install_flags: '/qn /norestart'
    uninstaller: 'https://github.com/arduino/arduino-ide/releases/download/{{ version }}/arduino-ide_{{ version }}_Windows_64bit.msi'
    uninstall_flags: 'ALLUSERS=1 /qn /norestart'
    msiexec: True
    locale: en_US
    reboot: False
  {% endfor %}