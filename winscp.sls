{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
winscp:
  {% for version in '5.7.6', '5.7.5', '5.7.4' %}
  '{{ version }}':
    full_name: 'WinSCP {{ version }}'
    installer: 'http://heanet.dl.sourceforge.net/project/winscp/WinSCP/{{ version }}/winscp576setup.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\WinSCP\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
