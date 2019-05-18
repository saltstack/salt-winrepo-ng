{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
winscp:
  {% for version in ['5.15', '5.13.9', '5.13.8', '5.13.7', '5.13.6', '5.13.5', '5.13.4', '5.13.3', '5.13.2', '5.13.1', '5.13', '5.11.3', '5.11.2', '5.11.1', '5.9.6', '5.9.2', '5.9.1', '5.9'] %}
  '{{ version }}':
    full_name: 'WinSCP {{ version }}'
    installer: 'https://downloads.sourceforge.net/project/winscp/WinSCP/{{ version }}/WinSCP-{{ version }}-Setup.exe'
    install_flags: '/SP- /verysilent /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\WinSCP\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
