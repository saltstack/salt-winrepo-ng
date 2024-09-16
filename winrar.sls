#if possible use 5.70 or newer due to vulnerabilities (CVE-2018-20250, CVE-2018-20251, CVE-2018-20252, CVE-2018-20253)

{%- load_yaml as versions %}
- '7.01'
- '7.00'
- '6.22'
- '6.21'
- '6.20'
- '6.11'
- '6.10'
- '6.02'
- '6.01'
- '6.00'
- '5.91'
- '5.70'
- '5.61'
{%- endload %}

winrar:
{%- for version in versions %}
  {%- set major, minor = version.split('.') %}
  '{{major}}.{{minor}}.0':
  {%- if grains['cpuarch'] == 'AMD64' %}
    arch: x64
    full_name: 'WinRAR {{major}}.{{minor}} (64-bit)'
    installer: 'https://www.rarlab.com/rar/winrar-x64-{{major}}{{minor}}.exe'
  {%- else %}
    arch: x86
    full_name: 'WinRAR {{major}}.{{minor}} (32-bit)'
    {%- if (major <= '5') or (major <= '6' and minor <= '02') %}
    installer: 'https://www.rarlab.com/rar/wrar{{major}}{{minor}}.exe'
    {%- else %}
    installer: 'https://www.rarlab.com/rar/winrar-x32-{{major}}{{minor}}.exe'
    {%- endif %}
  {%- endif %}
    uninstaller: '%ProgramFiles%\WinRAR\uninstall.exe'
    install_flags: '/S'
    uninstall_flags: '/S'
    msiexec: False
    locale: en_US
    reboot: False
{%- endfor %}
