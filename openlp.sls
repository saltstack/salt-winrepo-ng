# Source: http://openlp.org/
# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
{% set versions = ['2.4.6', '2.2.1'] %}
openlp:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'OpenLP {{ version }}'
    installer: 'https://get.openlp.org/{{ version }}/OpenLP-{{ version }}-setup.exe'
    install_flags: '/SP- /VERYSILENT /NORESTART'
    uninstaller: '{{ PROGRAM_FILES }}\OpenLP\unins000.exe'
    uninstall_flags: '/SP- /VERYSILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
