{% set PROGRAM_FILES = "%ProgramFiles%" %}
ccleaner-slim:
  {% for version in ['5.78','5.77', '5.76', '5.75', '5.74', '5.72', '5.60', '5.59', '5.58', '5.57'] %}
  '{{ version }}':
    {% set dl_version = version | replace(".","") %}
    full_name: 'CCleaner'
    installer: 'https://download.ccleaner.com/slim/ccsetup{{ dl_version }}_slim.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\CCleaner\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
