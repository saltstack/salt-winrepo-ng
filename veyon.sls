# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% if grains['cpuarch'] == 'AMD64' %}
{% set arch = 'win64' %}
{% else %}
{% set arch = 'win32' %}
{% endif %}

{% set versions = ['4.0.7', '4.0.6'] %}

veyon:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Veyon {{ version }}'
    installer: 'https://github.com/veyon/veyon/releases/download/v{{ version }}/veyon-{{ version }}.0-{{ arch }}-setup.exe'
    install_flags: '/S /Master'
    uninstaller: '%ProgramFiles%\Veyon\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
