# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
fiddler:
  '5.0.20181.14850':
    full_name:  'Fiddler'
    installer: 'https://telerik-fiddler.s3.amazonaws.com/fiddler/FiddlerSetup.exe'
    install_flags: '/S /D={{ PROGRAM_FILES }}\Fiddler'
    uninstaller: '{{ PROGRAM_FILES }}\Fiddler\uninst.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
