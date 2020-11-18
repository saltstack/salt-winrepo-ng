# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
thunderbird:
  {% for version in ['78.4.2', '60.6.1', '60.6.0', '60.5.3', '60.5.2', '60.5.1', '60.5.0', '60.4.0', '60.3.3', '60.3.2', '60.3.1', '60.3.0', '60.2.1', '60.0', '52.9.1', '52.9.0', '52.8.0', '52.6.0', '52.5.2', '52.3.0', '45.6.0', '45.4.0', '38.6.0', '38.5.0', '38.4.0', '38.3.0', '38.2.0', '38.1.0'] %}
  '{{ version }}':
    full_name: 'Mozilla Thunderbird {{ version }} (x86 en-GB)'
    installer: 'https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/{{ version }}/win32/en-GB/Thunderbird%20Setup%20{{ version }}.exe'
    install_flags: '-ms'
    uninstaller: '{{ PROGRAM_FILES }}\Mozilla Thunderbird\uninstall\helper.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
