{% set source_path = 'http://ca-dl.bandisoft.com/bandizip' %}

bandizip:
  '6.20':
    full_name: 'Bandizip'
    installer: '{{ source_path }}/BANDIZIP-SETUP.EXE'
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\Bandizip\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
