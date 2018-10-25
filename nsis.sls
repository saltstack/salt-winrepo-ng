# Define versions
{% set versions = {'3': ['03', '02.1', '02', '01', '0'],
                   '3%20Pre-release': ['0b2', '0b1'],
                   '2': ['51', '50', '49', '48', '47', '46']} %}

nsis:
  {% for major, subversions in versions.items() %}
  {% for minor in subversions %}
  '{{major|first}}.{{minor}}':
    full_name: 'Nullsoft Install System'
    installer: 'https://iweb.dl.sourceforge.net/project/nsis/NSIS%20{{major}}/{{major|first}}.{{minor}}/nsis-{{major|first}}.{{minor}}-setup.exe'
    install_flags: '/S'
    {% if grains['cpuarch'] == 'AMD64' %}
    uninstaller: '%PROGRAMFILES(x86)%\NSIS\uninst-nsis.exe'
    {% else %}
    uninstaller: '%PROGRAMFILES%\NSIS\uninst-nsis.exe'
    {% endif %}
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
  {% endfor %}
