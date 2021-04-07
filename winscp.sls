{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
winscp:
  {% for version in ['5.17.10', '5.17.9', '5.17.8', '5.17.7', '5.17.6', '5.17.5', '5.17.4', '5.17.3', '5.17.2', '5.17.1', '5.17', '5.15.9', '5.15.7', '5.15.5', '5.15.4', '5.15.3', '5.15.2', '5.15.1', '5.15', '5.13.9', '5.13.8', '5.13.7', '5.13.6', '5.13.5', '5.13.4', '5.13.3', '5.13.2', '5.13.1', '5.13', '5.11.3', '5.11.2', '5.11.1', '5.9.6', '5.9.2', '5.9.1', '5.9'] %}
  '{{ version }}':
    full_name: 'WinSCP {{ version }}'
    installer: 'https://downloads.sourceforge.net/project/winscp/WinSCP/{{ version }}/WinSCP-{{ version }}-Setup.exe'
    install_flags: '/SP- /verysilent /SUPPRESSMSGBOXES /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\WinSCP\unins000.exe'
    uninstall_flags: '/verysilent'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
