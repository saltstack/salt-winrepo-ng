{% set PROGRAM_FILES = "%ProgramFiles%" %}
ccleaner:
  {% for version in ['5.72', '5.71', '5.57', '5.44'] %}
  '{{ version }}':
    {% set dl_version = version | replace(".","") %}
    full_name: 'CCleaner'
    installer: 'https://download.ccleaner.com/ccsetup{{ dl_version }}.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\CCleaner\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
