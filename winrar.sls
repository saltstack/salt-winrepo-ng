#if possible use 5.70 or newer due to vulnerabilities (CVE-2018-20250, CVE-2018-20251, CVE-2018-20252, CVE-2018-20253)
{% set versions = {'5':['91', '70', '61'], '6':['22', '21', '20', '11', '10', '02', '01', '00']} %}

winrar:
{% for major, subversions in versions.items() %}
  {% for minor in subversions %}
  '{{major}}.{{minor}}.0':
    {% if grains['cpuarch'] == 'AMD64' %}
    arch: x64
    full_name: 'WinRAR {{major}}.{{minor}} (64-bit)'
    installer: 'https://www.rarlab.com/rar/winrar-x64-{{major}}{{minor}}.exe'
    {% else %}
    arch: x86
    full_name: 'WinRAR {{major}}.{{minor}} (32-bit)'
    {% if (major <= '5') or (major <= '6' and minor <= '02') %}
    installer: 'https://www.rarlab.com/rar/wrar{{major}}{{minor}}.exe'
    {% else %}
    installer: 'https://www.rarlab.com/rar/winrar-x32-{{major}}{{minor}}.exe'
    {% endif %}
    {% endif %}
    uninstaller: '%ProgramFiles%\WinRAR\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
{% endfor %}
