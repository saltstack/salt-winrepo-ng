{% set PROGRAM_FILES = "%ProgramFiles%" %}
bulkrenameutility:
  {% for version in ['3.0.0.1' ] %}
  '{{ version }}':
    {% if grains['cpuarch'] == 'AMD64' %}
    full_name: 'Bulk Rename Utility {{ version }} (64-bit)'
    {% else %}
    full_name: 'Bulk Rename Utility {{ version }} (32-bit)'
    {% endif %}
    installer: 'http://www.s3.tgrmn.com/bru/BRU_setup_{{ version }}.exe'
    install_flags: '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    uninstaller: '{{ PROGRAM_FILES }}\Bulk Rename Utility\unins000.exe'
    uninstall_flags: '/VERYSILENT  /SUPPRESSMSGBOXES /NORESTART /SP-'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
 
