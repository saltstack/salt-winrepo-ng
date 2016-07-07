# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
cyberduck:
  '4.7.3':
    full_name: 'Cyberduck 4.7.3'
    installer: 'http://update.cyberduck.io/windows/Cyberduck-Installer-4.7.3.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\Cyberduck\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
