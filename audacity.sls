{% set versions = ['2.4.2', '2.2.2', '2.2.1' ] %}
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
audacity:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Audacity {{ version }}'
    installer: 'https://www.videohelp.com/download/audacity-win-{{ version }}.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\Audacity\unins000.exe'
    uninstall_flags: '/SP- /verysilent /norestart'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
