# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
{% set VERSIONS  = ['3.1.7', '3.0.3', '3.0.0', '2.3.4', '2.3.3', '2.3.2', '2.3.1', '2.3.0', '2.2.4'] %}
gpg4win:
  {% for VERSION in VERSIONS %}
  {{ VERSION }}:
    full_name: 'Gpg4win ({{ VERSION }})'
    installer: 'http://files.gpg4win.org/gpg4win-{{ VERSION }}.exe'
    install_flags: '/S /C=C:\salt\var\cache\salt\minion\files\base\win\repo-ng\salt-winrepo-ng\gpg4win\silent.ini'
    uninstaller: '{{ PROGRAM_FILES }}\GNU\GnuPG\gpg4win-uninstall.exe'
    uninstall_flags: '/S'
    cache_file: salt://win/repo-ng/gpg4win/silent.ini
    msiexec: False
    reboot: False
  {% endfor %}
