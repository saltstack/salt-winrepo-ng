firefox:
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
  {% if grains['cpuarch'] == 'AMD64' %}
    {% set winarch = "win64" %}
    {% set arch = "x64" %}
  {% else %}
    {% set winarch = "win32" %}
    {% set arch = "x86" %}
  {% endif %}
  {% for version in '29.0.1', '31.0esr', '35.0.1', '38.0.1', '38.0.5', '38.0.6', '39.0', '39.0.3', '40.0', '40.0.1', '40.0.2', '40.0.3', '41.0', '41.0.1', '41.0.2', '42.0', '43.0', '43.0.1', '43.0.2', '43.0.3', '43.0.4', '44.0', '44.0.1', '44.0.2', '45.0' %}
  '{{ version }}':
    full_name: 'Mozilla Firefox {{ version }} ({{arch}} en-US)'
    installer: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/{{winarch}}/en-US/Firefox%20Setup%20{{ version }}.exe'
    install_flags: '/s'
    uninstaller: '{{ PROGRAM_FILES }}\Mozilla Firefox\uninstall\helper.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: {{grains['locale_info']['defaultlanguage']}}
    reboot: False
  {% endfor %}
