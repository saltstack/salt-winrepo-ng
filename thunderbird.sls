# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
thunderbird:
  {% for version in '38.6.0', '38.5.0', '38.4.0', '38.3.0', '38.2.0', '38.1.0' %}
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
