{% if grains['cpuarch'] == 'AMD64' %}
 {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
 {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}
{% set url = "https://download.jetbrains.com/python" %}
{% set versions = {'2019.1.1': '191.6605.12'} %}
pycharm-pro:
  {% for version, build in versions.items() %}
  {{ build }}:
    installer: '{{ url }}/pycharm-professional-{{ version }}.exe'
    full_name: 'JetBrains Pycharm {{ version }}'
    install_flags: '/S /CONFIG=C:\salt\var\cache\salt\minion\files\base\win\repo-ng\salt-winrepo-ng\pycharm-pro\silent.config'
    cache_file: salt://win/repo-ng/salt-winrepo-ng/pycharm-pro/silent.config
    uninstaller: '{{ PROGRAM_FILES }}\JetBrains\PyCharm {{ version }}\Uninstall.exe'
    uninstall_flags: '/S'
    msiexec: False
    reboot: False
  {% endfor %}
