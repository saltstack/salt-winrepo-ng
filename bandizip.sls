#the provider only offers the download of the latest version
{% set source_path = 'http://ca-dl.bandisoft.com/bandizip' %}
{% set version = '6.21' %}

bandizip:
  '{{ version }}':
    full_name: 'Bandizip'
    installer: '{{ source_path }}/BANDIZIP-SETUP.EXE'
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\Bandizip\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
