{% set versions = ['2.12.0'] %}
# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
pidgin:
  {% for version in versions %}
  '{{ version }}':
    full_name: 'Pidgin'
    installer: 'https://downloads.sourceforge.net/project/pidgin/Pidgin/{{ version }}/pidgin-{{ version }}-offline.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Pidgin\pidgin-uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
