# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
fiddler:
  '4.6.2.2':
    full_name:  'Fiddler'
    installer: 'http://fiddler2.com/dl/fiddler4setup.exe'
    install_flags: '/S /D={{ PROGRAM_FILES }}\Fiddler'
    uninstaller: '{{ PROGRAM_FILES }}\Fiddler\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  '2.6.2.2':
    full_name:  'Fiddler'
    installer: 'http://fiddler2.com/dl/fiddler2setup.exe'
    install_flags: '/S /D={{ PROGRAM_FILES }}\Fiddler'
    uninstaller: '{{ PROGRAM_FILES }}\Fiddler\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
