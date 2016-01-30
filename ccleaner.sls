# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
ccleaner:
  {% for version, dl_version in (('5.14', '514'), ('5.13', '513'), ('5.12', '512'), ('5.11', '511'), ('5.10', '510'), ('5.0.9', '509')) %}
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
