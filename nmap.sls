{% set version_list = ['7.91', '7.80', '7.70', '7.60'] %}

# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
nmap:
  {% for version in version_list %}
  '{{ version }}':
    full_name: 'Nmap {{ version }}'
    installer: 'https://nmap.org/dist/nmap-{{ version }}-setup.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Nmap\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
