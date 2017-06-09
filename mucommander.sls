{% set versions = ['0.9.2', '0.9.1'] %}

mucommander:
{% for v in versions %}
  '{{v}}':
    full_name: 'muCommander (remove only)'
    installer: 'https://github.com/mucommander/mucommander/releases/download/{v}/mucommander-{{v}}.exe'
    uninstaller: '%ProgramFiles(x86)%/muCommander/uninstaller.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    locale: en_US
    reboot: False
{% endfor %}
