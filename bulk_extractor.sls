# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
bulk_extractor:
  {% for version in '1.5.0', '1.5.1', '1.5.5' %}
  '{{ version }}':
    full_name: 'Bulk Extractor {{ version }}'
    installer: 'http://digitalcorpora.org/downloads/bulk_extractor/bulk_extractor-{{ version }}-windowsinstaller.exe'
    install_flags: ' /S /norestart'
    uninstaller: '{{ PROGRAM_FILES }}\Bulk Extractor {{ version }}\uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
