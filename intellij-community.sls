# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
intellij-community:
  {% for version in '14.1.4' %}
  '{{ version }}':
    full_name: 'IntelliJ IDEAS Community Edition {{ version }}'
    installer: 'https://download.jetbrains.com/idea/ideaIC-{{ version }}.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\JetBrains\IntelliJ IDEA Community Edition {{ version }}\bin\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
