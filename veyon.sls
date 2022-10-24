# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% if grains["cpuarch"] == "AMD64" %}
    {% set arch = "win64" %}
{% else %}
    {% set arch = "win32" %}
{% endif %}

{% set versions = (
    ("4.7.4", "4.7.4.32"),
    ("4.0.7", "4.0.7.0"),
) %}

veyon:
{% for version, dl_version in versions %}
  '{{ version }}':
    full_name: 'Veyon {{ version }}'
    installer: https://github.com/veyon/veyon/releases/download/v{{ version }}/veyon-{{ dl_version }}-{{ arch }}-setup.exe'
    install_flags: '/S /Master'
    uninstaller: '%ProgramFiles%\Veyon\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}

# No download resources available, uninstall only
{% set versions = (
    ("4.0.6", "4.0.6.0"),
) %}

{% for version in versions %}
  '{{ version }}':
    full_name: 'Veyon {{ version }}'
    uninstaller: '%ProgramFiles%\Veyon\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{% endfor %}
