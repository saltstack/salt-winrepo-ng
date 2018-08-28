firefox-esr:
  {% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
  {% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
  {% endif %}
  {% for version in ['60.1.0', '60.0.2', '60.0.1', '52.9.0', '52.8.1', '52.8.0', '52.7.3', '52.7.2', '52.6.0', '52.5.3', '52.4.0', '52.3.0', '52.2.1', '52.2.0', '52.1.2', '52.1.0', '52.0.2', '52.0.1', '45.7.0', '45.6.0', '45.5.1', '45.4.0', '45.3.0', '45.2.0', '45.1.0', '45.0.2', '38.7.1', '38.6.1', '38.6.0', '38.5.0', '38.4.0', '38.3.0', '38.2.1'] %}
  '{{ version }}':
    full_name: 'Mozilla Firefox {{ version }} ESR (x86 en-US)'
    installer: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}esr/win32/en-US/Firefox%20Setup%20{{ version }}esr.exe'
    install_flags: '/s'
    uninstaller: '{{ PROGRAM_FILES }}\Mozilla Firefox\uninstall\helper.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
