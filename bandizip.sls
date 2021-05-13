#the provider only offers the download of the latest version
{% set source_path_v6 = 'http://ca-dl.bandisoft.com/bandizip' %}
{% set source_path_v7 = 'http://dl.bandisoft.com/bandizip.std' %}
# we do not use version numbers but treated it like chrome and use 'latest' only
# {% set version6 = '6.26' %}
# {% set version7 = '7.16' %}
#
bandizip:
  'latest':
    full_name: 'Bandizip'
    installer: '{{ source_path_v7 }}/BANDIZIP-SETUP-STD-ALL.EXE'
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\Bandizip\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
#
bandizip6:
  'latest':
    full_name: 'Bandizip'
    installer: '{{ source_path_v6 }}/BANDIZIP-SETUP.EXE'
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\Bandizip\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
#
bandizip7:
  'latest':
    full_name: 'Bandizip'
    installer: '{{ source_path_v7 }}/BANDIZIP-SETUP-STD-ALL.EXE'
    install_flags: '/S'
    uninstaller: '%ProgramFiles%\Bandizip\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
#
