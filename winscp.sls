{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
winscp:
  {% for version, file_version in (('5.7.7', '577'), ('5.7.6', '576'), ('5.7.5', '575'), ('5.7.4', '574')) %}
  '{{ version }}':
    full_name: 'WinSCP {{ version }}'
    installer: 'http://heanet.dl.sourceforge.net/project/winscp/WinSCP/{{ version }}/winscp{{ file_version }}setup.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\WinSCP\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
