{% set versions = ['2.13.1', '2.13.0', '2.12.0', '2.10.5', '2.10.4', '2.10.3', '2.10.2', '2.10.1', '2.9.0'] %}
{% set PROGRAM_FILES = "%ProgramFiles%" %}
rocketchat:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Rocket.Chat+ {{ version }}'
    installer: 'https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/{{ version }}/rocketchat-setup-{{ version }}.exe'
    install_flags: '/S /allusers'
    uninstaller: '{{ PROGRAM_FILES }}\rocketchat\Uninstall Rocket.Chat+.exe'
    uninstall_flags: '/S /allusers'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
