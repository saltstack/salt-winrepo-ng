# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
  {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
  {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
nmap:
  {% for version in '7.01', '6.47' %}
  {{ version }}:
    full_name: 'Nmap {{ version }}'
    installer: 'http://nmap.org/dist/nmap-{{ version }}-setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Nmap\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
