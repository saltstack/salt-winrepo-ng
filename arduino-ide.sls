{%- load_yaml as versions %}
- 2.3.2
- 2.3.1
- 2.3.0
- 2.2.1
- 2.2.0
- 2.1.1
{%- endload %}

arduino-ide:
  {% for version in versions %}
  '{{ version }}.0':
    full_name: 'Arduino IDE'
    installer: 'https://github.com/arduino/arduino-ide/releases/download/{{ version }}/arduino-ide_{{ version }}_Windows_64bit.msi'
    install_flags: '/qn /norestart'
    uninstall_flags: 'ALLUSERS=1 /qn /norestart'
    msiexec: True
  {% endfor %}
