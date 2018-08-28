{% set PROGRAM_FILES = "%ProgramFiles%" %}
ccleaner:
  {% for version, dl_version in [('5.44', '544')] %}
  '{{ version }}':
    full_name: 'CCleaner'
    installer: 'http://download.piriform.com/ccsetup{{ dl_version }}.exe'
    install_flags: '/S'
    uninstaller: '{{ PROGRAM_FILES }}\CCleaner\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
