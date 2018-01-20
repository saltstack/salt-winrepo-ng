{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%PROGRAMFILES(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%PROGRAMFILES%" %}
{% endif %}
{% set versions = ['0.9.2'] %}
mucommander:
{% for v in versions %}
  '{{ v }}':
    full_name: 'muCommander (remove only)'
    installer: 'https://github.com/mucommander/mucommander/releases/download/{{ v }}/mucommander-{{ v }}.exe'
    uninstaller: '{{ PROGRAM_FILES }}\muCommander\uninstaller.exe'
    install_flags: '/S'
    uninstall_flags: '/S' 
    locale: en_US
    reboot: False
{% endfor %}
