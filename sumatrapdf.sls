{% if grains['cpuarch'] == 'AMD64' %}
    {% set INSTALLER = "SumatraPDF-3.1.2-64-install.exe" %}
{% else %}
    {% set INSTALLER = "SumatraPDF-3.1.2-install.exe" %}
{% endif %}
sumatrapdf:
  '3.1.2':
    full_name: 'SumatraPDF'
    installer: 'https://www.sumatrapdfreader.org/dl/{{ INSTALLER }}'
    install_flags: '/s /opt'
    uninstaller: '%ProgramFiles%\SumatraPDF\uninstall.exe'
    uninstall_flags: '/s'
    msiexec: False
    locale: en_US
    reboot: False
