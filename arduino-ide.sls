{% load_yaml as versions -%}
# renovate: datasource=github-releases depName=arduino-ide packageName=arduino/arduino-ide
- '2.3.5'
- '2.3.4'
- '2.3.3'
- '2.3.2'
- '2.3.1'
- '2.3.0'
- '2.2.1'
- '2.2.0'
- '2.1.1'
- '2.1.0'
- '2.0.4'
- '2.0.3'
- '2.0.2'
- '2.0.1'
- '2.0.0'
{% endload -%}

arduino-ide:
  {%- for version in versions %}
  '{{ version }}.0':
    full_name: Arduino IDE
    installer: https://github.com/arduino/arduino-ide/releases/download/{{ version }}/arduino-ide_{{ version }}_Windows_64bit.msi
    install_flags: /qn /norestart
    uninstall_flags: ALLUSERS=1 /qn /norestart
    msiexec: true
  {%- endfor %}
