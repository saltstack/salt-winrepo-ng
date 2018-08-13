{% set versions = ['61.0.2', '61.0.1', '61.0', '60.0.2', '60.0.1', '60.0', '59.0.3', '59.0.2', '59.0.1', '58.0.2', '58.0.1', '58.0', '57.0', '57.0.4', '57.0.3', '57.0.2', '57.0.1', '56.0', '56.0.2', '56.0.1', '55.0', '55.0.3', '55.0.1', '54.0', '54.0.1', '53.0', '53.0.3', '52.0', '52.0.2', '52.0.1', '51.0', '51.0.1', '50.1.0', '50.0', '50.0.2', '49.0', '49.0.2', '49.0.1', '48.0', '48.0.2', '47.0', '47.0.1', '46.0', '46.0.1', '45.0', '45.0.2', '45.0.1', '44.0', '44.0.2', '44.0.1', '43.0', '43.0.4', '43.0.3', '43.0.2', '43.0.1', '42.0', '41.0', '41.0.2', '41.0.1', '40.0', '40.0.3', '40.0.2', '39.0', '39.0.3', '38.0.6', '38.0.5', '38.0.1', '35.0.1', '29.0.1'] %}
{% if grains['cpuarch'] == 'AMD64' %}
  {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
  {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
firefox:
  {% for version in versions %}
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
