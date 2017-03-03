# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
intellij-ultimate:
  {% for version in ['14.1.4'] %}
  '{{ version }}':
    full_name: 'IntelliJ IDEAS Ultimate {{ version }}'
    installer: 'https://download.jetbrains.com/idea/ideaIU-{{ version }}.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\JetBrains\IntelliJ IDEA {{ version }}\bin\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
