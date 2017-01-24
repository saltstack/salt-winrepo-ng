firefox:
  {% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
  {% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
  {% endif %}
  {% for version in ['29.0.1', '35.0.1', '38.0.1', '38.0.5', '38.0.6', '39.0', '39.0.3', '40.0', '40.0.2', '40.0.3', '41.0', '41.0.1', '41.0.2', '42.0', '43.0', '43.0.1', '43.0.2', '43.0.3', '43.0.4', '44.0', '44.0.1', '44.0.2', '45.0', '45.0.1', '45.0.2', '46.0', '46.0.1', '47.0', '47.0.1', '48.0', '48.0.2', '49.0', '49.0.1', '49.0.2', '50.0', '50.0.2', '50.1.0', '51.0'] %}
  '{{ version }}':
    full_name: 'Mozilla Firefox {{ version }} (x86 en-US)'
    installer: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win32/en-US/Firefox%20Setup%20{{ version }}.exe'
    install_flags: '/s'
    uninstaller: '{{ PROGRAM_FILES }}\Mozilla Firefox\uninstall\helper.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
