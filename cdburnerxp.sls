# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
cdburnerxp:
  '4.5.6.5931':
    full_name: 'CDBurnerXP'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: https://download.cdburnerxp.se/msi/cdbxp_setup_x64_4.5.8.7128.msi'
    uninstaller: 'https://download.cdburnerxp.se/msi/cdbxp_setup_x64_4.5.8.7128.msi'
    {% else %}
    installer: 'https://download.cdburnerxp.se/msi/cdbxp_setup_4.5.8.7128.msi'
    uninstaller: 'https://download.cdburnerxp.se/msi/cdbxp_setup_4.5.8.7128.msi'
    {% endif %}
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
  '4.5.6.5931':
      full_name: 'CDBurnerXP'
    installer: 'https://download.cdburnerxp.se/cdbxp_setup_4.5.6.5931.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\CDBurnerXP\unins000.exe'
    uninstall_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
